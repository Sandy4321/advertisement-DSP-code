#!/home/kddmer/.pyenv/versions/env4/bin/python
# -*- coding: utf-8 -*-
"""
---------------------------------------------------------------------------
File Name   : dsp_ctr_feats_upload.py
Description : 上传训练后的模型和特征信息。
              1. 每日CTR模型训练完成后，需要将特征和对应的LR权值上传到dsp redis集群。
              2. 考虑到每日特征内容会有变化，需上传特征定义，预测程序会查询当日特征。
              3. 上传顺序：
                  a. 上传特征权值；
                  b. 上传数据特征预计算；
                  c. 上传本次训练的模型信息，更改最新训练数据日期；
                  d. 设置上一训练日期数据为48小时后过期删除。
Author      : 
Created at  : 2018/09/19
---------------------------------------------------------------------------
"""
import getopt
import pandas as pd
from datetime import datetime
from sklearn.externals import joblib
from rediscluster import StrictRedisCluster

import sys
sys.path.append("/home/kddmer/models/pub/")
import mysql_conn as ms
import redis_lib as rds
from project_utils import const


# Redis配置常量
const.TRAIN_DATE = 'traindate'             # Redis中预测模型最新训练数据日期
const.PRE_TRAIN_DATE = 'pre_traindate'     # Redis中预测模型前一次训练数据日期
const.INI_TRAIN_DATE = '2000-01-01'        # Redis中预测模型初始化训练数据日期
const.PATH_MODEL = 'dsp_ctr:model'         # Redis中预测模型信息的存储路径
const.MODEL_INFO = 'modelinfo'             # Redis中预测模型信息hash对象名
const.MODEL_TYPE = 'modeltype'             # Redis中预测模型信息模型类型名
const.PATH_FEATURES = 'dsp_ctr:features'   # Redis中预测模型特征信息的存储路径
const.FEAT_DEF = 'featdefs'                # Redis中预测模型特征定义信息hash对象名
const.FEAT_MINVALS = 'feat_minvals'        # Redis中预测模型特征归一化最小值hash对象名
const.FEAT_MAXVALS = 'feat_maxvals'        # Redis中预测模型特征归一化最大值hash对象名
const.SCORE_ACTCTR = 'score_actctr'        # Redis中预测模型评分对应的实际CTR
const.INTERCEPT = 'intercept'              # Redis中预测模型常数项值
const.CAL_FACTOR = 'calibration_factor'    # Redis中预测模型评分到点击率的校正因子


def load_featvals_nonhist(rs, traindate, fp_featdef, featidx, model):
    """加载非动态历史特征值。
       onehot后特征值为1，设置特征值为模型权值。
       从dataitems和featidx中解析特征key，取得model中特征对应的权值作为value，存入Redis。

    Args:
        rs: Redis连接对象
        traindate: 最新模型训练数据日期，格式为'YYYY-MM-DD'
        fp_featdef：模型特征定义文件路径，文件每一行对应一个特征，第一列为特征名
        featidx：模型训练数据onehot特征定义列表，形如：['12:ASUSTek Computer Inc 56','48:e153 20493']
        model：预测模型

    Returns:
        None
    """
    # # 特征定义文件每一行对应一个特征，分为四列：特征名称，特征生成命令定义，最小值，最大值
    # dataitems = []
    # with open(fp_featdef, 'r') as fp:
    #     for fline in fp.readlines():
    #         feat = fline.strip().split('\t')
    #         if feat[0].strip() != '':
    #             dataitems.append(feat[0])   # 添加特征名称

    pipe = rs.pipeline()
    for i in range(len(featidx)): 
        str = featidx[i]
        pos1 = str.find(":")    # 考虑到字符串可能包含分隔符，分别从左部和右部截取
        pos2 = str.rfind(" ")
        dataitems = str[0:pos1]
        featkey = str[pos1 + 1:pos2]
        pipe.hset('%s:%s:%s' % (const.PATH_FEATURES, traindate, dataitems), featkey, model.coef_[0][int(str[pos2+1:])])
    pipe.execute()
    print('nonhist features values have been loaded!')
    return None


def load_featvals_hist(rs, traindate):
    """加载动态历史特征值。
       统计特征均为关键数据项的前一天和前一周的CTR统计数值，不做onehot处理。
       为了简化预测，设置特征值为最大最小归一化值。
       dsp_ctr_train_minmax中存放最大最小值，拼接sql后调用load_featvals_exec加载特征。

    Args:
        rs: Redis连接对象
        traindate: 最新模型训练数据日期，格式为'YYYY-MM-DD'

    Returns:
        None
    """
    
    # 广告位
    sqlstr = "select t1.log_adspace \
                ,(t1.click_cnt_week/t1.impression_cnt_week - t2.adsp_last7days_ctr_min) / (t2.adsp_last7days_ctr_max - t2.adsp_last7days_ctr_min) \
                ,(t1.click_cnt/t1.impression_cnt - t2.adsp_yesterday_ctr_min) / (t2.adsp_yesterday_ctr_max - t2.adsp_yesterday_ctr_min) \
                ,(t1.click_cnt_week - t2.adsp_last7days_clk_cnt_min) / (t2.adsp_last7days_clk_cnt_max - t2.adsp_last7days_clk_cnt_min) \
                ,(t1.click_cnt - t2.adsp_yesterday_clk_cnt_min) / (t2.adsp_yesterday_clk_cnt_max - t2.adsp_yesterday_clk_cnt_min) \
            from dspbase.dsp_ctr_stat_adspace t1 \
            inner join dspbase.dsp_ctr_train_minmax t2 on t1.log_day=t2.log_day \
            where t1.log_day='%s'" % (traindate);
    dataitems = ['adsp_last7days_ctr','adsp_yesterday_ctr','adsp_last7days_clk_cnt','adsp_yesterday_clk_cnt']
    load_featvals_exec(rs, traindate, sqlstr, dataitems, len(featidx)-28)

    # 广告主
    sqlstr = "select t1.log_advertiserid \
                ,(t1.click_cnt_week/t1.impression_cnt_week - t2.ader_last7days_ctr_min) / (t2.ader_last7days_ctr_max - t2.ader_last7days_ctr_min) \
                ,(t1.click_cnt/t1.impression_cnt - t2.ader_yesterday_ctr_min) / (t2.ader_yesterday_ctr_max - t2.ader_yesterday_ctr_min) \
                ,(t1.click_cnt_week - t2.ader_last7days_clk_cnt_min) / (t2.ader_last7days_clk_cnt_max - t2.ader_last7days_clk_cnt_min) \
                ,(t1.click_cnt - t2.ader_yesterday_clk_cnt_min) / (t2.ader_yesterday_clk_cnt_max - t2.ader_yesterday_clk_cnt_min) \
            from dspbase.dsp_ctr_stat_advertiser t1 \
            inner join dspbase.dsp_ctr_train_minmax t2 on t1.log_day=t2.log_day \
            where t1.log_day='%s'" % (traindate);
    dataitems = ['ader_last7days_ctr','ader_yesterday_ctr','ader_last7days_clk_cnt','ader_yesterday_clk_cnt']
    load_featvals_exec(rs, traindate, sqlstr, dataitems, len(featidx)-24)

    # 创意
    sqlstr = "select t1.log_creativeid \
                ,(t1.click_cnt_week/t1.impression_cnt_week - t2.ctv_last7days_ctr_min) / (t2.ctv_last7days_ctr_max - t2.ctv_last7days_ctr_min) \
                ,(t1.click_cnt/t1.impression_cnt - t2.ctv_yesterday_ctr_min) / (t2.ctv_yesterday_ctr_max - t2.ctv_yesterday_ctr_min) \
                ,(t1.click_cnt_week - t2.ctv_last7days_clk_cnt_min) / (t2.ctv_last7days_clk_cnt_max - t2.ctv_last7days_clk_cnt_min) \
                ,(t1.click_cnt - t2.ctv_yesterday_clk_cnt_min) / (t2.ctv_yesterday_clk_cnt_max - t2.ctv_yesterday_clk_cnt_min) \
            from dspbase.dsp_ctr_stat_creative t1 \
            inner join dspbase.dsp_ctr_train_minmax t2 on t1.log_day=t2.log_day \
            where t1.log_day='%s'" % (traindate);
    dataitems = ['ctv_last7days_ctr','ctv_yesterday_ctr','ctv_last7days_clk_cnt','ctv_yesterday_clk_cnt']
    load_featvals_exec(rs, traindate, sqlstr, dataitems, len(featidx)-20)

    # 媒体
    sqlstr = "select t1.log_media \
                ,(t1.click_cnt_week/t1.impression_cnt_week - t2.media_last7days_ctr_min) / (t2.media_last7days_ctr_max - t2.media_last7days_ctr_min) \
                ,(t1.click_cnt/t1.impression_cnt - t2.media_yesterday_ctr_min) / (t2.media_yesterday_ctr_max - t2.media_yesterday_ctr_min) \
                ,(t1.click_cnt_week - t2.media_last7days_clk_cnt_min) / (t2.media_last7days_clk_cnt_max - t2.media_last7days_clk_cnt_min) \
                ,(t1.click_cnt - t2.media_yesterday_clk_cnt_min) / (t2.media_yesterday_clk_cnt_max - t2.media_yesterday_clk_cnt_min) \
            from dspbase.dsp_ctr_stat_media t1 \
            inner join dspbase.dsp_ctr_train_minmax t2 on t1.log_day=t2.log_day \
            where t1.log_day='%s'" % (traindate);
    dataitems = ['media_last7days_ctr','media_yesterday_ctr','media_last7days_clk_cnt','media_yesterday_clk_cnt']
    load_featvals_exec(rs, traindate, sqlstr, dataitems, len(featidx)-16)

    # 城市
    sqlstr = "select t1.log_region_city \
                ,(t1.click_cnt_week/t1.impression_cnt_week - t2.city_last7days_ctr_min) / (t2.city_last7days_ctr_max - t2.city_last7days_ctr_min) \
                ,(t1.click_cnt/t1.impression_cnt - t2.city_yesterday_ctr_min) / (t2.city_yesterday_ctr_max - t2.city_yesterday_ctr_min) \
                ,(t1.click_cnt_week - t2.city_last7days_clk_cnt_min) / (t2.city_last7days_clk_cnt_max - t2.city_last7days_clk_cnt_min) \
                ,(t1.click_cnt - t2.city_yesterday_clk_cnt_min) / (t2.city_yesterday_clk_cnt_max - t2.city_yesterday_clk_cnt_min) \
            from dspbase.dsp_ctr_stat_city t1 \
            inner join dspbase.dsp_ctr_train_minmax t2 on t1.log_day=t2.log_day \
            where t1.log_day='%s'" % (traindate);
    dataitems = ['city_last7days_ctr','city_yesterday_ctr','city_last7days_clk_cnt','city_yesterday_clk_cnt']
    load_featvals_exec(rs, traindate, sqlstr, dataitems, len(featidx)-12)

    # ifa
    sqlstr = "select t1.log_kdgrequest_device_ifa \
                ,(t1.click_cnt_week/t1.impression_cnt_week - t2.ifa_last7days_ctr_min) / (t2.ifa_last7days_ctr_max - t2.ifa_last7days_ctr_min) \
                ,(t1.click_cnt/t1.impression_cnt - t2.ifa_yesterday_ctr_min) / (t2.ifa_yesterday_ctr_max - t2.ifa_yesterday_ctr_min) \
                ,(t1.click_cnt_week - t2.ifa_last7days_clk_cnt_min) / (t2.ifa_last7days_clk_cnt_max - t2.ifa_last7days_clk_cnt_min) \
                ,(t1.click_cnt - t2.ifa_yesterday_clk_cnt_min) / (t2.ifa_yesterday_clk_cnt_max - t2.ifa_yesterday_clk_cnt_min) \
            from dspbase.dsp_ctr_stat_ifa t1 \
            inner join dspbase.dsp_ctr_train_minmax t2 on t1.log_day=t2.log_day \
            where t1.log_day='%s'" % (traindate);
    dataitems = ['ifa_last7days_ctr','ifa_yesterday_ctr','ifa_last7days_clk_cnt','ifa_yesterday_clk_cnt']
    load_featvals_exec(rs, traindate, sqlstr, dataitems, len(featidx)-8)

    # imei
    sqlstr = "select t1.log_kdgrequest_device_imeimd5 \
                ,(t1.click_cnt_week/t1.impression_cnt_week - t2.imei_last7days_ctr_min) / (t2.imei_last7days_ctr_max - t2.imei_last7days_ctr_min) \
                ,(t1.click_cnt/t1.impression_cnt - t2.imei_yesterday_ctr_min) / (t2.imei_yesterday_ctr_max - t2.imei_yesterday_ctr_min) \
                ,(t1.click_cnt_week - t2.imei_last7days_clk_cnt_min) / (t2.imei_last7days_clk_cnt_max - t2.imei_last7days_clk_cnt_min) \
                ,(t1.click_cnt - t2.imei_yesterday_clk_cnt_min) / (t2.imei_yesterday_clk_cnt_max - t2.imei_yesterday_clk_cnt_min) \
            from dspbase.dsp_ctr_stat_imei t1 \
            inner join dspbase.dsp_ctr_train_minmax t2 on t1.log_day=t2.log_day \
            where t1.log_day='%s'" % (traindate);
    dataitems = ['imei_last7days_ctr','imei_yesterday_ctr','imei_last7days_clk_cnt','imei_yesterday_clk_cnt']
    load_featvals_exec(rs, traindate, sqlstr, dataitems, len(featidx)-4)
    print('hist features values have been loaded!')
    return None


def load_featvals_exec(rs, traindate, sqlstr, dataitems, featpos, batchsize=10000):
    """执行上传动态历史特征。

    Args:
        rs: Redis连接对象
        traindate: 最新模型训练数据日期，格式为'YYYYMMDD'
        sqlstr：特征值读取SQL
        dataitems：特征数据项列表
        featpos：dataitems特征在featidx列表中的倒数位置
        batchsize：批量加载时单批数量

    Returns:
        None
    """
    dfResult = fetch_data(sqlstr, dataitems)
    # print(dfResult)
    # exit(0)
    if dfResult is not None:
        pipe = rs.pipeline()
        for i in range(len(dfResult)):
            for j in range(len(dataitems)):
                featval = float(dfResult.iloc[i, j+1]) * float(model.coef_[0][j+featpos])
                pipe.hset('%s:%s:%s' % (const.PATH_FEATURES, traindate, dataitems[j]), dfResult.iloc[i, 0], featval)
            if i % batchsize == 0:
                pipe.execute()
        pipe.execute()
    return None


def fetch_data(sqlstr, dataitems):
    """执行数据读取SQL。

    Args:
        sqlstr：特征值读取SQL
        dataitems：特征数据项列表

    Returns:
        df：DataFrame格式SQL返回数据集
    """
    mysql = ms.MyPymysqlPool("dbMysql")
    rst = mysql.getAll(sqlstr)
    if not rst:
        mysql.dispose()   # 释放资源
        print('No data: ', dataitems)
        return None
    else:
        df = pd.DataFrame(list(list(x.values()) for x in rst)).fillna('')
        print(' %d rows have been fetched.' % len(df))
        mysql.dispose()
        return df


def load_score_actctr(rs, traindate):
    """加载评分分段实际CTR。
       实际CTR为模型训练后，模型评分区间内训练数据的CTR，以校正预测评分CTR。

    Args:
        rs: Redis连接对象
        traindate: 最新模型训练数据日期，格式为'YYYYMMDD'

    Returns:
        None
    """
    sqlstr = "select score_upper_limit, actctr from dspbase.dsp_ctr_score_actctr \
                where log_day='%s' order by score_upper_limit" % (traindate);
    dataitems = ['score_upper_limit']
    dfResult = fetch_data(sqlstr, dataitems)
    # print(dfResult)
    pre_actctr = 0      # actctr为空时，用前一个分段的actctr代替
    if dfResult is not None:
        pipe = rs.pipeline()
        for i in range(len(dfResult)):
            score_upper_limit = float(dfResult.iloc[i, 0])
            actctr = float(dfResult.iloc[i, 1]) if dfResult.iloc[i, 1] != '' else pre_actctr
            pre_actctr = actctr
            rs.hset('%s:%s:%s' % (const.PATH_MODEL, traindate, const.SCORE_ACTCTR), score_upper_limit, actctr)
        pipe.execute()
    print('actual CTR has been updated!')
    return None


def load_model(rs, traindate, fp_featdef, intercept, calfactor, modeltype='lr_baseline'):
    """加载模型信息。
       onehot后特征值为1，设置特征值为模型权值。
       从dataitems和featidx中解析特征key，取得model中特征对应的权值作为value，存入Redis。

    Args:
        rs: Redis连接对象
        traindate: 最新模型训练数据日期，格式为'YYYYMMDD'
        fp_featdef：模型特征定义文件路径，文件每一行对应一个特征
        intercept: 模型常数项
        calfactor：CTR预测评分校正因子
        modeltype：预测模型类型

    Returns:
        None
    """
    # 更新评分分段实际CTR


    # 特征定义文件每一行对应一个特征，分为四列：特征名，特征生成命令定义，最小值，最大值
    with open(fp_featdef, 'r') as fp:
        for fline in fp.readlines():
            feat = fline.strip().split('\t')
            # feat为
            if len(feat) == 4 and feat[0] != '' and feat[1] != '' and feat[2] != '' and feat[3] != '':
                rs.hset('%s:%s:%s' % (const.PATH_MODEL, traindate, const.FEAT_DEF), feat[0], feat[1])
                rs.hset('%s:%s:%s' % (const.PATH_MODEL, traindate, const.FEAT_MINVALS), feat[0], feat[2])
                rs.hset('%s:%s:%s' % (const.PATH_MODEL, traindate, const.FEAT_MAXVALS), feat[0], feat[3])
    rs.hset('%s:%s' % (const.PATH_MODEL, const.MODEL_INFO), const.MODEL_TYPE, modeltype)
    rs.hset('%s:%s' % (const.PATH_MODEL, const.MODEL_INFO), const.INTERCEPT, intercept)
    rs.hset('%s:%s' % (const.PATH_MODEL, const.MODEL_INFO), const.CAL_FACTOR, calfactor)

    # 更新上一次训练数据日期，设置最新训练数据日期，需要在特征数据更新完成后进行
    curdate = rs.hget('%s:%s' % (const.PATH_MODEL, const.MODEL_INFO), const.TRAIN_DATE)
    if curdate is None:       # 初始化时没有上一次训练日期，此时设置为初始化日期
        pre_traindate = const.INI_TRAIN_DATE
    else:
        pre_traindate = str(curdate, encoding="utf8")

    # 为了实现重跑机制，只有当原有traindate小于新traindate时才更新predate
    if pre_traindate < traindate:
        rs.hset('%s:%s' % (const.PATH_MODEL, const.MODEL_INFO), const.PRE_TRAIN_DATE, pre_traindate)
        rs.hset('%s:%s' % (const.PATH_MODEL, const.MODEL_INFO), const.TRAIN_DATE, traindate)
    print('model info has been loaded!')
    return None


def clean_feats(rs, exphours):
    """最新模型特征加载后，删除上一个训练日期的特征。
       为了保证临界点时刻预测正常和错误回滚处理时间，上一个训练日期特征会保留exphours小时。

    Args:
        rs: Redis连接对象
        exphours: 上一个训练日期特征删除预留小时数

    Returns:
        None
    """
    # 为了保证临界点时刻正常预测和有足够的处理时间，设置过期时间为24小时
    pre_traindate = str(rs.hget('%s:%s' % (const.PATH_MODEL, const.MODEL_INFO), const.PRE_TRAIN_DATE), encoding="utf8")
    traindate = str(rs.hget('%s:%s' % (const.PATH_MODEL, const.MODEL_INFO), const.TRAIN_DATE), encoding="utf8")
    if pre_traindate < traindate:
        rs.expire('%s:%s:%s' % (const.PATH_MODEL, pre_traindate, const.FEAT_DEF), time=exphours*3600)
        rs.expire('%s:%s:%s' % (const.PATH_MODEL, pre_traindate, const.FEAT_MINVALS), time=exphours*3600)
        rs.expire('%s:%s:%s' % (const.PATH_MODEL, pre_traindate, const.FEAT_MAXVALS), time=exphours*3600)

        featkeys = rs.hgetall('%s:%s:%s' % (const.PATH_MODEL, pre_traindate, const.FEAT_DEF))
        for featkey in featkeys:
            rs.expire('%s:%s:%s' % (const.PATH_FEATURES, pre_traindate, str(featkey, encoding="utf8")), time=exphours*3600)
        print('features of %s will be deleted after 48 hours!' % (pre_traindate))
    return None


if __name__ == '__main__':
    PATH = '/data/dsp_files/dsp_ctr-downsample/'

    try:
        # 传入相应参数
        # traindate： 模型训练数据的日期，不是自然日期，'YYYYMMDD'格式
        opts, args = getopt.getopt(sys.argv[1:], 'ht:p:', ['traindate=', 'path='])
    except getopt.GetoptError:
        print('Error: dsp_ctr_feats_upload.py -t <traindate> -p <path>')
        sys.exit(2)
    for opt, arg in opts:
        if opt in ('-t'):
            traindate = arg
        elif opt in ('-p'):
            PATH = arg
         
    # modeltype = sys.argv[2]
    fp_featdef = '{0}dsp_ctr_featdefs{1}.conf'.format(PATH, traindate)
    fp_featidx = '{0}dsp_ctr_train_featidx{1}.pkl'.format(PATH, traindate)
    fp_model = '{0}dsp_ctr_train_lr{1}.pkl'.format(PATH, traindate)
    exphours = 1
    pos_histfeat = -28     # 末28位为动态历史特征
    calfactor = 1   # CTR预测评分校正因子，0：不校正，1：按dsp_ctr_score_actctr分段校正

    sttime = datetime.now()
    rs = rds.redis_connect()    # 连接集群

    traindate = traindate[0:4] + '-' + traindate[4:6] + '-' + traindate[6:8]
    # 1. 上传特征值，为了简化预测，特征值=特征权值*特征取值，以便模型预测评分时直接使用
    #    对于类别特征，由于特征取值1，特征值为特征权值
    featidx = joblib.load(fp_featidx)
    model = joblib.load(fp_model)
    intercept = model.intercept_[0]     # 模型常数项
    load_featvals_nonhist(rs, traindate, fp_featdef, featidx[:pos_histfeat], model)

    # 2. 上传前一日和前7天的历史动态特征，包括CTR和点击数
    load_featvals_hist(rs, traindate)

    # 3. 上传评分实际CTR。
    load_score_actctr(rs, traindate)

    # 4. 上传模型信息。由于模型特征会有变化，一并更新模型特征定义，dsp预测是动态解析。
    load_model(rs, traindate, fp_featdef, intercept, calfactor)

    # 5. 设置上次训练数据日期特征的过期时限
    clean_feats(rs, exphours)

    print ('running time: ', datetime.now() - sttime)
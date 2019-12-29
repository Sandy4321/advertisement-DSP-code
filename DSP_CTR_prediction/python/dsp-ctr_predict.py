#!/home/kddmer/.pyenv/versions/env3/bin/python
# -*- coding: utf-8 -*-
"""
---------------------------------------------------------------------------
File Name   : dsp_ctr_predict.py
Description : 根据dsp传入参数，预测广告创意点击率。
              1. 每日0:00后轮询redis中模型训练日期，与当前模型训练日期比较。
                 发现更新训练日期时，说明该日模型训练数据已经上传完成，读取最新模型特征。
              2. 根据dsp传入参数，按照模型特征中的特征定义生成在线特征。
              3. 根据在线特征提取对应的权值进行评分，并将评分校正为实际点击率预测值。
Author      : 
Created at  : 2018/09/19
---------------------------------------------------------------------------
"""
import getopt
import math
import numpy as np
import pandas as pd
from datetime import datetime
from sklearn.externals import joblib
from rediscluster import StrictRedisCluster

import sys
sys.path.append("/home/kddmer/models/pub/")
import redis_lib as rds
from project_utils import const


# Redis配置常量
const.TRAIN_DATE = 'traindate'             # Redis中预测模型最新训练数据日期
const.PATH_MODEL = 'dsp_ctr:model'         # Redis中预测模型信息的存储路径
const.MODEL_INFO = 'modelinfo'             # Redis中预测模型信息hash对象名
const.PATH_FEATURES = 'dsp_ctr:features'   # Redis中预测模型特征信息的存储路径
const.FEAT_DEF = 'featdefs'                # Redis中预测模型特征定义信息hash对象名
const.FEAT_MINVALS = 'feat_minvals'        # Redis中预测模型特征归一化最小值hash对象名
const.FEAT_MAXVALS = 'feat_maxvals'        # Redis中预测模型特征归一化最大值hash对象名
const.SCORE_ACTCTR = 'score_actctr'        # Redis中预测模型评分对应的实际CTR
const.INTERCEPT = 'intercept'              # Redis中预测模型常数项值
const.CAL_FACTOR = 'calibration_factor'    # Redis中预测模型评分到点击率的校正因子
const.NUM_FEATKEY = 'unohfeat'             # Redis中预测模型数值特征的key值


def cal_ctr_predict():
    """预测输入参数，注意参数名需要和Redis中定义的特征名称相同
    """
    global hour
    global advertiserid
    global campaignid
    global creativeids
    global mediashowid
    global media
    global channel
    global mcf
    global mcs
    global kdgrequest_device_ifa
    global kdgrequest_device_imei
    global kdgrequest_device_devicetype
    global kdgrequest_device_make
    global kdgrequest_device_model
    global kdgrequest_device_os
    global kdgrequest_device_carrier
    global kdgrequest_device_connectiontype
    global adspace
    global adunit
    global adtype
    global adsize
    global region_country
    global region_province
    global region_city
    global ader_brand
    global ader_secondindustry
    global camp_settlement_price
    global ctv_size
    global ctv_label
    global ctv_type
    global ctv_style_id
    global ctv_second_category
    global ctv_remark

    hour = '17'
    advertiserid = '60'
    campaignid = '472'
    creativeids = ['855']    # 符合定向的创意ID列表
    mediashowid = '20'
    media = 'org.linable.candy.veges2018'
    channel = '20'
    mcf = '12'
    mcs = '61'
    kdgrequest_device_devicetype = '2'
    kdgrequest_device_make = 'iPhone'
    kdgrequest_device_model = 'iPhone-8,4'
    kdgrequest_device_os = 'IOS'
    kdgrequest_device_carrier = '1'
    kdgrequest_device_connectiontype = '1'
    kdgrequest_device_ifa = '79BB1075-26C9-4237-33EA-63CF0241E796'
    kdgrequest_device_imei = ''
    adspace = '10200001'
    adunit = 'c47b2b2d0cbe4345338de7e902a41dd0'
    adtype = '1'
    adsize = '1'
    region_country = '中国'
    region_province = '山西省'
    region_city = '忻州市'
    ader_brand = '闪电降价'
    ader_secondindustry = '111006'
    camp_settlement_price = '10'
    ctv_size = '41821'
    ctv_label = ''
    ctv_type = '1'
    ctv_style_id = '1'
    ctv_second_category = ''
    ctv_remark = ''


def fetch_traindate(rs):
    """获取模型最新训练数据日期，如果是T+1训练，即为上一日期。
       模型和特征数据在Redis中按照日期单独存储，CTR预测时，需要根据日期获取特征和模型参数。
       PATH_MODEL存储路径下MODEL_INFO中存放2个日期key：
        1) pre_traindate: 上一次模型训练数据日期
        2) traindate: 最新模型训练数据日期

    Args:
        rs: Redis连接对象
    
    Returns:
        traindate: 最新模型训练数据日期，格式为'YYYYMMDD'
    """
    traindate = str(rs.hget('%s:%s' % (const.PATH_MODEL, const.MODEL_INFO), 
                            const.TRAIN_DATE), encoding="utf8")
    return traindate


def fetch_featinfo(rs, traindate):
    """获取当前模型的特征定义信息。
       主要包括三部分内容：
       1）考虑到模型特征会更新，将特征定义存储在Redis中，每日预测时重新生成；
       2）由于数值变量特征需要实时计算归一化，需要保留归一化参数；
       3）由于下采样等原因，需要对模型评分进行校正。

    Args:
        rs: Redis连接对象
        traindate: 模型最新训练数据日期
    
    Returns:
        featdefs: 特征定义列表，根据特征定义和传入参数可以计算出特征取值
        feat_minvals: 特征归一化最小值列表
        feat_maxvals: 特征归一化最大值列表
        intercept: 模型常数项
        calfactor: 评分校正因子，将模型预测分数校正为预测点击率
    """ 
    featdefs = rs.hgetall('%s:%s:%s' % (const.PATH_MODEL, traindate, const.FEAT_DEF))
    feat_minvals = rs.hgetall('%s:%s:%s' % (const.PATH_MODEL, traindate, const.FEAT_MINVALS))
    feat_maxvals = rs.hgetall('%s:%s:%s' % (const.PATH_MODEL, traindate, const.FEAT_MAXVALS))
    intercept = float(rs.hget('%s:%s' % (const.PATH_MODEL, const.MODEL_INFO), const.INTERCEPT))
    calfactor = float(rs.hget('%s:%s' % (const.PATH_MODEL, const.MODEL_INFO), const.CAL_FACTOR))
    return featdefs, feat_minvals, feat_maxvals, intercept, calfactor


def calc_featnorms(featdefs, feat_minvals, feat_maxvals, creativeids, num_featkey=const.NUM_FEATKEY):
    """根据传入参数，按照模型训练数据中的归一化方法，计算在线特征归一化值。
       采用最大最小归一化。为了简化处理逻辑，类别型特征统一处理，
       训练数据最大最小值模型更新时一并上传到Redis中：
       1）类别型特征：设最大值为1，最小值为0，归一化后保持不变；
       2）数值型特征：Redis中存储训练数据集中该特征的最大最小值。

    Args:
        featdefs: 特征定义列表，传入参数根据定义可以计算出特征取值
        feat_minvals: 特征归一化最小值列表
        feat_maxvals: 特征归一化最大值列表
        creativeids: 符合定向条件的候选广告创意ID列表
        num_featkey: 训练数据中数值特征不做onehot，配置文件中数值特征key值统一定义为num_featkey，
                     生成python命令时替换为具体值。

    Returns:
        featnorms: 在线特征归一化结果列表
    """
    featvals = []
    minvals = []
    maxvals = []
    creativeid = creativeids[0]
    for featname in featdefs:
        # Redis中取到的值为byte类型，如 b'ctv_last7days_ctr'，需转换为字符串
        pycmd = ''.join(['featkey = ', str(featdefs[featname], encoding="utf8")])
        loc = locals()
        exec(pycmd)
        if loc['featkey'] == num_featkey:
            pycmd = ''.join(['val = float(', str(featname, encoding="utf8"), ')'])
            exec(pycmd)
            featvals.append(loc['val'])
        else:
            featvals.append(1)
        minvals.append(float(feat_minvals[featname]))
        maxvals.append(float(feat_maxvals[featname]))
    featnorms = np.divide(np.subtract(featvals, minvals), np.subtract(maxvals, minvals))
    return featnorms


def calc_ctr_score(rs, traindate, featdefs, intercept, calfactor, creativeid, featnorms, num_featkey=const.NUM_FEATKEY):
    """传入在线特征取值，计算CTR预测值。

    Args:
        rs: Redis连接对象
        traindate: 最新模型训练数据日期
        featdefs: 特征定义列表，传入参数根据定义可以计算出特征取值
        intercept: 模型常数项
        calfactor: 分段校正标识，根据训练数据分段CTR校正，评分CTR更准确
        creativeid: 待预测的创意ID
        featnorms: 特征归一化结果列表
    
    Returns:
        ctvctr: 创意点击率预测值
    """
    pipe = rs.pipeline()
    featnames = []
    featvals = []
    loc = locals()
    for featname in featdefs:
        # 提取出特征生成规则，形如 b'kdgrequest_device_imei[-2:]+creativeid'
        hashpath = '%s:%s:%s' % (const.PATH_FEATURES, traindate, str(featname, encoding="utf8"))
        pycmd = ''.join(['featkey = ', str(featdefs[featname], encoding="utf8")])
        exec(pycmd)
        featnames.append(featname)
        pipe.hget(hashpath, loc['featkey'])
        print(hashpath, loc['featkey'])
    keyvals = pipe.execute()

    i = 0
    print('\ncreativeid: ', creativeid)
    for keyval in keyvals:
        featval = float(keyval) if keyval is not None else 0
        # 归一化修正，大于最大值修正为1，小于最大值修正为0
        if featnorms[i] > 1:
            featnorms[i] = 1
        elif featnorms[i] < 0:
            featnorms[i] = 0
        featvals.append(featval * featnorms[i])
        print(featnames[i], featval * featnorms[i])
        i += 1

    # 模型训练时会进行下采样等特征处理，校正预测值到实际CTR预测值
    gx =np.sum(featvals) + intercept
    try:
        score = 1 / (1 + math.exp(-gx))
    except OverflowError:
        score = 1 if gx > 0 else 0    # 存在gx值过大或过小的可能，修正为1或0
    
    # 判断是否需要分段校正
    if calfactor == 1:
        ctvctr = fetch_actctr(rs, traindate, score)
    else:
        ctvctr = score
    return ctvctr


def fetch_actctr(rs, traindate, score):
    """传入在线特征取值，计算CTR预测值。

    Args:
        rs: Redis连接对象
        traindate: 最新模型训练数据日期
        score: 预测评分
    
    Returns:
        actctr: 预测评分score在训练数据中的实际CTR
    """
    score_actctr = rs.hgetall('%s:%s:%s' % (const.PATH_MODEL, traindate, const.SCORE_ACTCTR))
    for key in sorted(score_actctr.keys()):
        if score < float(key):
            actctr = float(score_actctr[key])
            break
    return actctr


if __name__ == '__main__':
    rs = rds.redis_connect()

    # ------------------------------------------------------
    # 监控服务，每日0:00后启动，需要改写。
    # 查询PATH_MODEL中最新训练日期
    # 注：实际程序中需要比较traindate是否大于当前预测日期
    traindate = fetch_traindate(rs)

    # 传入参数预测
    cal_ctr_predict()

    # 如果发现更大的traindate，则提取对应的特征信息。
    # 注：为了保证临界点时刻预测正常和错误回滚处理时间，模型更新时会保留原有特征信息48小时。
    # 提取当日特征定义信息，返回值为字典类型
    featdefs, feat_minvals, feat_maxvals, intercept, calfactor = fetch_featinfo(rs, traindate)
    # ------------------------------------------------------

    sttime = datetime.now()
    # CTR模型对数值特征做了最大最小归一化处理，预测时要对传入数值特征做同样处理
    featnorms = calc_featnorms(featdefs, feat_minvals, feat_maxvals, creativeids)

    # 根据参数生成特征名称key，并提取对应的value（注意：为了提高预测速度，value中存放模型预计算的权值*特征取值）
    # 注：测试中单次预测时间不超过10ms，如果候选创意较多，需要改写为并行预测方式
    ctvctrs = {}
    for creativeid in creativeids:
        ctvctrs[creativeid] = calc_ctr_score(rs, traindate, featdefs, intercept, calfactor, creativeid, featnorms)
        print('time cost till creative id %s: ' % creativeid, datetime.now() - sttime)
    print('score of creatives: ', ctvctrs)

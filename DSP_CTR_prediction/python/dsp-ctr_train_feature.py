#!/home/kddmer/.pyenv/versions/env4/bin/python
# -*- coding: utf-8 -*-

# ---------------------------------------------------------------------------
# File Name   : dsp_ctr_train_feature.py
# Description : 读取训练数据，归一化并保存
# Author      : 
# Create      : 2018/09/25
# ---------------------------------------------------------------------------


import sys
import os
import getopt
import numpy as np
import pandas as pd
import time
import warnings
from sklearn.externals import joblib
from sklearn.utils import shuffle
from scipy import sparse
from sklearn.preprocessing import LabelBinarizer
from sklearn.preprocessing import MinMaxScaler
sys.path.append("/home/kddmer/models/pub/")
import mysql_conn as ms


# 根据日期信息获取对应训练数据
def fetch_data(table, dt_info, lmt=''):
    mysql = ms.MyPymysqlPool("dbMysql")
    sql = "select \
          log_token\
          ,log_clk_flag\
          ,log_hour\
          ,log_advertiserid\
          ,log_campaignid\
          ,log_creativeid\
          ,log_mediashowid\
          ,log_media\
          ,log_channel\
          ,log_mcf\
          ,log_mcs\
          ,log_kdgrequest_device_devicetype\
          ,log_kdgrequest_device_make\
          ,log_kdgrequest_device_model\
          ,log_kdgrequest_device_os\
          ,log_kdgrequest_device_carrier\
          ,log_kdgrequest_device_connectiontype\
          ,log_adspace\
          ,log_adunit\
          ,log_adtype\
          ,log_adsize\
          ,log_region_country\
          ,log_region_province\
          ,log_region_city\
          ,ader_brand\
          ,ader_secondindustry\
          ,ctv_label\
          ,ctv_type\
          ,ctv_style_id\
          ,ctv_second_category\
          ,ctv_remark\
          ,truncated_ifa\
          ,truncated_imei\
          ,ifa_cross_ctv\
          ,ifa_cross_ad\
          ,ifa_cross_campaign\
          ,ifa_cross_ctv_style\
          ,ifa_cross_ader_brand\
          ,ifa_cross_ader_secondindustry\
          ,ifa_cross_ctv_second_category\
          ,imei_cross_ctv\
          ,imei_cross_ad\
          ,imei_cross_campaign\
          ,imei_cross_ctv_style\
          ,imei_cross_ader_brand\
          ,imei_cross_ader_secondindustry\
          ,imei_cross_ctv_second_category\
          ,camp_settlement_price\
          ,ctv_size\
          ,ifnull(adsp_last7days_ctr,0)\
          ,ifnull(adsp_yesterday_ctr,0)\
          ,ifnull(adsp_last7days_clk_cnt,0)\
          ,ifnull(adsp_yesterday_clk_cnt,0)\
          ,ifnull(ader_last7days_ctr,0)\
          ,ifnull(ader_yesterday_ctr,0)\
          ,ifnull(ader_last7days_clk_cnt,0)\
          ,ifnull(ader_yesterday_clk_cnt,0)\
          ,ifnull(ctv_last7days_ctr,0)\
          ,ifnull(ctv_yesterday_ctr,0)\
          ,ifnull(ctv_last7days_clk_cnt,0)\
          ,ifnull(ctv_yesterday_clk_cnt,0)\
          ,ifnull(media_last7days_ctr,0)\
          ,ifnull(media_yesterday_ctr,0)\
          ,ifnull(media_last7days_clk_cnt,0)\
          ,ifnull(media_yesterday_clk_cnt,0)\
          ,ifnull(city_last7days_ctr,0)\
          ,ifnull(city_yesterday_ctr,0)\
          ,ifnull(city_last7days_clk_cnt,0)\
          ,ifnull(city_yesterday_clk_cnt,0)\
          ,ifnull(ifa_last7days_ctr,0)\
          ,ifnull(ifa_yesterday_ctr,0)\
          ,ifnull(ifa_last7days_clk_cnt,0)\
          ,ifnull(ifa_yesterday_clk_cnt,0)\
          ,ifnull(imei_last7days_ctr,0)\
          ,ifnull(imei_yesterday_ctr,0)\
          ,ifnull(imei_last7days_clk_cnt,0)\
          ,ifnull(imei_yesterday_clk_cnt,0)\
          from dspbase.%s where log_day between DATE_SUB(\'%s\', INTERVAL 30 DAY) and \'%s\' %s"\
          % (table, dt_info, dt_info, lmt)
    rst = mysql.getAll(sql)
    if not rst:
        mysql.dispose()
        print('				No data!')
        exit()
    else:
      df = pd.DataFrame(list(list(x.values()) for x in rst)).fillna('')
      print('		%d rows data have been fetched.' % len(df))
      mysql.dispose()
      return shuffle(df)


# 用于原始数据的onehot
def one_encoding(col, ohfeats, unohfeats, dfTrain):
    '''
    :param col: 列名
    :param ohfeats: 需要onehot的列
    :param unohfeats: 不需要onehot的列
    :param dfTrain: 训练数据
    :param stype: 标准化
    :return: onehot之后的数据和索引信息
    '''
    feat_idx = []
    enc = LabelBinarizer(sparse_output=True)  # 字符串型类别变量只能用LabelBinarizer()
    cn = 0
    
    # 先拼接onehot字段
    for i, feat in enumerate(ohfeats):
        x_train = enc.fit_transform(dfTrain.iloc[:, feat].astype('str').values.reshape(-1, 1))
        
        if i == 0:
            X_train = x_train
        else:
            X_train = sparse.hstack((X_train, x_train), format='csc')
        
        # 拼接索引标签
        ec = list(enc.classes_)
        if len(ec) == 1:
            feat_idx.append('%s:%s %d' % (col[feat], ec, cn))
            cn += 1
        elif len(ec) == 2:
            # feat_idx.append('%s:%s %d' % (col[feat], ec[0], cn))
            feat_idx.append('%s:%s %d' % (col[feat], ec[1], cn))
            cn += 1
        else:
            for j in range(len(ec)):
                feat_idx.append('%s:%s %d' % (col[feat], ec[j], cn))
                cn += 1
        print('NO.%s:%s, shape: %s.' % (str(feat), col[feat], str(X_train.shape)))
    
    # 拼接非onehot字段
    for i, feat in enumerate(unohfeats):
        x1 = dfTrain.iloc[:, feat].astype(np.float64).values.reshape(-1, 1)

        scaler = MinMaxScaler().fit(x1)
        x_train = scaler.transform(x1)
        X_train = sparse.hstack((X_train, x_train), format='csc')
        
        feat_idx.append('%s:%s %d' % (col[feat], 'unohfeat', cn))
        cn += 1
        print('NO.%s:%s, shape: %s.' % (str(feat), col[feat], str(X_train.shape)))
    
    print('		%d onehot encoding concat: done!' % len(feat_idx))
    
    return X_train, feat_idx


if __name__ == '__main__':
    # 数据存放路径设置
    PATH = '/data/dsp_files/dsp_ctr-downsample/'
    
    try:
        # 传入相应参数
        opts, args = getopt.getopt(sys.argv[1:], 'ht:p:', ['traindate=', 'path='])
    except getopt.GetoptError:
        print('Error: test_arg.py -t <traindate> -p <path>')
        sys.exit(2)
    for opt, arg in opts:
        if opt in ('-t'):
            traindate = arg
        elif opt in ('-p'):
            PATH = arg
    
    warnings.filterwarnings(action='ignore', category=DeprecationWarning)
    print('Begin to exec dsp_ctr_train_feature.py for {0}'.format(traindate))
    
    table = 'dsp_ctr_train'
    log_day = traindate[0:4] + '-' + traindate[4:6] + '-' + traindate[6:8]
    df = fetch_data(table, log_day, '')
    cols = ['log_token'
        , 'log_clk_flag'
        , 'log_hour'
        , 'log_advertiserid'
        , 'log_campaignid'
        , 'log_creativeid'
        , 'log_mediashowid'
        , 'log_media'
        , 'log_channel'
        , 'log_mcf'
        , 'log_mcs'
        , 'log_kdgrequest_device_devicetype'
        , 'log_kdgrequest_device_make'
        , 'log_kdgrequest_device_model'
        , 'log_kdgrequest_device_os'
        , 'log_kdgrequest_device_carrier'
        , 'log_kdgrequest_device_connectiontype'
        , 'log_adspace'
        , 'log_adunit'
        , 'log_adtype'
        , 'log_adsize'
        , 'log_region_country'
        , 'log_region_province'
        , 'log_region_city'
        , 'ader_brand'
        , 'ader_secondindustry'
        , 'ctv_label'
        , 'ctv_type'
        , 'ctv_style_id'
        , 'ctv_second_category'
        , 'ctv_remark'
        , 'truncated_ifa'
        , 'truncated_imei'
        , 'ifa_cross_ctv'
        , 'ifa_cross_ad'
        , 'ifa_cross_campaign'
        , 'ifa_cross_ctv_style'
        , 'ifa_cross_ader_brand'
        , 'ifa_cross_ader_secondindustry'
        , 'ifa_cross_ctv_second_category'
        , 'imei_cross_ctv'
        , 'imei_cross_ad'
        , 'imei_cross_campaign'
        , 'imei_cross_ctv_style'
        , 'imei_cross_ader_brand'
        , 'imei_cross_ader_secondindustry'
        , 'imei_cross_ctv_second_category'
        , 'camp_settlement_price'
        , 'ctv_size'
        , 'adsp_last7days_ctr'
        , 'adsp_yesterday_ctr'
        , 'adsp_last7days_clk_cnt'
        , 'adsp_yesterday_clk_cnt'
        , 'ader_last7days_ctr'
        , 'ader_yesterday_ctr'
        , 'ader_last7days_clk_cnt'
        , 'ader_yesterday_clk_cnt'
        , 'ctv_last7days_ctr'
        , 'ctv_yesterday_ctr'
        , 'ctv_last7days_clk_cnt'
        , 'ctv_yesterday_clk_cnt'
        , 'media_last7days_ctr'
        , 'media_yesterday_ctr'
        , 'media_last7days_clk_cnt'
        , 'media_yesterday_clk_cnt'
        , 'city_last7days_ctr'
        , 'city_yesterday_ctr'
        , 'city_last7days_clk_cnt'
        , 'city_yesterday_clk_cnt'
        , 'ifa_last7days_ctr'
        , 'ifa_yesterday_ctr'
        , 'ifa_last7days_clk_cnt'
        , 'ifa_yesterday_clk_cnt'
        , 'imei_last7days_ctr'
        , 'imei_yesterday_ctr'
        , 'imei_last7days_clk_cnt'
        , 'imei_yesterday_clk_cnt']
    df.columns = cols
    cols = list(df.columns)

    print('----------OneEncoding--------')
    ohfeats = [i for i in range(2, 47)]
    unohfeats = [i for i in range(47, 77)]
    t1 = time.time()
    X_train, feat_idx = one_encoding(cols, ohfeats, unohfeats, df)
    t2 = time.time()
    print('OneEncoding cost:', str(t2 - t1))
    print('Data size:', X_train.shape)

    y_train = df.iloc[:, 1].values
    token = df.iloc[:, 0].values
    joblib.dump((X_train, y_train, token), '{0}dsp_ctr_Xy_train{1}.pkl'.format(PATH, traindate), compress=3)
    joblib.dump(feat_idx, '{0}dsp_ctr_train_featidx{1}.pkl'.format(PATH, traindate), compress=3)
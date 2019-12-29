#!/home/kddmer/.pyenv/versions/env4/bin/python
# -*- coding: utf-8 -*-
"""
---------------------------------------------------------------------------
File Name   : dsp_ctr_train_model.py
Description : 离线训练CTR模型并保存模型文件。
Author      : 
Created at  : 2018/09/25
---------------------------------------------------------------------------
"""
import getopt
import time
import warnings
import numpy as np
from sklearn.externals import joblib
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import roc_auc_score, classification_report
from sklearn.model_selection import cross_val_score, train_test_split

import sys
sys.path.append('/home/kddmer/scripts')
import mysql_conn as ms


def cal_weight(traindate):
    """计算下采样样本权值，传入训练模型，CTR预测评分时需要进行校正。

    Args:
        traindate: 训练数据日期

    Returns:
        raw_ctr：原始数据中的正样本比例，即原始CTR
        train_ctr：下采样训练数据中的正样本比例，即训练数据CTR
    """
    sql1 = "select sum(merge_positive)/sum(merge_negative) from dspbase.dsp_ctr_calibration \
                where log_day between DATE_SUB(\'%s\', INTERVAL 30 DAY) and \'%s\';" % (traindate, traindate)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        raw_ctr = mysql.getOne(sql1)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    raw_ctr = list(raw_ctr.values())[0]

    sql2 = "select sum(train_positive)/sum(train_negative) from dspbase.dsp_ctr_calibration where\
           log_day between DATE_SUB(\'%s\', INTERVAL 30 DAY) and \'%s\';" % (traindate, traindate)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        train_ctr = mysql.getOne(sql2)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    train_ctr = list(train_ctr.values())[0]
    
    return raw_ctr, train_ctr


def model_predict(model, modelinfo, feats, labels, rawctr=0.01):
    """打印模型预测评分，以便了解模型性能。

    Args:
        model: 训练模型
        modelinfo: 训练模型类型
        feats: 特征数据
        labels: 点击标识
        rawctr: 原始数据的实际CTR

    Returns:
        None
    """
    pred_proba = model.predict_proba(feats)
    pred_label = np.array(pred_proba[:, 1]) > rawctr
    print("accuracy score %s: " % modelinfo)
    print(classification_report(labels, pred_label, digits=5))
    print('AUC: %.4f' % roc_auc_score(labels, pred_label))
    return None


if __name__ == '__main__':
    # PATH = sys.argv[1]    # 数据存放路径设置
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
    warnings.filterwarnings(action='ignore', category=FutureWarning)
    print('Begin to exec dsp_ctr_train_model.py for {0}'.format(traindate))

    # 计算模型中的正负样本权值
    log_day = traindate[0:4] + '-' + traindate[4:6] + '-' + traindate[6:8]
    raw_ctr, train_ctr = cal_weight(log_day)
    # n_ratio = train_ctr / raw_ctr
    # p_ratio = (1 - raw_ctr) / (1 - train_ctr)
    n_ratio = (1 - raw_ctr) / (1 - train_ctr)
    p_ratio = raw_ctr / train_ctr
    
    # 训练模型
    print('LR training...')
    t1 = time.time()
    model = LogisticRegression(C=0.1, penalty='l2', class_weight={0:n_ratio, 1:p_ratio})
    X_train, y_train, token = joblib.load('{0}dsp_ctr_Xy_train{1}.pkl'.format(PATH, traindate))
    
    # # l1 = [i for i in range(66)]
    # # l2 = [i for i in range(80, X_train.shape[1])]
    # # l1.extend(l2)
    # l1 = [i for i in range(205, 1192)]
    # X_train = X_train[:, l1]
    # # exit(0)
    # print(X_train.shape)
    model.fit(X_train, y_train)
    t2 = time.time()
    print('time cost:', t2 - t1)
    joblib.dump(model, '{0}dsp_ctr_train_lr{1}.pkl'.format(PATH, traindate), compress=3)
    model_predict(model, 'train', X_train, y_train, raw_ctr)
    # exit(0)
    
    print('model performance monitoring...')
    for i in range(5):
        print('random_state is', i)
        X_tr, X_te, y_tr, y_te = train_test_split(X_train, y_train, test_size=0.2, random_state=i)
        model = LogisticRegression(C=0.1, penalty='l2', class_weight={0:n_ratio, 1:p_ratio})
        model.fit(X_tr, y_tr)
        model_predict(model, 'cv_train {0}'.format(i), X_tr, y_tr, raw_ctr)
        model_predict(model, 'cv_test {0}'.format(i), X_te, y_te, raw_ctr)
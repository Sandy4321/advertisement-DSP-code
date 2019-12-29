#!/home/kddmer/.pyenv/versions/env4/bin/python
# -*- coding: utf-8 -*-

# ---------------------------------------------------------------------------
# File Name   : dsp_ctr_train_gen_featdefs.py
# Description : 生成所需配置文件，同时更新dsp_ctr_train_minmax表。
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
sys.path.append("/home/kddmer/models/pub/")
import mysql_conn as ms


# 根据日期信息获取对应训练数据
def fetch_data(table, dt_info, lmt=''):
    mysql = ms.MyPymysqlPool("dbMysql")
    sql = "select \
          camp_settlement_price\
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
          from dspbase.%s where log_day between DATE_SUB(\'%s\', INTERVAL 30 DAY) and \'%s\' %s" \
          % (table, dt_info, dt_info, lmt)
    rst = mysql.getAll(sql)
    if not rst:
        mysql.dispose()
        print('				No data!')
        exit()
    else:
      df = pd.DataFrame(list(list(x.values()) for x in rst)).fillna(-1)
      print('		%d rows data have been fetched.' % len(df))
      mysql.dispose()
      return df


def update_table_minmax():
    # 若存在该天数据，则首先删除
    sql = "delete from dspbase.dsp_ctr_train_minmax where log_day=\'%s\'" % (log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.delete(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    
    sql = "insert into dspbase.dsp_ctr_train_minmax select \'{0}\',{1},{2},{3},{4},{5},{6},{7},{8},{9},{10}\
               ,{11},{12},{13},{14},{15},{16},{17},{18},{19},{20},{21},{22},{23},{24},{25},{26},{27},{28},{29}\
               ,{30},{31},{32},{33},{34},{35},{36},{37},{38},{39},{40},{41},{42},{43},{44},{45},{46},{47},{48},{49},{50}\
               ,{51},{52},{53},{54},{55},{56},{57},{58},{59},{60}".format(log_day
                                                                          , df['camp_settlement_price'].min()
                                                                          , df['ctv_size'].min()
                                                                          , df['adsp_last7days_ctr'].min()
                                                                          , df['adsp_yesterday_ctr'].min()
                                                                          , df['adsp_last7days_clk_cnt'].min()
                                                                          , df['adsp_yesterday_clk_cnt'].min()
                                                                          , df['ader_last7days_ctr'].min()
                                                                          , df['ader_yesterday_ctr'].min()
                                                                          , df['ader_last7days_clk_cnt'].min()
                                                                          , df['ader_yesterday_clk_cnt'].min()
                                                                          , df['ctv_last7days_ctr'].min()
                                                                          , df['ctv_yesterday_ctr'].min()
                                                                          , df['ctv_last7days_clk_cnt'].min()
                                                                          , df['ctv_yesterday_clk_cnt'].min()
                                                                          , df['media_last7days_ctr'].min()
                                                                          , df['media_yesterday_ctr'].min()
                                                                          , df['media_last7days_clk_cnt'].min()
                                                                          , df['media_yesterday_clk_cnt'].min()
                                                                          , df['city_last7days_ctr'].min()
                                                                          , df['city_yesterday_ctr'].min()
                                                                          , df['city_last7days_clk_cnt'].min()
                                                                          , df['city_yesterday_clk_cnt'].min()
                                                                          , df['ifa_last7days_ctr'].min()
                                                                          , df['ifa_yesterday_ctr'].min()
                                                                          , df['ifa_last7days_clk_cnt'].min()
                                                                          , df['ifa_yesterday_clk_cnt'].min()
                                                                          , df['imei_last7days_ctr'].min()
                                                                          , df['imei_yesterday_ctr'].min()
                                                                          , df['imei_last7days_clk_cnt'].min()
                                                                          , df['imei_yesterday_clk_cnt'].min()
                                                                          , df['camp_settlement_price'].max()
                                                                          , df['ctv_size'].max()
                                                                          , df['adsp_last7days_ctr'].max()
                                                                          , df['adsp_yesterday_ctr'].max()
                                                                          , df['adsp_last7days_clk_cnt'].max()
                                                                          , df['adsp_yesterday_clk_cnt'].max()
                                                                          , df['ader_last7days_ctr'].max()
                                                                          , df['ader_yesterday_ctr'].max()
                                                                          , df['ader_last7days_clk_cnt'].max()
                                                                          , df['ader_yesterday_clk_cnt'].max()
                                                                          , df['ctv_last7days_ctr'].max()
                                                                          , df['ctv_yesterday_ctr'].max()
                                                                          , df['ctv_last7days_clk_cnt'].max()
                                                                          , df['ctv_yesterday_clk_cnt'].max()
                                                                          , df['media_last7days_ctr'].max()
                                                                          , df['media_yesterday_ctr'].max()
                                                                          , df['media_last7days_clk_cnt'].max()
                                                                          , df['media_yesterday_clk_cnt'].max()
                                                                          , df['city_last7days_ctr'].max()
                                                                          , df['city_yesterday_ctr'].max()
                                                                          , df['city_last7days_clk_cnt'].max()
                                                                          , df['city_yesterday_clk_cnt'].max()
                                                                          , df['ifa_last7days_ctr'].max()
                                                                          , df['ifa_yesterday_ctr'].max()
                                                                          , df['ifa_last7days_clk_cnt'].max()
                                                                          , df['ifa_yesterday_clk_cnt'].max()
                                                                          , df['imei_last7days_ctr'].max()
                                                                          , df['imei_yesterday_ctr'].max()
                                                                          , df['imei_last7days_clk_cnt'].max()
                                                                          , df['imei_yesterday_clk_cnt'].max())
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()


if __name__ == '__main__':
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
    print('Begin to exec dsp_ctr_train_gen_featdefs.py for {0}'.format(traindate))
    
    table = 'dsp_ctr_train'
    log_day = traindate[0:4] + '-' + traindate[4:6] + '-' + traindate[6:8]
    df = fetch_data(table, log_day, '')
    cols = ['camp_settlement_price'
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
    
    conf = '''log_hour	hour	0	1
log_advertiserid	advertiserid	0	1
log_campaignid	campaignid	0	1
log_creativeid	creativeid	0	1
log_mediashowid	mediashowid	0	1
log_media	media	0	1
log_channel	channel	0	1
log_mcf	mcf	0	1
log_mcs	mcs	0	1
log_kdgrequest_device_devicetype	kdgrequest_device_devicetype	0	1
log_kdgrequest_device_make	kdgrequest_device_make	0	1
log_kdgrequest_device_model	kdgrequest_device_model	0	1
log_kdgrequest_device_os	kdgrequest_device_os	0	1
log_kdgrequest_device_carrier	kdgrequest_device_carrier	0	1
log_kdgrequest_device_connectiontype	kdgrequest_device_connectiontype	0	1
log_adspace	adspace	0	1
log_adunit	adunit	0	1
log_adtype	adtype	0	1
log_adsize	adsize	0	1
log_region_country	region_country	0	1
log_region_province	region_province	0	1
log_region_city	region_city	0	1
ader_brand	ader_brand	0	1
ader_secondindustry	ader_secondindustry	0	1
ctv_label	ctv_label	0	1
ctv_type	ctv_type	0	1
ctv_style_id	ctv_style_id	0	1
ctv_second_category	ctv_second_category	0	1
ctv_remark	ctv_remark	0	1
truncated_ifa	kdgrequest_device_ifa[-2:]	0	1
truncated_imei	kdgrequest_device_imei[-2:]	0	1
ifa_cross_ctv	''.join('' if kdgrequest_device_ifa[-2:]=='' or creativeid=='' else [kdgrequest_device_ifa[-2:],creativeid])	0	1
ifa_cross_ad	''.join('' if kdgrequest_device_ifa[-2:]=='' or adunit=='' else [kdgrequest_device_ifa[-2:],adunit])	0	1
ifa_cross_campaign	''.join('' if kdgrequest_device_ifa[-2:]=='' or campaignid=='' else [kdgrequest_device_ifa[-2:],campaignid])	0	1
ifa_cross_ctv_style	''.join('' if kdgrequest_device_ifa[-2:]=='' or ctv_style_id=='' else [kdgrequest_device_ifa[-2:],ctv_style_id])	0	1
ifa_cross_ader_brand	''.join('' if kdgrequest_device_ifa[-2:]=='' or ader_brand=='' else [kdgrequest_device_ifa[-2:],ader_brand])	0	1
ifa_cross_ader_secondindustry	''.join('' if kdgrequest_device_ifa[-2:]=='' or ader_secondindustry=='' else [kdgrequest_device_ifa[-2:],ader_secondindustry])	0	1
ifa_cross_ctv_second_category	''.join('' if kdgrequest_device_ifa[-2:]=='' or ctv_second_category=='' else [kdgrequest_device_ifa[-2:],ctv_second_category])	0	1
imei_cross_ctv	''.join('' if kdgrequest_device_imei[-2:]=='' or creativeid=='' else [kdgrequest_device_imei[-2:],creativeid])	0	1
imei_cross_ad	''.join('' if kdgrequest_device_imei[-2:]=='' or adunit=='' else [kdgrequest_device_imei[-2:],adunit])	0	1
imei_cross_campaign	''.join('' if kdgrequest_device_imei[-2:]=='' or campaignid=='' else [kdgrequest_device_imei[-2:],campaignid])	0	1
imei_cross_ctv_style	''.join('' if kdgrequest_device_imei[-2:]=='' or ctv_style_id=='' else [kdgrequest_device_imei[-2:],ctv_style_id])	0	1
imei_cross_ader_brand	''.join('' if kdgrequest_device_imei[-2:]=='' or ader_brand=='' else [kdgrequest_device_imei[-2:],ader_brand])	0	1
imei_cross_ader_secondindustry	''.join('' if kdgrequest_device_imei[-2:]=='' or ader_secondindustry=='' else [kdgrequest_device_imei[-2:],ader_secondindustry])	0	1
imei_cross_ctv_second_category	''.join('' if kdgrequest_device_imei[-2:]=='' or ctv_second_category=='' else [kdgrequest_device_imei[-2:],ctv_second_category])	0	1'''
    
    update_table_minmax()
    
    print('----------Gen Featdefs--------')
    if os.path.exists('{0}dsp_ctr_featdefs{1}.conf'.format(PATH, traindate)):
        os.remove('{0}dsp_ctr_featdefs{1}.conf'.format(PATH, traindate))
    with open('{0}dsp_ctr_featdefs{1}.conf'.format(PATH, traindate), 'a') as f:
        f.write(conf + '\n')
        f.write('camp_settlement_price' + '\t' + 'num_featkey' + '\t' + str(int(df['camp_settlement_price'].min()))
                + '\t' + str(int(df['camp_settlement_price'].max())) + '\n')
        f.write('ctv_size' + '\t' + 'num_featkey' + '\t' + str(int(df['ctv_size'].min()))
                + '\t' + str(int(df['ctv_size'].max())) + '\n')
        f.write('adsp_last7days_ctr' + '\t' + 'adspace' + '\t' + str(df['adsp_last7days_ctr'].min())
                + '\t' + str(df['adsp_last7days_ctr'].max()) + '\n')
        f.write('adsp_yesterday_ctr' + '\t' + 'adspace' + '\t' + str(df['adsp_yesterday_ctr'].min())
                + '\t' + str(df['adsp_yesterday_ctr'].max()) + '\n')
        f.write('adsp_last7days_clk_cnt' + '\t' + 'adspace' + '\t' + str(int(df['adsp_last7days_clk_cnt'].min()))
                + '\t' + str(int(df['adsp_last7days_clk_cnt'].max())) + '\n')
        f.write('adsp_yesterday_clk_cnt' + '\t' + 'adspace' + '\t' + str(int(df['adsp_yesterday_clk_cnt'].min()))
                + '\t' + str(int(df['adsp_yesterday_clk_cnt'].max())) + '\n')
        f.write('ader_last7days_ctr' + '\t' + 'advertiserid' + '\t' + str(df['ader_last7days_ctr'].min())
                + '\t' + str(df['ader_last7days_ctr'].max()) + '\n')
        f.write('ader_yesterday_ctr' + '\t' + 'advertiserid' + '\t' + str(df['ader_yesterday_ctr'].min())
                + '\t' + str(df['ader_yesterday_ctr'].max()) + '\n')
        f.write('ader_last7days_clk_cnt' + '\t' + 'advertiserid' + '\t' + str(int(df['ader_last7days_clk_cnt'].min()))
                + '\t' + str(int(df['ader_last7days_clk_cnt'].max())) + '\n')
        f.write('ader_yesterday_clk_cnt' + '\t' + 'advertiserid' + '\t' + str(int(df['ader_yesterday_clk_cnt'].min()))
                + '\t' + str(int(df['ader_yesterday_clk_cnt'].max())) + '\n')
        f.write('ctv_last7days_ctr' + '\t' + 'creativeid' + '\t' + str(df['ctv_last7days_ctr'].min())
                + '\t' + str(df['ctv_last7days_ctr'].max()) + '\n')
        f.write('ctv_yesterday_ctr' + '\t' + 'creativeid' + '\t' + str(df['ctv_yesterday_ctr'].min())
                + '\t' + str(df['ctv_yesterday_ctr'].max()) + '\n')
        f.write('ctv_last7days_clk_cnt' + '\t' + 'creativeid' + '\t' + str(int(df['ctv_last7days_clk_cnt'].min()))
                + '\t' + str(int(df['ctv_last7days_clk_cnt'].max())) + '\n')
        f.write('ctv_yesterday_clk_cnt' + '\t' + 'creativeid' + '\t' + str(int(df['ctv_yesterday_clk_cnt'].min()))
                + '\t' + str(int(df['ctv_yesterday_clk_cnt'].max())) + '\n')
        f.write('media_last7days_ctr' + '\t' + 'media' + '\t' + str(df['media_last7days_ctr'].min())
                + '\t' + str(df['media_last7days_ctr'].max()) + '\n')
        f.write('media_yesterday_ctr' + '\t' + 'media' + '\t' + str(df['media_yesterday_ctr'].min())
                + '\t' + str(df['media_yesterday_ctr'].max()) + '\n')
        f.write('media_last7days_clk_cnt' + '\t' + 'media' + '\t' + str(int(df['media_last7days_clk_cnt'].min()))
                + '\t' + str(int(df['media_last7days_clk_cnt'].max())) + '\n')
        f.write('media_yesterday_clk_cnt' + '\t' + 'media' + '\t' + str(int(df['media_yesterday_clk_cnt'].min()))
                + '\t' + str(int(df['media_yesterday_clk_cnt'].max())) + '\n')
        f.write('city_last7days_ctr' + '\t' + 'region_city' + '\t' + str(df['city_last7days_ctr'].min())
                + '\t' + str(df['city_last7days_ctr'].max()) + '\n')
        f.write('city_yesterday_ctr' + '\t' + 'region_city' + '\t' + str(df['city_yesterday_ctr'].min())
                + '\t' + str(df['city_yesterday_ctr'].max()) + '\n')
        f.write('city_last7days_clk_cnt' + '\t' + 'region_city' + '\t' + str(int(df['city_last7days_clk_cnt'].min()))
                + '\t' + str(int(df['city_last7days_clk_cnt'].max())) + '\n')
        f.write('city_yesterday_clk_cnt' + '\t' + 'region_city' + '\t' + str(int(df['city_yesterday_clk_cnt'].min()))
                + '\t' + str(int(df['city_yesterday_clk_cnt'].max())) + '\n')
        f.write('ifa_last7days_ctr' + '\t' + 'kdgrequest_device_ifa' + '\t' + str(df['ifa_last7days_ctr'].min())
                + '\t' + str(df['ifa_last7days_ctr'].max()) + '\n')
        f.write('ifa_yesterday_ctr' + '\t' + 'kdgrequest_device_ifa' + '\t' + str(df['ifa_yesterday_ctr'].min())
                + '\t' + str(df['ifa_yesterday_ctr'].max()) + '\n')
        f.write('ifa_last7days_clk_cnt' + '\t' + 'kdgrequest_device_ifa' + '\t' + str(int(df['ifa_last7days_clk_cnt'].min()))
                + '\t' + str(int(df['ifa_last7days_clk_cnt'].max())) + '\n')
        f.write('ifa_yesterday_clk_cnt' + '\t' + 'kdgrequest_device_ifa' + '\t' + str(int(df['ifa_yesterday_clk_cnt'].min()))
                + '\t' + str(int(df['ifa_yesterday_clk_cnt'].max())) + '\n')
        f.write('imei_last7days_ctr' + '\t' + 'kdgrequest_device_imei' + '\t' + str(df['imei_last7days_ctr'].min())
                + '\t' + str(df['imei_last7days_ctr'].max()) + '\n')
        f.write('imei_yesterday_ctr' + '\t' + 'kdgrequest_device_imei' + '\t' + str(df['imei_yesterday_ctr'].min())
                + '\t' + str(df['imei_yesterday_ctr'].max()) + '\n')
        f.write('imei_last7days_clk_cnt' + '\t' + 'kdgrequest_device_imei' + '\t' + str(int(df['imei_last7days_clk_cnt'].min()))
                + '\t' + str(int(df['imei_last7days_clk_cnt'].max())) + '\n')
        f.write('imei_yesterday_clk_cnt' + '\t' + 'kdgrequest_device_imei' + '\t' + str(int(df['imei_yesterday_clk_cnt'].min()))
                + '\t' + str(int(df['imei_yesterday_clk_cnt'].max())) + '\n')
    print('done!')

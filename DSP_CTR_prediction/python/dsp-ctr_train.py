#!/home/kddmer/.pyenv/versions/env4/bin/python
# -*- coding: utf-8 -*-

# ---------------------------------------------------------------------------
# File Name   : dsp_ctr_train.py
# Description : 生成下采样训练数据
# Author      : 
# Create      : 2018/09/25
# ---------------------------------------------------------------------------


import sys
import os
import time
import warnings
import getopt
sys.path.append("/home/kddmer/models/pub/")
import mysql_conn as ms


# 向训练表dsp_ctr_train中插入数据
def insert_dsp_train_base(dt):
    log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]
    
    # 若存在该天数据，则首先删除
    sql = "delete from dspbase.dsp_ctr_train where log_day=\'%s\'" % (log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.delete(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    
    # 向训练表中插入有点击的数据
    sql = "insert into dspbase.dsp_ctr_train                                                    \
(log_token                                                                   \
,log_dt                                                                      \
,log_day                                                                     \
,log_hour                                                                    \
,log_clk_flag                                                                \
,log_advertiserid                                                            \
,log_campaignid                                                              \
,log_creativeid                                                              \
,log_mediashowid                                                             \
,log_media                                                                   \
,log_channel                                                                 \
,log_mcf                                                                     \
,log_mcs                                                                     \
,log_kdgrequest_device_devicetype                                            \
,log_kdgrequest_device_make                                                  \
,log_kdgrequest_device_model                                                 \
,log_kdgrequest_device_os                                                    \
,log_kdgrequest_device_carrier                                               \
,log_kdgrequest_device_connectiontype                                        \
,log_kdgrequest_device_ifa                                                   \
,log_kdgrequest_device_imeimd5                                               \
,log_adspace                                                                 \
,log_adunit                                                                  \
,log_adtype                                                                  \
,log_adsize                                                                  \
,log_region_country                                                          \
,log_region_province                                                         \
,log_region_city                                                             \
,ader_brand                                                                  \
,ader_secondindustry                                                         \
,camp_settlement_price                                                       \
,ctv_size                                                                    \
,ctv_label                                                                   \
,ctv_type                                                                    \
,ctv_style_id                                                                \
,ctv_link_type                                                               \
,ctv_second_category                                                         \
,ctv_remark                                                                  \
,truncated_ifa                                                               \
,ifa_cross_ctv                                                               \
,ifa_cross_ad                                                                \
,ifa_cross_campaign                                                          \
,ifa_cross_ctv_style                                                         \
,ifa_cross_ader_brand                                                        \
,ifa_cross_ader_secondindustry                                               \
,ifa_cross_ctv_second_category                                               \
,truncated_imei                                                              \
,imei_cross_ctv                                                              \
,imei_cross_ad                                                               \
,imei_cross_campaign                                                         \
,imei_cross_ctv_style                                                        \
,imei_cross_ader_brand                                                       \
,imei_cross_ader_secondindustry                                              \
,imei_cross_ctv_second_category                                              \
,adsp_last7days_ctr                                                          \
,adsp_yesterday_ctr                                                          \
,adsp_last7days_clk_cnt                                                      \
,adsp_yesterday_clk_cnt                                                      \
,ader_last7days_ctr                                                          \
,ader_yesterday_ctr                                                          \
,ader_last7days_clk_cnt                                                      \
,ader_yesterday_clk_cnt                                                      \
,ctv_last7days_ctr                                                           \
,ctv_yesterday_ctr                                                           \
,ctv_last7days_clk_cnt                                                       \
,ctv_yesterday_clk_cnt                                                       \
,media_last7days_ctr                                                         \
,media_yesterday_ctr                                                         \
,media_last7days_clk_cnt                                                     \
,media_yesterday_clk_cnt                                                     \
,city_last7days_ctr                                                          \
,city_yesterday_ctr                                                          \
,city_last7days_clk_cnt                                                      \
,city_yesterday_clk_cnt                                                      \
,ifa_last7days_ctr                                                           \
,ifa_yesterday_ctr                                                           \
,ifa_last7days_clk_cnt                                                       \
,ifa_yesterday_clk_cnt                                                       \
,imei_last7days_ctr                                                          \
,imei_yesterday_ctr                                                          \
,imei_last7days_clk_cnt                                                      \
,imei_yesterday_clk_cnt                                                      \
)                                                                            \
select                                                                       \
    t1.log_token                                                               \
    ,t1.log_dt                                                                 \
    ,t1.log_day                                                                \
    ,t1.log_hour                                                               \
    ,t1.log_clk_flag                                                           \
    ,t1.log_advertiserid                                                       \
    ,t1.log_campaignid                                                         \
    ,t1.log_creativeid                                                         \
    ,t1.log_mediashowid                                                        \
    ,t1.log_media                                                              \
    ,t1.log_channel                                                            \
    ,t1.log_mcf                                                                \
    ,t1.log_mcs                                                                \
    ,cast(t1.log_kdgrequest_device_devicetype as char(50))                     \
    ,t1.log_kdgrequest_device_make                                             \
    ,t1.log_kdgrequest_device_model                                            \
    ,t1.log_kdgrequest_device_os                                               \
    ,cast(t1.log_kdgrequest_device_carrier as char(50))                        \
    ,cast(t1.log_kdgrequest_device_connectiontype as char(50))                 \
    ,t1.log_kdgrequest_device_ifa                                              \
    ,t1.log_kdgrequest_device_imeimd5                                          \
    ,t1.log_adspace                                                            \
    ,t1.log_adunit                                                             \
    ,t1.log_adtype                                                             \
    ,cast(t1.log_adtype as char(50))                                           \
    ,t8.country                                                                \
    ,t8.province                                                               \
    ,t8.city                                                                   \
    ,t1.ader_brand                                                             \
    ,t1.ader_secondindustry                                                    \
    ,t1.camp_settlement_price                                                  \
    ,t1.ctv_size                                                               \
    ,t1.ctv_label                                                              \
    ,t1.ctv_type                                                               \
    ,cast(t1.ctv_style_id as char(50))                                         \
    ,cast(t1.ctv_link_type as char(50))                                        \
    ,cast(t1.ctv_second_category as char(50))                                  \
    ,t1.ctv_remark                                                             \
    ,right(t1.log_kdgrequest_device_ifa,2)                                     \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.log_creativeid)          \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.log_adunit)              \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.log_campaignid)          \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.ctv_style_id)            \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.ader_brand)              \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.ader_secondindustry)     \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.ctv_second_category)     \
    ,right(t1.log_kdgrequest_device_imeimd5,2)                                 \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.log_creativeid)      \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.log_adunit)          \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.log_campaignid)      \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.ctv_style_id)        \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.ader_brand)          \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.ader_secondindustry) \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.ctv_second_category) \
    ,t22.click_cnt_week/t22.impression_cnt_week                                 \
    ,t22.click_cnt/t22.impression_cnt                                           \
    ,t22.click_cnt_week                                                        \
    ,t22.click_cnt                                                             \
    ,t2.click_cnt_week/t2.impression_cnt_week                                  \
    ,t2.click_cnt/t2.impression_cnt                                            \
    ,t2.click_cnt_week                                                         \
    ,t2.click_cnt                                                            	\
    ,t3.click_cnt_week/t3.impression_cnt_week                                  \
    ,t3.click_cnt/t3.impression_cnt                                            \
    ,t3.click_cnt_week                                                         \
    ,t3.click_cnt                                                              \
    ,t4.click_cnt_week/t4.impression_cnt_week                                  \
    ,t4.click_cnt/t4.impression_cnt                                            \
    ,t4.click_cnt_week                                                         \
    ,t4.click_cnt                                                              \
    ,t5.click_cnt_week/t5.impression_cnt_week                                  \
    ,t5.click_cnt/t5.impression_cnt                                            \
    ,t5.click_cnt_week                                                         \
    ,t5.click_cnt                                                              \
    ,t6.click_cnt_week/t6.impression_cnt_week                                  \
    ,t6.click_cnt/t6.impression_cnt                                            \
    ,t6.click_cnt_week                                                         \
    ,t6.click_cnt                                                              \
    ,t7.click_cnt_week/t7.impression_cnt_week                                  \
    ,t7.click_cnt/t7.impression_cnt                                            \
    ,t7.click_cnt_week                                                         \
    ,t7.click_cnt                                                              \
from dspbase.dsp_ctr_daily_merge%s t1                                                \
left join dspbase.dsp_ctr_stat_adspace t22                                           \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t22.log_day                        \
and t1.log_adspace = t22.log_adspace                                         \
left join dspbase.dsp_ctr_stat_advertiser t2                                         \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t2.log_day                         \
and t1.log_advertiserid = t2.log_advertiserid                                \
left join dspbase.dsp_ctr_stat_creative t3                                           \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t3.log_day                         \
and t1.log_creativeid = t3.log_creativeid                                    \
left join dspbase.dsp_ctr_stat_media t4                                              \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t4.log_day                         \
and t1.log_media = t4.log_media                                              \
left join dspbase.dsp_ctr_stat_city t5                                               \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t5.log_day                         \
and t1.log_region = t5.log_region_city                                       \
left join dspbase.dsp_ctr_stat_ifa t6                                                \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t6.log_day                         \
and t1.log_kdgrequest_device_ifa = t6.log_kdgrequest_device_ifa              \
left join dspbase.dsp_ctr_stat_imei t7                                               \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t7.log_day                         \
and t1.log_kdgrequest_device_imeimd5 = t7.log_kdgrequest_device_imeimd5      \
left join dspbase.dsp_config_city t8                                                 \
on t1.log_region = t8.city                                                   \
where t1.log_istest=0                                                        \
and locate('测试',t1.ader_brand)=0                                             \
and t1.log_adNormalType=0                                                    \
and t1.log_clk_flag=1;" % (dt)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # 有曝光无点击的数据，下采样，倍率为0.025
    sql1 = "select cast((select count(*)*0.025 from dspbase.dsp_ctr_daily_merge%s where log_clk_flag=0) as signed);" % (dt)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        num = mysql.getOne(sql1)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    num = list(num.values())[0]
    # 向训练表中插入下采样数据
    sql2 = "insert into dspbase.dsp_ctr_train                                                    \
(log_token                                                                   \
,log_dt                                                                      \
,log_day                                                                     \
,log_hour                                                                    \
,log_clk_flag                                                                \
,log_advertiserid                                                            \
,log_campaignid                                                              \
,log_creativeid                                                              \
,log_mediashowid                                                             \
,log_media                                                                   \
,log_channel                                                                 \
,log_mcf                                                                     \
,log_mcs                                                                     \
,log_kdgrequest_device_devicetype                                            \
,log_kdgrequest_device_make                                                  \
,log_kdgrequest_device_model                                                 \
,log_kdgrequest_device_os                                                    \
,log_kdgrequest_device_carrier                                               \
,log_kdgrequest_device_connectiontype                                        \
,log_kdgrequest_device_ifa                                                   \
,log_kdgrequest_device_imeimd5                                               \
,log_adspace                                                                 \
,log_adunit                                                                  \
,log_adtype                                                                  \
,log_adsize                                                                  \
,log_region_country                                                          \
,log_region_province                                                         \
,log_region_city                                                             \
,ader_brand                                                                  \
,ader_secondindustry                                                         \
,camp_settlement_price                                                       \
,ctv_size                                                                    \
,ctv_label                                                                   \
,ctv_type                                                                    \
,ctv_style_id                                                                \
,ctv_link_type                                                               \
,ctv_second_category                                                         \
,ctv_remark                                                                  \
,truncated_ifa                                                               \
,ifa_cross_ctv                                                               \
,ifa_cross_ad                                                                \
,ifa_cross_campaign                                                          \
,ifa_cross_ctv_style                                                         \
,ifa_cross_ader_brand                                                        \
,ifa_cross_ader_secondindustry                                               \
,ifa_cross_ctv_second_category                                               \
,truncated_imei                                                              \
,imei_cross_ctv                                                              \
,imei_cross_ad                                                               \
,imei_cross_campaign                                                         \
,imei_cross_ctv_style                                                        \
,imei_cross_ader_brand                                                       \
,imei_cross_ader_secondindustry                                              \
,imei_cross_ctv_second_category                                              \
,adsp_last7days_ctr                                                          \
,adsp_yesterday_ctr                                                          \
,adsp_last7days_clk_cnt                                                      \
,adsp_yesterday_clk_cnt                                                      \
,ader_last7days_ctr                                                          \
,ader_yesterday_ctr                                                          \
,ader_last7days_clk_cnt                                                      \
,ader_yesterday_clk_cnt                                                      \
,ctv_last7days_ctr                                                           \
,ctv_yesterday_ctr                                                           \
,ctv_last7days_clk_cnt                                                       \
,ctv_yesterday_clk_cnt                                                       \
,media_last7days_ctr                                                         \
,media_yesterday_ctr                                                         \
,media_last7days_clk_cnt                                                     \
,media_yesterday_clk_cnt                                                     \
,city_last7days_ctr                                                          \
,city_yesterday_ctr                                                          \
,city_last7days_clk_cnt                                                      \
,city_yesterday_clk_cnt                                                      \
,ifa_last7days_ctr                                                           \
,ifa_yesterday_ctr                                                           \
,ifa_last7days_clk_cnt                                                       \
,ifa_yesterday_clk_cnt                                                       \
,imei_last7days_ctr                                                          \
,imei_yesterday_ctr                                                          \
,imei_last7days_clk_cnt                                                      \
,imei_yesterday_clk_cnt                                                      \
)                                                                            \
select                                                                       \
    t1.log_token                                                               \
    ,t1.log_dt                                                                 \
    ,t1.log_day                                                                \
    ,t1.log_hour                                                               \
    ,t1.log_clk_flag                                                           \
    ,t1.log_advertiserid                                                       \
    ,t1.log_campaignid                                                         \
    ,t1.log_creativeid                                                         \
    ,t1.log_mediashowid                                                        \
    ,t1.log_media                                                              \
    ,t1.log_channel                                                            \
    ,t1.log_mcf                                                                \
    ,t1.log_mcs                                                                \
    ,cast(t1.log_kdgrequest_device_devicetype as char(50))                     \
    ,t1.log_kdgrequest_device_make                                             \
    ,t1.log_kdgrequest_device_model                                            \
    ,t1.log_kdgrequest_device_os                                               \
    ,cast(t1.log_kdgrequest_device_carrier as char(50))                        \
    ,cast(t1.log_kdgrequest_device_connectiontype as char(50))                 \
    ,t1.log_kdgrequest_device_ifa                                              \
    ,t1.log_kdgrequest_device_imeimd5                                          \
    ,t1.log_adspace                                                            \
    ,t1.log_adunit                                                             \
    ,t1.log_adtype                                                             \
    ,cast(t1.log_adtype as char(50))                                           \
    ,t8.country                                                                \
    ,t8.province                                                               \
    ,t8.city                                                                   \
    ,t1.ader_brand                                                             \
    ,t1.ader_secondindustry                                                    \
    ,t1.camp_settlement_price                                                  \
    ,t1.ctv_size                                                               \
    ,t1.ctv_label                                                              \
    ,t1.ctv_type                                                               \
    ,cast(t1.ctv_style_id as char(50))                                         \
    ,cast(t1.ctv_link_type as char(50))                                        \
    ,cast(t1.ctv_second_category as char(50))                                  \
    ,t1.ctv_remark                                                             \
    ,right(t1.log_kdgrequest_device_ifa,2)                                     \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.log_creativeid)          \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.log_adunit)              \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.log_campaignid)          \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.ctv_style_id)            \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.ader_brand)              \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.ader_secondindustry)     \
    ,concat(right(t1.log_kdgrequest_device_ifa,2), t1.ctv_second_category)     \
    ,right(t1.log_kdgrequest_device_imeimd5,2)                                 \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.log_creativeid)      \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.log_adunit)          \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.log_campaignid)      \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.ctv_style_id)        \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.ader_brand)          \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.ader_secondindustry) \
    ,concat(right(t1.log_kdgrequest_device_imeimd5,2), t1.ctv_second_category) \
    ,t22.click_cnt_week/t22.impression_cnt_week                                 \
    ,t22.click_cnt/t22.impression_cnt                                           \
    ,t22.click_cnt_week                                                        \
    ,t22.click_cnt                                                             \
    ,t2.click_cnt_week/t2.impression_cnt_week                                  \
    ,t2.click_cnt/t2.impression_cnt                                            \
    ,t2.click_cnt_week                                                         \
    ,t2.click_cnt	                                                           \
    ,t3.click_cnt_week/t3.impression_cnt_week                                  \
    ,t3.click_cnt/t3.impression_cnt                                            \
    ,t3.click_cnt_week                                                         \
    ,t3.click_cnt                                                              \
    ,t4.click_cnt_week/t4.impression_cnt_week                                  \
    ,t4.click_cnt/t4.impression_cnt                                            \
    ,t4.click_cnt_week                                                         \
    ,t4.click_cnt                                                              \
    ,t5.click_cnt_week/t5.impression_cnt_week                                  \
    ,t5.click_cnt/t5.impression_cnt                                            \
    ,t5.click_cnt_week                                                         \
    ,t5.click_cnt                                                              \
    ,t6.click_cnt_week/t6.impression_cnt_week                                  \
    ,t6.click_cnt/t6.impression_cnt                                            \
    ,t6.click_cnt_week                                                         \
    ,t6.click_cnt                                                              \
    ,t7.click_cnt_week/t7.impression_cnt_week                                  \
    ,t7.click_cnt/t7.impression_cnt                                            \
    ,t7.click_cnt_week                                                         \
    ,t7.click_cnt                                                              \
from dspbase.dsp_ctr_daily_merge%s t1                                                \
left join dspbase.dsp_ctr_stat_adspace t22                                           \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t22.log_day                        \
and t1.log_adspace = t22.log_adspace                                         \
left join dspbase.dsp_ctr_stat_advertiser t2                                         \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t2.log_day                         \
and t1.log_advertiserid = t2.log_advertiserid                                \
left join dspbase.dsp_ctr_stat_creative t3                                           \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t3.log_day                         \
and t1.log_creativeid = t3.log_creativeid                                    \
left join dspbase.dsp_ctr_stat_media t4                                              \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t4.log_day                         \
and t1.log_media = t4.log_media                                              \
left join dspbase.dsp_ctr_stat_city t5                                               \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t5.log_day                         \
and t1.log_region = t5.log_region_city                                       \
left join dspbase.dsp_ctr_stat_ifa t6                                                \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t6.log_day                         \
and t1.log_kdgrequest_device_ifa = t6.log_kdgrequest_device_ifa              \
left join dspbase.dsp_ctr_stat_imei t7                                               \
on DATE_SUB(t1.log_day, INTERVAL 1 DAY) = t7.log_day                         \
and t1.log_kdgrequest_device_imeimd5 = t7.log_kdgrequest_device_imeimd5      \
left join dspbase.dsp_config_city t8                                                 \
on t1.log_region = t8.city                                                   \
where t1.log_istest=0                                                        \
and locate('测试',t1.ader_brand)=0                                             \
and t1.log_adNormalType=0                                                    \
and t1.log_clk_flag=0 order by rand() limit %d;" % (dt, num)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql2)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()


def update_calibration(dt):
    log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]
    # 计算下采样之后'点击/曝光'的比例，并插入dsp_ctr_calibration表中
    sql = "update dspbase.dsp_ctr_calibration set train_positive=(select \
           sum(case when log_clk_flag=1 then 1 else 0 end) \
           from dspbase.dsp_ctr_train where log_day=\'%s\'),train_negative=(select \
           sum(case when log_clk_flag=0 then 1 else 0 end) \
           from dspbase.dsp_ctr_train where log_day=\'%s\'),train_ratio=(select \
           sum(case when log_clk_flag=1 then 1 else 0 end)/sum(case when log_clk_flag=0 then 1 else 0 end) \
           from dspbase.dsp_ctr_train where log_day=\'%s\') where log_day=\'%s\'" % (log_day, log_day, log_day, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.update(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()


if __name__ == "__main__":
    try:
        # 传入相应参数
        opts, args = getopt.getopt(sys.argv[1:], 'ht:', ['traindate='])
    except getopt.GetoptError:
        print('Error: test_arg.py -t <traindate>')
        sys.exit(2)
    for opt, arg in opts:
        if opt in ('-t'):
            traindate = arg
    
    warnings.filterwarnings(action='ignore', category=Warning)
    print('Gen dsp_ctr_train for date:', traindate)
    
    t1 = time.time()
    insert_dsp_train_base(traindate)
    update_calibration(traindate)
    t2 = time.time()
    
    print('Done!')
    print('Cost time:', str(t2 - t1))
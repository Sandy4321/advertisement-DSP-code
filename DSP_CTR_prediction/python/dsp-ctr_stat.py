#!/home/kddmer/.pyenv/versions/env4/bin/python
# -*- coding: utf-8 -*-

# ---------------------------------------------------------------------------
# File Name   : dsp_ctr_stat.py
# Description : 根据merge表和传入日期每天更新状态表
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


# 更新创意状态表
def update_creativeid_stat(dt):
    log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]
    # 若存在该天数据，则首先删除
    sql = "delete from dspbase.dsp_ctr_stat_creative where log_day=\'%s\'" % (log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.delete(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # 插入曝光、点击统计值
    sql1 = "insert into dspbase.dsp_ctr_stat_creative                  \
    (log_day,log_creativeid,impression_cnt,click_cnt)        \
    select log_day,log_creativeid,count(*),sum(log_clk_flag) \
    from dspbase.dsp_ctr_daily_merge%s                                   \
    where log_day=\'%s\'                                         \
    group by log_day,log_creativeid;" % (dt, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql1)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
        
    sql12 = "insert into dspbase.dsp_ctr_stat_creative(log_day,log_creativeid,impression_cnt,click_cnt) \
             select \'%s\',t1.log_creativeid,0,0 from dspbase.dsp_ctr_stat_creative t1 \
             left join dspbase.dsp_ctr_stat_creative t2 \
             on t2.log_day=\'%s\' \
             and t1.log_creativeid=t2.log_creativeid \
             where t1.log_day between DATE_SUB(\'%s\', INTERVAL 6 DAY) and DATE_SUB(\'%s\', INTERVAL 1 DAY) \
             and t2.log_creativeid is null \
             and t1.impression_cnt_week is not null \
             group by t1.log_creativeid;" % (log_day, log_day, log_day, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql12)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    
    # 更新impression_cnt_week、click_cnt_week字段
    sql2 = "update dspbase.dsp_ctr_stat_creative t0                            \
    INNER JOIN                                                       \
    (select t1.log_day, t1.log_creativeid                            \
    ,sum(t2.impression_cnt) as impression_cnt_week                   \
    ,sum(t2.click_cnt) as click_cnt_week                             \
    from dspbase.dsp_ctr_stat_creative t1                                      \
    left join dspbase.dsp_ctr_stat_creative t2                                 \
    on t2.log_day between DATE_SUB(t1.log_day, INTERVAL 6 DAY)       \
    and t1.log_day and t1.log_creativeid=t2.log_creativeid           \
    where t1.log_day=\'%s\'                                              \
    group by t1.log_day, t1.log_creativeid) t3                       \
    on t0.log_day=t3.log_day and t0.log_creativeid=t3.log_creativeid \
    set t0.impression_cnt_week=t3.impression_cnt_week                \
    ,t0.click_cnt_week=t3.click_cnt_week                             \
    where t0.log_day=\'%s\';" % (log_day, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql2)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()


# 更新广告主状态表
def update_advertiser_stat(dt):
    log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]
    # 若存在该天数据，则首先删除
    sql = "delete from dspbase.dsp_ctr_stat_advertiser where log_day=\'%s\'" % (log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.delete(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # 插入曝光、点击统计值
    sql1 = "insert into dspbase.dsp_ctr_stat_advertiser                  \
    (log_day,log_advertiserid,impression_cnt,click_cnt)        \
    select log_day,log_advertiserid,count(*),sum(log_clk_flag) \
    from dspbase.dsp_ctr_daily_merge%s                                   \
    where log_day=\'%s\'                                         \
    group by log_day,log_advertiserid;" % (dt, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql1)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()

    sql12 = "insert into dspbase.dsp_ctr_stat_advertiser(log_day,log_advertiserid,impression_cnt,click_cnt) \
                 select \'%s\',t1.log_advertiserid,0,0 from dspbase.dsp_ctr_stat_advertiser t1 \
                 left join dspbase.dsp_ctr_stat_advertiser t2 \
                 on t2.log_day=\'%s\' \
                 and t1.log_advertiserid=t2.log_advertiserid \
                 where t1.log_day between DATE_SUB(\'%s\', INTERVAL 7 DAY) and DATE_SUB(\'%s\', INTERVAL 1 DAY) \
                 and t2.log_advertiserid is null \
                 and t1.impression_cnt_week is not null \
                 group by t1.log_advertiserid;" % (log_day, log_day, log_day, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql12)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    
    # 更新impression_cnt_week、click_cnt_week字段
    sql2 = "update dspbase.dsp_ctr_stat_advertiser t0                            \
    INNER JOIN                                                       \
    (select t1.log_day, t1.log_advertiserid                            \
    ,sum(t2.impression_cnt) as impression_cnt_week                   \
    ,sum(t2.click_cnt) as click_cnt_week                             \
    from dspbase.dsp_ctr_stat_advertiser t1                                      \
    left join dspbase.dsp_ctr_stat_advertiser t2                                 \
    on t2.log_day between DATE_SUB(t1.log_day, INTERVAL 6 DAY)       \
    and t1.log_day and t1.log_advertiserid=t2.log_advertiserid           \
    where t1.log_day=\'%s\'                                              \
    group by t1.log_day, t1.log_advertiserid) t3                       \
    on t0.log_day=t3.log_day and t0.log_advertiserid=t3.log_advertiserid \
    set t0.impression_cnt_week=t3.impression_cnt_week                \
    ,t0.click_cnt_week=t3.click_cnt_week                             \
    where t0.log_day=\'%s\';" % (log_day, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql2)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()


# 更新城市状态表
def update_city_stat(dt):
    log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]
    # 若存在该天数据，则首先删除
    sql = "delete from dspbase.dsp_ctr_stat_city where log_day=\'%s\'" % (log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.delete(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # 插入曝光、点击统计值
    sql1 = "insert into dspbase.dsp_ctr_stat_city                  \
    (log_day,log_region_city,impression_cnt,click_cnt)        \
    select log_day,log_region,count(*),sum(log_clk_flag) \
    from dspbase.dsp_ctr_daily_merge%s                                   \
    where log_day=\'%s\'                                        \
    group by log_day,log_region;" % (dt, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql1)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()

    sql12 = "insert into dspbase.dsp_ctr_stat_city(log_day,log_region_city,impression_cnt,click_cnt) \
                     select \'%s\',t1.log_region_city,0,0 from dspbase.dsp_ctr_stat_city t1 \
                     left join dspbase.dsp_ctr_stat_city t2 \
                     on t2.log_day=\'%s\' \
                     and t1.log_region_city=t2.log_region_city \
                     where t1.log_day between DATE_SUB(\'%s\', INTERVAL 6 DAY) and DATE_SUB(\'%s\', INTERVAL 1 DAY) \
                     and t2.log_region_city is null \
                     and t1.impression_cnt_week is not null \
                     group by t1.log_region_city;" % (log_day, log_day, log_day, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql12)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    
    # 更新impression_cnt_week、click_cnt_week字段
    sql2 = "update dspbase.dsp_ctr_stat_city t0                            \
    INNER JOIN                                                       \
    (select t1.log_day, t1.log_region_city                            \
    ,sum(t2.impression_cnt) as impression_cnt_week                   \
    ,sum(t2.click_cnt) as click_cnt_week                             \
    from dspbase.dsp_ctr_stat_city t1                                      \
    left join dspbase.dsp_ctr_stat_city t2                                 \
    on t2.log_day between DATE_SUB(t1.log_day, INTERVAL 6 DAY)       \
    and t1.log_day and t1.log_region_city=t2.log_region_city           \
    where t1.log_day=\'%s\'                                              \
    group by t1.log_day, t1.log_region_city) t3                       \
    on t0.log_day=t3.log_day and t0.log_region_city=t3.log_region_city \
    set t0.impression_cnt_week=t3.impression_cnt_week                \
    ,t0.click_cnt_week=t3.click_cnt_week                             \
    where t0.log_day=\'%s\';" % (log_day, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql2)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()


# 更新广告版位状态表
def update_adspace_stat(dt):
    log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]
    # 若存在该天数据，则首先删除
    sql = "delete from dspbase.dsp_ctr_stat_adspace where log_day=\'%s\'" % (log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.delete(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # 插入曝光、点击统计值
    sql1 = "insert into dspbase.dsp_ctr_stat_adspace                  \
    (log_day,log_adspace,impression_cnt,click_cnt)        \
    select log_day,log_adspace,count(*),sum(log_clk_flag) \
    from dspbase.dsp_ctr_daily_merge%s                                   \
    where log_day=\'%s\'                                         \
    group by log_day,log_adspace;" % (dt, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql1)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()

    sql12 = "insert into dspbase.dsp_ctr_stat_adspace(log_day,log_adspace,impression_cnt,click_cnt) \
                         select \'%s\',t1.log_adspace,0,0 from dspbase.dsp_ctr_stat_adspace t1 \
                         left join dspbase.dsp_ctr_stat_adspace t2 \
                         on t2.log_day=\'%s\' \
                         and t1.log_adspace=t2.log_adspace \
                         where t1.log_day between DATE_SUB(\'%s\', INTERVAL 6 DAY) and DATE_SUB(\'%s\', INTERVAL 1 DAY) \
                         and t2.log_adspace is null \
                         and t1.impression_cnt_week is not null \
                         group by t1.log_adspace;" % (log_day, log_day, log_day, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql12)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    
    # 更新impression_cnt_week、click_cnt_week字段
    sql2 = "update dspbase.dsp_ctr_stat_adspace t0                            \
    INNER JOIN                                                       \
    (select t1.log_day, t1.log_adspace                            \
    ,sum(t2.impression_cnt) as impression_cnt_week                   \
    ,sum(t2.click_cnt) as click_cnt_week                             \
    from dspbase.dsp_ctr_stat_adspace t1                                      \
    left join dspbase.dsp_ctr_stat_adspace t2                                 \
    on t2.log_day between DATE_SUB(t1.log_day, INTERVAL 6 DAY)       \
    and t1.log_day and t1.log_adspace=t2.log_adspace           \
    where t1.log_day=\'%s\'                                              \
    group by t1.log_day, t1.log_adspace) t3                       \
    on t0.log_day=t3.log_day and t0.log_adspace=t3.log_adspace \
    set t0.impression_cnt_week=t3.impression_cnt_week                \
    ,t0.click_cnt_week=t3.click_cnt_week                             \
    where t0.log_day=\'%s\';" % (log_day, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql2)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()


# 更新媒体状态表
def update_media_stat(dt):
    log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]
    # 若存在该天数据，则首先删除
    sql = "delete from dspbase.dsp_ctr_stat_media where log_day=\'%s\'" % (log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.delete(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # 插入曝光、点击统计值
    sql1 = "insert into dspbase.dsp_ctr_stat_media                  \
    (log_day,log_media,impression_cnt,click_cnt)        \
    select log_day,log_media,count(*),sum(log_clk_flag) \
    from dspbase.dsp_ctr_daily_merge%s                                   \
    where log_day=\'%s\'                                         \
    group by log_day,log_media;" % (dt, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql1)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()

    sql12 = "insert into dspbase.dsp_ctr_stat_media(log_day,log_media,impression_cnt,click_cnt) \
                             select \'%s\',t1.log_media,0,0 from dspbase.dsp_ctr_stat_media t1 \
                             left join dspbase.dsp_ctr_stat_media t2 \
                             on t2.log_day=\'%s\' \
                             and t1.log_media=t2.log_media \
                             where t1.log_day between DATE_SUB(\'%s\', INTERVAL 6 DAY) and DATE_SUB(\'%s\', INTERVAL 1 DAY) \
                             and t2.log_media is null \
                             and t1.impression_cnt_week is not null \
                             group by t1.log_media;" % (log_day, log_day, log_day, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql12)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    
    # 更新impression_cnt_week、click_cnt_week字段
    sql2 = "update dspbase.dsp_ctr_stat_media t0                            \
    INNER JOIN                                                       \
    (select t1.log_day, t1.log_media                            \
    ,sum(t2.impression_cnt) as impression_cnt_week                   \
    ,sum(t2.click_cnt) as click_cnt_week                             \
    from dspbase.dsp_ctr_stat_media t1                                      \
    left join dspbase.dsp_ctr_stat_media t2                                 \
    on t2.log_day between DATE_SUB(t1.log_day, INTERVAL 6 DAY)       \
    and t1.log_day and t1.log_media=t2.log_media           \
    where t1.log_day=\'%s\'                                              \
    group by t1.log_day, t1.log_media) t3                       \
    on t0.log_day=t3.log_day and t0.log_media=t3.log_media \
    set t0.impression_cnt_week=t3.impression_cnt_week                \
    ,t0.click_cnt_week=t3.click_cnt_week                             \
    where t0.log_day=\'%s\';" % (log_day, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql2)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()

    
# 更新deviceid状态表
def update_deviceid_stat(dt):
    log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]
    # 若存在该天数据，则首先删除
    sql = "delete from dspbase.dsp_ctr_stat_deviceid where log_day=\'%s\'" % (log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.delete(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # 插入曝光、点击统计值
    sql1 = "insert into dspbase.dsp_ctr_stat_deviceid                                    \
    (log_day,log_kdgrequest_deviceid,impression_cnt,click_cnt)        \
    select log_day,log_kdgrequest_deviceid,count(*),sum(log_clk_flag) \
    from dspbase.dsp_ctr_daily_merge%s                                              \
    where log_day=\'%s\' and log_kdgrequest_deviceid is not null         \
    group by log_day,log_kdgrequest_deviceid;" % (dt, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql1)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # 删除临时表dsp_ctr_stat_ifa_tmp中数据
    sql2 = "delete from dspbase.dsp_ctr_stat_deviceid_tmp where log_day=\'%s\'" % (log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.delete(sql2)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # 向临时表中插入统计数据
    sql3 = "insert into dspbase.dsp_ctr_stat_deviceid_tmp                                   \
    select \'%s\',log_kdgrequest_deviceid,sum(impression_cnt),sum(click_cnt) \
    from dspbase.dsp_ctr_stat_deviceid                                                      \
    where log_day between DATE_SUB(\'%s\', INTERVAL 6 DAY) and \'%s\'              \
    and log_kdgrequest_deviceid in                                       \
    (select distinct log_kdgrequest_deviceid                             \
    from dspbase.dsp_ctr_daily_merge%s)                                                \
    group by log_kdgrequest_deviceid;" % (log_day, log_day, log_day, dt)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql3)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # 更新impression_cnt_week、click_cnt_week字段
    sql4 = "update dspbase.dsp_ctr_stat_deviceid t1                                \
    left join dspbase.dsp_ctr_stat_deviceid_tmp t2                                 \
    on t1.log_day=t2.log_day                                      \
    and t1.log_kdgrequest_deviceid=t2.log_kdgrequest_deviceid \
    set t1.impression_cnt_week=t2.impression_cnt_week             \
    ,t1.click_cnt_week=t2.click_cnt_week                          \
    where t1.log_day=\'%s\';" % (log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql4)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # 清空临时表dsp_ctr_stat_ifa_tmp
    sql5 = "truncate table dspbase.dsp_ctr_stat_deviceid_tmp"
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql5)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()


# # 更新ifa状态表
# def update_ifa_stat(dt):
#     log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]
#     # 若存在该天数据，则首先删除
#     sql = "delete from dspbase.dsp_ctr_stat_ifa where log_day=\'%s\'" % (log_day)
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.delete(sql)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()
#     # 插入曝光、点击统计值
#     sql1 = "insert into dspbase.dsp_ctr_stat_ifa                                    \
#     (log_day,log_kdgrequest_device_ifa,impression_cnt,click_cnt)        \
#     select log_day,log_kdgrequest_device_ifa,count(*),sum(log_clk_flag) \
#     from dspbase.dsp_ctr_daily_merge%s                                              \
#     where log_day=\'%s\' and log_kdgrequest_device_ifa is not null         \
#     group by log_day,log_kdgrequest_device_ifa;" % (dt, log_day)
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.insert(sql1)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()
#     # 删除临时表dsp_ctr_stat_ifa_tmp中数据
#     sql2 = "delete from dspbase.dsp_ctr_stat_ifa_tmp where log_day=\'%s\'" % (log_day)
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.delete(sql2)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()
#     # 向临时表中插入统计数据
#     sql3 = "insert into dspbase.dsp_ctr_stat_ifa_tmp                                   \
#     select \'%s\',log_kdgrequest_device_ifa,sum(impression_cnt),sum(click_cnt) \
#     from dspbase.dsp_ctr_stat_ifa                                                      \
#     where log_day between DATE_SUB(\'%s\', INTERVAL 6 DAY) and \'%s\'              \
#     and log_kdgrequest_device_ifa in                                       \
#     (select distinct log_kdgrequest_device_ifa                             \
#     from dspbase.dsp_ctr_daily_merge%s)                                                \
#     group by log_kdgrequest_device_ifa;" % (log_day, log_day, log_day, dt)
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.insert(sql3)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()
#     # 更新impression_cnt_week、click_cnt_week字段
#     sql4 = "update dspbase.dsp_ctr_stat_ifa t1                                \
#     left join dspbase.dsp_ctr_stat_ifa_tmp t2                                 \
#     on t1.log_day=t2.log_day                                      \
#     and t1.log_kdgrequest_device_ifa=t2.log_kdgrequest_device_ifa \
#     set t1.impression_cnt_week=t2.impression_cnt_week             \
#     ,t1.click_cnt_week=t2.click_cnt_week                          \
#     where t1.log_day=\'%s\';" % (log_day)
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.insert(sql4)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()
#     # 清空临时表dsp_ctr_stat_ifa_tmp
#     sql5 = "truncate table dspbase.dsp_ctr_stat_ifa_tmp"
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.insert(sql5)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()
#
#
# # 更新imei状态表
# def update_imei_stat(dt):
#     log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]
#
#     # 若存在该天数据，则首先删除
#     sql = "delete from dspbase.dsp_ctr_stat_imei where log_day=\'%s\'" % (log_day)
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.delete(sql)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()
#
#     # 插入曝光、点击统计值
#     sql1 = "insert into dspbase.dsp_ctr_stat_imei                                       \
#     (log_day,log_kdgrequest_device_imeimd5,impression_cnt,click_cnt)        \
#     select log_day,log_kdgrequest_device_imeimd5,count(*),sum(log_clk_flag) \
#     from dspbase.dsp_ctr_daily_merge%s                                                  \
#     where log_day=\'%s\' and log_kdgrequest_device_imeimd5 is not null       \
#     group by log_day,log_kdgrequest_device_imeimd5;" % (dt, log_day)
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.insert(sql1)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()
#
#     # 删除临时表dsp_ctr_stat_imei_tmp中数据
#     sql2 = "delete from dspbase.dsp_ctr_stat_imei_tmp where log_day=\'%s\'" % (log_day)
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.delete(sql2)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()
#
#     # 向临时表中插入数据
#     sql3 = "insert into dspbase.dsp_ctr_stat_imei_tmp                                          \
#         select \'%s\',log_kdgrequest_device_imeimd5,sum(impression_cnt),sum(click_cnt) \
#         from dspbase.dsp_ctr_stat_imei                                                         \
#         where log_day between DATE_SUB(\'%s\', INTERVAL 6 DAY) and \'%s\'                  \
#         and log_kdgrequest_device_imeimd5 in                                       \
#         (select distinct log_kdgrequest_device_imeimd5                             \
#         from dspbase.dsp_ctr_daily_merge%s)                                                    \
#         group by log_kdgrequest_device_imeimd5;" % (log_day, log_day, log_day, dt)
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.insert(sql3)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()
#
#     # 更新impression_cnt_week、click_cnt_week字段
#     sql4 = "update dspbase.dsp_ctr_stat_imei t1                                           \
#         left join dspbase.dsp_ctr_stat_imei_tmp t2                                        \
#         on t1.log_day=t2.log_day                                              \
#         and t1.log_kdgrequest_device_imeimd5=t2.log_kdgrequest_device_imeimd5 \
#         set t1.impression_cnt_week=t2.impression_cnt_week                     \
#         ,t1.click_cnt_week=t2.click_cnt_week                                  \
#         where t1.log_day=\'%s\';" % (log_day)
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.insert(sql4)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()
#
#     # 清空临时表dsp_ctr_stat_imei_tmp
#     sql5 = "truncate table dspbase.dsp_ctr_stat_imei_tmp"
#     mysql = ms.MyPymysqlPool("dbMysql")
#     try:
#         mysql.insert(sql5)
#     except Exception as e:
#         print('Error:', e)
#     finally:
#         mysql.dispose()


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
    
    warnings.filterwarnings(action='ignore', category=DeprecationWarning)
    print('Gen dsp_ctr_stat for date:', traindate)

    t1 = time.time()
    update_creativeid_stat(traindate)
    print('table %s is done' % 'dsp_ctr_stat_creative')
    update_advertiser_stat(traindate)
    print('table %s is done' % 'dsp_ctr_stat_advertiser')
    update_city_stat(traindate)
    print('table %s is done' % 'dsp_ctr_stat_city')
    update_adspace_stat(traindate)
    print('table %s is done' % 'dsp_ctr_stat_adspace')
    update_media_stat(traindate)
    print('table %s is done' % 'dsp_ctr_stat_media')
    update_deviceid_stat(traindate)
    print('table %s is done' % 'dsp_ctr_stat_deviceid')
    # update_imei_stat(traindate)
    # print('table %s is done' % 'dsp_ctr_stat_imei')
    # update_ifa_stat(traindate)
    # print('table %s is done' % 'dsp_ctr_stat_ifa')
    t2 = time.time()
    
    print('Done!')
    print('Cost time:', str(t2 - t1))
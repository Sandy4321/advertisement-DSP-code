#!/home/kddmer/.pyenv/versions/env4/bin/python
# -*- coding: utf-8 -*-

# ---------------------------------------------------------------------------
# File Name   : dsp_ctr_daily_merge.py
# Description : 根据原始数据和传入日期每天生成merge表
# Author      : 
# Create      : 2018/09/25
# ---------------------------------------------------------------------------


import sys
import os
import time
import datetime
import warnings
import getopt
sys.path.append("/home/kddmer/models/pub/")
import mysql_conn as ms


# 根据日期创建merge表
def create_merge(dt):
    # 若对应表已经存在，则先删除
    sql = "drop table if exists dspbase.dsp_ctr_daily_merge%s" % dt
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.delete(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    
    # 创建空表
    sql = "CREATE TABLE dspbase.dsp_ctr_daily_merge%s ( \
    `log_dt` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL, \
    `log_day` date DEFAULT NULL, \
    `log_hour` tinyint(4) DEFAULT NULL, \
    `log_imp_flag` tinyint(4) DEFAULT NULL, \
    `log_clk_flag` tinyint(4) DEFAULT NULL, \
    `log_kdgresponse_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '对应kdgreqeust中的id', \
    `log_downrspcontent` text COLLATE utf8mb4_unicode_ci COMMENT '响应信息', \
    `log_isrespsucc` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '是否返回（0，没有返回，1返回）', \
    `log_accountid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '账户id', \
    `log_advertiserid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '广告主id', \
    `log_campaignid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '计划id', \
    `log_creativeid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '素材id', \
    `log_mediashowid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '媒体外部id', \
    `log_channel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '渠道id', \
    `log_devicetype` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备类型,os、android、other', \
    `log_adsize` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '广告尺寸', \
    `log_ctr` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '当前投放素材的ctr', \
    `log_media` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '媒体', \
    `log_adspace` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '广告位', \
    `log_adunit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '媒体传的原始的广告位的id', \
    `log_adtype` int(11) DEFAULT NULL COMMENT '展示类型', \
    `log_istest` int(11) DEFAULT NULL COMMENT '是否是测试流量   0.正式   1.测试', \
    `log_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '客户端ip', \
    `log_mcf` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '媒体一级分类', \
    `log_mcs` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '媒体二级分类', \
    `log_region` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地域', \
    `log_time` bigint(20) DEFAULT NULL COMMENT '时间戳', \
    `log_logtype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志类型', \
    `log_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL, \
    `log_adnormaltype` int(11) DEFAULT NULL COMMENT '反作弊类型，0表示正常', \
    `log_mediaid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '媒体id', \
    `log_platid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '平台id', \
    `log_incost` double(20,2) DEFAULT NULL COMMENT '成本', \
    `log_outcost` double(20,2) DEFAULT NULL COMMENT '消耗', \
    `log_adcost` double(20,2) DEFAULT NULL COMMENT '广告主价格', \
    `log_status` int(11) DEFAULT NULL COMMENT '状态:  0.时间太长失效; 1.正常', \
    `log_kdgrequest_imp_num` int(11) DEFAULT NULL, \
    `log_kdgrequest_device_devicetype` int(11) DEFAULT NULL COMMENT '0.未知;1.pc;2.phone;3.pad;4.tv', \
    `log_kdgrequest_device_make` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备制造商', \
    `log_kdgrequest_device_model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备型号', \
    `log_kdgrequest_device_os` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '如：Android、IOS、WindowsPhone', \
    `log_kdgrequest_device_osv` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作系统版本;', \
    `log_kdgrequest_device_h` int(11) DEFAULT NULL COMMENT '设备屏幕纵向分辨率', \
    `log_kdgrequest_device_w` int(11) DEFAULT NULL COMMENT '设备屏幕横向分辨率', \
    `log_kdgrequest_device_carrier` int(11) DEFAULT NULL COMMENT '运营商。0.未知;1.中国移动;2.中国联通;3.中国电信', \
    `log_kdgrequest_device_connectiontype` int(11) DEFAULT NULL COMMENT '网络连接类型。0.未知;1.WIFI;2.2G;3.3G;4.4G;5.5G', \
    `log_kdgrequest_device_ifa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'iOS终端设备的明文。', \
    `log_kdgrequest_device_imeimd5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备IMEI（MEID）号,SHA1加密串。', \
    `ader_brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌名称', \
    `ader_com_addr` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司注册地址', \
    `ader_category` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '广告主行业分类', \
    `ader_settlement_type` tinyint(4) DEFAULT '1' COMMENT '结算方式 1 CPM 2 CPC', \
    `ader_firstindustry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '一级行业分类', \
    `ader_secondindustry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '二级行业分类', \
    `ader_servicerate` tinyint(3) DEFAULT NULL COMMENT '服务费率', \
    `ader_priority` tinyint(4) DEFAULT NULL COMMENT '优先级', \
    `ader_credit` int(11) DEFAULT NULL COMMENT '信用金', \
    `ader_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态（0正常，1删除）', \
    `ader_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1开启，2暂停', \
    `ader_auth_status` tinyint(3) DEFAULT '0' COMMENT '内审状态0待审核，1审核通过，2审核拒绝', \
    `ader_audit_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '外审状态（0待审核，1通过，2拒绝，3部分通过）', \
    `camp_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '计划名称', \
    `camp_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '计划状态（0正常，1删除）', \
    `camp_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1开启，2暂停', \
    `camp_is_status` tinyint(3) DEFAULT '1' COMMENT '操作来源：1web，2曝光到量,3点击到量，4到期,5程序开启，6日预算到量，7周预算到量,8广告主余额不足', \
    `camp_start_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开始时间', \
    `camp_end_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结束日期', \
    `camp_launch_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '投放类型  1 尽快投放  2 匀速投放', \
    `camp_settlement_type` tinyint(4) DEFAULT '1' COMMENT '结算类型：1CPM，2CPC', \
    `camp_settlement_price` decimal(10,2) DEFAULT '0.00' COMMENT '结算价格（元）', \
    `camp_budget_type` tinyint(4) DEFAULT '0' COMMENT '预算控制（0不限，1周预算，2日预算）', \
    `camp_budget_num` decimal(20,2) DEFAULT '0.00' COMMENT '预算金额', \
    `camp_frequency_type` tinyint(4) DEFAULT '0' COMMENT '频次控制：（0不限，1周期内单人曝光不超过，2每天单人曝光不超过，3每小时单人曝光不超过', \
    `camp_frequency_num` int(11) DEFAULT '0' COMMENT '频次', \
    `camp_imp_limit` int(11) DEFAULT '0' COMMENT '曝光上限0表示不限', \
    `camp_click_limit` int(11) DEFAULT '0' COMMENT '点击上限0表示不限', \
    `camp_orient_time` text COLLATE utf8mb4_unicode_ci COMMENT '时段定向', \
    `camp_orient_aear` text COLLATE utf8mb4_unicode_ci COMMENT '地域定向', \
    `camp_orient_network` text COLLATE utf8mb4_unicode_ci COMMENT '网络定向（wifi，5G，4G，3G，2G，gprs）', \
    `camp_orient_system` text COLLATE utf8mb4_unicode_ci COMMENT '系统定向（android,ios,windows,mac OS,other）', \
    `camp_orient_plat` text COLLATE utf8mb4_unicode_ci COMMENT '渠道定向', \
    `camp_orient_media` text COLLATE utf8mb4_unicode_ci COMMENT '媒体定向', \
    `camp_orient_adslot` text COLLATE utf8mb4_unicode_ci COMMENT '广告位定向', \
    `camp_orient_media_crowd` text COLLATE utf8mb4_unicode_ci COMMENT '媒体人群定向，json字符串', \
    `camp_orient_interest` text COLLATE utf8mb4_unicode_ci COMMENT '兴趣定向', \
    `ctv_width` int(11) NOT NULL COMMENT '宽', \
    `ctv_height` int(11) NOT NULL COMMENT '高', \
    `ctv_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创意类型（1banner,2video,3native）', \
    `ctv_style_id` int(11) DEFAULT '1' COMMENT '广告素材类型', \
    `ctv_link_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:H5,2:App下载,3:应用直达', \
    `ctv_size` int(11) NOT NULL COMMENT '素材大小', \
    `ctv_deep_link` text COLLATE utf8mb4_unicode_ci COMMENT 'link_type为1：空。为2：iOS下载地址。为3：json对象包含落地页和唤醒地址', \
    `ctv_first_category` int(8) DEFAULT NULL COMMENT '一级分类', \
    `ctv_second_category` int(8) DEFAULT NULL COMMENT '二级分类', \
    `ctv_label` text COLLATE utf8mb4_unicode_ci COMMENT '标签标识', \
    `ctv_remark` text COLLATE utf8mb4_unicode_ci COMMENT '备注', \
    KEY `idx1` (`log_day`,`log_creativeid`,`log_kdgrequest_device_ifa`(191),`log_kdgrequest_device_imeimd5`(191)), \
    KEY `idx2` (`log_day`,`log_kdgrequest_device_ifa`(191)), \
    KEY `idx3` (`log_day`,`log_kdgrequest_device_imeimd5`(191)), \
    KEY `idx4` (`log_day`,`log_creativeid`) \
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; " % dt
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()


# 向merge表中插入数据
def insert_merge(dt):
    # 转换日期格式：20180906 -> 2018-09-06
    log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]
    # 插入数据
    sql = "insert into dspbase.dsp_ctr_daily_merge%s                  \
    (log_dt                                                       \
    ,log_day                                                      \
    ,log_hour\
    ,log_imp_flag                                                 \
    ,log_clk_flag                                                 \
    ,log_accountid                                                \
    ,log_advertiserid                                             \
    ,log_campaignid                                               \
    ,log_creativeid                                               \
    ,log_mediashowid                                              \
    ,log_channel                                                  \
    ,log_devicetype                                               \
    ,log_adsize                                                   \
    ,log_ctr                                                      \
    ,log_media                                                    \
    ,log_adspace                                                  \
    ,log_adunit                                                   \
    ,log_adtype                                                   \
    ,log_istest                                                   \
    ,log_ip                                                       \
    ,log_mcf                                                      \
    ,log_mcs                                                      \
    ,log_region                                                   \
    ,log_token                                                    \
    ,log_adnormaltype                                             \
    ,log_mediaid                                                  \
    ,log_platid                                                   \
    ,log_incost                                                   \
    ,log_outcost                                                  \
    ,log_adcost                                                   \
    ,log_status                                                   \
    ,log_kdgrequest_imp_num                                       \
    ,log_kdgrequest_device_devicetype                             \
    ,log_kdgrequest_device_make                                   \
    ,log_kdgrequest_device_model                                  \
    ,log_kdgrequest_device_os                                     \
    ,log_kdgrequest_device_h                                      \
    ,log_kdgrequest_device_w                                      \
    ,log_kdgrequest_device_carrier                                \
    ,log_kdgrequest_device_connectiontype                         \
    ,log_kdgrequest_device_ifa                                    \
    ,log_kdgrequest_device_imeimd5                                \
    ,ader_brand                                                   \
    ,ader_firstindustry                                           \
    ,ader_secondindustry                                          \
    ,ader_servicerate                                             \
    ,camp_settlement_type                                         \
    ,camp_settlement_price                                        \
    ,camp_imp_limit                                               \
    ,camp_click_limit                                             \
    ,ctv_width                                                    \
    ,ctv_height                                                   \
    ,ctv_type                                                     \
    ,ctv_style_id                                                 \
    ,ctv_link_type                                                \
    ,ctv_size                                                     \
    ,ctv_deep_link                                                \
    ,ctv_first_category                                           \
    ,ctv_second_category                                          \
    ,ctv_label                                                    \
    ,ctv_remark                                                   \
    )                                                             \
    select                                                        \
    t0.dt                                                         \
    ,left(t0.dt,10)                                               \
    ,right(left(t0.dt,13),2)                                      \
    ,t0.imp_flag                                                  \
    ,t0.clk_flag                                                  \
    ,t0.accountid                                                 \
    ,t0.advertiserid                                              \
    ,t0.campaignid                                                \
    ,t0.creativeid                                                \
    ,t0.mediashowid                                               \
    ,t0.channel                                                   \
    ,t0.devicetype                                                \
    ,t0.adsize                                                    \
    ,t0.ctr                                                       \
    ,t0.media                                                     \
    ,t0.adspace                                                   \
    ,t0.adunit                                                    \
    ,t0.adtype                                                    \
    ,t0.istest                                                    \
    ,t0.ip                                                        \
    ,t0.mcf                                                       \
    ,t0.mcs                                                       \
    ,t0.region                                                    \
    ,t0.token                                                     \
    ,t0.adnormaltype                                              \
    ,t0.mediaid                                                   \
    ,t0.platid                                                    \
    ,t0.incost                                                    \
    ,t0.outcost                                                   \
    ,t0.adcost                                                    \
    ,t0.status                                                    \
    ,t0.kdgrequest_imp_num                                        \
    ,t0.kdgrequest_device_devicetype                              \
    ,t0.kdgrequest_device_make                                    \
    ,t0.kdgrequest_device_model                                   \
    ,t0.kdgrequest_device_os                                      \
    ,t0.kdgrequest_device_h                                       \
    ,t0.kdgrequest_device_w                                       \
    ,t0.kdgrequest_device_carrier                                 \
    ,t0.kdgrequest_device_connectiontype                          \
    ,t0.kdgrequest_device_ifa                                     \
    ,t0.kdgrequest_device_imeimd5                                 \
    ,t1.brand                                                     \
    ,t1.firstindustry                                             \
    ,t1.secondindustry                                            \
    ,t1.servicerate                                               \
    ,t2.settlement_type                                           \
    ,t2.settlement_price                                          \
    ,t2.imp_limit                                                 \
    ,t2.click_limit                                               \
    ,t3.width                                                     \
    ,t3.height                                                    \
    ,t3.type                                                      \
    ,t3.style_id                                                  \
    ,t3.link_type                                                 \
    ,t3.size                                                      \
    ,t3.deep_link                                                 \
    ,t3.first_category                                            \
    ,t3.second_category                                           \
    ,t3.label                                                     \
    ,t3.remark                                                    \
    from dspbase.src_log_info_0907_0929 t0                                        \
    left join dspbase.src_advertiser_info t1 on t0.advertiserid = t1.id   \
    left join dspbase.src_campaign t2 on t0.campaignid = t2.id            \
    left join dspbase.src_creative t3 on t0.creativeid = t3.id where imp_flag <> 0 \
    and t0.dt like \'%s%%\';" % (dt, log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql)
        # print(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    # # 获取前一天日期
    # b_day = datetime.datetime.strptime(dt, '%Y%m%d')
    # delta = datetime.timedelta(days=-1)
    # b_day = b_day + delta
    # b_dt = b_day.__str__()[:10].replace('-', '')
    # # 删除前一天生成的merge表
    # sql = "drop table if exists dsp_ctr_daily_merge%s" % b_dt
    # mysql = ms.MyPymysqlPool("dbMysql")
    # try:
    #     mysql.delete(sql)
    # except Exception as e:
    #     print('Error:', e)
    # finally:
    #     mysql.dispose()


def insert_calibration(dt):
    log_day = dt[0:4] + '-' + dt[4:6] + '-' + dt[6:8]

    # 若存在该天数据，则首先删除
    sql = "delete from dspbase.dsp_ctr_calibration where log_day=\'%s\'" % (log_day)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.delete(sql)
    except Exception as e:
        print('Error:', e)
    finally:
        mysql.dispose()
    
    # 计算下采样之前'点击/曝光'的比例，并插入dsp_ctr_calibration表中
    sql = "insert into dspbase.dsp_ctr_calibration(log_day,merge_positive,merge_negative,merge_ratio) select \'%s\', \
           sum(case when log_clk_flag=1 then 1 else 0 end),sum(case when log_clk_flag=0 then 1 else 0 end),  \
           sum(case when log_clk_flag=1 then 1 else 0 end)/sum(case when log_clk_flag=0 then 1 else 0 end)   \
           from dspbase.dsp_ctr_daily_merge%s" % (log_day, dt)
    mysql = ms.MyPymysqlPool("dbMysql")
    try:
        mysql.insert(sql)
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
    
    warnings.filterwarnings(action='ignore', category=DeprecationWarning)
    print('Gen dsp_ctr_daily_merge for date:', traindate)
    t1 = time.time()
    create_merge(traindate)
    insert_merge(traindate)
    insert_calibration(traindate)
    t2 = time.time()
    print('Done!')
    print('Cost time:', str(t2 - t1))

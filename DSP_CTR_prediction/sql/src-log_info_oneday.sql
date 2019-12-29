CREATE TABLE `src_log_info_oneday` (
  `dt` text,
  `imp_flag` int(11) NOT NULL,
  `clk_flag` int(11) NOT NULL,
  `accountid` text,
  `advertiserid` varchar(50),
  `campaignid` varchar(50),
  `creativeid` varchar(50),
  `mediashowid` text,
  `channel` text,
  `devicetype` text,
  `adsize` text,
  `ctr` text,
  `media` text,
  `adspace` text,
  `adunit` text,
  `adtype` int(11) DEFAULT NULL,
  `ip` text,
  `mcf` text,
  `mcs` text,
  `region` text,
  `time` bigint(20) DEFAULT NULL,
  `logtype` text,
  `token` text,
  `mediaid` text,
  `kdgrequest_imp_num` int(11) DEFAULT NULL,
  `kdgrequest_device_devicetype` int(11) DEFAULT NULL,
  `kdgrequest_device_make` text,
  `kdgrequest_device_model` text,
  `kdgrequest_device_os` text,
  `kdgrequest_device_osv` text,
  `kdgrequest_device_h` int(11) DEFAULT NULL,
  `kdgrequest_device_w` int(11) DEFAULT NULL,
  `kdgrequest_device_carrier` int(11) DEFAULT NULL,
  `kdgrequest_device_connectiontype` int(11) DEFAULT NULL,
  `deviceid` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into src_log_info_oneday
(dt
,imp_flag
,clk_flag
,accountid
,advertiserid
,campaignid
,creativeid
,mediashowid
,channel
,devicetype
,adsize
,ctr
,media
,adspace
,adunit
,adtype
,ip
,mcf
,mcs
,region
,logtype
,token
,mediaid
,kdgrequest_imp_num
,kdgrequest_device_devicetype
,kdgrequest_device_make
,kdgrequest_device_model
,kdgrequest_device_os
,kdgrequest_device_osv
,kdgrequest_device_h
,kdgrequest_device_w
,kdgrequest_device_carrier
,kdgrequest_device_connectiontype
,deviceid)                

select 
substr(dt,1,13)
,imp_flag
,clk_flag
,accountid
,advertiserid
,campaignid
,creativeid
,mediashowid
,channel
,devicetype
,adsize
,ctr
,media
,adspace
,adunit
,adtype
,ip
,mcf
,mcs
,region
,logtype
,min(token)
,mediaid
,kdgrequest_imp_num
,kdgrequest_device_devicetype
,kdgrequest_device_make
,kdgrequest_device_model
,kdgrequest_device_os
,kdgrequest_device_osv
,kdgrequest_device_h
,kdgrequest_device_w
,kdgrequest_device_carrier
,kdgrequest_device_connectiontype
,deviceid

from src_log_info_1001_1015
where substr(dt,1,10)='2018-10-01'
group by 
substr(dt,1,13)
,imp_flag
,clk_flag
,accountid
,advertiserid
,campaignid
,creativeid
,mediashowid
,channel
,devicetype
,adsize
,ctr
,media
,adspace
,adunit
,adtype
,ip
,mcf
,mcs
,region
,logtype
,mediaid
,kdgrequest_imp_num
,kdgrequest_device_devicetype
,kdgrequest_device_make
,kdgrequest_device_model
,kdgrequest_device_os
,kdgrequest_device_osv
,kdgrequest_device_h
,kdgrequest_device_w
,kdgrequest_device_carrier
,kdgrequest_device_connectiontype
,deviceid

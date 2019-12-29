
CREATE TABLE `ctr_predict_t2e1_ohmore` (
  `clk_flag` tinyint(1) DEFAULT '0' COMMENT '点击标志',
  `token` char(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'token',
  `account_id_oh1` tinyint(1) NOT NULL COMMENT '账户id',
  `account_id_oh2` tinyint(1) NOT NULL COMMENT '账户id',
  `account_id_oh3` tinyint(1) NOT NULL COMMENT '账户id',
  `account_id_oh4` tinyint(1) NOT NULL COMMENT '账户id',
  `account_id_oh5` tinyint(1) NOT NULL COMMENT '账户id',
  `account_id_oh6` tinyint(1) NOT NULL COMMENT '账户id',
  `account_id_oh7` tinyint(1) NOT NULL COMMENT '账户id',
  `advertiser_id_oh5` tinyint(1) NOT NULL COMMENT '广告主id',
  `advertiser_id_oh6` tinyint(1) NOT NULL COMMENT '广告主id',
  `advertiser_id_oh7` tinyint(1) NOT NULL COMMENT '广告主id',
  `advertiser_id_oh14` tinyint(1) NOT NULL COMMENT '广告主id',
  `advertiser_id_oh15` tinyint(1) NOT NULL COMMENT '广告主id',
  `advertiser_id_oh17` tinyint(1) NOT NULL COMMENT '广告主id',
  `advertiser_id_oh18` tinyint(1) NOT NULL COMMENT '广告主id',
  `advertiser_id_oh19` tinyint(1) NOT NULL COMMENT '广告主id',
  `advertiser_id_oh20` tinyint(1) NOT NULL COMMENT '广告主id',
  `advertiser_id_oh21` tinyint(1) NOT NULL COMMENT '广告主id',
  `advertiser_id_oh22` tinyint(1) NOT NULL COMMENT '广告主id',
  `campaign_id_oh1` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh2` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh3` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh6` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh7` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh8` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh9` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh10` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh11` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh12` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh13` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh14` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh15` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh16` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh17` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh18` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh19` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh20` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh21` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh22` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh23` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh24` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh25` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh26` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh27` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh28` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh29` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh30` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh31` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh32` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh33` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh34` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh35` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh36` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh37` smallint(2) NOT NULL COMMENT '计划id',
  `campaign_id_oh38` smallint(2) NOT NULL COMMENT '计划id',
  `creative_id_oh3` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh4` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh5` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh6` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh7` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh8` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh9` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh10` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh12` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh13` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh14` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh15` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh18` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh19` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh22` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh23` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh24` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh25` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh26` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh27` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh28` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh29` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh30` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh31` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh32` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh33` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh34` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh35` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh36` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh37` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh38` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh39` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh40` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh41` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh42` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh43` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh44` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh45` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh46` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh47` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh48` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh49` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh50` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh51` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh52` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh53` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh54` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh55` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh56` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh57` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh58` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh59` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh60` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh61` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh62` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh63` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh64` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh65` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh66` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh67` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh68` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh69` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh70` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh71` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh72` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh73` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh74` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh75` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh76` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh77` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh78` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh79` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh80` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh81` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh82` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh83` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh84` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh85` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh86` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh87` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh88` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh89` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh90` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh91` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh92` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh93` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh94` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh95` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh96` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh97` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh98` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh99` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh100` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh101` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh102` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh103` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh104` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh105` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh106` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh107` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh108` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh109` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh110` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh111` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh112` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh113` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh114` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh115` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh116` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh117` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh118` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh119` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh120` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh121` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh122` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh123` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh124` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh125` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh126` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh127` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh128` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh129` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh130` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh131` smallint(2) NOT NULL COMMENT '创意id',
  `creative_id_oh132` smallint(2) NOT NULL COMMENT '创意id',
  `channel_id_oh2` smallint(2) DEFAULT NULL COMMENT '渠道id',
  `channel_id_oh3` smallint(2) DEFAULT NULL COMMENT '渠道id',
  `channel_id_oh4` smallint(2) DEFAULT NULL COMMENT '渠道id',
  `channel_id_oh5` smallint(2) DEFAULT NULL COMMENT '渠道id',
  `channel_id_oh6` smallint(2) DEFAULT NULL COMMENT '渠道id',
  `channel_id_oh7` smallint(2) DEFAULT NULL COMMENT '渠道id',
  `channel_id_oh8` smallint(2) DEFAULT NULL COMMENT '渠道id',
  `device_type` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '设备类型',
  `media` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '媒体id',
  `ad_space1` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值  362',
  `ad_space2` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值  1002',
  `ad_space3` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值  1010',
  `ad_space4` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值  1018',
  `ad_space5` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值  1026',
  `ad_space6` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值  1034',
  `ad_space7` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值  1042',
  `ad_space8` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值  1050',
  `ad_space9` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值  1058',
  `ad_space10` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 1066',
  `ad_space11` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 1074',
  `ad_space12` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 1082',
  `ad_space13` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 1090',
  `ad_space14` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 1098',
  `ad_space15` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 1106',
  `ad_space16` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 1114',
  `ad_space17` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 1122',
  `ad_space18` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 1130',
  `ad_space19` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 200048',
  `ad_space20` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10050002',
  `ad_space21` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10050004',
  `ad_space22` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10050012',
  `ad_space23` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10050032',
  `ad_space24` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10050034',
  `ad_space25` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10060001',
  `ad_space26` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10060003',
  `ad_space27` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10060004',
  `ad_space28` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10070001',
  `ad_space29` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10070002',
  `ad_space30` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10070003',
  `ad_space31` tinyint(1) DEFAULT NULL COMMENT 'dsp定义的广告位，类别离散值 10070004',
  `adunit1` tinyint(1) DEFAULT NULL COMMENT '媒体定义的广告位，类别离散值 1130',
  `adunit2` tinyint(1) DEFAULT NULL COMMENT '媒体定义的广告位，类别离散值 1122',
  `adunit3` tinyint(1) DEFAULT NULL COMMENT '媒体定义的广告位，类别离散值 1002',
  `adunit4` tinyint(1) DEFAULT NULL COMMENT '媒体定义的广告位，类别离散值 1010',
  `adunit5` tinyint(1) DEFAULT NULL COMMENT '媒体定义的广告位，类别离散值 1042',
  `ad_type1` tinyint(1) DEFAULT NULL COMMENT '广告类型',
  `ad_type3` tinyint(1) DEFAULT NULL COMMENT '广告类型',
  `ad_type4` tinyint(1) DEFAULT NULL COMMENT '广告类型',
  `ad_type6` tinyint(1) DEFAULT NULL COMMENT '广告类型',
  `ad_size1` tinyint(1) DEFAULT NULL COMMENT '广告大小150*130',
  `ad_size2` tinyint(1) DEFAULT NULL COMMENT '广告大小160*160',
  `ad_size3` tinyint(1) DEFAULT NULL COMMENT '广告大小190*145',
  `ad_size4` tinyint(1) DEFAULT NULL COMMENT '广告大小240*240',
  `ad_size5` tinyint(1) DEFAULT NULL COMMENT '广告大小45*45',
  `ad_size6` tinyint(1) DEFAULT NULL COMMENT '广告大小50*50',
  `ad_size7` tinyint(1) DEFAULT NULL COMMENT '广告大小640*120',
  `ad_size8` tinyint(1) DEFAULT NULL COMMENT '广告大小640*360',
  `ad_size9` tinyint(1) DEFAULT NULL COMMENT '广告大小710*236',
  `ad_size10` tinyint(1) DEFAULT NULL COMMENT '广告大小720*168',
  `ad_size11` tinyint(1) DEFAULT NULL COMMENT '广告大小720*360',
  `device_id` text COLLATE utf8mb4_unicode_ci COMMENT '设备id',
  `in_cost` int(4) DEFAULT NULL,
  `out_cost` bigint(20) DEFAULT NULL,
  `ad_cost` bigint(20) DEFAULT NULL,
  `tyear` smallint(4) NOT NULL COMMENT '年',
  `tmonth` tinyint(1) NOT NULL COMMENT '月',
  `tday` tinyint(1) NOT NULL COMMENT '日',
  `thour` tinyint(1) NOT NULL COMMENT '时',
  `tminute` tinyint(1) NOT NULL COMMENT '分',  
  `tweek1` tinyint(1) NOT NULL COMMENT '周日',
  `tweek2` tinyint(1) NOT NULL COMMENT '周1',
  `tweek3` tinyint(1) NOT NULL COMMENT '周2',
  `tweek4` tinyint(1) NOT NULL COMMENT '周3',
  `tweek5` tinyint(1) NOT NULL COMMENT '周4',
  `tweek6` tinyint(1) NOT NULL COMMENT '周5',
  `tweek7` tinyint(1) NOT NULL COMMENT '周六',
  `thunit1` tinyint(1) NOT NULL COMMENT '时段(1:[0,6), 2:[6,9), 3:[9,12), 4:[12,14), 5:[14,18), 6:[18-24))',
  `thunit2` tinyint(1) NOT NULL COMMENT '时段(1:[0,6), 2:[6,9), 3:[9,12), 4:[12,14), 5:[14,18), 6:[18-24))',
  `thunit3` tinyint(1) NOT NULL COMMENT '时段(1:[0,6), 2:[6,9), 3:[9,12), 4:[12,14), 5:[14,18), 6:[18-24))',
  `thunit4` tinyint(1) NOT NULL COMMENT '时段(1:[0,6), 2:[6,9), 3:[9,12), 4:[12,14), 5:[14,18), 6:[18-24))',
  `thunit5` tinyint(1) NOT NULL COMMENT '时段(1:[0,6), 2:[6,9), 3:[9,12), 4:[12,14), 5:[14,18), 6:[18-24))',
  `thunit6` tinyint(1) NOT NULL COMMENT '时段(1:[0,6), 2:[6,9), 3:[9,12), 4:[12,14), 5:[14,18), 6:[18-24))',

  `ad_servicerate0` tinyint(3) DEFAULT NULL COMMENT '服务费率',
  `ad_servicerate1` tinyint(3) DEFAULT NULL COMMENT '服务费率',
  `ad_servicerate15` tinyint(3) DEFAULT NULL COMMENT '服务费率',
  `ad_servicerate50` tinyint(3) DEFAULT NULL COMMENT '服务费率',
  `ad_priority0` tinyint(4) DEFAULT NULL COMMENT '优先级',
  `ad_priority1` tinyint(4) DEFAULT NULL COMMENT '优先级',
  `ad_credit1` int(11) DEFAULT NULL COMMENT '信用金0',
  `ad_credit2` int(11) DEFAULT NULL COMMENT '信用金100',
  `ad_credit3` int(11) DEFAULT NULL COMMENT '信用金1000',
  `ad_credit4` int(11) DEFAULT NULL COMMENT '信用金20000',
  `ad_credit5` int(11) DEFAULT NULL COMMENT '信用金100000',

  `cp_status0` tinyint(3) NOT NULL DEFAULT '0' COMMENT '计划状态（0正常，1删除）',
  `cp_status1` tinyint(3) NOT NULL DEFAULT '0' COMMENT '计划状态（0正常，1删除）',
  `cp_flag1` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1开启，2暂停',
  `cp_flag2` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1开启，2暂停',
  `cp_is_status1` tinyint(3) DEFAULT '1' COMMENT '操作来源：1web，2曝光到量,3点击到量，4到期,5程序开启，6日预算到量，7周预算到量',
  `cp_is_status8` tinyint(3) DEFAULT '1' COMMENT '操作来源：1web，2曝光到量,3点击到量，4到期,5程序开启，6日预算到量，7周预算到量',
  `cp_start_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开始时间',
  `cp_end_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结束日期',
  `cp_budget_typen` tinyint(4) DEFAULT '0' COMMENT '预算控制（0不限）',
  `cp_budget_type1` tinyint(4) DEFAULT '0' COMMENT '预算控制（0不限，1周预算，2日预算）',
  `cp_budget_type2` tinyint(4) DEFAULT '0' COMMENT '预算控制（0不限，1周预算，2日预算）',
  `cp_budget_num` int(11) DEFAULT '0' COMMENT '预算金额',
  `cp_frequency_typen` tinyint(4) DEFAULT '0' COMMENT '频次控制：（1不限',
  `cp_frequency_type1` tinyint(4) DEFAULT '0' COMMENT '频次控制：（0不限，1周期内单人曝光不超过，2每天单人曝光不超过，3每小时单人曝光不超过',
  `cp_frequency_type2` tinyint(4) DEFAULT '0' COMMENT '频次控制：（0不限，1周期内单人曝光不超过，2每天单人曝光不超过，3每小时单人曝光不超过',
  `cp_frequency_type3` tinyint(4) DEFAULT '0' COMMENT '频次控制：（0不限，1周期内单人曝光不超过，2每天单人曝光不超过，3每小时单人曝光不超过',
  `cp_imp_limitn` int(11) DEFAULT '0' COMMENT '曝光上限1表示不限，0表示有限量',
  `cp_imp_limitv` int(11) DEFAULT '0' COMMENT '曝光上限0表示不限量，在limitn中定义，具体数值为上限量',
  `cp_click_limitn` int(11) DEFAULT '0' COMMENT '点击上限1表示不限',
  `cp_click_limitv` int(11) DEFAULT '0' COMMENT '点击上限0表示不限，在limitn中定义，具体数值为上限量',
  `cp_orient_networkwifi` tinyint(1) COMMENT '网络定向（wifi，5G，4G，3G，2G，gprs）',
  `cp_orient_network5g` tinyint(1) COMMENT '网络定向（wifi，5G，4G，3G，2G，gprs）',
  `cp_orient_network4g` tinyint(1) COMMENT '网络定向（wifi，5G，4G，3G，2G，gprs）',
  `cp_orient_network3g` tinyint(1) COMMENT '网络定向（wifi，5G，4G，3G，2G，gprs）',
  `cp_orient_network2g` tinyint(1) COMMENT '网络定向（wifi，5G，4G，3G，2G，gprs）',
  `cp_orient_networkgprs` tinyint(1) COMMENT '网络定向（wifi，5G，4G，3G，2G，gprs）',
  `cp_orient_networkots` tinyint(1) COMMENT '网络定向（wifi，5G，4G，3G，2G，gprs）',
  `cp_orient_systemadr` tinyint(1) COMMENT '系统定向（android,ios,windows,mac OS,other）',
  `cp_orient_systemios` tinyint(1) COMMENT '系统定向（android,ios,windows,mac OS,other）',
  `cp_orient_systemwin` tinyint(1) COMMENT '系统定向（android,ios,windows,mac OS,other）',
  `cp_orient_systemmac` tinyint(1) COMMENT '系统定向（android,ios,windows,mac OS,other）',
  `cp_orient_systemots` tinyint(1) COMMENT '系统定向（android,ios,windows,mac OS,other）',
  `cp_orient_adslotn` tinyint(1)  COMMENT '广告位定向，不限',
  `cp_orient_adslot1` tinyint(1) COMMENT '广告位定向1002',
  `cp_orient_adslot2` tinyint(1) COMMENT '广告位定向10050001',
  `cp_orient_adslot3` tinyint(1) COMMENT '广告位定向10050002',
  `cp_orient_adslot4` tinyint(1) COMMENT '广告位定向10050003',
  `cp_orient_adslot5` tinyint(1) COMMENT '广告位定向10050004',
  `cp_orient_adslot6` tinyint(1) COMMENT '广告位定向10050005',
  `cp_orient_adslot7` tinyint(1) COMMENT '广告位定向10050006',
  `cp_orient_adslot8` tinyint(1) COMMENT '广告位定向10050007',
  `cp_orient_adslot9` tinyint(1) COMMENT '广告位定向10050008',
  `cp_orient_adslot10` tinyint(1) COMMENT '广告位定向10050009',
  `cp_orient_adslot11` tinyint(1) COMMENT '广告位定向10050010',
  `cp_orient_adslot12` tinyint(1) COMMENT '广告位定向10050011',
  `cp_orient_adslot13` tinyint(1) COMMENT '广告位定向10050012',
  `cp_orient_adslot14` tinyint(1) COMMENT '广告位定向10050013',
  `cp_orient_adslot15` tinyint(1) COMMENT '广告位定向10050014',
  `cp_orient_adslot16` tinyint(1) COMMENT '广告位定向10050015',
  `cp_orient_adslot17` tinyint(1) COMMENT '广告位定向10050016',
  `cp_orient_adslot18` tinyint(1) COMMENT '广告位定向10050017',
  `cp_orient_adslot19` tinyint(1) COMMENT '广告位定向10050018',
  `cp_orient_adslot20` tinyint(1) COMMENT '广告位定向10050019',
  `cp_orient_adslot21` tinyint(1) COMMENT '广告位定向10050020',
  `cp_orient_adslot22` tinyint(1) COMMENT '广告位定向10050021',
  `cp_orient_adslot23` tinyint(1) COMMENT '广告位定向10050022',
  `cp_orient_adslot24` tinyint(1) COMMENT '广告位定向10050023',
  `cp_orient_adslot25` tinyint(1) COMMENT '广告位定向10050024',
  `cp_orient_adslot26` tinyint(1) COMMENT '广告位定向10050025',
  `cp_orient_adslot27` tinyint(1) COMMENT '广告位定向10050026',
  `cp_orient_adslot28` tinyint(1) COMMENT '广告位定向10050027',
  `cp_orient_adslot29` tinyint(1) COMMENT '广告位定向10050028',
  `cp_orient_adslot30` tinyint(1) COMMENT '广告位定向10050029',
  `cp_orient_adslot31` tinyint(1) COMMENT '广告位定向10050030',
  `cp_orient_adslot32` tinyint(1) COMMENT '广告位定向10050031',
  `cp_orient_adslot33` tinyint(1) COMMENT '广告位定向10050032',
  `cp_orient_adslot34` tinyint(1) COMMENT '广告位定向10050033',
  `cp_orient_adslot35` tinyint(1) COMMENT '广告位定向10050034',
  `cp_orient_adslot36` tinyint(1) COMMENT '广告位定向10050035',
  `cp_orient_adslot37` tinyint(1) COMMENT '广告位定向10050036',
  `cp_orient_adslot38` tinyint(1) COMMENT '广告位定向10060001',
  `cp_orient_adslot39` tinyint(1) COMMENT '广告位定向10060002',
  `cp_orient_adslot40` tinyint(1) COMMENT '广告位定向10060003',
  `cp_orient_adslot41` tinyint(1) COMMENT '广告位定向10060004',
  `cp_orient_adslot42` tinyint(1) COMMENT '广告位定向10070001',
  `cp_orient_adslot43` tinyint(1) COMMENT '广告位定向10070002',
  `cp_orient_adslot44` tinyint(1) COMMENT '广告位定向10070003',
  `cp_orient_adslot45` tinyint(1) COMMENT '广告位定向10070004',
  `cp_orient_adslot46` tinyint(1) COMMENT '广告位定向10070005',
  `cp_orient_adslot47` tinyint(1) COMMENT '广告位定向10070006',
  `cp_orient_adslot48` tinyint(1) COMMENT '广告位定向10070007',
  `cp_orient_adslot49` tinyint(1) COMMENT '广告位定向10070008',
  `cp_orient_adslot50` tinyint(1) COMMENT '广告位定向1010',
  `cp_orient_adslot51` tinyint(1) COMMENT '广告位定向1018',
  `cp_orient_adslot52` tinyint(1) COMMENT '广告位定向1026',
  `cp_orient_adslot53` tinyint(1) COMMENT '广告位定向1034',
  `cp_orient_adslot54` tinyint(1) COMMENT '广告位定向1042',
  `cp_orient_adslot55` tinyint(1) COMMENT '广告位定向1050',
  `cp_orient_adslot56` tinyint(1) COMMENT '广告位定向1058',
  `cp_orient_adslot57` tinyint(1) COMMENT '广告位定向1066',
  `cp_orient_adslot58` tinyint(1) COMMENT '广告位定向1074',
  `cp_orient_adslot59` tinyint(1) COMMENT '广告位定向1082',
  `cp_orient_adslot60` tinyint(1) COMMENT '广告位定向1090',
  `cp_orient_adslot61` tinyint(1) COMMENT '广告位定向1098',
  `cp_orient_adslot62` tinyint(1) COMMENT '广告位定向1106',
  `cp_orient_adslot63` tinyint(1) COMMENT '广告位定向1114',
  `cp_orient_adslot64` tinyint(1) COMMENT '广告位定向1122',
  `cp_orient_adslot65` tinyint(1) COMMENT '广告位定向1130',
  `cp_orient_adslot66` tinyint(1) COMMENT '广告位定向1138',
  `cp_orient_adslot67` tinyint(1) COMMENT '广告位定向200048',
  `cp_orient_adslot68` tinyint(1) COMMENT '广告位定向362',
  `cp_orient_adslot69` tinyint(1) COMMENT '广告位定向ape_fpf_v1_2',
  `cp_orient_adslot70` tinyint(1) COMMENT '广告位定向aphone_fpv',
  `cp_orient_adslot71` tinyint(1) COMMENT '广告位定向aphone_lp',
  `cp_orient_adslot72` tinyint(1) COMMENT '广告位定向ios_fpv',
  `cp_orient_adslot73` tinyint(1) COMMENT '广告位定向ipad_lp',
  `cp_orient_adslot74` tinyint(1) COMMENT '广告位定向ipd_fpf_v1_2',
  `cp_orient_adslot75` tinyint(1) COMMENT '广告位定向ipe_fpf_v1_2',
  `cp_orient_adslot76` tinyint(1) COMMENT '广告位定向iphone_lp',

  `ct_file_type1` tinyint(1) NOT NULL COMMENT '素材文件类型jpeg',
  `ct_file_type2` tinyint(1) NOT NULL COMMENT '素材文件类型png',
  `ct_width` int(11) NOT NULL COMMENT '宽',
  `ct_height` int(11) NOT NULL COMMENT '高',
  `ct_type1` tinyint(1) NOT NULL COMMENT '创意类型（1banner,2video,3native）',
  `ct_type2` tinyint(1) NOT NULL COMMENT '创意类型（1banner,2video,3native）',
  `ct_type3` tinyint(1) NOT NULL COMMENT '创意类型（1banner,2video,3native）',
  `ct_link_type0` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:H5,2:App下载,3:应用直达',
  `ct_link_type1` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:H5,2:App下载,3:应用直达',
  `ct_link_type2` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:H5,2:App下载,3:应用直达',
  `ct_size` int(11) NOT NULL COMMENT '素材大小',
  `ct_duration` int(11) DEFAULT '0' COMMENT '视频时长，单位秒',
  `ct_template_id1` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id3` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id4` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id5` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id6` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id7` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id8` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id9` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id11` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id12` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id13` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id14` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id15` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id16` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id17` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_id18` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板id',
  `ct_template_style_id1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创意模板风格id',
  `ct_template_style_id2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创意模板风格id',
  `ct_template_style_id3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创意模板风格id',
  `ct_template_style_id5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '创意模板风格id',
  `ct_status0` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态（0正常，1删除）',
  `ct_status1` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态（0正常，1删除）',
  `ct_flag1` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1启动，2暂停',
  `ct_flag2` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1启动，2暂停',

  `ch_charging_type1` tinyint(4) NOT NULL COMMENT '计费方式：1包段资源，2私有交易（PD），3公开竞价（RTB）',
  `ch_charging_type2` tinyint(4) NOT NULL COMMENT '计费方式：1包段资源，2私有交易（PD），3公开竞价（RTB）',
  `ch_charging_type3` tinyint(4) NOT NULL COMMENT '计费方式：1包段资源，2私有交易（PD），3公开竞价（RTB）',
  `ch_media_no` int(4) DEFAULT '0' COMMENT '媒体损耗系数',
  `ch_media_category1` tinyint(1) DEFAULT NULL COMMENT '媒体分类一级',
  `ch_media_category2` tinyint(1) DEFAULT NULL COMMENT '媒体分类一级',
  `ch_media_category4` tinyint(1) DEFAULT NULL COMMENT '媒体分类一级',
  `ch_media_category6` tinyint(1) DEFAULT NULL COMMENT '媒体分类一级',
  `ch_media_category_sed13` tinyint(1) DEFAULT NULL COMMENT '媒体分类二级',
  `ch_media_category_sed15` tinyint(1) DEFAULT NULL COMMENT '媒体分类二级',
  `ch_media_category_sed17` tinyint(1) DEFAULT NULL COMMENT '媒体分类二级',
  `ch_media_category_sed20` tinyint(1) DEFAULT NULL COMMENT '媒体分类二级',
  `ch_media_category_sed28` tinyint(1) DEFAULT NULL COMMENT '媒体分类二级',
  `ch_media_category_sed33` tinyint(1) DEFAULT NULL COMMENT '媒体分类二级',
  `ch_sources_type7` tinyint(1) DEFAULT NULL COMMENT '资源类型（多选,号隔开）：1PC-Web,2PC-视频,3Mobile-APP,4Mobile-Web,5Mobile-视频,6其他',
  `ch_sources_type8` tinyint(1) DEFAULT NULL COMMENT '资源类型（多选,号隔开）：1PC-Web,2PC-视频,3Mobile-APP,4Mobile-Web,5Mobile-视频,6其他',
  `ch_sources_type9` tinyint(1) DEFAULT NULL COMMENT '资源类型（多选,号隔开）：1PC-Web,2PC-视频,3Mobile-APP,4Mobile-Web,5Mobile-视频,6其他'

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


insert into ctr_predict_t2e1_ohmore
(
clk_flag
,token
,account_id_oh1
,account_id_oh2
,account_id_oh3
,account_id_oh4
,account_id_oh5
,account_id_oh6
,account_id_oh7
,advertiser_id_oh5
,advertiser_id_oh6
,advertiser_id_oh7
,advertiser_id_oh14
,advertiser_id_oh15
,advertiser_id_oh17
,advertiser_id_oh18
,advertiser_id_oh19
,advertiser_id_oh20
,advertiser_id_oh21
,advertiser_id_oh22
,campaign_id_oh1
,campaign_id_oh2
,campaign_id_oh3
,campaign_id_oh6
,campaign_id_oh7
,campaign_id_oh8
,campaign_id_oh9
,campaign_id_oh10
,campaign_id_oh11
,campaign_id_oh12
,campaign_id_oh13
,campaign_id_oh14
,campaign_id_oh15
,campaign_id_oh16
,campaign_id_oh17
,campaign_id_oh18
,campaign_id_oh19
,campaign_id_oh20
,campaign_id_oh21
,campaign_id_oh22
,campaign_id_oh23
,campaign_id_oh24
,campaign_id_oh25
,campaign_id_oh26
,campaign_id_oh27
,campaign_id_oh28
,campaign_id_oh29
,campaign_id_oh30
,campaign_id_oh31
,campaign_id_oh32
,campaign_id_oh33
,campaign_id_oh34
,campaign_id_oh35
,campaign_id_oh36
,campaign_id_oh37
,campaign_id_oh38
,creative_id_oh3
,creative_id_oh4
,creative_id_oh5
,creative_id_oh6
,creative_id_oh7
,creative_id_oh8
,creative_id_oh9
,creative_id_oh10
,creative_id_oh12
,creative_id_oh13
,creative_id_oh14
,creative_id_oh15
,creative_id_oh18
,creative_id_oh19
,creative_id_oh22
,creative_id_oh23
,creative_id_oh24
,creative_id_oh25
,creative_id_oh26
,creative_id_oh27
,creative_id_oh28
,creative_id_oh29
,creative_id_oh30
,creative_id_oh31
,creative_id_oh32
,creative_id_oh33
,creative_id_oh34
,creative_id_oh35
,creative_id_oh36
,creative_id_oh37
,creative_id_oh38
,creative_id_oh39
,creative_id_oh40
,creative_id_oh41
,creative_id_oh42
,creative_id_oh43
,creative_id_oh44
,creative_id_oh45
,creative_id_oh46
,creative_id_oh47
,creative_id_oh48
,creative_id_oh49
,creative_id_oh50
,creative_id_oh51
,creative_id_oh52
,creative_id_oh53
,creative_id_oh54
,creative_id_oh55
,creative_id_oh56
,creative_id_oh57
,creative_id_oh58
,creative_id_oh59
,creative_id_oh60
,creative_id_oh61
,creative_id_oh62
,creative_id_oh63
,creative_id_oh64
,creative_id_oh65
,creative_id_oh66
,creative_id_oh67
,creative_id_oh68
,creative_id_oh69
,creative_id_oh70
,creative_id_oh71
,creative_id_oh72
,creative_id_oh73
,creative_id_oh74
,creative_id_oh75
,creative_id_oh76
,creative_id_oh77
,creative_id_oh78
,creative_id_oh79
,creative_id_oh80
,creative_id_oh81
,creative_id_oh82
,creative_id_oh83
,creative_id_oh84
,creative_id_oh85
,creative_id_oh86
,creative_id_oh87
,creative_id_oh88
,creative_id_oh89
,creative_id_oh90
,creative_id_oh91
,creative_id_oh92
,creative_id_oh93
,creative_id_oh94
,creative_id_oh95
,creative_id_oh96
,creative_id_oh97
,creative_id_oh98
,creative_id_oh99
,creative_id_oh100
,creative_id_oh101
,creative_id_oh102
,creative_id_oh103
,creative_id_oh104
,creative_id_oh105
,creative_id_oh106
,creative_id_oh107
,creative_id_oh108
,creative_id_oh109
,creative_id_oh110
,creative_id_oh111
,creative_id_oh112
,creative_id_oh113
,creative_id_oh114
,creative_id_oh115
,creative_id_oh116
,creative_id_oh117
,creative_id_oh118
,creative_id_oh119
,creative_id_oh120
,creative_id_oh121
,creative_id_oh122
,creative_id_oh123
,creative_id_oh124
,creative_id_oh125
,creative_id_oh126
,creative_id_oh127
,creative_id_oh128
,creative_id_oh129
,creative_id_oh130
,creative_id_oh131
,creative_id_oh132
,channel_id_oh2
,channel_id_oh3
,channel_id_oh4
,channel_id_oh5
,channel_id_oh6
,channel_id_oh7
,channel_id_oh8
,device_type
,media
,ad_space1
,ad_space2
,ad_space3
,ad_space4
,ad_space5
,ad_space6
,ad_space7
,ad_space8
,ad_space9
,ad_space10
,ad_space11
,ad_space12
,ad_space13
,ad_space14
,ad_space15
,ad_space16
,ad_space17
,ad_space18
,ad_space19
,ad_space20
,ad_space21
,ad_space22
,ad_space23
,ad_space24
,ad_space25
,ad_space26
,ad_space27
,ad_space28
,ad_space29
,ad_space30
,ad_space31
,adunit1
,adunit2
,adunit3
,adunit4
,adunit5
,ad_type1
,ad_type3
,ad_type4
,ad_type6
,ad_size1
,ad_size2
,ad_size3
,ad_size4
,ad_size5
,ad_size6
,ad_size7
,ad_size8
,ad_size9
,ad_size10
,ad_size11
,device_id
,in_cost
,out_cost
,ad_cost
,tyear
,tmonth
,tday
,thour
,tminute
,tweek1
,tweek2
,tweek3
,tweek4
,tweek5
,tweek6
,tweek7
,thunit1
,thunit2
,thunit3
,thunit4
,thunit5
,thunit6

,ad_servicerate0
,ad_servicerate1
,ad_servicerate15
,ad_servicerate50
,ad_priority0
,ad_priority1
,ad_credit1
,ad_credit2
,ad_credit3
,ad_credit4
,ad_credit5

,cp_status0
,cp_status1
,cp_flag1
,cp_flag2
,cp_is_status1
,cp_is_status8
,cp_start_date
,cp_end_date
,cp_budget_typen
,cp_budget_type1
,cp_budget_type2
,cp_budget_num
,cp_frequency_typen
,cp_frequency_type1
,cp_frequency_type2
,cp_frequency_type3
,cp_imp_limitn
,cp_imp_limitv
,cp_click_limitn
,cp_click_limitv
,cp_orient_networkwifi
,cp_orient_network5g
,cp_orient_network4g
,cp_orient_network3g
,cp_orient_network2g
,cp_orient_networkgprs
,cp_orient_networkots
,cp_orient_systemadr
,cp_orient_systemios
,cp_orient_systemwin
,cp_orient_systemmac
,cp_orient_systemots
,cp_orient_adslotn
,cp_orient_adslot1
,cp_orient_adslot2
,cp_orient_adslot3
,cp_orient_adslot4
,cp_orient_adslot5
,cp_orient_adslot6
,cp_orient_adslot7
,cp_orient_adslot8
,cp_orient_adslot9
,cp_orient_adslot10
,cp_orient_adslot11
,cp_orient_adslot12
,cp_orient_adslot13
,cp_orient_adslot14
,cp_orient_adslot15
,cp_orient_adslot16
,cp_orient_adslot17
,cp_orient_adslot18
,cp_orient_adslot19
,cp_orient_adslot20
,cp_orient_adslot21
,cp_orient_adslot22
,cp_orient_adslot23
,cp_orient_adslot24
,cp_orient_adslot25
,cp_orient_adslot26
,cp_orient_adslot27
,cp_orient_adslot28
,cp_orient_adslot29
,cp_orient_adslot30
,cp_orient_adslot31
,cp_orient_adslot32
,cp_orient_adslot33
,cp_orient_adslot34
,cp_orient_adslot35
,cp_orient_adslot36
,cp_orient_adslot37
,cp_orient_adslot38
,cp_orient_adslot39
,cp_orient_adslot40
,cp_orient_adslot41
,cp_orient_adslot42
,cp_orient_adslot43
,cp_orient_adslot44
,cp_orient_adslot45
,cp_orient_adslot46
,cp_orient_adslot47
,cp_orient_adslot48
,cp_orient_adslot49
,cp_orient_adslot50
,cp_orient_adslot51
,cp_orient_adslot52
,cp_orient_adslot53
,cp_orient_adslot54
,cp_orient_adslot55
,cp_orient_adslot56
,cp_orient_adslot57
,cp_orient_adslot58
,cp_orient_adslot59
,cp_orient_adslot60
,cp_orient_adslot61
,cp_orient_adslot62
,cp_orient_adslot63
,cp_orient_adslot64
,cp_orient_adslot65
,cp_orient_adslot66
,cp_orient_adslot67
,cp_orient_adslot68
,cp_orient_adslot69
,cp_orient_adslot70
,cp_orient_adslot71
,cp_orient_adslot72
,cp_orient_adslot73
,cp_orient_adslot74
,cp_orient_adslot75
,cp_orient_adslot76

,ct_file_type1
,ct_file_type2
,ct_width
,ct_height
,ct_type1
,ct_type2
,ct_type3
,ct_link_type0
,ct_link_type1
,ct_link_type2
,ct_size
,ct_duration
,ct_template_id1
,ct_template_id2
,ct_template_id3
,ct_template_id4
,ct_template_id5
,ct_template_id6
,ct_template_id7
,ct_template_id8
,ct_template_id9
,ct_template_id11
,ct_template_id12
,ct_template_id13
,ct_template_id14
,ct_template_id15
,ct_template_id16
,ct_template_id17
,ct_template_id18
,ct_template_style_id1
,ct_template_style_id2
,ct_template_style_id3
,ct_template_style_id5
,ct_status0
,ct_status1
,ct_flag1
,ct_flag2

,ch_charging_type1
,ch_charging_type2
,ch_charging_type3
,ch_media_no
,ch_media_category1
,ch_media_category2
,ch_media_category4
,ch_media_category6
,ch_media_category_sed13
,ch_media_category_sed15
,ch_media_category_sed17
,ch_media_category_sed20
,ch_media_category_sed28
,ch_media_category_sed33
,ch_sources_type7
,ch_sources_type8
,ch_sources_type9
)

select 
clk_flag
,token
,case when account_id=1 then 1 else 0 end
,case when account_id=2 then 1 else 0 end
,case when account_id=3 then 1 else 0 end
,case when account_id=4 then 1 else 0 end
,case when account_id=5 then 1 else 0 end
,case when account_id=6 then 1 else 0 end
,case when account_id=7 then 1 else 0 end
,case when advertiser_id=5 then 1 else 0 end
,case when advertiser_id=6 then 1 else 0 end
,case when advertiser_id=7 then 1 else 0 end
,case when advertiser_id=14 then 1 else 0 end
,case when advertiser_id=15 then 1 else 0 end
,case when advertiser_id=17 then 1 else 0 end
,case when advertiser_id=18 then 1 else 0 end
,case when advertiser_id=19 then 1 else 0 end
,case when advertiser_id=20 then 1 else 0 end
,case when advertiser_id=21 then 1 else 0 end
,case when advertiser_id=22 then 1 else 0 end
,case when campaign_id=1 then 1 else 0 end
,case when campaign_id=2 then 1 else 0 end
,case when campaign_id=3 then 1 else 0 end
,case when campaign_id=6 then 1 else 0 end
,case when campaign_id=7 then 1 else 0 end
,case when campaign_id=8 then 1 else 0 end
,case when campaign_id=9 then 1 else 0 end
,case when campaign_id=10 then 1 else 0 end
,case when campaign_id=11 then 1 else 0 end
,case when campaign_id=12 then 1 else 0 end
,case when campaign_id=13 then 1 else 0 end
,case when campaign_id=14 then 1 else 0 end
,case when campaign_id=15 then 1 else 0 end
,case when campaign_id=16 then 1 else 0 end
,case when campaign_id=17 then 1 else 0 end
,case when campaign_id=18 then 1 else 0 end
,case when campaign_id=19 then 1 else 0 end
,case when campaign_id=20 then 1 else 0 end
,case when campaign_id=21 then 1 else 0 end
,case when campaign_id=22 then 1 else 0 end
,case when campaign_id=23 then 1 else 0 end
,case when campaign_id=24 then 1 else 0 end
,case when campaign_id=25 then 1 else 0 end
,case when campaign_id=26 then 1 else 0 end
,case when campaign_id=27 then 1 else 0 end
,case when campaign_id=28 then 1 else 0 end
,case when campaign_id=29 then 1 else 0 end
,case when campaign_id=30 then 1 else 0 end
,case when campaign_id=31 then 1 else 0 end
,case when campaign_id=32 then 1 else 0 end
,case when campaign_id=33 then 1 else 0 end
,case when campaign_id=34 then 1 else 0 end
,case when campaign_id=35 then 1 else 0 end
,case when campaign_id=36 then 1 else 0 end
,case when campaign_id=37 then 1 else 0 end
,case when campaign_id=38 then 1 else 0 end
,case when creative_id=3 then 1 else 0 end
,case when creative_id=4 then 1 else 0 end
,case when creative_id=5 then 1 else 0 end
,case when creative_id=6 then 1 else 0 end
,case when creative_id=7 then 1 else 0 end
,case when creative_id=8 then 1 else 0 end
,case when creative_id=9 then 1 else 0 end
,case when creative_id=10 then 1 else 0 end
,case when creative_id=12 then 1 else 0 end
,case when creative_id=13 then 1 else 0 end
,case when creative_id=14 then 1 else 0 end
,case when creative_id=15 then 1 else 0 end
,case when creative_id=18 then 1 else 0 end
,case when creative_id=19 then 1 else 0 end
,case when creative_id=22 then 1 else 0 end
,case when creative_id=23 then 1 else 0 end
,case when creative_id=24 then 1 else 0 end
,case when creative_id=25 then 1 else 0 end
,case when creative_id=26 then 1 else 0 end
,case when creative_id=27 then 1 else 0 end
,case when creative_id=28 then 1 else 0 end 
,case when creative_id=29 then 1 else 0 end 
,case when creative_id=30 then 1 else 0 end
,case when creative_id=31 then 1 else 0 end
,case when creative_id=32 then 1 else 0 end
,case when creative_id=33 then 1 else 0 end
,case when creative_id=34 then 1 else 0 end
,case when creative_id=35 then 1 else 0 end
,case when creative_id=36 then 1 else 0 end
,case when creative_id=37 then 1 else 0 end
,case when creative_id=38 then 1 else 0 end
,case when creative_id=39 then 1 else 0 end
,case when creative_id=40 then 1 else 0 end
,case when creative_id=41 then 1 else 0 end
,case when creative_id=42 then 1 else 0 end
,case when creative_id=43 then 1 else 0 end
,case when creative_id=44 then 1 else 0 end
,case when creative_id=45 then 1 else 0 end
,case when creative_id=46 then 1 else 0 end
,case when creative_id=47 then 1 else 0 end
,case when creative_id=48 then 1 else 0 end
,case when creative_id=49 then 1 else 0 end
,case when creative_id=50 then 1 else 0 end
,case when creative_id=51 then 1 else 0 end
,case when creative_id=52 then 1 else 0 end
,case when creative_id=53 then 1 else 0 end
,case when creative_id=54 then 1 else 0 end
,case when creative_id=55 then 1 else 0 end
,case when creative_id=56 then 1 else 0 end
,case when creative_id=57 then 1 else 0 end
,case when creative_id=58 then 1 else 0 end
,case when creative_id=59 then 1 else 0 end
,case when creative_id=60 then 1 else 0 end
,case when creative_id=61 then 1 else 0 end
,case when creative_id=62 then 1 else 0 end
,case when creative_id=63 then 1 else 0 end
,case when creative_id=64 then 1 else 0 end
,case when creative_id=65 then 1 else 0 end
,case when creative_id=66 then 1 else 0 end
,case when creative_id=67 then 1 else 0 end
,case when creative_id=68 then 1 else 0 end
,case when creative_id=69 then 1 else 0 end
,case when creative_id=70 then 1 else 0 end
,case when creative_id=71 then 1 else 0 end
,case when creative_id=72 then 1 else 0 end
,case when creative_id=73 then 1 else 0 end
,case when creative_id=74 then 1 else 0 end
,case when creative_id=75 then 1 else 0 end
,case when creative_id=76 then 1 else 0 end
,case when creative_id=77 then 1 else 0 end
,case when creative_id=78 then 1 else 0 end
,case when creative_id=79 then 1 else 0 end
,case when creative_id=80 then 1 else 0 end
,case when creative_id=81 then 1 else 0 end
,case when creative_id=82 then 1 else 0 end
,case when creative_id=83 then 1 else 0 end
,case when creative_id=84 then 1 else 0 end
,case when creative_id=85 then 1 else 0 end
,case when creative_id=86 then 1 else 0 end
,case when creative_id=87 then 1 else 0 end
,case when creative_id=88 then 1 else 0 end
,case when creative_id=89 then 1 else 0 end
,case when creative_id=90 then 1 else 0 end
,case when creative_id=91 then 1 else 0 end
,case when creative_id=92 then 1 else 0 end
,case when creative_id=93 then 1 else 0 end
,case when creative_id=94 then 1 else 0 end
,case when creative_id=95 then 1 else 0 end
,case when creative_id=96 then 1 else 0 end
,case when creative_id=97 then 1 else 0 end
,case when creative_id=98 then 1 else 0 end
,case when creative_id=99 then 1 else 0 end
,case when creative_id=100 then 1 else 0 end
,case when creative_id=101 then 1 else 0 end
,case when creative_id=102 then 1 else 0 end
,case when creative_id=103 then 1 else 0 end
,case when creative_id=104 then 1 else 0 end
,case when creative_id=105 then 1 else 0 end
,case when creative_id=106 then 1 else 0 end
,case when creative_id=107 then 1 else 0 end
,case when creative_id=108 then 1 else 0 end
,case when creative_id=109 then 1 else 0 end
,case when creative_id=110 then 1 else 0 end
,case when creative_id=111 then 1 else 0 end
,case when creative_id=112 then 1 else 0 end
,case when creative_id=113 then 1 else 0 end
,case when creative_id=114 then 1 else 0 end
,case when creative_id=115 then 1 else 0 end
,case when creative_id=116 then 1 else 0 end
,case when creative_id=117 then 1 else 0 end
,case when creative_id=118 then 1 else 0 end
,case when creative_id=119 then 1 else 0 end
,case when creative_id=120 then 1 else 0 end
,case when creative_id=121 then 1 else 0 end
,case when creative_id=122 then 1 else 0 end
,case when creative_id=123 then 1 else 0 end
,case when creative_id=124 then 1 else 0 end
,case when creative_id=125 then 1 else 0 end
,case when creative_id=126 then 1 else 0 end
,case when creative_id=127 then 1 else 0 end
,case when creative_id=128 then 1 else 0 end
,case when creative_id=129 then 1 else 0 end
,case when creative_id=130 then 1 else 0 end
,case when creative_id=131 then 1 else 0 end
,case when creative_id=132 then 1 else 0 end
,case when channel_id=2 then 1 else 0 end 
,case when channel_id=3 then 1 else 0 end 
,case when channel_id=4 then 1 else 0 end 
,case when channel_id=5 then 1 else 0 end 
,case when channel_id=6 then 1 else 0 end 
,case when channel_id=7 then 1 else 0 end 
,case when channel_id=8 then 1 else 0 end 
,device_type
,media
,case when ad_space=362 then 1 else 0 end
,case when ad_space=1002 then 1 else 0 end
,case when ad_space=1010 then 1 else 0 end
,case when ad_space=1018 then 1 else 0 end
,case when ad_space=1026 then 1 else 0 end
,case when ad_space=1034 then 1 else 0 end
,case when ad_space=1042 then 1 else 0 end
,case when ad_space=1050 then 1 else 0 end
,case when ad_space=1058 then 1 else 0 end
,case when ad_space=1066 then 1 else 0 end
,case when ad_space=1074 then 1 else 0 end
,case when ad_space=1082 then 1 else 0 end
,case when ad_space=1090 then 1 else 0 end
,case when ad_space=1098 then 1 else 0 end
,case when ad_space=1106 then 1 else 0 end
,case when ad_space=1114 then 1 else 0 end
,case when ad_space=1122 then 1 else 0 end
,case when ad_space=1130 then 1 else 0 end
,case when ad_space=200048 then 1 else 0 end
,case when ad_space=10050002 then 1 else 0 end
,case when ad_space=10050004 then 1 else 0 end
,case when ad_space=10050012 then 1 else 0 end
,case when ad_space=10050032 then 1 else 0 end
,case when ad_space=10050034 then 1 else 0 end
,case when ad_space=10060001 then 1 else 0 end
,case when ad_space=10060003 then 1 else 0 end
,case when ad_space=10060004 then 1 else 0 end
,case when ad_space=10070001 then 1 else 0 end
,case when ad_space=10070002 then 1 else 0 end
,case when ad_space=10070003 then 1 else 0 end
,case when ad_space=10070004 then 1 else 0 end
,case when adunit='1130' then 1 else 0 end
,case when adunit='1122' then 1 else 0 end
,case when adunit='1002' then 1 else 0 end
,case when adunit='1010' then 1 else 0 end
,case when adunit='1042' then 1 else 0 end
,case when ad_type=1 then 1 else 0 end
,case when ad_type=3 then 1 else 0 end
,case when ad_type=4 then 1 else 0 end
,case when ad_type=6 then 1 else 0 end
,case when ad_size='150*130' then 1 else 0 end
,case when ad_size='160*160' then 1 else 0 end
,case when ad_size='190*145' then 1 else 0 end
,case when ad_size='240*240' then 1 else 0 end
,case when ad_size='45*45' then 1 else 0 end
,case when ad_size='50*50' then 1 else 0 end
,case when ad_size='640*120' then 1 else 0 end
,case when ad_size='640*360' then 1 else 0 end
,case when ad_size='710*236' then 1 else 0 end
,case when ad_size='720*168' then 1 else 0 end
,case when ad_size='720*360' then 1 else 0 end
,device_id
,in_cost
,out_cost
,ad_cost
,tyear
,tmonth
,tday
,thour
,tminute
,case when tweek=1 then 1 else 0 end
,case when tweek=2 then 1 else 0 end
,case when tweek=3 then 1 else 0 end
,case when tweek=4 then 1 else 0 end
,case when tweek=5 then 1 else 0 end
,case when tweek=6 then 1 else 0 end
,case when tweek=7 then 1 else 0 end
,case when thour>=0 and thour<6 then 1 else 0 end
,case when thour>=6 and thour<9 then 1 else 0 end
,case when thour>=9 and thour<12 then 1 else 0 end
,case when thour>=12 and thour<14 then 1 else 0 end
,case when thour>=14 and thour<18 then 1 else 0 end
,case when thour>=18 and thour<24 then 1 else 0 end
	
,case when ad_servicerate=0 then 1 else 0 end
,case when ad_servicerate=1 then 1 else 0 end
,case when ad_servicerate=15 then 1 else 0 end
,case when ad_servicerate=50 then 1 else 0 end
,case when ad_priority=0 then 1 else 0 end
,case when ad_priority=1 then 1 else 0 end
,case when ad_credit=0 then 1 else 0 end
,case when ad_credit=100 then 1 else 0 end
,case when ad_credit=1000 then 1 else 0 end
,case when ad_credit=20000 then 1 else 0 end
,case when ad_credit=100000 then 1 else 0 end

,case when cp_status=0 then 1 else 0 end
,case when cp_status=1 then 1 else 0 end
,case when cp_flag=1 then 1 else 0 end
,case when cp_flag=2 then 1 else 0 end
,case when cp_is_status=1 then 1 else 0 end
,case when cp_is_status=8 then 1 else 0 end
,cp_start_date
,cp_end_date
,case when cp_budget_type=0 then 1 else 0 end
,case when cp_budget_type=1 then 1 else 0 end
,case when cp_budget_type=2 then 1 else 0 end
,cp_budget_num
,case when cp_frequency_type=0 then 1 else 0 end
,case when cp_frequency_type=1 then 1 else 0 end
,case when cp_frequency_type=2 then 1 else 0 end
,case when cp_frequency_type=3 then 1 else 0 end
,case when cp_imp_limit=0 then 1 else 0 end
,case when cp_imp_limit>0 then cp_imp_limit else 0 end
,case when cp_click_limit=0 then 1 else 0 end
,case when cp_click_limit>0 then cp_click_limit else 0 end
,case when locate('wifi',cp_orient_network)>0 then 1 else 0 end
,case when locate('5g',cp_orient_network)>0 then 1 else 0 end
,case when locate('4g',cp_orient_network)>0 then 1 else 0 end
,case when locate('3g',cp_orient_network)>0 then 1 else 0 end
,case when locate('2g',cp_orient_network)>0 then 1 else 0 end
,case when locate('gprs',cp_orient_network)>0 then 1 else 0 end
,case when locate('other',cp_orient_network)>0 then 1 else 0 end
,case when locate('android',cp_orient_system)>0 then 1 else 0 end
,case when locate('ios',cp_orient_system)>0 then 1 else 0 end
,case when locate('windows',cp_orient_system)>0 then 1 else 0 end
,case when locate('mac os',cp_orient_system)>0 then 1 else 0 end
,case when locate('other',cp_orient_system)>0 then 1 else 0 end
,case when locate('[""""]',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1002',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050001',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050002',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050003',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050004',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050005',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050006',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050007',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050008',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050009',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050010',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050011',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050012',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050013',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050014',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050015',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050016',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050017',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050018',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050019',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050020',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050021',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050022',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050023',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050024',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050025',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050026',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050027',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050028',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050029',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050030',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050031',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050032',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050033',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050034',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050035',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10050036',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10060001',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10060002',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10060003',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10060004',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10070001',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10070002',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10070003',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10070004',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10070005',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10070006',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10070007',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('10070008',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1010',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1018',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1026',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1034',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1042',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1050',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1058',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1066',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1074',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1082',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1090',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1098',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1106',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1114',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1122',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1130',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('1138',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('200048',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('362',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('ape_fpf_v1_2',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('aphone_fpv',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('aphone_lp',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('ios_fpv',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('ipad_lp',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('ipd_fpf_v1_2',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('ipe_fpf_v1_2',cp_orient_adslot)>0 then 1 else 0 end
,case when locate('iphone_lp',cp_orient_adslot)>0 then 1 else 0 end

,case when ct_file_type='jpeg' then 1 else 0 end
,case when ct_file_type='png' then 1 else 0 end
,ct_width
,ct_height
,case when ct_type='1' then 1 else 0 end
,case when ct_type='2' then 1 else 0 end
,case when ct_type='3' then 1 else 0 end
,case when ct_link_type=0 then 1 else 0 end
,case when ct_link_type=1 then 1 else 0 end
,case when ct_link_type=2 then 1 else 0 end
,ct_size
,ct_duration
,case when ct_template_id=1 then 1 else 0 end
,case when ct_template_id=2 then 1 else 0 end
,case when ct_template_id=3 then 1 else 0 end
,case when ct_template_id=4 then 1 else 0 end
,case when ct_template_id=5 then 1 else 0 end
,case when ct_template_id=6 then 1 else 0 end
,case when ct_template_id=7 then 1 else 0 end
,case when ct_template_id=8 then 1 else 0 end
,case when ct_template_id=9 then 1 else 0 end
,case when ct_template_id=11 then 1 else 0 end
,case when ct_template_id=12 then 1 else 0 end
,case when ct_template_id=13 then 1 else 0 end
,case when ct_template_id=14 then 1 else 0 end
,case when ct_template_id=15 then 1 else 0 end
,case when ct_template_id=16 then 1 else 0 end
,case when ct_template_id=17 then 1 else 0 end
,case when ct_template_id=18 then 1 else 0 end
,case when ct_template_id in (1,3,5,7,8,11,12,13,14,15,16,17,18) then 1 else 0 end
,case when ct_template_id in (2,6) then 1 else 0 end
,case when ct_template_id=4 then 1 else 0 end
,case when ct_template_id=9 then 1 else 0 end
,case when ct_status=0 then 1 else 0 end
,case when ct_status=1 then 1 else 0 end
,case when ct_flag=1 then 1 else 0 end
,case when ct_flag=2 then 1 else 0 end

,case when ch_charging_type=1 then 1 else 0 end
,case when ch_charging_type=2 then 1 else 0 end
,case when ch_charging_type=3 then 1 else 0 end
,ch_media_no
,case when ch_media_category='1' then 1 else 0 end
,case when ch_media_category='2' then 1 else 0 end
,case when ch_media_category='4' then 1 else 0 end
,case when ch_media_category='6' then 1 else 0 end
,case when ch_media_category_sed='13' then 1 else 0 end
,case when ch_media_category_sed='15' then 1 else 0 end
,case when ch_media_category_sed='17' then 1 else 0 end
,case when ch_media_category_sed='20' then 1 else 0 end
,case when ch_media_category_sed='28' then 1 else 0 end
,case when ch_media_category_sed='33' then 1 else 0 end
,case when ch_sources_type='7' then 1 else 0 end
,case when ch_sources_type='8' then 1 else 0 end
,case when ch_sources_type='9' then 1 else 0 end

from ctr_predict_t2_merge_mvf
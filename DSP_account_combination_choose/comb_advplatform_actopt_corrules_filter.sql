

CREATE TABLE `comb_advplatform_actopt_corrules_filter` (
  `dt` datetime NOT NULL,
  `day_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_first_industry_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '一级行业名称，组合优化项，需要onehot',
  `adg_site_set` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '投放站点集合，组合优化项，需要onehot',
  `adg_product_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标的物类型，组合优化项，需要onehot',
  `tag_age_1_17` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组合优化项，遵循广告平台方法离散分组，定向报表中统计出来的真实年龄曝光量比例',
  `tag_age_18_23` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组合优化项，遵循广告平台方法离散分组，定向报表中统计出来的真实年龄曝光量比例',
  `tag_age_24_30` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组合优化项，遵循广告平台方法离散分组，定向报表中统计出来的真实年龄曝光量比例',
  `tag_age_31_40` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组合优化项，遵循广告平台方法离散分组，定向报表中统计出来的真实年龄曝光量比例',
  `tag_age_41_50` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组合优化项，遵循广告平台方法离散分组，定向报表中统计出来的真实年龄曝光量比例',
  `tag_age_51_65` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组合优化项，遵循广告平台方法离散分组，定向报表中统计出来的真实年龄曝光量比例',
  `tag_age_66_127` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组合优化项，遵循广告平台方法离散分组，定向报表中统计出来的真实年龄曝光量比例',
  `gender_FEMALE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组合优化项，定向报表中统计出来的真实性别曝光量比例',
  `gender_MALE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组合优化项，定向报表中统计出来的真实性别曝光量比例',
  `region_110000` varchar(10)  DEFAULT NULL,
  `region_120000` varchar(10) DEFAULT NULL,
  `region_130000` varchar(10) DEFAULT NULL,
  `region_140000` varchar(10) DEFAULT NULL,
  `region_150000` varchar(10) DEFAULT NULL,
  `region_210000` varchar(10) DEFAULT NULL,
  `region_220000` varchar(10) DEFAULT NULL,
  `region_230000` varchar(10) DEFAULT NULL,
  `region_310000` varchar(10) DEFAULT NULL,
  `region_320000` varchar(10) DEFAULT NULL,
  `region_330000` varchar(10) DEFAULT NULL,
  `region_340000` varchar(10) DEFAULT NULL,
  `region_350000` varchar(10) DEFAULT NULL,
  `region_360000` varchar(10) DEFAULT NULL,
  `region_370000` varchar(10) DEFAULT NULL,
  `region_410000` varchar(10) DEFAULT NULL,
  `region_420000` varchar(10) DEFAULT NULL,
  `region_430000` varchar(10) DEFAULT NULL,
  `region_440000` varchar(10) DEFAULT NULL,
  `region_450000` varchar(10) DEFAULT NULL,
  `region_460000` varchar(10) DEFAULT NULL,
  `region_500000` varchar(10) DEFAULT NULL,
  `region_510000` varchar(10) DEFAULT NULL,
  `region_520000` varchar(10) DEFAULT NULL,
  `region_530000` varchar(10) DEFAULT NULL,
  `region_540000` varchar(10) DEFAULT NULL,
  `region_610000` varchar(10) DEFAULT NULL,
  `region_620000` varchar(10) DEFAULT NULL,
  `region_630000` varchar(10) DEFAULT NULL,
  `region_640000` varchar(10) DEFAULT NULL,
  `region_650000` varchar(10) DEFAULT NULL,
  `region_710000` varchar(10) DEFAULT NULL,
  `region_810000` varchar(10) DEFAULT NULL,
  `region_820000` varchar(10) DEFAULT NULL,
  `buss_1` varchar(10) DEFAULT NULL,
  `buss_2` varchar(10) DEFAULT NULL,
  `buss_3` varchar(10) DEFAULT NULL,
  `buss_4` varchar(10) DEFAULT NULL,
  `buss_5` varchar(10) DEFAULT NULL,
  `buss_6` varchar(10) DEFAULT NULL,
  `buss_7` varchar(10) DEFAULT NULL,
  `buss_8` varchar(10) DEFAULT NULL,
  `buss_9` varchar(10) DEFAULT NULL,
  `buss_10` varchar(10) DEFAULT NULL,
  `buss_11` varchar(10) DEFAULT NULL,
  `buss_12` varchar(10) DEFAULT NULL,
  `buss_13` varchar(10) DEFAULT NULL,
  `buss_14` varchar(10) DEFAULT NULL,
  `buss_15` varchar(10) DEFAULT NULL,
  `buss_16` varchar(10) DEFAULT NULL,
  `buss_21` varchar(10) DEFAULT NULL,
  `buss_25` varchar(10) DEFAULT NULL,
  `ad_space` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '广告位，组合优化项，需要onehot（adc_drp*数据项较稀疏，暂不考虑）',
  `adc_form_size_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adc_form_detail` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '素材类型，组合优化项，需要onehot',
  `ade_image_hash` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片hash，不作为组合优化项（需根据组合优化规则结果反查验证，以确定是否优化规则的可靠性）',
  `ade_image_url` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片url，关联advplatform_adcreatives_elements获得',
  `ade_title` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '广告文案，不作为组合优化项（需根据组合优化规则结果反查验证，以确定是否优化规则的可靠性）',
  `item_num` tinyint(1) DEFAULT NULL COMMENT '项数',
  `ctr_flag` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '激活率级别',
  `all_support` decimal(10,8) NOT NULL COMMENT '全部项集支持度',
  `pre_support` decimal(10,8) NOT NULL COMMENT '前导项集支持度',
  `confidence` decimal(10,8) NOT NULL COMMENT '置信度',
  `seq_support` decimal(10,8) NOT NULL COMMENT '推导项集支持度',
  `lift` decimal(20,8) DEFAULT NULL COMMENT '提升'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

truncate table comb_advplatform_actopt_corrules_filter;
insert into comb_advplatform_actopt_corrules_filter
(
	dt
	,day_type
	,ind_first_industry_name
	,adg_site_set
	,adg_product_type
	,tag_age_1_17
	,tag_age_18_23
	,tag_age_24_30
	,tag_age_31_40
	,tag_age_41_50
	,tag_age_51_65
	,tag_age_66_127
	,gender_MALE
	,gender_FEMALE
	,region_110000
	,region_120000
	,region_130000
	,region_140000
	,region_150000
	,region_210000
	,region_220000
	,region_230000
	,region_310000
	,region_320000
	,region_330000
	,region_340000
	,region_350000
	,region_360000
	,region_370000
	,region_410000
	,region_420000
	,region_430000
	,region_440000
	,region_450000
	,region_460000
	,region_500000
	,region_510000
	,region_520000
	,region_530000
	,region_540000
	,region_610000
	,region_620000
	,region_630000
	,region_640000
	,region_650000
	,region_710000
	,region_810000
	,region_820000
	,buss_1
	,buss_2
	,buss_3
	,buss_4
	,buss_5
	,buss_6
	,buss_7
	,buss_8
	,buss_9
	,buss_10
	,buss_11
	,buss_12
	,buss_13
	,buss_14
	,buss_15
	,buss_16
	,buss_21
	,buss_25
	,ad_space
	,adc_form_size_type
	,adc_form_detail
	,ade_image_hash
	,ade_title
	,item_num
	,ctr_flag
	,all_support
	,pre_support
	,confidence
	,seq_support
	,lift
)
select 
	dt
	,day_type
	,ind_first_industry_name
	,adg_site_set
	,adg_product_type
	,tag_age_1_17
	,tag_age_18_23
	,tag_age_24_30
	,tag_age_31_40
	,tag_age_41_50
	,tag_age_51_65
	,tag_age_66_127
	,gender_MALE
	,gender_FEMALE
	,region_110000
	,region_120000
	,region_130000
	,region_140000
	,region_150000
	,region_210000
	,region_220000
	,region_230000
	,region_310000
	,region_320000
	,region_330000
	,region_340000
	,region_350000
	,region_360000
	,region_370000
	,region_410000
	,region_420000
	,region_430000
	,region_440000
	,region_450000
	,region_460000
	,region_500000
	,region_510000
	,region_520000
	,region_530000
	,region_540000
	,region_610000
	,region_620000
	,region_630000
	,region_640000
	,region_650000
	,region_710000
	,region_810000
	,region_820000
	,buss_1
	,buss_2
	,buss_3
	,buss_4
	,buss_5
	,buss_6
	,buss_7
	,buss_8
	,buss_9
	,buss_10
	,buss_11
	,buss_12
	,buss_13
	,buss_14
	,buss_15
	,buss_16
	,buss_21
	,buss_25
	,ad_space
	,adc_form_size_type
	,adc_form_detail
	,ade_image_hash
	,ade_title
	,item_num
	,ctr_flag
	,all_support
	,pre_support
	,confidence
	,seq_support
	,lift
from comb_advplatform_actopt_corrules 
where ctr_flag in ('ctr_h','ctr_l') and lift>2.5;

call delRddRule;

update comb_advplatform_actopt_corrules_filter t1
inner join (select image,min(image_url) as image_url from advplatform_adcreatives_elements where dt='2018-09-09' group by image) t2
			on locate(t1.ade_image_hash,t2.image)>0 
set t1.ade_image_url=t2.image_url;

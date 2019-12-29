

CREATE TABLE `comb_advplatform_life_cycle_reports_stat` (
  `ad_id` bigint(20) NOT NULL COMMENT '广告 id',
  `adgroup_id` bigint(20) NOT NULL COMMENT '广告组 id',
  `campaign_id` bigint(20) NOT NULL COMMENT '广告计划id',
  `account_id` bigint(20) NOT NULL COMMENT '账户id',
  `adcreative_template_id` int(11) DEFAULT NULL COMMENT '创意规格id',
  `site_set` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '投放站点集合',
  `product_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标的物类型',
  `adc_template_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板名称',
  `adc_template_size` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创意模板大小',
  `system_industry_id` bigint(20) DEFAULT NULL COMMENT '行业id',
  `first_industry_id` bigint(20) DEFAULT NULL COMMENT '一级行业id',
  `first_industry_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '一级行业名称',
  `second_industry_id` bigint(20) DEFAULT NULL COMMENT '二级行业id',
  `second_industry_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '二级行业名称',
  `ad_configured_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '广告层级客户设置状态',
  `adgroup_configured_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '广告组层级客户设置状态',
  `campaign_configured_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '广告计划层级客户设置状态',
  `impression` bigint(20) NOT NULL COMMENT '曝光量',
  `click` bigint(20) NOT NULL COMMENT '点击量',
  `activation` bigint(20) NOT NULL COMMENT 'APP 激活量，仅在广告主回传对应转化数据后有数据',
  `cost` bigint(20) NOT NULL COMMENT '消耗，单位为分',
  `dt_start` date NOT NULL COMMENT '开始日期',
  `dt_end` date NOT NULL COMMENT '结束日期',
  `life_day` tinyint(4) DEFAULT NULL COMMENT '广告生命周期天数',
  `life_flag` tinyint(4) DEFAULT NULL COMMENT '计算广告生命周期所用，0为仅在前七天出现过的广告。',
  KEY `idx0` (`ad_id`),
  KEY `idx1` (`first_industry_id`) USING BTREE,
  KEY `idx2` (`site_set`) USING BTREE,
  KEY `idx3` (`adcreative_template_id`,`site_set`,`product_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


insert into comb_advplatform_life_cycle_reports_stat
select 
	ad_id
	,adgroup_id
	,campaign_id
	,account_id
	,adcreative_template_id
	,site_set
	,product_type
	,adc_template_name
	,adc_template_size
	,system_industry_id
	,first_industry_id
	,first_industry_name
	,second_industry_id
	,second_industry_name
	,max(ad_configured_status)
	,max(adgroup_configured_status)
	,max(campaign_configured_status)
	,sum(impression)
	,sum(click)
	,sum(activation)
	,sum(cost)
	,min(dt)
	,max(dt)
	,datediff(max(dt),min(dt))
	,case when min(dt) <'2018-10-07' or max(dt)>'2018-12-24' then 1 else 0 end
from comb_advplatform_life_cycle_reports
group by 
	ad_id
	,adgroup_id
	,campaign_id
	,account_id
	,adcreative_template_id
	,site_set
	,product_type
	,adc_template_name
	,adc_template_size
	,system_industry_id
	,first_industry_id
	,first_industry_name
	,second_industry_id
	,second_industry_name
	

select t2.first_industry_name,life_day+1,count(distinct ad_id),sum(impression),sum(click),sum(activation),sum(cost)/100
from comb_advplatform_life_cycle_reports_stat t1
INNER JOIN advplatform_industry_classification_proc t2 on t1.system_industry_id=t2.industry_id
where life_flag=0 
GROUP BY t2.first_industry_name,life_day


select greatest(ad_configured_status,adgroup_configured_status,campaign_configured_status)
			,life_day+1,count(distinct ad_id),sum(impression),sum(click),sum(activation),sum(cost)/100
from comb_advplatform_life_cycle_reports_stat t1
where life_flag=0 
GROUP BY greatest(ad_configured_status,adgroup_configured_status,campaign_configured_status),life_day 


select case when locate('图',adc_form) then '图'
						when locate('视频',adc_form) then '视频'
						when locate('文字链',adc_form) then '文字链'
						when locate('动',adc_form) then '动' end
	,life_day+1,count(distinct ad_id),sum(impression),sum(click),sum(activation),sum(cost)/100
from comb_advplatform_life_cycle_reports_stat t1
INNER JOIN (select adc_template_id
						,max(ad_space) as ad_space
						,max(adc_form) as adc_form
						,max(adc_form_size) as adc_form_size
						,max(adc_description) as adc_description
					from advplatform_adcreative_template
					group by adc_template_id) t2 on t1.adcreative_template_id=t2.adc_template_id
where life_flag=0 
GROUP BY case when locate('图',adc_form) then '图'
						when locate('视频',adc_form) then '视频'
						when locate('文字链',adc_form) then '文字链'
						when locate('动',adc_form) then '动' end
		,life_day
		

		
		
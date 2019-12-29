

CREATE TABLE `comb_advplatform_tag_reports_merge_t1e1_comp` (
  `dt` date NOT NULL,
  `impression` bigint(20) DEFAULT NULL,
  `click` int(4) DEFAULT NULL,
  `clk_ratio` decimal(10,8) DEFAULT NULL COMMENT '点击率：点击量和曝光量比值',
  `ctr_ratio_bin` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` bigint(20) DEFAULT NULL,
  `download` int(4) DEFAULT NULL,
  `conversion` int(4) DEFAULT NULL,
  `activation` int(4) DEFAULT NULL,
  `atv_ratio` decimal(10,8) DEFAULT NULL COMMENT '激活率：激活量和曝光量比值',
  `atv_ratio_bin` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '激活率级别标识，大于激活率1.5倍均值',
  `gender` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` varchar(25) DEFAULT NULL,
  `register` int(4) DEFAULT NULL,
  `reservation` int(4) DEFAULT NULL,
  `level` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acct_agency_id` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adgroup_id` int(4) DEFAULT NULL,
  `adg_campaign_id` int(4) DEFAULT NULL,
  `adg_account_id` int(4) DEFAULT NULL,
  `adg_optimization_goal` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '广告优化目标类型',
  `adg_billing_event` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '计费类型',
  `adg_bid_amount` int(4) DEFAULT NULL COMMENT '广告出价，单位为分',
  `adg_site_set` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '投放站点集合',
  `adg_product_type` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标的物类型',
  `adg_product_refs_id` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标的物 id',
  `adv_corporation_name` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `adv_system_industry_id` int(4) DEFAULT NULL COMMENT '行业 id，详见 [行业分类]',
  `ind_first_industry_id` int(4) DEFAULT NULL COMMENT '一级行业id',
  `ind_first_industry_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '一级行业名称',
  KEY `idx1` (`dt`,`acct_agency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


insert into comb_advplatform_tag_reports_merge_t1e1_comp
(
	dt
	,impression
	,click
	,clk_ratio
	,ctr_ratio_bin
	,cost
	,download
	,conversion
	,activation
	,atv_ratio
	,atv_ratio_bin
	,gender
	,age
	,region_id
	,register
	,reservation
	,level
	,type
	,acct_agency_id
	,adgroup_id
	,adg_campaign_id
	,adg_account_id
	,adg_optimization_goal
	,adg_billing_event
	,adg_bid_amount
	,adg_site_set
	,adg_product_type
	,adg_product_refs_id
	,adv_corporation_name
	,adv_system_industry_id
	,ind_first_industry_id
	,ind_first_industry_name
)

select 
	dt
	,impression
	,click
	,clk_ratio
	,ctr_ratio_bin
	,cost
	,download
	,conversion
	,activation
	,atv_ratio
	,atv_ratio_bin
	,gender
	,age
	,region_id
	,register
	,reservation
	,level
	,type
	,acct_agency_id
	,adgroup_id
	,adg_campaign_id
	,adg_account_id
	,adg_optimization_goal
	,adg_billing_event
	,adg_bid_amount
	,adg_site_set
	,adg_product_type
	,adg_product_refs_id
	,adv_corporation_name
	,adv_system_industry_id
	,ind_first_industry_id
	,ind_first_industry_name

from comb_advplatform_tag_reports_merge
where impression>=5000 and not (type='age' and age=0) and not (type='region' and region_id=0);

create index idx2 on comb_advplatform_tag_reports_merge_t1e1_comp(type);

update comb_advplatform_tag_reports_merge_t1e1_comp t1
set t1.region_id=''
where t1.region_id=-1
;

update comb_advplatform_tag_reports_merge_t1e1_comp t1
inner join (select dt,acct_agency_id,max(gender) as gender
						from advplatform_targeting_tag_reports
						where type='gender'
						group by dt,acct_agency_id
						having count(*)=1) t2
	on t2.dt=t1.dt and t2.acct_agency_id=t1.acct_agency_id
set t1.gender=t2.gender
where t1.type in ('age','region')
;

update comb_advplatform_tag_reports_merge_t1e1_comp t1
inner join (select dt,acct_agency_id,max(age) as age
						from advplatform_targeting_tag_reports
						where type='age'
						group by dt,acct_agency_id
						having count(*)=1) t2
	on t2.dt=t1.dt and t2.acct_agency_id=t1.acct_agency_id
set t1.age=t2.age
where t1.type in ('gender','region')
;

update comb_advplatform_tag_reports_merge_t1e1_comp t1
inner join (select dt,acct_agency_id,max(region_id) as region_id
						from advplatform_targeting_tag_reports
						where type='region'
						group by dt,acct_agency_id
						having count(*)=1) t2
	on t2.dt=t1.dt and t2.acct_agency_id=t1.acct_agency_id
set t1.region_id=t2.region_id
where t1.type in ('age','gender')
;

update comb_advplatform_tag_reports_merge_t1e1_comp set adg_site_set=replace(replace(adg_site_set,'["',''),'"]','');


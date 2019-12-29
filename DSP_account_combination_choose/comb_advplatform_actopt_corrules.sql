
CREATE TABLE `comb_advplatform_actopt_freqitems` (
  `dt` datetime NOT NULL,
  `day_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_first_industry_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'һ����ҵ���ƣ�����Ż����Ҫonehot',
  `adg_site_set` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ͷ��վ�㼯�ϣ�����Ż����Ҫonehot',
  `adg_product_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��������ͣ�����Ż����Ҫonehot',
  `tag_age_1_17` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_18_23` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_24_30` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_31_40` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_41_50` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_51_65` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_66_127` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `gender_FEMALE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż�����򱨱���ͳ�Ƴ�������ʵ�Ա��ع�������',
  `gender_MALE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż�����򱨱���ͳ�Ƴ�������ʵ�Ա��ع�������',
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
  `ad_space` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '���λ������Ż����Ҫonehot��adc_drp*�������ϡ�裬�ݲ����ǣ�',
  `adc_form_size_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adc_form_detail` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '�ز����ͣ�����Ż����Ҫonehot',
  `ade_image_hash` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ͼƬhash������Ϊ����Ż�����������Ż�������������֤����ȷ���Ƿ��Ż�����Ŀɿ��ԣ�',
  `ade_title` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����İ�������Ϊ����Ż�����������Ż�������������֤����ȷ���Ƿ��Ż�����Ŀɿ��ԣ�',
  `item_num` tinyint(1) DEFAULT NULL COMMENT '����',
  `ctr_flag` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '�����ʼ���',
  `support` decimal(10,8) NOT NULL COMMENT '֧�ֶ�'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `comb_advplatform_actopt_corrules` (
  `dt` datetime NOT NULL,
  `day_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ind_first_industry_name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'һ����ҵ���ƣ�����Ż����Ҫonehot',
  `adg_site_set` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ͷ��վ�㼯�ϣ�����Ż����Ҫonehot',
  `adg_product_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '��������ͣ�����Ż����Ҫonehot',
  `tag_age_1_17` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_18_23` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_24_30` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_31_40` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_41_50` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_51_65` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `tag_age_66_127` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż����ѭ���ƽ̨������ɢ���飬���򱨱���ͳ�Ƴ�������ʵ�����ع�������',
  `gender_FEMALE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż�����򱨱���ͳ�Ƴ�������ʵ�Ա��ع�������',
  `gender_MALE` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����Ż�����򱨱���ͳ�Ƴ�������ʵ�Ա��ع�������',
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
  `ad_space` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '���λ������Ż����Ҫonehot��adc_drp*�������ϡ�裬�ݲ����ǣ�',
  `adc_form_size_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adc_form_detail` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '�ز����ͣ�����Ż����Ҫonehot',
  `ade_image_hash` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ͼƬhash������Ϊ����Ż�����������Ż�������������֤����ȷ���Ƿ��Ż�����Ŀɿ��ԣ�',
  `ade_title` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '����İ�������Ϊ����Ż�����������Ż�������������֤����ȷ���Ƿ��Ż�����Ŀɿ��ԣ�',
  `item_num` tinyint(1) DEFAULT NULL COMMENT '����',
  `ctr_flag` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '�����ʼ���',
  `all_support` decimal(10,8) NOT NULL COMMENT 'ȫ���֧�ֶ�',
  `pre_support` decimal(10,8) NOT NULL COMMENT 'ǰ���֧�ֶ�',
  `confidence` decimal(10,8) NOT NULL COMMENT '���Ŷ�',
  `seq_support` decimal(10,8) NOT NULL COMMENT '�Ƶ��֧�ֶ�',
  `lift` decimal(20,8) DEFAULT NULL COMMENT '����'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

create index idx1 on comb_advplatform_actopt_freqitems(dt, ctr_flag);
create index idx2 on comb_advplatform_actopt_freqitems
(dt,day_type
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
	,gender_FEMALE
	,gender_MALE
	,ad_space
	,adc_form_size_type)

select * from comb_advplatform_actopt_freqitems where item_num=0 and dt='2018-08-30'
ctr_h	0.17878502
ctr_l	0.23456496
ctr_m	0.58665002

truncate table comb_advplatform_actopt_corrules;
insert into comb_advplatform_actopt_corrules
(
	dt,day_type
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
	t1.dt
	,t1.day_type
	,t1.ind_first_industry_name
	,t1.adg_site_set
	,t1.adg_product_type
	,t1.tag_age_1_17
	,t1.tag_age_18_23
	,t1.tag_age_24_30
	,t1.tag_age_31_40
	,t1.tag_age_41_50
	,t1.tag_age_51_65
	,t1.tag_age_66_127
	,t1.gender_MALE
	,t1.gender_FEMALE
	,case when t1.region_110000='reg110000' then '����' end
	,case when t1.region_120000='reg120000' then '���' end
	,case when t1.region_130000='reg130000' then '�ӱ�' end
	,case when t1.region_140000='reg140000' then 'ɽ��' end
	,case when t1.region_150000='reg150000' then '����' end
	,case when t1.region_210000='reg210000' then '����' end
	,case when t1.region_220000='reg220000' then '����' end
	,case when t1.region_230000='reg230000' then '����' end
	,case when t1.region_310000='reg310000' then '�Ϻ�' end
	,case when t1.region_320000='reg320000' then '����' end
	,case when t1.region_330000='reg330000' then '�㽭' end
	,case when t1.region_340000='reg340000' then '����' end
	,case when t1.region_350000='reg350000' then '����' end
	,case when t1.region_360000='reg360000' then '����' end
	,case when t1.region_370000='reg370000' then 'ɽ��' end
	,case when t1.region_410000='reg410000' then '����' end
	,case when t1.region_420000='reg420000' then '����' end
	,case when t1.region_430000='reg430000' then '����' end
	,case when t1.region_440000='reg440000' then '�㶫' end
	,case when t1.region_450000='reg450000' then '����' end
	,case when t1.region_460000='reg460000' then '����' end
	,case when t1.region_500000='reg500000' then '����' end
	,case when t1.region_510000='reg510000' then '�Ĵ�' end
	,case when t1.region_520000='reg520000' then '����' end
	,case when t1.region_530000='reg530000' then '����' end
	,case when t1.region_540000='reg540000' then '����' end
	,case when t1.region_610000='reg610000' then '����' end
	,case when t1.region_620000='reg620000' then '����' end
	,case when t1.region_630000='reg630000' then '�ຣ' end
	,case when t1.region_640000='reg640000' then '����' end
	,case when t1.region_650000='reg650000' then '�½�' end
	,case when t1.region_710000='reg710000' then '̨��' end
	,case when t1.region_810000='reg810000' then '���' end
	,case when t1.region_820000='reg820000' then '����' end
	,case when t1.buss_1='bus1' then '����' end
	,case when t1.buss_2='bus2' then '����' end
	,case when t1.buss_3='bus3' then '����' end
	,case when t1.buss_4='bus4' then '����' end
	,case when t1.buss_5='bus5' then '����' end
	,case when t1.buss_6='bus6' then '�Ҿ�' end
	,case when t1.buss_7='bus7' then '����Ьñ���' end
	,case when t1.buss_8='bus8' then '������ʳ' end
	,case when t1.buss_9='bus9' then '�������' end
	,case when t1.buss_10='bus10' then '�������' end
	,case when t1.buss_11='bus11' then '����' end
	,case when t1.buss_12='bus12' then '������/���Ӳ�Ʒ' end
	,case when t1.buss_13='bus13' then '�����˶�' end
	,case when t1.buss_14='bus14' then 'ҽ�ƽ���' end
	,case when t1.buss_15='bus15' then '�в�����' end
	,case when t1.buss_16='bus16' then '��Ϸ' end
	,case when t1.buss_21='bus21' then '����' end
	,case when t1.buss_25='bus25' then '��������' end
	,t1.ad_space
	,t1.adc_form_size_type
	,t1.adc_form_detail
	,t1.ade_image_hash
	,t1.ade_title
	,t1.item_num
	,t1.ctr_flag
	,t1.support
	,t2.support
	,t1.support/t2.support
	,case when t1.ctr_flag='ctr_h' then 0.17878502
				when t1.ctr_flag='ctr_l' then 0.23456496
				when t1.ctr_flag='ctr_m' then 0.58665002
	 end
	,t1.support/t2.support/(case when t1.ctr_flag='ctr_h' then 0.17878502
																when t1.ctr_flag='ctr_l' then 0.23456496
																when t1.ctr_flag='ctr_m' then 0.58665002
													 end)
from comb_advplatform_actopt_freqitems t1
inner join comb_advplatform_actopt_freqitems t2 
				on t1.dt = t2.dt 
					and t1.day_type	= t2.day_type
					and t1.ind_first_industry_name	= t2.ind_first_industry_name
					and t1.adg_site_set            = t2.adg_site_set           
					and t1.adg_product_type        = t2.adg_product_type       
					and t1.tag_age_1_17            = t2.tag_age_1_17           
					and t1.tag_age_18_23           = t2.tag_age_18_23          
					and t1.tag_age_24_30           = t2.tag_age_24_30          
					and t1.tag_age_31_40           = t2.tag_age_31_40          
					and t1.tag_age_41_50           = t2.tag_age_41_50          
					and t1.tag_age_51_65           = t2.tag_age_51_65          
					and t1.tag_age_66_127          = t2.tag_age_66_127         
					and t1.gender_FEMALE           = t2.gender_FEMALE          
					and t1.gender_MALE             = t2.gender_MALE            
					and t1.region_110000 = t2.region_110000 
					and t1.region_120000 = t2.region_120000 
					and t1.region_130000 = t2.region_130000 
					and t1.region_140000 = t2.region_140000 
					and t1.region_150000 = t2.region_150000 
					and t1.region_210000 = t2.region_210000 
					and t1.region_220000 = t2.region_220000 
					and t1.region_230000 = t2.region_230000 
					and t1.region_310000 = t2.region_310000 
					and t1.region_320000 = t2.region_320000 
					and t1.region_330000 = t2.region_330000 
					and t1.region_340000 = t2.region_340000 
					and t1.region_350000 = t2.region_350000 
					and t1.region_360000 = t2.region_360000 
					and t1.region_370000 = t2.region_370000 
					and t1.region_410000 = t2.region_410000 
					and t1.region_420000 = t2.region_420000 
					and t1.region_430000 = t2.region_430000 
					and t1.region_440000 = t2.region_440000 
					and t1.region_450000 = t2.region_450000 
					and t1.region_460000 = t2.region_460000 
					and t1.region_500000 = t2.region_500000 
					and t1.region_510000 = t2.region_510000 
					and t1.region_520000 = t2.region_520000 
					and t1.region_530000 = t2.region_530000 
					and t1.region_540000 = t2.region_540000 
					and t1.region_610000 = t2.region_610000 
					and t1.region_620000 = t2.region_620000 
					and t1.region_630000 = t2.region_630000 
					and t1.region_640000 = t2.region_640000 
					and t1.region_650000 = t2.region_650000 
					and t1.region_710000 = t2.region_710000 
					and t1.region_810000 = t2.region_810000 
					and t1.region_820000 = t2.region_820000 
					and t1.buss_1       = t2.buss_1       
					and t1.buss_2       = t2.buss_2       
					and t1.buss_3       = t2.buss_3       
					and t1.buss_4       = t2.buss_4       
					and t1.buss_5       = t2.buss_5       
					and t1.buss_6       = t2.buss_6       
					and t1.buss_7       = t2.buss_7       
					and t1.buss_8       = t2.buss_8       
					and t1.buss_9       = t2.buss_9       
					and t1.buss_10       = t2.buss_10       
					and t1.buss_11       = t2.buss_11       
					and t1.buss_12       = t2.buss_12       
					and t1.buss_13       = t2.buss_13       
					and t1.buss_14       = t2.buss_14       
					and t1.buss_15       = t2.buss_15       
					and t1.buss_16       = t2.buss_16       
					and t1.buss_21       = t2.buss_21       
					and t1.buss_25       = t2.buss_25       
					and t1.ad_space                = t2.ad_space               
					and t1.adc_form_size_type      = t2.adc_form_size_type     
					and t1.adc_form_detail         = t2.adc_form_detail        
					and t1.ade_image_hash          = t2.ade_image_hash         
					and t1.ade_title               = t2.ade_title          
					and t1.item_num                = t2.item_num 						              
					and t2.ctr_flag=''
	
where t1.dt='2018-09-09' and t1.ctr_flag in ('ctr_h','ctr_l','ctr_m')


truncate table comb_advplatform_actopt_corrules_filter;
insert into comb_advplatform_actopt_corrules_filter 
select * from comb_advplatform_actopt_corrules 
where ctr_flag in ('ctr_h','ctr_l') and lift>2.5;

call delRddRule;



insert into comb_advplatform_actopt_corrules
(
	dt
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
	t1.dt
	,t1.ind_first_industry_name
	,t1.adg_site_set
	,t1.adg_product_type
	,t1.tag_age_1_17
	,t1.tag_age_18_23
	,t1.tag_age_24_30
	,t1.tag_age_31_40
	,t1.tag_age_41_50
	,t1.tag_age_51_65
	,t1.tag_age_66_127
	,t1.gender_MALE
	,t1.gender_FEMALE
	,case when t1.region_110000='reg110000' then '����' end
	,case when t1.region_120000='reg120000' then '���' end
	,case when t1.region_130000='reg130000' then '�ӱ�' end
	,case when t1.region_140000='reg140000' then 'ɽ��' end
	,case when t1.region_150000='reg150000' then '����' end
	,case when t1.region_210000='reg210000' then '����' end
	,case when t1.region_220000='reg220000' then '����' end
	,case when t1.region_230000='reg230000' then '����' end
	,case when t1.region_310000='reg310000' then '�Ϻ�' end
	,case when t1.region_320000='reg320000' then '����' end
	,case when t1.region_330000='reg330000' then '�㽭' end
	,case when t1.region_340000='reg340000' then '����' end
	,case when t1.region_350000='reg350000' then '����' end
	,case when t1.region_360000='reg360000' then '����' end
	,case when t1.region_370000='reg370000' then 'ɽ��' end
	,case when t1.region_410000='reg410000' then '����' end
	,case when t1.region_420000='reg420000' then '����' end
	,case when t1.region_430000='reg430000' then '����' end
	,case when t1.region_440000='reg440000' then '�㶫' end
	,case when t1.region_450000='reg450000' then '����' end
	,case when t1.region_460000='reg460000' then '����' end
	,case when t1.region_500000='reg500000' then '����' end
	,case when t1.region_510000='reg510000' then '�Ĵ�' end
	,case when t1.region_520000='reg520000' then '����' end
	,case when t1.region_530000='reg530000' then '����' end
	,case when t1.region_540000='reg540000' then '����' end
	,case when t1.region_610000='reg610000' then '����' end
	,case when t1.region_620000='reg620000' then '����' end
	,case when t1.region_630000='reg630000' then '�ຣ' end
	,case when t1.region_640000='reg640000' then '����' end
	,case when t1.region_650000='reg650000' then '�½�' end
	,case when t1.region_710000='reg710000' then '̨��' end
	,case when t1.region_810000='reg810000' then '���' end
	,case when t1.region_820000='reg820000' then '����' end
	,t1.ad_space
	,t1.adc_form_size_type
	,t1.adc_form_detail
	,t1.ade_image_hash
	,t1.ade_title
	,t1.item_num
	,t1.ctr_flag
	,t1.support
	,t2.support
	,t1.support/t2.support
	,case when t1.ctr_flag='ctr_h' then 0.17750164
				when t1.ctr_flag='ctr_l' then 0.17171531
	 end
	,t1.support/t2.support/(case when t1.ctr_flag='ctr_h' then 0.17750164
																when t1.ctr_flag='ctr_l' then 0.17171531
													 end)
from comb_advplatform_actopt_freqitems_old t1
inner join (select * from comb_advplatform_actopt_freqitems_old where dt='2018-11-07' and ctr_flag='') t2 
				on t1.dt = t2.dt 
					and t1.ind_first_industry_name	= t2.ind_first_industry_name
					and t1.adg_site_set            = t2.adg_site_set           
					and t1.adg_product_type        = t2.adg_product_type       
					and t1.tag_age_1_17            = t2.tag_age_1_17           
					and t1.tag_age_18_23           = t2.tag_age_18_23          
					and t1.tag_age_24_30           = t2.tag_age_24_30          
					and t1.tag_age_31_40           = t2.tag_age_31_40          
					and t1.tag_age_41_50           = t2.tag_age_41_50          
					and t1.tag_age_51_65           = t2.tag_age_51_65          
					and t1.tag_age_66_127          = t2.tag_age_66_127         
					and t1.gender_FEMALE           = t2.gender_FEMALE          
					and t1.gender_MALE             = t2.gender_MALE            
					and t1.region_110000 = t2.region_110000 
					and t1.region_120000 = t2.region_120000 
					and t1.region_130000 = t2.region_130000 
					and t1.region_140000 = t2.region_140000 
					and t1.region_150000 = t2.region_150000 
					and t1.region_210000 = t2.region_210000 
					and t1.region_220000 = t2.region_220000 
					and t1.region_230000 = t2.region_230000 
					and t1.region_310000 = t2.region_310000 
					and t1.region_320000 = t2.region_320000 
					and t1.region_330000 = t2.region_330000 
					and t1.region_340000 = t2.region_340000 
					and t1.region_350000 = t2.region_350000 
					and t1.region_360000 = t2.region_360000 
					and t1.region_370000 = t2.region_370000 
					and t1.region_410000 = t2.region_410000 
					and t1.region_420000 = t2.region_420000 
					and t1.region_430000 = t2.region_430000 
					and t1.region_440000 = t2.region_440000 
					and t1.region_450000 = t2.region_450000 
					and t1.region_460000 = t2.region_460000 
					and t1.region_500000 = t2.region_500000 
					and t1.region_510000 = t2.region_510000 
					and t1.region_520000 = t2.region_520000 
					and t1.region_530000 = t2.region_530000 
					and t1.region_540000 = t2.region_540000 
					and t1.region_610000 = t2.region_610000 
					and t1.region_620000 = t2.region_620000 
					and t1.region_630000 = t2.region_630000 
					and t1.region_640000 = t2.region_640000 
					and t1.region_650000 = t2.region_650000 
					and t1.region_710000 = t2.region_710000 
					and t1.region_810000 = t2.region_810000 
					and t1.region_820000 = t2.region_820000 
					and t1.ad_space                = t2.ad_space               
					and t1.adc_form_size_type      = t2.adc_form_size_type     
					and t1.adc_form_detail         = t2.adc_form_detail        
					and t1.ade_image_hash          = t2.ade_image_hash         
					and t1.ade_title               = t2.ade_title          
					and t1.item_num                = t2.item_num 
	where t1.dt='2018-11-07' and t1.ctr_flag in ('ctr_h','ctr_l')
	
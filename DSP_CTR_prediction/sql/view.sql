drop view vl_ctr_predict_t2_merge_mvf_train;
drop view vl_ctr_predict_t2_merge_mvf_test;
  
  
  
  

CREATE VIEW vl_ctr_predict_t2_merge_mvf_train AS
  SELECT
	  clk_flag
		,token
		,account_id
		,advertiser_id
		,campaign_id
		,creative_id
		,channel_id
		,case when locate('ios', device_type)>0 then 1
					when locate('android', device_type)>0 then 2
				else 3 end
			as device_type
#		,media
		,case when ad_space='362' then 1
					when ad_space='1002' then 2
          when ad_space='1010' then 3
          when ad_space='1018' then 4
          when ad_space='1026' then 5
          when ad_space='1034' then 6
          when ad_space='1042' then 7
          when ad_space='1050' then 8
          when ad_space='1058' then 9
          when ad_space='1066' then 10
          when ad_space='1074' then 11
          when ad_space='1082' then 12
          when ad_space='1090' then 13
          when ad_space='1098' then 14
          when ad_space='1106' then 15
          when ad_space='1114' then 16
          when ad_space='1122' then 17
          when ad_space='1130' then 18
          when ad_space='200048' then 19
          when ad_space='10060001' then 20
          when ad_space='10060003' then 21
          when ad_space='10060004' then 22
          when ad_space='10070001' then 23
          when ad_space='10070002' then 24
          when ad_space='10070004' then 25
				else -1 end
			as ad_space
		,case when locate('1130', adunit)>0 then 1
					when locate('1122', adunit)>0 then 2
					when locate('1002', adunit)>0 then 3
					when locate('1010', adunit)>0 then 4
					when locate('1042', adunit)>0 then 5
				else -1 end
			as adunit
		,ad_type
		,case when locate('150*130', ad_size)>0 then 1
					when locate('160*160', ad_size)>0 then 2
					when locate('190*145', ad_size)>0 then 3
					when locate('240*240', ad_size)>0 then 4
					when locate('45*45', ad_size)>0 then 5
					when locate('50*50', ad_size)>0 then 6
					when locate('640*120', ad_size)>0 then 7
					when locate('640*360', ad_size)>0 then 8
					when locate('710*236', ad_size)>0 then 9
					when locate('720*168', ad_size)>0 then 10
					when locate('720*360', ad_size)>0 then 111
				else -1 end
			as ad_size
		,in_cost
		,out_cost/10
		,ad_cost
		,tweek
		,case when thour>=0 and thour<6 then 1
					when thour>=6 and thour<9 then 2
					when thour>=9 and thour<12 then 3
					when thour>=12 and thour<14 then 4
					when thour>=14 and thour<18 then 5
					when thour>=18 and thour<24 then 6
				else -1 end
			as thunit
		,ad_servicerate
		,ad_priority
		,ad_credit
		,cp_status
		,cp_flag
		,cp_is_status
		,cp_budget_type
		,cp_budget_num
		,cp_frequency_type
		,cp_imp_limit
		,cp_click_limit
		,case when locate('wifi', cp_orient_network)>0 then 1
					when locate('4G', cp_orient_network)>0 then 2
					when locate('3G', cp_orient_network)>0 then 3
					when locate('other', cp_orient_network)>0 then 4
				else -1 end
			as cp_orient_network
		,case when locate('Android', cp_orient_system)>0 then 1
					when locate('iOS', cp_orient_system)>0 then 2
				else -1 end
			as cp_orient_system
#		,cp_orient_adslot
		,case when locate('jpeg', ct_file_type)>0 then 1
					when locate('png', ct_file_type)>0 then 2
				else -1 end
			as ct_file_type
		,ct_width
		,ct_height
		,ct_type
		,ct_link_type
		,ct_size
		,ct_duration
		,case when ct_template_id in ('11','12','13','14','17','18','7','8','9') then ct_template_id
				else -1 end
			as ct_template_id
		,ct_status
		,ct_flag
		,ch_charging_type
		,ch_media_no
		,ch_media_category
		,ch_media_category_sed
#		,ch_sources_type
  FROM ctr_predict_t2_merge_mvf
  where tday>=15;


CREATE VIEW vl_ctr_predict_t2_merge_mvf_test AS
  SELECT
	  clk_flag
		,token
		,account_id
		,advertiser_id
		,campaign_id
		,creative_id
		,channel_id
		,case when locate('ios', device_type)>0 then 1
					when locate('android', device_type)>0 then 2
				else 3 end
			as device_type
#		,media
		,case when ad_space='362' then 1
					when ad_space='1002' then 2
          when ad_space='1010' then 3
          when ad_space='1018' then 4
          when ad_space='1026' then 5
          when ad_space='1034' then 6
          when ad_space='1042' then 7
          when ad_space='1050' then 8
          when ad_space='1058' then 9
          when ad_space='1066' then 10
          when ad_space='1074' then 11
          when ad_space='1082' then 12
          when ad_space='1090' then 13
          when ad_space='1098' then 14
          when ad_space='1106' then 15
          when ad_space='1114' then 16
          when ad_space='1122' then 17
          when ad_space='1130' then 18
          when ad_space='200048' then 19
          when ad_space='10060001' then 20
          when ad_space='10060003' then 21
          when ad_space='10060004' then 22
          when ad_space='10070001' then 23
          when ad_space='10070002' then 24
          when ad_space='10070004' then 25
				else -1 end
			as ad_space
		,case when locate('1130', adunit)>0 then 1
					when locate('1122', adunit)>0 then 2
					when locate('1002', adunit)>0 then 3
					when locate('1010', adunit)>0 then 4
					when locate('1042', adunit)>0 then 5
				else -1 end
			as adunit
		,ad_type
		,case when locate('150*130', ad_size)>0 then 1
					when locate('160*160', ad_size)>0 then 2
					when locate('190*145', ad_size)>0 then 3
					when locate('240*240', ad_size)>0 then 4
					when locate('45*45', ad_size)>0 then 5
					when locate('50*50', ad_size)>0 then 6
					when locate('640*120', ad_size)>0 then 7
					when locate('640*360', ad_size)>0 then 8
					when locate('710*236', ad_size)>0 then 9
					when locate('720*168', ad_size)>0 then 10
					when locate('720*360', ad_size)>0 then 111
				else -1 end
			as ad_size
		,in_cost
		,out_cost/10
		,ad_cost
		,tweek
		,case when thour>=0 and thour<6 then 1
					when thour>=6 and thour<9 then 2
					when thour>=9 and thour<12 then 3
					when thour>=12 and thour<14 then 4
					when thour>=14 and thour<18 then 5
					when thour>=18 and thour<24 then 6
				else -1 end
			as thunit
		,ad_servicerate
		,ad_priority
		,ad_credit
		,cp_status
		,cp_flag
		,cp_is_status
		,cp_budget_type
		,cp_budget_num
		,cp_frequency_type
		,cp_imp_limit
		,cp_click_limit
		,case when locate('wifi', cp_orient_network)>0 then 1
					when locate('4G', cp_orient_network)>0 then 2
					when locate('3G', cp_orient_network)>0 then 3
					when locate('other', cp_orient_network)>0 then 4
				else -1 end
			as cp_orient_network
		,case when locate('Android', cp_orient_system)>0 then 1
					when locate('iOS', cp_orient_system)>0 then 2
				else -1 end
			as cp_orient_system
#		,cp_orient_adslot
		,case when locate('jpeg', ct_file_type)>0 then 1
					when locate('png', ct_file_type)>0 then 2
				else -1 end
			as ct_file_type
		,ct_width
		,ct_height
		,ct_type
		,ct_link_type
		,ct_size
		,ct_duration
		,case when ct_template_id in ('11','12','13','14','17','18','7','8','9') then ct_template_id
				else -1 end
			as ct_template_id
		,ct_status
		,ct_flag
		,ch_charging_type
		,ch_media_no
		,ch_media_category
		,ch_media_category_sed
#		,ch_sources_type
  FROM ctr_predict_t2_merge_mvf
  where not tday>=15;


drop view vl_ctr_predict_t2e1_ohmore_train;
drop view vl_ctr_predict_t2e1_ohmore_test;
CREATE VIEW vl_ctr_predict_t2e1_ohmore_train AS
  SELECT
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
 		,case when locate('ios', device_type)>0 then 1
					when locate('android', device_type)>0 then 2
				else 3 end
			as device_type
#		,media
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
#    ,device_id            
    ,in_cost              
    ,out_cost             
    ,ad_cost          
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
FROM ctr_predict_t2e1_ohmore
  where channel_id_oh5=1 and tday >= 15;



CREATE VIEW vl_ctr_predict_t2e1_ohmore_test AS
  SELECT
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
 		,case when locate('ios', device_type)>0 then 1
					when locate('android', device_type)>0 then 2
				else 3 end
			as device_type
#		,media
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
#    ,device_id            
    ,in_cost              
    ,out_cost             
    ,ad_cost          
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
FROM ctr_predict_t2e1_ohmore
  where channel_id_oh5=1 and not tday >= 15;
  

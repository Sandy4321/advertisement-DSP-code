DELIMITER $$  
DROP PROCEDURE IF EXISTS base.delRddRule;

create PROCEDURE base.delRddRule()
BEGIN
		DECLARE i int;
		DECLARE v_items_h int;
		DECLARE v_items_l int;
		
		DECLARE cur_items_h CURSOR FOR select max(item_num) from comb_advplatform_actopt_corrules_filter where ctr_flag='ctr_h';    
		DECLARE cur_items_l CURSOR FOR select max(item_num) from comb_advplatform_actopt_corrules_filter where ctr_flag='ctr_l';    
		
		OPEN cur_items_h;
		FETCH NEXT from cur_items_h INTO v_items_h;
		CLOSE cur_items_h;
		
		OPEN cur_items_l;
		FETCH NEXT from cur_items_l INTO v_items_l;
		CLOSE cur_items_l;

		set i = 0;
    WHILE i<v_items_h DO
				call base.delRddRule_h(i);
				set i=i+1;
    END WHILE;

		set i = 0;
    WHILE i<v_items_l DO
				call base.delRddRule_l(i);
				set i=i+1;
    END WHILE;
    
END$$

DELIMITER;
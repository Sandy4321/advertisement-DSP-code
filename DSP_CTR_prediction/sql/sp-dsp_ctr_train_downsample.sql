DELIMITER $$  
DROP PROCEDURE IF EXISTS dspbase.sp_dsp_ctr_train_downsample;

create PROCEDURE dspbase.sp_dsp_ctr_train_downsample()
BEGIN
		DECLARE v_clk_num int;
		DECLARE v_clk_day char(10);
		
    DECLARE done INT DEFAULT 0;
		DECLARE cur_clk CURSOR FOR select log_day,count(*) as clk_num from dsp_ctr_train_zzy where log_clk_flag=1;   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;

		OPEN cur_clk;
    REPEAT
			FETCH NEXT from cur_clk INTO v_clk_day, v_clk_num;
      IF not done THEN
				insert into dsp_ctr_train_zzy select * from dsp_ctr_train where log_day=v_clk_day limit 40 order by rand();
      END IF; 
    UNTIL done END REPEAT;  
		CLOSE cur_clk;

END$$

DELIMITER;
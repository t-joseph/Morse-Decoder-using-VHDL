---------------------------------------------------------------------------------------------------------------
-----------------------Filename: uartcontrolfsm.vhd - FSM which controls the uart serial transmission----------
---------------------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------------------------------------------------

ENTITY fsm_uart_control IS
    PORT(rb_i, cp_i, dv_i, co_i: IN STD_LOGIC; 
         dv_o : OUT STD_LOGIC);
END fsm_uart_control;
---------------------------------------------------------------------------------------------------------------
ARCHITECTURE a1 OF fsm_uart_control IS

    TYPE state_name_t IS (S1, S2, S3);
    SIGNAL state_s : state_name_t := S1;
    SIGNAL statef_s : state_name_t := S1;
---------------------------------------------------------------------------------------------------------------
BEGIN
---------------------------------------------------------------------------------------------------------------
  clkd: PROCESS (cp_i,rb_i)
  BEGIN
---------------------------------------------------------------------------------------------------------------  
    
	IF(rb_i = '0') THEN state_s <= S1;
	-- Perform state transition on every clock pulse
    ELSIF (cp_i'EVENT AND cp_i='1')
      THEN state_s<=statef_s;
    END IF;
  END PROCESS clkd;
---------------------------------------------------------------------------------------------------------------
  state_trans : PROCESS (state_s,dv_i,co_i)
  BEGIN 
---------------------------------------------------------------------------------------------------------------
    CASE state_s IS
      WHEN S1 =>
		-- When data valid input from binary tree is high i.e. "dv_i"=1,
			-- Perform next state transition
			-- Otherwise stay in S1 state
		IF (dv_i = '1') THEN statef_s <= S2; 
		ELSE statef_s <= S1;
		END IF;

      WHEN S2 =>
		-- Stay in "S2" state until "co_i" becomes high
			-- "co_i" active high represents completion of 
			-- 12 counts of Mod 12 Counter
			-- When co_i becomes high, perform next state transition	
		IF (co_i='1') THEN statef_s <= S3;
		ELSE statef_s <= S2;
		END IF;

      WHEN S3 => 
	    --Stay in "S3" state until "dv_i" input from binary tree becomes low
			-- Perform next state transition to initial state S1
			-- Otherwise stay in S3 state 
		IF (dv_i='0') THEN statef_s <= S1;
		ELSE statef_s <= S3;
		END IF;	
   END CASE;
   END PROCESS state_trans;
---------------------------------------------------------------------------------------------------------------
  output : PROCESS(state_s)   
    BEGIN	
      CASE state_s IS
        WHEN S1 =>
			-- "dv_o" controls enable pin of Mod12 counter
			--  When dv_o is low, Mod12 counter will be disabled		
			dv_o<='0';
		WHEN S2 => 
			--  When "dv_o" is high, during every baud rate  
			--  Mod12 counter will change states
			dv_o<='1';
		WHEN S3 => 
			--  Once the Mod 12 counter has reached full count, 
			--	"dv_o" should be reset to avoid transmitting same character again
			dv_o<='0';	
    END CASE;
    END PROCESS output;
---------------------------------------------------------------------------------------------------------------
END a1;
---------------------------------------------------------------------------------------------------------------
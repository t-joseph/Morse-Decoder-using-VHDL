-----------------------------------------------------------------------------------------------------------
--------------------morsedetector.vhd - Detection of valid morse input-------------------------------------
-----------------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------------------------------

ENTITY detector IS
PORT (rb_i,gcp_i,mrs_i : IN STD_LOGIC;
      dv_o : OUT STD_LOGIC;
      si_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END detector;
-----------------------------------------------------------------------------------------------------------

ARCHITECTURE a1 OF detector IS

--The states for detection of Morse Code during the 3rd signal pulse
TYPE samples_state_name_t IS (S1, S2, S3, S4, S5); 

--The states for detection of Morse Code Dot, Dash, CharSpace and WordSpace
TYPE decoder_state_name_t IS (A, B, C, D, E, F, G, H, I, J, K, L);

--Declaring the present state and next state for first FSM
SIGNAL samples_curr_state_s : samples_state_name_t := S1;
SIGNAL samples_next_state_s : samples_state_name_t := S1;

--Declaring the present state and next state for second FSM
SIGNAL decoder_curr_state_s : decoder_state_name_t := A;
SIGNAL decoder_next_state_s : decoder_state_name_t := A;

SIGNAL temp_s : STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL samples_enable_s : STD_LOGIC;
SIGNAL decoder_enable_s : STD_LOGIC;
-----------------------------------------------------------------------------------------------------------
BEGIN
-----------------------------------------------------------------------------------------------------------
  clkd: PROCESS (gcp_i,rb_i)
  BEGIN 
    IF(rb_i = '0') THEN samples_curr_state_s <= S1;
	-- For first FSM perform state transition on every clock pulse
    ELSIF (gcp_i'EVENT AND gcp_i='1') THEN samples_curr_state_s<=samples_next_state_s;
    END IF;
     
    IF(rb_i = '0') THEN decoder_curr_state_s <= A;
	-- For second FSM perform state transition when clock pulse and samples_enable signal is high
	ELSIF (gcp_i'EVENT AND gcp_i='1' AND samples_enable_s ='1')
      THEN decoder_curr_state_s<=decoder_next_state_s;
    END IF;
  END PROCESS clkd;
  
--State transistions of first FSM   
-----------------------------------------------------------------------------------------------------------
 samples_state_trans : PROCESS (samples_curr_state_s)
  BEGIN 
-----------------------------------------------------------------------------------------------------------
    samples_next_state_s <= S1;
    CASE samples_curr_state_s IS
      WHEN S1 => samples_next_state_s <= S2;
      WHEN S2 => samples_next_state_s <= S3;
      WHEN S3 => samples_next_state_s <= S4;
      WHEN S4 => samples_next_state_s <= S5;
      WHEN S5 => samples_next_state_s <= S1;
   END CASE;
  END PROCESS samples_state_trans;
  
--State transistions of second FSM  
----------------------------------------------------------------------------------------------------------- 
 decoder_state_trans : PROCESS (decoder_curr_state_s,mrs_i)
  BEGIN
-----------------------------------------------------------------------------------------------------------
    CASE decoder_curr_state_s IS
      WHEN A => IF (mrs_i = '1') THEN decoder_next_state_s <= B;
				ELSE decoder_next_state_s <= A;END IF;  

      WHEN B => IF (mrs_i = '0') THEN decoder_next_state_s <= C;
	            --Assigning detected DOT to a signal which is given as output during output process--
				temp_s <= "01";
                ELSIF (mrs_i = '1') THEN decoder_next_state_s <= D;
				ELSE decoder_next_state_s <= A;END IF;  

      WHEN C => IF (mrs_i = '0') THEN decoder_next_state_s <= F;
                ELSIF (mrs_i = '1') THEN decoder_next_state_s <= B; 
				ELSE decoder_next_state_s <= A;END IF;  

      WHEN D => IF (mrs_i = '0') THEN decoder_next_state_s <= A;
                ELSIF (mrs_i = '1') THEN decoder_next_state_s <= E;
				ELSE decoder_next_state_s <= A;END IF;  

      WHEN E => IF (mrs_i = '0') THEN decoder_next_state_s <= C;
				--Assigning detected DASH to a signal which is given as output during output process--
				temp_s <= "10";	
				ELSIF (mrs_i = '1') THEN decoder_next_state_s <= B;
				ELSE decoder_next_state_s <= A;END IF; 

      WHEN F => IF (mrs_i = '0') THEN decoder_next_state_s <= G;
				ELSIF (mrs_i = '1') THEN decoder_next_state_s <= B;
				ELSE decoder_next_state_s <= A;END IF;  

      WHEN G => IF (mrs_i = '0') THEN decoder_next_state_s <= H;
				--Assigning detected CHARACTER SPACE in a signal which is given as output during output process--
				temp_s <= "00";	
                ELSIF (mrs_i = '1') THEN decoder_next_state_s <= B;
				ELSE decoder_next_state_s <= A;END IF;  

      WHEN H => IF (mrs_i = '0') THEN decoder_next_state_s <= I;
                ELSIF (mrs_i = '1') THEN decoder_next_state_s <= B;
				ELSE decoder_next_state_s <= A;END IF;  

      WHEN I => IF (mrs_i = '0') THEN decoder_next_state_s <= J;
                ELSIF (mrs_i = '1') THEN decoder_next_state_s <= B;
				ELSE decoder_next_state_s <= A;END IF;  

      WHEN J => IF (mrs_i = '0') THEN decoder_next_state_s <= K;
                ELSIF (mrs_i = '1') THEN decoder_next_state_s <= B;
				ELSE decoder_next_state_s <= A;END IF;  

      WHEN K => IF (mrs_i = '0') THEN decoder_next_state_s <= L;
				--Assigning detected WORD SPACE in a signal which is given as output during output process--
				temp_s <= "11";
				ELSIF (mrs_i = '1') THEN decoder_next_state_s <= B;
				ELSE decoder_next_state_s <= A;END IF;  

      WHEN L => IF (mrs_i = '1') THEN decoder_next_state_s <= B;
				ELSE decoder_next_state_s <= A;END IF;  
		
   END CASE;
  END PROCESS decoder_state_trans;
  
--Output process   
-------------------------------------------------------------------------------------------------------  
  samples_output : PROCESS(samples_curr_state_s,decoder_curr_state_s)   
    BEGIN	
-------------------------------------------------------------------------------------------------------	
	-- The output representation after successful detection of Morse Codes
	-- '00'-CharSpace
	-- '01'-Dot
	-- '10'-Dash
	-- '11'-WordSpace
	
	  samples_enable_s <= '0';	
      CASE samples_curr_state_s IS
        WHEN S1 => dv_o <= '0';
        WHEN S2 => dv_o <= '0';
	    WHEN S3 => dv_o <= '0';
				   samples_enable_s <= '1';
        WHEN S4 => IF(decoder_curr_state_s = C OR 
					  decoder_curr_state_s = H OR decoder_curr_state_s = L)
					  THEN dv_o <= '1';
					       si_o<=temp_s;
				   ELSE dv_o <= '0';
		           END IF;
        WHEN S5 => dv_o <= '0';
     END CASE;
  END PROCESS samples_output;
  
------------------------------------------------------------------------------------------------------
END a1;
------------------------------------------------------------------------------------------------------
 

	

    	










--------------------------------------------------------------------------------------------------------
---binarytree.vhd - Traversing morse binary tree using morse detector output to get a valid character---
-------------------------------------------------------------------------------------------------------- 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--------------------------------------------------------------------------------------------------------

ENTITY fsm_morse_tree IS
    PORT(rb_i, gcp_i, dv_i : IN STD_LOGIC; 
         s_i : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 asci_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         dv_o : OUT STD_LOGIC);

END fsm_morse_tree;

-------------------------------------------------------------------------------------------------------

ARCHITECTURE a1 OF fsm_morse_tree IS

--Declaring the states of FSM
    TYPE state_name_t IS (IDLE, T, M, N, E, A, I, O, G, K, D, W, R, U, S, Q, Z, Y, C, X, B, J, L, F, V, H, 
		P, ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, WS, CS, I1, I2, I3);

--Declaring the present state and next state for FSM		
    SIGNAL state_s : state_name_t := IDLE;
    SIGNAL statef_s : state_name_t := IDLE;
--Declaring asci_s to hold asci value of characters temporarliy.	
    SIGNAL asci_s : STD_LOGIC_VECTOR (7 DOWNTO 0);
--Declaring state_enable_s signal to use it as an enable during Char Space and Word Space states	
	SIGNAL state_enable_s : STD_LOGIC;
-------------------------------------------------------------------------------------------------------
BEGIN
-------------------------------------------------------------------------------------------------------

  clkd: PROCESS (gcp_i,rb_i)
  BEGIN
    IF(rb_i = '0') THEN state_s <= IDLE;
  --State Transitions
    ELSIF (gcp_i'EVENT AND gcp_i='1')
	  THEN IF(dv_i = '1')
	    THEN state_s<=statef_s;
	  ELSIF(dv_i = '0' AND state_enable_s = '1')
		THEN  state_s<=statef_s;
	  END IF;		
    END IF;
  END PROCESS clkd;

-------------------------------------------------------------------------------------------------------
  state_trans : PROCESS (state_s,s_i)
  BEGIN 
----
--------------------------------------------------------------------------------------------------- 
--Resetting statef_s to IDLE at next clock pulse to avoid FSM holding previous clock cycle statef_s 
    statef_s <= IDLE;
---------------------------------------------------------------
------------ "s_i" is defined with following state
			--   :'00'-Character Space
			--   :'01'-Dot
			--   :'10'-Dash
			--   :'11'-Word Space
			
    CASE state_s IS
      WHEN IDLE =>IF (s_i="01") THEN statef_s <= E; 
		ELSIF (s_i = "10") THEN statef_s <= T; 
		ELSIF (s_i = "11") THEN statef_s <= WS; 
		ELSE statef_s <= IDLE;
		END IF;

      WHEN T => IF (s_i="01") THEN statef_s <= N; 
		ELSIF (s_i = "10") THEN statef_s <= M;  
		ELSIF(s_i = "00") THEN statef_s <= CS;
		ELSE statef_s <= IDLE;END IF;

      WHEN E => IF (s_i="01") THEN statef_s <= I; 
		ELSIF (s_i = "10") THEN statef_s <= A; 
		ELSIF(s_i = "00") THEN statef_s <= CS;
		ELSE statef_s <= IDLE;END IF;

      WHEN M => IF (s_i="00") THEN statef_s <= CS;
		ELSIF (s_i = "01") THEN statef_s <= G; 
		ELSIF(s_i = "10") THEN statef_s <= O;
		ELSE statef_s <= IDLE;END IF;
  
      WHEN N => IF (s_i="00") THEN statef_s <= CS;
		ELSIF (s_i = "01") THEN statef_s <= D; 
		ELSIF(s_i = "10") THEN statef_s <= K;
		ELSE statef_s <= IDLE;END IF; 

      WHEN A => IF (s_i="00") THEN statef_s <= CS; 
		ELSIF (s_i = "01") THEN statef_s <= R; 
		ELSIF(s_i = "10") THEN statef_s <= W;	
		ELSE statef_s <= IDLE;END IF;

      WHEN I => IF (s_i="00") THEN statef_s <= CS;
		ELSIF (s_i = "01") THEN statef_s <= S; 
		ELSIF(s_i = "10") THEN statef_s <= U; 
		ELSE statef_s <= IDLE;
		END IF;

      WHEN O => IF (s_i="00") THEN statef_s <= CS; 
		ELSIF (s_i = "10") THEN statef_s <= I1;
		ELSIF (s_i = "01") THEN statef_s <= I2;
		ELSE statef_s <= IDLE;END IF;
	
      WHEN I1 => IF (s_i="01") THEN statef_s <= NINE; 
		ELSIF (s_i = "10") THEN statef_s <= ZERO;
		ELSE statef_s <= IDLE;END IF;

      WHEN I2 => IF (s_i="01") THEN statef_s <= EIGHT; 
		ELSE statef_s <= IDLE;END IF;

      WHEN G => IF (s_i="00") THEN statef_s <= CS;
		ELSIF (s_i = "01") THEN statef_s <= Z; 
		ELSIF(s_i = "10") THEN statef_s <= Q; 
		ELSE statef_s <= IDLE;
		END IF;

      WHEN K => IF (s_i="00") THEN statef_s <= CS; 
		ELSIF (s_i = "01") THEN statef_s <= C; 
		ELSIF(s_i = "10") THEN statef_s <= Y;
		ELSE statef_s <= IDLE;END IF;

      WHEN D => IF (s_i="00") THEN statef_s <= CS;
		ELSIF (s_i = "01") THEN statef_s <= B; 
		ELSIF(s_i = "10") THEN statef_s <= X; 
		ELSE statef_s <= IDLE;END IF;

      WHEN W => IF (s_i="00") THEN statef_s <= CS; 
		ELSIF (s_i = "01") THEN statef_s <= P; 
		ELSIF(s_i = "10") THEN statef_s <= J;
		ELSE statef_s <= IDLE;END IF;
     
      WHEN R => IF (s_i="00") THEN statef_s <= CS;
		ELSIF (s_i = "01") THEN statef_s <= L; 	 
		ELSE statef_s <= IDLE;END IF;

      WHEN U => IF (s_i="00") THEN statef_s <= CS; 
		ELSIF (s_i = "01") THEN statef_s <= F; 
		ELSIF(s_i = "10") THEN statef_s <= I3;
		ELSE statef_s <= IDLE;END IF;

      WHEN I3 =>IF (s_i = "10") THEN statef_s <= TWO;
		ELSE statef_s <= IDLE;END IF;	

      WHEN S => IF (s_i="00") THEN statef_s <= CS;
		ELSIF (s_i = "01") THEN statef_s <= H; 
		ELSIF(s_i = "10") THEN statef_s <= V; 
		ELSE statef_s <= IDLE;END IF;

      WHEN Q => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;

      WHEN Z => IF (s_i="00") THEN statef_s <= CS; 
		ELSIF (s_i = "01") THEN statef_s <= SEVEN;
		ELSE statef_s <= IDLE;END IF;

      WHEN Y => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;

      WHEN C => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;

      WHEN X => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;

      WHEN B => IF (s_i="00") THEN statef_s <= CS; 
		ELSIF (s_i = "01") THEN statef_s <= SIX;
		ELSE statef_s <= IDLE;END IF;

      WHEN J => IF (s_i="00") THEN statef_s <= CS; 
		ELSIF(s_i = "10") THEN statef_s <= ONE; 
		ELSE statef_s <= IDLE;END IF;

      WHEN P => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;

      WHEN L => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;

      WHEN F => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;

      WHEN V => IF (s_i="00") THEN statef_s <= CS; 
		ELSIF (s_i = "10") THEN statef_s <= THREE;
		ELSE statef_s <= IDLE;END IF;

      WHEN H => IF (s_i="00") THEN statef_s <= CS; 
		ELSIF (s_i = "01") THEN statef_s <= FIVE;
		ELSIF (s_i = "10") THEN statef_s <= FOUR;
		ELSE statef_s <= IDLE;END IF;

      WHEN ZERO => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;
		   
      WHEN ONE => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;
		  
      WHEN TWO => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;
		  
      WHEN THREE => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;
			
      WHEN FOUR => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;
		   
      WHEN FIVE => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;
		   
      WHEN SIX => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;
		  
      WHEN SEVEN => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;
			
      WHEN EIGHT => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;
			
      WHEN NINE => IF (s_i="00") THEN statef_s <= CS; 
		ELSE statef_s <= IDLE;END IF;
		   
      WHEN WS => statef_s <= IDLE;
      WHEN CS => statef_s <= IDLE;

    END CASE;
  END PROCESS state_trans;

-------------------------------------------------------------------------------------------------------
  output : PROCESS(state_s)   
    BEGIN	
-------------------------------------------------------------------------------------------------------	
	  dv_o<='0';	
	  state_enable_s <= '0';
      CASE state_s IS
        WHEN IDLE => 
				
		WHEN T => 
				asci_s<="01010100"; 
				
		WHEN E => 
				asci_s<="01000101"; 
				
		WHEN M => 
				asci_s<="01001101"; 
				
		WHEN N => 
				asci_s<="01001110"; 
				
		WHEN A => 
				asci_s<="01000001"; 
				
		WHEN I => 
				asci_s<="01001001"; 
				
		WHEN O => 
				asci_s<="01001111"; 
				
		WHEN G => 
				asci_s<="01000111";
				
		WHEN K => 
				asci_s<="01001011"; 
				
		WHEN D => 
				asci_s<="01000100"; 
				
		WHEN W => 
				asci_s<="01010111"; 
					
		WHEN R => 
				asci_s<="01010010"; 
				
		WHEN U => 
				asci_s<="01010101"; 
				
		WHEN S => 
				asci_s<="01010011"; 
				
		WHEN Q => 
				asci_s<="01010001";
				
		WHEN Z => 
				asci_s<="01011010";
				
		WHEN Y => 
				asci_s<="01011001";
				
		WHEN X => 
				asci_s<="01011000"; 
				
		WHEN B => 
				asci_s<="01000010";
				
		WHEN J => 
				asci_s<="01001010"; 
				
		WHEN C => 
				asci_s<="01000011";
				
		WHEN P => 
				asci_s<="01010000";
				
		WHEN L => 
				asci_s<="01001100"; 
				
		WHEN F => 
				asci_s<="01000110"; 
				
		WHEN V => 
				asci_s<="01010110"; 
				
		WHEN H => 
				asci_s<="01001000"; 
				
		WHEN ZERO => 
				asci_s<="00110000"; 
				
		WHEN ONE => 
				asci_s<="00110001"; 
				
		WHEN TWO => 
				asci_s<="00110010";
				
		WHEN THREE => 
				asci_s<="00110011"; 
				
		WHEN FOUR => 
				asci_s<="00110100";
				
		WHEN FIVE =>
				asci_s<="00110101"; 
				
		WHEN SIX =>
				asci_s<="00110110";
				
		WHEN SEVEN => 
				asci_s<="00110111"; 
				
		WHEN EIGHT => 
				asci_s<="00111000";
				
		WHEN NINE => 
				asci_s<="00111001"; 
					
		WHEN I1 => dv_o <= '0';
		WHEN I2 => dv_o <= '0';
		WHEN I3 => dv_o <= '0';
		WHEN WS =>
			--Complete the detection with output dv_o as "1"
				asci_o<="00100000"; 
				dv_o <= '1';
				state_enable_s <= '1';
        WHEN CS =>
			--Complete the detection with output dv_o as "1"
				asci_o<=asci_s; 
				dv_o <= '1';
				state_enable_s <= '1';
      END CASE;
    END PROCESS output;
---------------------------------------------------------------------------------------------------
END a1;
---------------------------------------------------------------------------------------------------




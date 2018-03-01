---------------------------------------------------------------------------------------------------------------
-------------------------------Filename: morsetransmitter.vhd -------------------------------------------------
---------------------------------------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------------------------------------------------

ENTITY final IS
  PORT (rb_i,cp_i,mrs_i: IN STD_LOGIC;
	tx_o : OUT STD_LOGIC);
END final;
---------------------------------------------------------------------------------------------------------------
ARCHITECTURE ar1 OF final IS
---------------------------------------------------------------------------------------------------------------

---"Frequency Divider" divides system clock frequency 50MHz into 50 Hz which acts as Clk for 
---Morse detector and Morse to ASCII Converter Binary tree module
  COMPONENT comp1 PORT (rb_i, cp_i : IN STD_LOGIC; 
                        co_o, gcp_o : OUT STD_LOGIC);
						END COMPONENT;
						
----"Morse Detector" which detects the Morse input as stream of Dots, Dashes,
----Character Spaces and Word Spaces						
  COMPONENT comp2 PORT (rb_i,gcp_i,mrs_i : IN STD_LOGIC; 
						dv_o : OUT STD_LOGIC;
						si_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
						END COMPONENT;

----"Morse Binary Tree to ASCII Converter" generates equivalent ASCII output of the incoming Morse input						
  COMPONENT comp3 PORT (rb_i, gcp_i, dv_i : IN STD_LOGIC; s_i : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
						asci_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
						dv_o : OUT STD_LOGIC); 
						END COMPONENT;
						
----"UART FSM" which controls the state transitions of Mod12 Counter which inturn controls the MUX output
  COMPONENT comp4 PORT (rb_i, cp_i, dv_i, co_i: IN STD_LOGIC; 
						dv_o:OUT STD_LOGIC);
						END COMPONENT;
						
----"Baud Rate Generator" converts system clock frequency to compatible baud rate
----of 9600 bits/seconds (selectable) for serial transmission of data
  COMPONENT comp5 PORT (rb_i,cp_i: IN STD_LOGIC; 
						co_o: OUT STD_LOGIC); 
						END COMPONENT;
						
----"AND Gate" gates the output only when dv_o from UART FSM and co_o from Baud Generator
----both are active high. When both are high, o1 is high=> start of Mod12Counter to
----count up
  COMPONENT comp6 PORT (i1,i2: IN STD_LOGIC; 
						o1: OUT STD_LOGIC);
						END COMPONENT;
  				
				
----"Mod 12 Counter" is responsible for selecting the 12x1 Mux through 12 counts and 
----transmission of data serially at selected Baud Rate. It controls the choice of data
----to be transmitted by Mux way of 4 select bits q3_o(3), q3_o(2), q3_o(1) & q3_o(0) 						
  COMPONENT comp7 PORT (rb_i,cp_i,ena_i: IN STD_LOGIC; 
						q3_o : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
						co_o: OUT STD_LOGIC); 
						END COMPONENT;
						
----"12x1 Multiplexer" converts the ASCII data from MorsetoASCII Binary Tree Converter into serial output
----txd_o at specified Baud Rate based on the choice of select bits q3_o(3 DOWNTO 0)						
  COMPONENT comp8 PORT (data_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
						sel_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
						y_o : OUT STD_LOGIC);
						END COMPONENT;
	

  
  
--------------------------------------------------------------------------------------------------
----Invoke all the modular components from WORK library
  
  FOR ALL : comp1 USE ENTITY WORK.clk50hz (a1);	
  FOR ALL : comp2 USE ENTITY WORK.detector (a1);
  FOR ALL : comp3 USE ENTITY WORK.fsm_morse_tree (a1);
  FOR ALL : comp4 USE ENTITY WORK.fsm_uart_control (a1);
  FOR ALL : comp5 USE ENTITY WORK.baud_gen (a1);
  FOR ALL : comp6 USE ENTITY WORK.wgt_and2 (a1);
  FOR ALL : comp7 USE ENTITY WORK.c12ec (a1);  
  FOR ALL : comp8 USE ENTITY WORK.mux12x1 (a1);
   
--------------------------------------------------------------------------------------------------
SIGNAL ngbaudco_s, ngbtreedvo_s, ngand_s, ngmod12co_s : STD_LOGIC;
SIGNAL nguartfsmdvo_s, ngclkco_s, ngclkq_s, ngdvi_s, ntx_s : STD_LOGIC;

SIGNAL sel_s : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL ngbtreeasc_s : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL ngsi_s : STD_LOGIC_VECTOR (1 DOWNTO 0);
--------------------------------------------------------------------------------------------------
BEGIN 
--------------------------------------------------------------------------------------------------
  --Assign Port Mapping of the invoked components with compatible input-output pins
  
  g01 : comp1 PORT MAP (rb_i, cp_i, ngclkco_s, ngclkq_s);	  
  g02 : comp2 PORT MAP (rb_i, ngclkq_s, mrs_i, ngdvi_s, ngsi_s);
  g03 : comp3 PORT MAP (rb_i, ngclkq_s, ngdvi_s, ngsi_s, ngbtreeasc_s, ngbtreedvo_s);
  g04 : comp4 PORT MAP (rb_i, cp_i, ngbtreedvo_s, ngmod12co_s, nguartfsmdvo_s);  
  g05 : comp5 PORT MAP (rb_i, cp_i, ngbaudco_s);
  g06 : comp6 PORT MAP (nguartfsmdvo_s, ngbaudco_s, ngand_s);	
  g07 : comp7 PORT MAP (rb_i, cp_i, ngand_s, sel_s, ngmod12co_s);
  g08 : comp8 PORT MAP (ngbtreeasc_s, sel_s, ntx_s);
  
--------------------------------------------------------------------------------------------------- 
  tx_o <= ntx_s;
---------------------------------------------------------------------------------------------------  
END ar1;
---------------------------------------------------------------------------------------------------

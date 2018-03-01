------------------------------------------------------------------------------------------------------------
-----------------Filename: morsedecodertest_tb.vhd - Morse Transmitter Testbench for sending a word---------
------------------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
 
 
ENTITY morsedecodertest_tb IS
END morsedecodertest_tb;
 
ARCHITECTURE behavior OF morsedecodertest_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT morsedecodertest
    PORT(
         rb_i : IN  STD_LOGIC;
         cp_i : IN  STD_LOGIC;
         mrs_i : IN  STD_LOGIC;
         tx_o : OUT  STD_LOGIC
        );
    END COMPONENT;
	
    FOR ALL : morsedecodertest USE ENTITY WORK.final (ar1);

   --Inputs
   SIGNAL rb_i : STD_LOGIC := '0';
   SIGNAL cp_i : STD_LOGIC := '0';
   SIGNAL mrs_i : STD_LOGIC := '0';
 
 	--Outputs
   SIGNAL tx_o : STD_LOGIC := '1';
   
   -- Setting period of clock
 
   CONSTANT period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: morsedecodertest PORT MAP (
          rb_i => rb_i,
          cp_i => cp_i,
          mrs_i => mrs_i,
          tx_o => tx_o
        );

   -- Clock PROCESS definitions
   clock_PROCESS :PROCESS
   BEGIN
		cp_i <=  '0';
		WAIT FOR period/2;
		cp_i <=  '1';
		WAIT FOR period/2;
   END PROCESS;
 

   -- Stimulus PROCESS
   stim_proc: PROCESS
   BEGIN		
        
		
     -- hold reset state for 20 ns.
	  
		rb_i <= '0';
		WAIT FOR 20 ns;	
			rb_i <= '1';
			
		--test for by sending 2 words "HI TOM"
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------	
        mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
				
        mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
        mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--H is detected(48h)
		

------------------------------------------------------------------------------------------	
------------------------------------------------------------------------------------------
        mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
        mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		--I is detected(49h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- ws detected
		
		--SPACE is detected(20h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
 	    mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- T detected(54h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
     	
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      --O detected(4Fh)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
    	
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- M detected(4Dh)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
        mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- ws detected
		
		--SPACE is detected(20h)
		
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
      wait;
   END PROCESS;

END behavior;

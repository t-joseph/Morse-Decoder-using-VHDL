
------------------------------------------------------------------------------------------------------------
------------------------Filename: clk50hz_tb.vhd -  Generated 50Hz Clock Test Bench-------------------------
------------------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
 
 
ENTITY clk50hz_tb IS
END clk50hz_tb;
 
ARCHITECTURE behavior OF clk50hz_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
   COMPONENT clk50hz PORT (rb_i, 
						   cp_i : IN STD_LOGIC; 
                           co_o, 
						   gcp_o : OUT STD_LOGIC);
   END COMPONENT;
	
    FOR ALL : clk50hz USE ENTITY WORK.clk50hz (a1);	

   --Inputs
   SIGNAL rb_i : STD_LOGIC := '0';
   SIGNAL cp_i  : STD_LOGIC := '0';
  
 	--Outputs
   SIGNAL co_o : STD_LOGIC := '0';
   SIGNAL gcp_o : STD_LOGIC := '0';
   
    -- Setting period of clock
 
   CONSTANT period : TIME := 20 ns;
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clk50hz PORT MAP (
						  rb_i => rb_i,
						  cp_i => cp_i,
						  co_o => co_o,
						  gcp_o => gcp_o
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
		      
   			
		--test for 50 HZ clock 
--------------------------------------------------------------------------
		
		WAIT FOR 20 ms;
		--First Clock Period

	    WAIT FOR 20 ms;
		--Second Clock Period

	    WAIT FOR 20 ms;
		--Third Clock Period
		
	    WAIT FOR 20 ms;
		--Fourth Clock Period

     END PROCESS;

END behavior;			
			


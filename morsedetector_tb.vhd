LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

 
ENTITY morsedetector_tb IS
END morsedetector_tb;
 
ARCHITECTURE behavior OF morsedetector_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT morsedetector PORT (rb_i,
						  gcp_i,mrs_i : IN STD_LOGIC; 
						  dv_o : OUT STD_LOGIC;
						  si_o : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
	END COMPONENT;
    
	FOR ALL : morsedetector USE ENTITY WORK.detector (a1);

   --Inputs
   SIGNAL nrb_i : STD_LOGIC := '0';
   SIGNAL ngcp_i : STD_LOGIC := '0';
   SIGNAL nmrs_i : STD_LOGIC := '0';

 	--Outputs
   SIGNAL ndv_o : STD_LOGIC;
   SIGNAL nsi_o : STD_LOGIC_VECTOR(1 DOWNTO 0);
   
   -- Setting period of clock
 
   constant period : TIME := 20 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: morsedetector PORT MAP (
          nrb_i,
          ngcp_i,
          nmrs_i,
          ndv_o,
		  nsi_o
        );

   -- Clock Process definitions
   clock_PROCESS:PROCESS
   BEGIN
		ngcp_i <=  '0';
		WAIT FOR period/2;
		ngcp_i <=  '1';
		WAIT FOR period/2;
   END PROCESS;
 

   -- Stimulus process
   stim_proc: PROCESS
   BEGIN		
      -- hold reset state for 20 ms.
	  
		nrb_i <= '0';
		WAIT FOR 20 ms;	
			nrb_i <= '1';
      
		----Test for detector 
----------------------------------------------------------------------		
		nmrs_i <= '1'; WAIT FOR 100 ms;
		nmrs_i <= '0'; WAIT FOR 100 ms;
		----Detecting DOT
----------------------------------------------------------------------		
		
		nmrs_i <= '0'; WAIT FOR 100 ms;
		nmrs_i <= '0'; WAIT FOR 100 ms;
		nmrs_i <= '0'; WAIT FOR 100 ms;
       ----Detecting CHARACTER SPACE
----------------------------------------------------------------------
		nmrs_i <= '1'; WAIT FOR 100 ms;
		nmrs_i <= '1'; WAIT FOR 100 ms;
		nmrs_i <= '1'; WAIT FOR 100 ms;
		nmrs_i <= '0'; WAIT FOR 100 ms;
		----Detecting DASH
----------------------------------------------------------------------		
		
		nmrs_i <= '0'; WAIT FOR 100 ms;
		nmrs_i <= '0'; WAIT FOR 100 ms;
		nmrs_i <= '0'; WAIT FOR 100 ms;
		nmrs_i <= '0'; WAIT FOR 100 ms;
		nmrs_i <= '0'; WAIT FOR 100 ms;
		nmrs_i <= '0'; WAIT FOR 100 ms;
		nmrs_i <= '0'; WAIT FOR 100 ms;
       ----Detecting WORD SPACE
----------------------------------------------------------------------
	
   WAIT;
   END process;

END behavior;	

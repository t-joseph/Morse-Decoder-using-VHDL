------------------------------------------------------------------------------------------------------------
------Filename: morsetransmitter_tb.vhd - Morse Transmitter Testbench for random sending characters---------
------------------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
 
 
ENTITY morsetransmitter_tb IS
END morsetransmitter_tb;
 
ARCHITECTURE behavior OF morsetransmitter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT morsetransmitter
    PORT(
         rb_i : IN  STD_LOGIC;
         cp_i : IN  STD_LOGIC;
         mrs_i : IN  STD_LOGIC;
         tx_o : OUT  STD_LOGIC
        );
    END COMPONENT;
	
    FOR ALL : morsetransmitter USE ENTITY WORK.final (ar1);

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
   uut: morsetransmitter PORT MAP (
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
		--test for morse transmitter
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------	
        mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--E is detected(45h)


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
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--A is detected(41h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--S is detected(53h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--U is detected(55h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
				
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--R is detected(52h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
				
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
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--W is detected(57h)
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
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
			
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--V is detected(56h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--F is detected(46h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		

		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--  L is detected(4Ch)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		

		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--P is detected(50h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
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
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--J is detected(4Ah)
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
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		

		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--5 is detected(5h)
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
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		

		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--4 is detected(4h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
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
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--3 is detected(3h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
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
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--2 is detected(2h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

      mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
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
	
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		

		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; -- cs detected
		
		--1 is detected(1h)
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
-------------------------------------------------------------------------------------------	
------------------------------------------------------------------------------------------	
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- N detected(4Eh)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
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
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- D detected(44h)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- K detected(4Bh)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- G detected(47h)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
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
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- B detected(42h)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected	
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- X detected(58h)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected	
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected	
			
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- C detected(43h)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected	
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
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
		
      -- Y detected(59h)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected	
		

		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected	
			
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- Z detected(5Ah)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected	
		

		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected	
			
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- Q detected(51h)
-------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------
		
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
			
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- - detected(2Dh)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected	
		
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
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- 6 detected(6h)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected	
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected	
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- 7 detected(7h)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
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
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- 8 detected(8h)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
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
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- 9 detected(9h)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
		
		
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
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dash detected
		
		mrs_i <= '1'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;  -- dot detected
		
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms;
		mrs_i <= '0'; WAIT FOR 100 ms; --  cs detected
		
      -- 0 detected(0h)
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
      wait;
   END PROCESS;

END behavior;

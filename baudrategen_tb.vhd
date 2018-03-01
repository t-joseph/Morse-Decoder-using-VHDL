------------------------------------------------------------------------------------------------------------
------------------------Filename: baudrategen_tb.vhd - Baud Rate Generator Testbench-------------------------------------
------------------------------------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
 
 
ENTITY baudrategen_tb IS
END baudrategen_tb;
 
ARCHITECTURE behavior OF baudrategen_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT baudrategen PORT (
						  rb_i,
						  cp_i: IN STD_LOGIC; 
						  co_o: OUT STD_LOGIC); 
	END COMPONENT;
	
    FOR ALL : baudrategen USE ENTITY WORK.baud_gen (a1);

   --Inputs
   SIGNAL rb_i : STD_LOGIC := '0';
   SIGNAL cp_i : STD_LOGIC := '0';
  
 	--Outputs
   SIGNAL co_o : STD_LOGIC := '0';
   
   -- Setting period of clock
 
   CONSTANT period : TIME := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: baudrategen PORT MAP (
          rb_i => rb_i,
          cp_i => cp_i,
          co_o => co_o
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
   
     -- hold reset state for 20ns.
		rb_i <= '0';
		WAIT FOR 20 ns;	
			rb_i <= '1';	
			
		--test for baud rate generator
--------------------------------------------------------------------------
		
		 WAIT FOR 104 us; 
		--First baud rate output

--------------------------------------------------------------------------

		WAIT FOR 104 us; 
		--Second baud rate output

--------------------------------------------------------------------------

		WAIT FOR 104 us; 
		--Third baud rate output

-------------------------------------------------------------------------		
			
      WAIT;
   END PROCESS;

END behavior;			
			

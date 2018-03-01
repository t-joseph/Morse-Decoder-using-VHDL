------------------------------------------------------------------------------------------------------------
------------------------Filename: mux_tb.vhd - 12x1 MUX Test Bench-------------------------------------
------------------------------------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
 
 
ENTITY mux_tb IS
END mux_tb;
 
ARCHITECTURE behavior OF mux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux PORT (
					    data_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
						sel_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
						y_o : OUT STD_LOGIC);
	END COMPONENT;
	
    FOR ALL : mux USE ENTITY WORK.mux12x1 (a1);

   --Inputs
   SIGNAL data_i : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01010100";
   SIGNAL sel_i  : STD_LOGIC_VECTOR(3 DOWNTO 0);
  
 	--Outputs
   SIGNAL y_o : STD_LOGIC := '0';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          data_i => data_i,
          sel_i => sel_i,
          y_o => y_o
        );
		
		
		  -- Stimulus PROCESS
   stim_proc: PROCESS
   BEGIN
     
      WAIT FOR 100 ns;       
   			
		--test for 12X1 Mux Transmitting ASCII value of "T(54H)"
--------------------------------------------------------------------------
		
		sel_i <= "0000";  WAIT FOR 100 ns;
		--Selecting invalid output

		sel_i <= "0001"; WAIT FOR 100 ns;
		--Selecting start bit zero

		sel_i <= "0010"; WAIT FOR 100 ns;
		--Selecting first data bit

	    sel_i <= "0011"; WAIT FOR 100 ns;
		--Selecting second data bit

	    sel_i <= "0100"; WAIT FOR 100 ns;
		--Selecting third data bit

	    sel_i <= "0101"; WAIT FOR 100 ns;
		--Selecting fourth data bit

	    sel_i <= "0110"; WAIT FOR 100 ns;
		--Selecting fifth data bit

	    sel_i <= "0111"; WAIT FOR 100 ns;
		--Selecting sixth data bit

	    sel_i <= "1000"; WAIT FOR 100 ns;
		--Selecting seventh data bit

	    sel_i <= "1001"; WAIT FOR 100 ns;
		--Selecting eighth data bit

	    sel_i <= "1010"; WAIT FOR 100 ns;
		--Selecting first stop bit
		
	    sel_i <= "1011"; WAIT FOR 100 ns;
		--Selecting second stop bit

     END PROCESS;

END behavior;			
			


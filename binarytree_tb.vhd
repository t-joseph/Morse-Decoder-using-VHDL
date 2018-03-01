
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY binarytree_tb IS
END binarytree_tb;
 
ARCHITECTURE behavior OF binarytree_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT binarytree PORT (rb_i, 
							   gcp_i, dv_i : IN STD_LOGIC; 
							   s_i : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
						       asci_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); 
						       dv_o : OUT STD_LOGIC);
	END COMPONENT;
    
	FOR ALL : binarytree USE ENTITY WORK.fsm_morse_tree (a1);

   --Inputs
   signal nrb_i : std_logic := '0';
   signal ngcp_i : std_logic := '0';
   signal ndv_i : std_logic := '0';
   signal ns_i : STD_LOGIC_VECTOR(1 DOWNTO 0);

 	--Outputs
   signal ndv_o : std_logic;
   signal nasci_o : STD_LOGIC_VECTOR(7 DOWNTO 0);
   
   -- Setting period of clock
 
   constant period : time := 20 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: binarytree PORT MAP (
          nrb_i,
          ngcp_i,
          ndv_i,
		  ns_i,
		  nasci_o,
		  ndv_o
        );

   -- Clock process definitions
   clock_process :process
   begin
		ngcp_i <=  '0';
		wait for period/2;
		ngcp_i <=  '1';
		wait for period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 20 ms.
	  
		nrb_i <= '0';
		wait for 20 ms;	
			nrb_i <= '1';
      
		----Test for binary tree
----------------------------------------------------------------------		
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		----Detecting E(45H)
----------------------------------------------------------------------
----------------------------------------------------------------------		
		
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		----Detecting I(49H)
----------------------------------------------------------------------
----------------------------------------------------------------------

		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		----Detecting A(41H)
----------------------------------------------------------------------		
----------------------------------------------------------------------
		
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		--S is detected(53h)

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
    
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		
		--U is detected(55h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
        ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		
		--R is detected(52h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		
		--W is detected(57h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
        ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		
		--H is detected(48h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
        ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		
		--V is detected(56h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
        ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		
		--F is detected(46h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

        ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		
		--  L is detected(4Ch)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

        ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		
		--P is detected(50h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		
		
		--J is detected(4Ah)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
        ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		--5 is detected(35h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
	
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;

		
		--4 is detected(34h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

        ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;

		
		--3 is detected(33h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
		
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		
		--2 is detected(32h)
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
		
		ns_i <= "01"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "01"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "10"; ndv_i <= '1'; wait for 20 ms;
		ns_i <= "10"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '0'; wait for 80 ms;
		ns_i <= "00"; ndv_i <= '1'; wait for 20 ms;

		
		--1 is detected(31h)
-------------------------------------------------------------------------------------------	
   wait;
   end process;
-------------------------------------------------------------------------------------------
END behavior;	
-------------------------------------------------------------------------------------------
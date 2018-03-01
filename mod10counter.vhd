--------------------------------------------------------------------------------------------
-----------------------Filename: mod10counter.vhd - Mod 10 counter without enble pin--------
--------------------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.ALL;
--------------------------------------------------------------------------------------------
Entity c10xc is PORT (rb_i,cp_i : IN std_logic;
		      q3_o,co_o : OUT std_logic);
END c10xc;
--------------------------------------------------------------------------------------------
Architecture ar1 of c10xc IS

CONSTANT s0 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0000";
CONSTANT s1 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0001";
CONSTANT s2 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0010";
CONSTANT s3 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0011";
CONSTANT s4 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0100";
CONSTANT s5 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0101";
CONSTANT s6 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0110";
CONSTANT s7 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0111";
CONSTANT s8 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "1000";
CONSTANT s9 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "1001";

SIGNAL state_s : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
	zaehlen : PROCESS (rb_i,cp_i)
	BEGIN
	 IF (rb_i= '0') THEN state_s <= s0;
	  ELSIF (cp_i ='1' ANd cp_i'EVENT)
	  THEN
	   CASE state_s IS
	   WHEN s0 => state_s <= s1;
	   WHEN s1 => state_s <= s2;
	   WHEN s2 => state_s <= s3;
	   WHEN s3 => state_s <= s4;
	   WHEN s4 => state_s <= s5;
	   WHEN s5 => state_s <= s6;
	   WHEN s6 => state_s <= s7;
	   WHEN s7 => state_s <= s8;
	   WHEN s8 => state_s <= s9;
	   WHEN s9 => state_s <= s0;
	   WHEN OTHERS => state_s <= s0;
	   END CASE;
	 END IF;
	END PROCESS zaehlen;
---------------------------------------------------------------------------------------------
q3_o <= state_s(3);
co_o <= state_s(3) AND NOT state_s(2) and not state_s(1) and state_s(0);
END ar1;
---------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--------------------------------Filename: mod10counterwe.vhd - Mod 10 counter with enable pin -------------------
-----------------------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.ALL;
-----------------------------------------------------------------------------------------------------------------

Entity c10ec is
 port(rb_i,cp_i,ena_i:in std_logic;
          q3_o,co_o:out std_logic);
end c10ec;
-----------------------------------------------------------------------------------------------------------------

Architecture ar1 of c10ec IS

CONSTANT s0 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0000";
CONSTANT s1 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0001";
CONSTANT s2 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0010";
CONSTANT s3 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0011";
CONSTANT s4 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "0100";
CONSTANT s5 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "1101";
CONSTANT s6 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "1110";
CONSTANT s7 : STD_LOGIC_VECTOR (3 DOWNTO 0):= "1111";
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
	   WHEN s0 => if (ena_i='1') then state_s <= s1;end if;
	   WHEN s1 => if (ena_i='1') then state_s <= s2;end if;
	   WHEN s2 => if (ena_i='1') then state_s <= s3;end if;
	   WHEN s3 => if (ena_i='1') then state_s <= s4;end if;
	   WHEN s4 => if (ena_i='1') then state_s <= s5;end if;
	   WHEN s5 => if (ena_i='1') then state_s <= s6;end if;
	   WHEN s6 => if (ena_i='1') then state_s <= s7;end if;
	   WHEN s7 => if (ena_i='1') then state_s <= s8;end if;
	   WHEN s8 => if (ena_i='1') then state_s <= s9;end if;
	   WHEN s9 => if (ena_i='1') then state_s <= s0;end if;
	   WHEN OTHERS => state_s <= s0;
	   END CASE;
	 END IF;
	END PROCESS zaehlen;

--------------------------------------------------------------------------------------------------------------
q3_o<= state_s(3);

co_o <= state_s(3) AND NOT state_s(2) and not state_s(1) and state_s(0) and ena_i;
--------------------------------------------------------------------------------------------------------------
END ar1;
--------------------------------------------------------------------------------------------------------------

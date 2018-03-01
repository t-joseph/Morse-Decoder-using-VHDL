------------------------------------------------------------------------------------------------------------
------------------------Filename: baudrategen.vhd - Baud Rate Generator-------------------------------------
------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
------------------------------------------------------------------------------------------------------------

ENTITY baud_gen IS
  PORT (rb_i,cp_i : IN STD_LOGIC;
	co_o : OUT STD_LOGIC);
END baud_gen;
------------------------------------------------------------------------------------------------------------

ARCHITECTURE a1 OF baud_gen IS
------------------------------------------------------------------------------------------------------------
  COMPONENT comp1 PORT (rb_i,cp_i: IN STD_LOGIC; q2_o,co_o: OUT STD_LOGIC); END COMPONENT;
  COMPONENT comp2 PORT (rb_i,cp_i,ena_i: IN STD_LOGIC; q3_o,co_o: OUT STD_LOGIC); END COMPONENT;
  COMPONENT comp3 PORT (rb_i,cp_i,ena_i: IN STD_LOGIC; q3_o,co_o: OUT STD_LOGIC); END COMPONENT;
  COMPONENT comp4 PORT (rb_i,cp_i,ena_i: IN STD_LOGIC; q2_o,co_o: OUT STD_LOGIC); END COMPONENT;
  
-- Invoke all modular components(counters-Mod5,Mod13,Mod16,Mod5) from WORK library	
  FOR ALL : comp1 USE ENTITY WORK.c05xc (ar1);
  FOR ALL : comp2 USE ENTITY WORK.c13ec (ar1);
  FOR ALL : comp3 USE ENTITY WORK.c16ec (ar1);
  FOR ALL : comp4 USE ENTITY WORK.c05ec (ar1);
	

SIGNAL ng5c_s, ng5q_s, ng13c_s, ng13q_s, ng16q_s, ng16c_s, ng5ec_s, ng5eq_s: STD_LOGIC;
------------------------------------------------------------------------------------------------------------
BEGIN 
------------------------------------------------------------------------------------------------------------

--Assign Port Mapping of the invoked components with compatible input-output pins  
  g01 : comp1 PORT MAP (rb_i, cp_i,ng5q_s,ng5c_s);
  g02 : comp2 PORT MAP (rb_i, cp_i,ng5c_s,ng13q_s,ng13c_s);
  g03 : comp3 PORT MAP (rb_i, cp_i,ng13c_s,ng16q_s, ng16c_s);
  g04 : comp4 PORT MAP (rb_i,cp_i,ng16c_s,ng5eq_s,ng5ec_s);


-----------------------------------------------------------------------------------------------------------  
  co_o <= ng5ec_s;
-----------------------------------------------------------------------------------------------------------
END a1;
-----------------------------------------------------------------------------------------------------------
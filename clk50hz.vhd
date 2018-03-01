-------------------------------------------------------------------------------------------------------------------
------------------------------------------------Filename: clk50hz.vhd - 50 Hz Frequency Generator------------------
-------------------------------------------------------------------------------------------------------------------
lIBRARY IEEE;
USE IEEE.std_logic_1164.all;
-------------------------------------------------------------------------------------------------------------------
ENTITY clk50hz IS 
PORT(rb_i,cp_i :IN std_logic;
     co_o,gcp_o:OUT std_logic);
END clk50hz;

-------------------------------------------------------------------------------------------------------------------

ARCHITECTURE a1 OF clk50hz IS

COMPONENT c10xc 
PORT (rb_i,cp_i : IN std_logic;
           q3_o,co_o : OUT std_logic);
END COMPONENT;

COMPONENT c10ec
 PORT(rb_i,cp_i,ena_i  : IN std_logic;
          q3_o,co_o    : OUT std_logic);
END COMPONENT;


SIGNAL q3_o,co1_o  : STD_LOGIC;
SIGNAL q32_o,co2_o : STD_LOGIC;
SIGNAL q33_o,co3_o : STD_LOGIC;
SIGNAL q34_o,co4_o : STD_LOGIC;
SIGNAL q35_o,co5_o : STD_LOGIC;
SIGNAL q36_o,co6_o : STD_LOGIC;

BEGIN

uu1 : c10xc PORT MAP (rb_i,cp_i,q3_o,co1_o );
uu2 : c10ec PORT MAP (rb_i,cp_i, co1_o, q32_o, co2_o );
uu3 : c10ec PORT MAP (rb_i,cp_i, co2_o, q33_o, co3_o );
uu4 : c10ec PORT MAP (rb_i,cp_i, co3_o, q34_o, co4_o );
uu5 : c10ec PORT MAP (rb_i,cp_i, co4_o, q35_o, co5_o );
uu6 : c10ec PORT MAP (rb_i,cp_i, co5_o, q36_o, co6_o );

-------------------------------------------------------------------------------------------------------------------
co_o <= co6_o;
gcp_o  <= q36_o;
-------------------------------------------------------------------------------------------------------------------
END a1;
-------------------------------------------------------------------------------------------------------------------


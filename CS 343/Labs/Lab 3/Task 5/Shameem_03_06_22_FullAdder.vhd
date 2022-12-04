library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03_06_22_FullAdder is
	port (Shameem_03_06_22_Cin, Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_lOGIC;
	      Shameem_03_06_22_Sum, Shameem_03_06_22_Cout: out STD_lOGIC);
end Shameem_03_06_22_FullAdder;

architecture arch of Shameem_03_06_22_FullAdder is
signal Shameem_03_06_22_int1, Shameem_03_06_22_int2, Shameem_03_06_22_int3: std_logic;
component Shameem_03_06_22_HalfAdder is
	port (Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_lOGIC;
	      Shameem_03_06_22_Sum, Shameem_03_06_22_Carry: out STD_lOGIC);
end component;
begin
	U1: Shameem_03_06_22_HalfAdder port map (Shameem_03_06_22_A, Shameem_03_06_22_B, Shameem_03_06_22_int1, Shameem_03_06_22_int2);
	U2: Shameem_03_06_22_HalfAdder port map (Shameem_03_06_22_int1, Shameem_03_06_22_Cin, Shameem_03_06_22_Sum, Shameem_03_06_22_int3);
	Shameem_03_06_22_Cout <= Shameem_03_06_22_int2 OR Shameem_03_06_22_int3;	
end arch;

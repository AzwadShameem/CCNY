library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03_06_22_HalfAdder is
	port (Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_lOGIC;
	      Shameem_03_06_22_Sum, Shameem_03_06_22_Carry: out STD_lOGIC);
end Shameem_03_06_22_HalfAdder;

architecture arch of Shameem_03_06_22_HalfAdder is
begin
	P1: process (Shameem_03_06_22_A, Shameem_03_06_22_B)
	begin
		Shameem_03_06_22_Sum <= Shameem_03_06_22_A XOR Shameem_03_06_22_B;
	end process;
	P2: process (Shameem_03_06_22_A, Shameem_03_06_22_B) 
	begin
		Shameem_03_06_22_Carry <= Shameem_03_06_22_A AND Shameem_03_06_22_B;
	end process;
end arch;

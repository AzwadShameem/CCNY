library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03_06_22_NBitFullAdderSub is
	generic (N: integer := 16);
	port (Shameem_03_06_22_Operation: in STD_lOGIC;
	      Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_lOGIC_VECTOR(N-1 downto 0);
	      Shameem_03_06_22_Sum: out STD_lOGIC_VECTOR(N-1 downto 0);
	      Shameem_03_06_22_Cout: out STD_lOGIC);
end Shameem_03_06_22_NBitFullAdderSub;

architecture Behavioural of Shameem_03_06_22_NBitFullAdderSub is
signal Shameem_03_06_22_Carry, Shameem_03_06_22_int1, Shameem_03_06_22_int2, Shameem_03_06_22_int3: STD_lOGIC_VECTOR(N downto 0);
begin	
	process(Shameem_03_06_22_A, Shameem_03_06_22_B, Shameem_03_06_22_Operation, Shameem_03_06_22_Carry, 
		Shameem_03_06_22_int1, Shameem_03_06_22_int2, Shameem_03_06_22_int3)
	begin
		Shameem_03_06_22_Carry(0) <= Shameem_03_06_22_Operation;
		for i in 0 to N-1 loop
			Shameem_03_06_22_int1(i) <= Shameem_03_06_22_B(i) xor Shameem_03_06_22_Operation;
			Shameem_03_06_22_int2(i) <= Shameem_03_06_22_int1(i) xor Shameem_03_06_22_A(i);
			Shameem_03_06_22_Sum(i) <= Shameem_03_06_22_int2(i) xor Shameem_03_06_22_Carry(i);
			Shameem_03_06_22_int3(i) <= Shameem_03_06_22_Carry(i) and Shameem_03_06_22_int2(i);
			Shameem_03_06_22_Carry(i + 1) <= (Shameem_03_06_22_A(i) and Shameem_03_06_22_int1(i)) or Shameem_03_06_22_int3(i);
		end loop;
	end process;	
	Shameem_03_06_22_Cout <= Shameem_03_06_22_Carry(N);
end Behavioural;

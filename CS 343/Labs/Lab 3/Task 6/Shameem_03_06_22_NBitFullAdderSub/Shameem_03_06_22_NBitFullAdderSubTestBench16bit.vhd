library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.all;


entity Shameem_03_06_22_NBitFullAdderSubTestBench16bit is
end Shameem_03_06_22_NBitFullAdderSubTestBench16bit;

architecture arch_test of Shameem_03_06_22_NBitFullAdderSubTestBench16bit is
component Shameem_03_06_22_NBitFullAdderSub is
	generic (N: integer := 16);
	port (Shameem_03_06_22_Operation: in STD_lOGIC;
	      Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_lOGIC_VECTOR(N-1 downto 0);
	      Shameem_03_06_22_Sum: out STD_lOGIC_VECTOR(N-1 downto 0);
	      Shameem_03_06_22_Cout: out STD_lOGIC);
end component;
signal Shameem_03_06_22_add_sub, Shameem_03_06_22_Cout: STD_LOGIC;
signal Shameem_03_06_22_dataa, Shameem_03_06_22_datab, Shameem_03_06_22_Sum: STD_LOGIC_VECTOR (15 DOWNTO 0);
begin
	U1: Shameem_03_06_22_NBitFullAdderSub PORT MAP(Shameem_03_06_22_add_sub, Shameem_03_06_22_dataa, 
						    Shameem_03_06_22_datab, Shameem_03_06_22_Sum, Shameem_03_06_22_Cout);
	vectors: PROCESS
	BEGIN
		-- a. Most Positive N bit integer + 1
		Shameem_03_06_22_add_sub <= '0';
		Shameem_03_06_22_dataa <= "0111111111111111";
		Shameem_03_06_22_datab <= "0000000000000001";
		WAIT FOR 100 ns;
		-- b. Most Positive N bit integer - 1
		Shameem_03_06_22_add_sub <= '1';
		Shameem_03_06_22_dataa <= "0111111111111111";
		Shameem_03_06_22_datab <= "0000000000000001";
		WAIT FOR 100 ns;
		-- c. Most Negative N bit integer + 1
		Shameem_03_06_22_add_sub <= '0';
		Shameem_03_06_22_dataa <= "1000000000000000";
		Shameem_03_06_22_datab <= "0000000000000001";
		WAIT FOR 100 ns;
		-- d. Most Negative N bit integer ? 1
		Shameem_03_06_22_add_sub <= '1';
		Shameem_03_06_22_dataa <= "1000000000000000";
		Shameem_03_06_22_datab <= "0000000000000001";
		WAIT FOR 100 ns;
		-- e. Most Positive N bit integer - Most Negative N bit integer
		Shameem_03_06_22_add_sub <= '1';
		Shameem_03_06_22_dataa <= "0111111111111111";
		Shameem_03_06_22_datab <= "1000000000000000";
		WAIT FOR 100 ns;
		-- f. Most Positive N bit integer + Most Negative N bit integer
		Shameem_03_06_22_add_sub <= '0';
		Shameem_03_06_22_dataa <= "0111111111111111";
		Shameem_03_06_22_datab <= "1000000000000000";
		WAIT FOR 100 ns;
		-- g. Most Positive N bit integer - Most Positive N bit integer 
		Shameem_03_06_22_add_sub <= '1';
		Shameem_03_06_22_dataa <= "0111111111111111";
		Shameem_03_06_22_datab <= "0111111111111111";
		WAIT FOR 100 ns;
	WAIT;
	END PROCESS;
end arch_test;
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.all;


entity Shameem_03_06_22_NBitFullAdderSubFlagsTestBench32bit is
end Shameem_03_06_22_NBitFullAdderSubFlagsTestBench32bit;

architecture arch_test of Shameem_03_06_22_NBitFullAdderSubFlagsTestBench32bit is
component Shameem_03_06_22_NBitFullAdderSubFlags is
	generic (N: integer := 32);
	port (Shameem_03_06_22_Operation: in STD_LOGIC;
	      Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_LOGIC_VECTOR(N-1 downto 0);
	      Shameem_03_06_22_Sum: out STD_lOGIC_VECTOR(N-1 downto 0);
	      Shameem_03_06_22_Carry, Shameem_03_06_22_Overflow, Shameem_03_06_22_Zero, Shameem_03_06_22_Negative: out STD_lOGIC);
end component;
signal Shameem_03_06_22_Operation, Shameem_03_06_22_Carry, Shameem_03_06_22_Overflow, Shameem_03_06_22_Zero, Shameem_03_06_22_Negative : STD_LOGIC;
signal Shameem_03_06_22_A, Shameem_03_06_22_B, Shameem_03_06_22_Sum: STD_LOGIC_VECTOR(31 downto 0);

begin
	U1: Shameem_03_06_22_NBitFullAdderSubFlags PORT MAP(Shameem_03_06_22_Operation, Shameem_03_06_22_A, Shameem_03_06_22_B, Shameem_03_06_22_Sum, Shameem_03_06_22_Carry,  Shameem_03_06_22_Overflow, Shameem_03_06_22_Zero, Shameem_03_06_22_Negative);
	vectors: PROCESS
	BEGIN
		-- a. Most Positive N bit integer + 1
		Shameem_03_06_22_Operation <= '0';
		Shameem_03_06_22_A <= "01111111111111111111111111111111";
		Shameem_03_06_22_B <= "00000000000000000000000000000001";
		WAIT FOR 100 ns;
		-- b. Most Positive N bit integer - 1
		Shameem_03_06_22_Operation <= '1';
		Shameem_03_06_22_A <= "01111111111111111111111111111111";
		Shameem_03_06_22_B <= "00000000000000000000000000000001";
		WAIT FOR 100 ns;
		-- c. Most Negative N bit integer + 1
		Shameem_03_06_22_Operation <= '0';
		Shameem_03_06_22_A <= "10000000000000000000000000000000";
		Shameem_03_06_22_B <= "00000000000000000000000000000001";
		WAIT FOR 100 ns;
		-- d. Most Negative N bit integer - 1
		Shameem_03_06_22_Operation <= '1';
		Shameem_03_06_22_A <= "10000000000000000000000000000000";
		Shameem_03_06_22_B <= "00000000000000000000000000000001";
		WAIT FOR 100 ns;
		-- e. Most Positive N bit integer - Most Negative N bit integer
		Shameem_03_06_22_Operation <= '1';
		Shameem_03_06_22_A <= "01111111111111111111111111111111";
		Shameem_03_06_22_B <= "10000000000000000000000000000000";
		WAIT FOR 100 ns;
		-- f. Most Positive N bit integer + Most Negative N bit integer
		Shameem_03_06_22_Operation <= '0';
		Shameem_03_06_22_A <= "01111111111111111111111111111111";
		Shameem_03_06_22_B <= "10000000000000000000000000000000";
		WAIT FOR 100 ns;
		-- g. Most Positive N bit integer - Most Positive N bit integer 
		Shameem_03_06_22_Operation <= '1';
		Shameem_03_06_22_A <= "01111111111111111111111111111111";
		Shameem_03_06_22_B <= "01111111111111111111111111111111";
		WAIT FOR 100 ns;
	WAIT;
	END PROCESS;
end arch_test;
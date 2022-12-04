library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.all;


entity Shameem_03_06_22_NBitFullAdderSubFlagsTestBench is
end Shameem_03_06_22_NBitFullAdderSubFlagsTestBench;

architecture arch_tb of Shameem_03_06_22_NBitFullAdderSubFlagsTestBench is
component Shameem_03_06_22_NBitFullAdderSubFlags is
	generic (N: integer := 16);
	port (Shameem_03_06_22_Operation: in STD_lOGIC;
	      Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_lOGIC_VECTOR(N-1 downto 0);
	      Shameem_03_06_22_Sum: out STD_lOGIC_VECTOR(N-1 downto 0);
	      Shameem_03_06_22_Carry, Shameem_03_06_22_Overflow, Shameem_03_06_22_Zero, Shameem_03_06_22_Negative: out STD_lOGIC);
end component;
signal Shameem_03_06_22_addsub, Shameem_03_06_22_Carry, Shameem_03_06_22_Overflows, Shameem_03_06_22_Negatives, Shameem_03_06_22_Zeros: STD_LOGIC;
signal Shameem_03_06_22_A_input, Shameem_03_06_22_B_input, Shameem_03_06_22_Result, Shameem_03_06_22_Answer: STD_LOGIC_VECTOR(15 downto 0);
signal Shameem_03_06_22_Error: STD_LOGIC:= '1';

begin
	uut: Shameem_03_06_22_NBitFullAdderSubFlags port map(Shameem_03_06_22_addsub, Shameem_03_06_22_A_input, Shameem_03_06_22_B_input, 
	Shameem_03_06_22_Result, Shameem_03_06_22_Carry, Shameem_03_06_22_Overflows, Shameem_03_06_22_Zeros, Shameem_03_06_22_Negatives);
	process
		begin
			Shameem_03_06_22_addsub <= '0';
			Shameem_03_06_22_A_input <= "0000000000011110";
			Shameem_03_06_22_B_input <= "0000000000000001";
			Shameem_03_06_22_Answer <= "0000000000011111";
			wait for 1 ns;
			if ((Shameem_03_06_22_Result = Shameem_03_06_22_Answer)) then
				Shameem_03_06_22_Error <= '0';
			end if;
			wait for 200ns;
			if (Shameem_03_06_22_Error = '0') then
				report "No errors detected. The simulation was successful";
				report "Input A = " & integer'image(to_integer(signed(Shameem_03_06_22_A_input)));
				report "Input B = " & integer'image(to_integer(signed(Shameem_03_06_22_B_input)));
				report "The result = " & integer'image(to_integer(signed(Shameem_03_06_22_Result)));
				report "The result is correct because the actual value = " & integer'image(to_integer(signed(Shameem_03_06_22_Answer)));
			else
				report "Error detected. The Simulation Failed";
				report "Input A = " & integer'image(to_integer(signed(Shameem_03_06_22_A_input)));
				report "Input B = " & integer'image(to_integer(signed(Shameem_03_06_22_B_input)));
				report "The result = " & integer'image(to_integer(signed(Shameem_03_06_22_Result)));
				report "The real answer should be = " & integer'image(to_integer(signed(Shameem_03_06_22_Answer))) severity failure;
			end if;
	end process;
end arch_tb;

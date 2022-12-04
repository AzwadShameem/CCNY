library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03_06_22_FourBitFullAdder is
	port (Shameem_03_06_22_Cin: in STD_LOGIC;
	      Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_LOGIC_VECTOR(3 downto 0);
	      Shameem_03_06_22_Sum: out STD_LOGIC_VECTOR(3 downto 0);
	      Shameem_03_06_22_Cout: out STD_LOGIC);
end Shameem_03_06_22_FourBitFullAdder;

architecture arch of Shameem_03_06_22_FourBitFullAdder is
component Shameem_03_06_22_FullAdder
	port (Shameem_03_06_22_Cin, Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_LOGIC;
	      Shameem_03_06_22_Sum, Shameem_03_06_22_Cout : out STD_LOGIC);
end component;
signal Shameem_03_06_22_Couts : std_logic_vector(3 downto 0);
begin
	U1: Shameem_03_06_22_FullAdder port map (Shameem_03_06_22_Cin, Shameem_03_06_22_A(0), Shameem_03_06_22_B(0), Shameem_03_06_22_Sum(0), Shameem_03_06_22_Couts(0));
	U2: Shameem_03_06_22_FullAdder port map (Shameem_03_06_22_Couts(0), Shameem_03_06_22_A(1), Shameem_03_06_22_B(1), Shameem_03_06_22_Sum(1), Shameem_03_06_22_Couts(1));
	U3: Shameem_03_06_22_FullAdder port map (Shameem_03_06_22_Couts(1), Shameem_03_06_22_A(2), Shameem_03_06_22_B(2), Shameem_03_06_22_Sum(2), Shameem_03_06_22_Couts(2));
	U4: Shameem_03_06_22_FullAdder port map (Shameem_03_06_22_Couts(2), Shameem_03_06_22_A(3), Shameem_03_06_22_B(3), Shameem_03_06_22_Sum(3), Shameem_03_06_22_Couts(3));
	Shameem_03_06_22_Cout <= Shameem_03_06_22_Couts(3);
end arch;

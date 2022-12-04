library ieee;
use ieee.std_logic_1164.all;

entity Shameem_Azwad_02_28_22_eight_bit_comparator is
	port (a, b : in STD_LOGIC_VECTOR(7 downto 0);
			aeqb : out STD_LOGIC);
end Shameem_Azwad_02_28_22_eight_bit_comparator;

architecture arch of Shameem_Azwad_02_28_22_eight_bit_comparator is
signal eq1, eq2, eq3, eq4: STD_LOGIC;
component Shameem_Azwad_02_28_22_two_bit_comparator is
	port (a, b : in std_logic_vector(1 downto 0);
			aeqb : out std_logic);
end component;
begin
	U1: Shameem_Azwad_02_28_22_two_bit_comparator port map(a=>a(1 downto 0), b=>b(1 downto 0), aeqb=>eq1);
	U2: Shameem_Azwad_02_28_22_two_bit_comparator port map(a=>a(3 downto 2), b=>b(3 downto 2), aeqb=>eq2);
	U3: Shameem_Azwad_02_28_22_two_bit_comparator port map(a=>a(5 downto 4), b=>b(5 downto 4), aeqb=>eq3);
	U4: Shameem_Azwad_02_28_22_two_bit_comparator port map(a=>a(7 downto 6), b=>b(7 downto 6), aeqb=>eq4);
	aeqb <= eq1 AND eq2 AND eq3 AND eq4;
end arch;

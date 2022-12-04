library ieee;
use ieee.std_logic_1164.all;

entity Shameem_Azwad_02_28_22_eight_bit_equal is
	port (a, b : in STD_LOGIC_VECTOR(7 downto 0);
			aeqb : out STD_LOGIC);
end Shameem_Azwad_02_28_22_eight_bit_equal;

architecture arch of Shameem_Azwad_02_28_22_eight_bit_equal is
signal eq0, eq1, eq2, eq3, eq4, eq5, eq6, eq7: STD_LOGIC;
component Shameem_Azwad_02_28_22_equal is
	port (a, b: in STD_LOGIC;
			aeqb: out STD_LOGIC);
end component;
begin
	U1: Shameem_Azwad_02_28_22_equal port map(a=>a(0), b=>b(0), aeqb=>eq0);
	U2: Shameem_Azwad_02_28_22_equal port map(a=>a(1), b=>b(1), aeqb=>eq1);
	U3: Shameem_Azwad_02_28_22_equal port map(a=>a(2), b=>b(2), aeqb=>eq2);
	U4: Shameem_Azwad_02_28_22_equal port map(a=>a(3), b=>b(3), aeqb=>eq3);
	U5: Shameem_Azwad_02_28_22_equal port map(a=>a(4), b=>b(4), aeqb=>eq4);
	U6: Shameem_Azwad_02_28_22_equal port map(a=>a(5), b=>b(5), aeqb=>eq5);
	U7: Shameem_Azwad_02_28_22_equal port map(a=>a(6), b=>b(6), aeqb=>eq6);
	U8: Shameem_Azwad_02_28_22_equal port map(a=>a(7), b=>b(7), aeqb=>eq7);
	aeqb <= eq0 AND eq1 AND eq2 AND eq3 AND eq4 AND eq5 AND eq6 AND eq7;
end arch;

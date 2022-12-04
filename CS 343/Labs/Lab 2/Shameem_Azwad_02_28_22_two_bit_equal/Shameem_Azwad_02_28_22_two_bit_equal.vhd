library ieee;
use ieee.std_logic_1164.all;

entity Shameem_Azwad_02_28_22_two_bit_equal is
	port (a, b : in std_logic_vector(1 downto 0);
			aeqb : out std_logic);
end Shameem_Azwad_02_28_22_two_bit_equal;

architecture arch of Shameem_Azwad_02_28_22_two_bit_equal is
signal p0, p1, p2, p3 : std_logic;
begin
	aeqb <= p0 or p1 or p2 or p3;
	p0 <= (NOT A(1) AND NOT B(1)) AND (NOT A(0) AND NOT B(0));
	p1 <= (NOT A(1) AND NOT B(1)) AND (A(0) AND B(0));
	p2 <= (A(1) AND B(1)) AND (NOT A(0) AND NOT B(0));
	p3 <= (A(1) AND B(1)) AND (A(0) AND B(0));
end arch;

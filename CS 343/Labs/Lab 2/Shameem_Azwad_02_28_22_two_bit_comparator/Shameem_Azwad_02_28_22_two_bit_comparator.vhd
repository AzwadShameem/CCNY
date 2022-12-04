library ieee;
use ieee.std_logic_1164.all;

entity Shameem_Azwad_02_28_22_two_bit_comparator is
	port (a, b : in std_logic_vector(1 downto 0);
			aeqb : out std_logic);
end Shameem_Azwad_02_28_22_two_bit_comparator;

architecture arch of Shameem_Azwad_02_28_22_two_bit_comparator is
begin
	aeqb <= ((NOT a(1) AND NOT b(1)) AND (NOT a(0) AND NOT b(0))) OR ((NOT a(1) AND NOT b(1)) AND (a(0) AND b(0))) OR ((a(1) AND b(1)) AND (NOT a(0) AND NOT b(0))) OR ((a(1) AND b(1)) AND (a(0) AND b(0)));
end arch;

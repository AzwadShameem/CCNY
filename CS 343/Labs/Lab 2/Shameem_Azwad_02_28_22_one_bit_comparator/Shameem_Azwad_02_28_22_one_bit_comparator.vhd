Library ieee;
use ieee.std_logic_1164.all;

entity Shameem_Azwad_02_28_22_one_bit_comparator is
	port (a, b : in STD_LOGIC;
			aeqb : out STD_LOGIC);
end Shameem_Azwad_02_28_22_one_bit_comparator;

architecture arch of Shameem_Azwad_02_28_22_one_bit_comparator is
begin
	aeqb <= (NOT a AND NOT b) or (a AND b);
end arch;

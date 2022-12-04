Library ieee;
use ieee.std_logic_1164.all;

entity Shameem_Azwad_02_28_22_equal is
	port (a: in std_logic;
	      b: in std_logic;
         aeqb: out std_logic);
end Shameem_Azwad_02_28_22_equal;

architecture arch of Shameem_Azwad_02_28_22_equal is
signal p0: std_logic;
signal p1: std_logic;
begin
	aeqb <= p0 or p1;
	p0 <= (not a) and (not b);
	p1 <= a and b;
end arch; 

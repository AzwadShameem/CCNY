LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Shameem_Azwad_mux_2_1_32bit IS
	PORT (A, B : IN STD_LOGIC_VECTOR(31 downto 0);
			X : IN STD_LOGIC_VECTOR(1 downto 1);
		   Y: IN STD_LOGIC_VECTOR(31 downto 0));
END Shameem_Azwad_mux_2_1_32bit;

ARCHITECTURE LogicFunction OF Shameem_Azwad_mux_2_1_32bit IS
BEGIN
	Y <= (A AND NOT X) OR (B AND X);
END LogicFunction ;
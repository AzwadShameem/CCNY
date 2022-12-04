LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY Shameem_03_23_22_Adderk IS
	GENERIC (Shameem_03_23_22_k: INTEGER := 8);
	PORT ( 	
			Shameem_03_23_22_carryin: IN STD_LOGIC ;
			Shameem_03_23_22_X, Shameem_03_23_22_Y: IN STD_LOGIC_VECTOR(Shameem_03_23_22_k-1 DOWNTO 0);
			Shameem_03_23_22_S: OUT STD_LOGIC_VECTOR(Shameem_03_23_22_k-1 DOWNTO 0);
			Shameem_03_23_22_carryout: OUT STD_LOGIC 
		  );
END Shameem_03_23_22_Adderk;
ARCHITECTURE Behavioural OF Shameem_03_23_22_Adderk IS
SIGNAL Shameem_03_23_22_Sum: STD_LOGIC_VECTOR(Shameem_03_23_22_k DOWNTO 0);
BEGIN
	Shameem_03_23_22_Sum <= ('0' & Shameem_03_23_22_X) + ('0' & Shameem_03_23_22_Y) + Shameem_03_23_22_carryin;
	Shameem_03_23_22_S <= Shameem_03_23_22_Sum(Shameem_03_23_22_k-1 DOWNTO 0);
	Shameem_03_23_22_carryout <= Shameem_03_23_22_Sum(Shameem_03_23_22_k);
END Behavioural;
		
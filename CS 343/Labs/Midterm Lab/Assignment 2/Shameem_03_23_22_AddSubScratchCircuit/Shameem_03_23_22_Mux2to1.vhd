LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Shameem_03_23_22_Mux2to1 IS
	GENERIC (Shameem_03_23_22_k: INTEGER := 8 );
	PORT ( 
			Shameem_03_23_22_V, Shameem_03_23_22_W: IN STD_LOGIC_VECTOR(Shameem_03_23_22_k-1 DOWNTO 0);
			Shameem_03_23_22_Selm: IN STD_LOGIC ;
			Shameem_03_23_22_F: OUT STD_LOGIC_VECTOR(Shameem_03_23_22_k-1 DOWNTO 0) 
		  ) ;
END Shameem_03_23_22_Mux2to1 ;
ARCHITECTURE Behavioural OF Shameem_03_23_22_Mux2to1 IS
	BEGIN
	PROCESS (Shameem_03_23_22_V, Shameem_03_23_22_W, Shameem_03_23_22_Selm)
	BEGIN
		IF Shameem_03_23_22_Selm = '0' THEN
			Shameem_03_23_22_F <= Shameem_03_23_22_V;
		ELSE
			Shameem_03_23_22_F <= Shameem_03_23_22_W;
		END IF;
	END PROCESS;
END Behavioural;

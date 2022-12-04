LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Shameem_03_23_22_AddSubScratch IS
	GENERIC (N : INTEGER := 32 ) ;
	PORT (
			Shameem_03_23_22_A, Shameem_03_23_22_B : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			Shameem_03_23_22_Clock, Shameem_03_23_22_Reset, Shameem_03_23_22_Sel, Shameem_03_23_22_AddSub: IN STD_LOGIC;
			Shameem_03_23_22_Z : BUFFER STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			Shameem_03_23_22_Overflow : OUT STD_LOGIC ) ;
END Shameem_03_23_22_AddSubScratch;

ARCHITECTURE Behavioural OF Shameem_03_23_22_AddSubScratch IS
SIGNAL Shameem_03_23_22_G, Shameem_03_23_22_H, Shameem_03_23_22_M, Shameem_03_23_22_Areg: STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
SIGNAL Shameem_03_23_22_Breg, Shameem_03_23_22_Zreg, Shameem_03_23_22_AddSubR_n: STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
SIGNAL Shameem_03_23_22_SelR, Shameem_03_23_22_AddSubR, Shameem_03_23_22_carryout, Shameem_03_23_22_over_flow : STD_LOGIC ;
COMPONENT Shameem_03_23_22_Mux2to1
	GENERIC (Shameem_03_23_22_k : INTEGER := 8 ) ;
	PORT ( 
			Shameem_03_23_22_V, Shameem_03_23_22_W : IN STD_LOGIC_VECTOR(Shameem_03_23_22_k-1 DOWNTO 0) ;
			Shameem_03_23_22_Selm : IN STD_LOGIC ;
			Shameem_03_23_22_F : OUT STD_LOGIC_VECTOR(Shameem_03_23_22_k-1 DOWNTO 0) ) ;
END COMPONENT ;
COMPONENT Shameem_03_23_22_Adderk
	GENERIC (Shameem_03_23_22_k : INTEGER := 8 ) ;
	PORT (
			Shameem_03_23_22_carryin : IN STD_LOGIC ;
			Shameem_03_23_22_X, Shameem_03_23_22_Y : IN STD_LOGIC_VECTOR(Shameem_03_23_22_k-1 DOWNTO 0) ;
			Shameem_03_23_22_S : OUT STD_LOGIC_VECTOR(Shameem_03_23_22_k-1 DOWNTO 0) ;
			Shameem_03_23_22_carryout : OUT STD_LOGIC);
END COMPONENT;
BEGIN
	PROCESS (Shameem_03_23_22_Reset, Shameem_03_23_22_Clock)
	BEGIN
		IF Shameem_03_23_22_Reset = '1' THEN
			Shameem_03_23_22_Areg <= (OTHERS => '0'); 
			Shameem_03_23_22_Breg <= (OTHERS => '0');
			Shameem_03_23_22_Zreg <= (OTHERS => '0'); 
			Shameem_03_23_22_SelR <= '0'; 
			Shameem_03_23_22_AddSubR <= '0'; 
			Shameem_03_23_22_Overflow <= '0';
		ELSIF Shameem_03_23_22_Clock'EVENT AND Shameem_03_23_22_Clock = '1' THEN
			Shameem_03_23_22_Areg <= Shameem_03_23_22_A; 
			Shameem_03_23_22_Breg <= Shameem_03_23_22_B; 
			Shameem_03_23_22_Zreg <= Shameem_03_23_22_M;
			Shameem_03_23_22_SelR <= Shameem_03_23_22_Sel; 
			Shameem_03_23_22_AddSubR <= Shameem_03_23_22_AddSub; 
			Shameem_03_23_22_Overflow <= Shameem_03_23_22_over_flow;
		END IF ;
	END PROCESS ;
	Shameem_03_23_22_U1: Shameem_03_23_22_Adderk GENERIC MAP (N) 
		PORT MAP (Shameem_03_23_22_AddSubR, Shameem_03_23_22_G, Shameem_03_23_22_H, Shameem_03_23_22_M, Shameem_03_23_22_carryout );
	
	Shameem_03_23_22_U2: Shameem_03_23_22_Mux2to1 GENERIC MAP (N) 
		PORT MAP (Shameem_03_23_22_Areg, Shameem_03_23_22_Z, Shameem_03_23_22_SelR, Shameem_03_23_22_G);
		
	Shameem_03_23_22_AddSubR_n <= (OTHERS => Shameem_03_23_22_AddSubR);
	
	Shameem_03_23_22_H <= Shameem_03_23_22_Breg XOR Shameem_03_23_22_AddSubR_n ;
	
	Shameem_03_23_22_over_flow <= Shameem_03_23_22_carryout XOR Shameem_03_23_22_G(N-1) 
		XOR Shameem_03_23_22_H(N-1) XOR Shameem_03_23_22_M(N-1);

	Shameem_03_23_22_Z <= Shameem_03_23_22_Zreg ;
END Behavioural;
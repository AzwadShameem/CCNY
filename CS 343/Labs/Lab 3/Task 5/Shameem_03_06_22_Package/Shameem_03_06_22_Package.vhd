library ieee;
use ieee.std_logic_1164.all;

PACKAGE Shameem_03_06_22_Package is 

	component Shameem_03_06_22_HalfAdder is
		port (Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_lOGIC;
				Shameem_03_06_22_Sum, Shameem_03_06_22_Carry: out STD_lOGIC);
	end component;
	
	component Shameem_03_06_22_FullAdder is
		port (Shameem_03_06_22_Cin, Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_lOGIC;
				Shameem_03_06_22_Sum, Shameem_03_06_22_Cout: out STD_lOGIC);
	end component;

	
	component Shameem_03_06_22_FourBitFullAdder is
	port (Shameem_03_06_22_Cin: in STD_LOGIC;
	      Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_LOGIC_VECTOR(3 downto 0);
	      Shameem_03_06_22_Sum: out STD_LOGIC_VECTOR(3 downto 0);
	      Shameem_03_06_22_Cout: out STD_LOGIC);
	end component;
	
	component Shameem_03_06_22_FourBitFullAdderSub is
	port (Shameem_03_06_22_Operation : in STD_LOGIC;
	      Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_LOGIC_VECTOR(3 downto 0);
	      Shameem_03_06_22_Sum: out STD_LOGIC_VECTOR(3 downto 0);
	      Shameem_03_06_22_Carry: out STD_LOGIC);  
	end component;

	
	component Shameem_03_06_22_NBitFullAdderSub is
		generic (N: integer := 4);
		port (Shameem_03_06_22_Operation: in STD_lOGIC;
				Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_lOGIC_VECTOR(N-1 downto 0);
				Shameem_03_06_22_Sum: out STD_lOGIC_VECTOR(N-1 downto 0);
				Shameem_03_06_22_Cout: out STD_lOGIC);
	end component;
	
	component Shameem_03_06_22_NBitFullAdderSubFlags is
		generic (N: integer := 4);
		port (Shameem_03_06_22_Operation: in STD_lOGIC;
				Shameem_03_06_22_A, Shameem_03_06_22_B: in STD_lOGIC_VECTOR(N-1 downto 0);
				Shameem_03_06_22_Sum: out STD_lOGIC_VECTOR(N-1 downto 0);
				Shameem_03_06_22_Carry, Shameem_03_06_22_Overflow, Shameem_03_06_22_Zero, Shameem_03_06_22_Negative: out STD_lOGIC);
	end component;
	
	
	component Shameem_03_06_22_NBitLPMAddSub IS
		generic (N: integer := 16);
		PORT (Shameem_03_06_22_Operation: IN STD_LOGIC;
				Shameem_03_06_22_A, Shameem_03_06_22_B: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				Shameem_03_06_22_Result: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				Shameem_03_06_22_Overflow: OUT STD_LOGIC);
	end component;
	
end package Shameem_03_06_22_Package;
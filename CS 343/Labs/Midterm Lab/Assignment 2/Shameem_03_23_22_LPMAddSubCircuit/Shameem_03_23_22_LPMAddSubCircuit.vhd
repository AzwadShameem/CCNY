library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03_23_22_LPMAddSubCircuit is
	port 
	(
		Shameem_03_23_22_AddressA, Shameem_03_23_22_AddressB: in STD_LOGIC_VECTOR(3 downto 0);
		Shameem_03_23_22_AddSub, Shameem_03_23_22_Clock: in STD_LOGIC;
		Shameem_03_23_22_FinalResult: out STD_LOGIC_VECTOR(31 downto 0);
		Shameem_03_23_22_Z, Shameem_03_23_22_N, Shameem_03_23_22_O: out STD_LOGIC
	);
end Shameem_03_23_22_LPMAddSubCircuit;

architecture arch of Shameem_03_23_22_LPMAddSubCircuit is
signal Shameem_03_23_22_a, Shameem_03_23_22_b, Shameem_03_23_22_answer: STD_LOGIC_VECTOR(31 downto 0);
signal Shameem_03_23_22_wr: STD_LOGIC := '0';
component Shameem_03_23_22_LPMAddSub IS
	PORT
	(
		Shameem_03_23_22_add_sub: IN STD_LOGIC ;
		Shameem_03_23_22_dataa: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Shameem_03_23_22_datab: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Shameem_03_23_22_overflow: OUT STD_LOGIC ;
		Shameem_03_23_22_result: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component;
component Shameem_03_23_22_DataMemory IS
	PORT
	(
		Shameem_03_23_22_address: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		Shameem_03_23_22_clock: IN STD_LOGIC  := '1';
		Shameem_03_23_22_data: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		Shameem_03_23_22_wren: IN STD_LOGIC ;
		Shameem_03_23_22_q: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component;
begin
	Shameem_03_23_22_DataA: Shameem_03_23_22_DataMemory 
		port map(Shameem_03_23_22_AddressA, Shameem_03_23_22_Clock, x"00000000", Shameem_03_23_22_wr, Shameem_03_23_22_a);
	
	Shameem_03_23_22_DataB: Shameem_03_23_22_DataMemory 
		port map(Shameem_03_23_22_AddressB, Shameem_03_23_22_Clock, x"00000000", Shameem_03_23_22_wr, Shameem_03_23_22_b);
		
	Shameem_03_23_22_Math: Shameem_03_23_22_LPMAddSub 
		port map (Shameem_03_23_22_AddSub, Shameem_03_23_22_a, Shameem_03_23_22_b, Shameem_03_23_22_O, Shameem_03_23_22_answer);
	
	Shameem_03_23_22_FinalResult <= Shameem_03_23_22_answer;
	Shameem_03_23_22_N <= Shameem_03_23_22_answer(31);
	Shameem_03_23_22_Z <= '1' when(Shameem_03_23_22_answer=x"00000000") else '0';
end arch;

library ieee;
use ieee.std_logic_1164.all;

entity Shameem_03132022_LPMSRAM_tb is
end Shameem_03132022_LPMSRAM_tb;

architecture arch_test of Shameem_03132022_LPMSRAM_tb is
component Shameem_03132022_LPMSRAM IS
	PORT (Shameem_03132022_address: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Shameem_03132022_clock: IN STD_LOGIC;
			Shameem_03132022_data: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Shameem_03132022_wren: IN STD_LOGIC ;
			Shameem_03132022_q: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
end component;
signal Shameem_03132022_clock, Shameem_03132022_WREN: STD_LOGIC;
signal Shameem_03132022_data, Shameem_03132022_address, Shameem_03132022_q, nulls: STD_LOGIC_VECTOR (3 DOWNTO 0);

begin
	U1: Shameem_03132022_LPMSRAM PORT MAP(Shameem_03132022_address, Shameem_03132022_clock, Shameem_03132022_data, Shameem_03132022_WREN, Shameem_03132022_q);
	vectors: PROCESS
	BEGIN
		Shameem_03132022_clock <= '0';
		Shameem_03132022_wren <= '0';
		Shameem_03132022_address <= "1010";
		Shameem_03132022_data <= "0001";
		WAIT FOR 20 ps;
		Shameem_03132022_clock <= '1';
		Shameem_03132022_wren <= '0';
		Shameem_03132022_address <= "1010";
		Shameem_03132022_data <= "0001";
		WAIT FOR 19 ps;
		Shameem_03132022_address <= nulls;
		Shameem_03132022_data <= nulls;
		WAIT FOR 1 ps;
		Shameem_03132022_clock <= '0';
		Shameem_03132022_wren <= '1';
		Shameem_03132022_address <= "1011";
		Shameem_03132022_data <= "0010";
		WAIT FOR 20 ps;
		Shameem_03132022_clock <= '1';
		Shameem_03132022_wren <= '1';
		Shameem_03132022_address <= "1011";
		Shameem_03132022_data <= "0010";
		WAIT FOR 19 ps;
		Shameem_03132022_address <= nulls;
		Shameem_03132022_data <= nulls;
		WAIT FOR 1 ps;
		Shameem_03132022_clock <= '0';
		Shameem_03132022_wren <= '0';
		Shameem_03132022_address <= "1100";
		Shameem_03132022_data <= "0011";
		WAIT FOR 20 ps;
		Shameem_03132022_clock <= '1';
		Shameem_03132022_wren <= '0';
		Shameem_03132022_address <= "1100";
		Shameem_03132022_data <= "0011";
		WAIT FOR 19 ps;
		Shameem_03132022_address <= nulls;
		Shameem_03132022_data <= nulls;
		WAIT FOR 1 ps;
		Shameem_03132022_clock <= '0';
		Shameem_03132022_wren <= '1';
		Shameem_03132022_address <= "1101";
		Shameem_03132022_data <= "0100";
		WAIT FOR 20 ps;
		Shameem_03132022_clock <= '1';
		Shameem_03132022_wren <= '1';
		Shameem_03132022_address <= "1101";
		Shameem_03132022_data <= "0100";
		WAIT FOR 19 ps;
		Shameem_03132022_address <= nulls;
		Shameem_03132022_data <= nulls;
		WAIT FOR 1 ps;
		Shameem_03132022_clock <= '0';
		Shameem_03132022_wren <= '0';
		Shameem_03132022_address <= "1110";
		Shameem_03132022_data <= "0101";
		WAIT FOR 20 ps;
		Shameem_03132022_clock <= '1';
		Shameem_03132022_wren <= '0';
		Shameem_03132022_address <= "1110";
		Shameem_03132022_data <= "0101";
		WAIT FOR 19 ps;
		Shameem_03132022_address <= nulls;
		Shameem_03132022_data <= nulls;
		WAIT FOR 1 ps;
		Shameem_03132022_clock <= '0';
		Shameem_03132022_wren <= '1';
		Shameem_03132022_address <= "1111";
		Shameem_03132022_data <= "0110";
		WAIT FOR 20 ps;
		Shameem_03132022_clock <= '1';
		Shameem_03132022_wren <= '1';
		Shameem_03132022_address <= "1111";
		Shameem_03132022_data <= "0110";
		WAIT FOR 20 ps;
	WAIT;
	END PROCESS;
end arch_test;
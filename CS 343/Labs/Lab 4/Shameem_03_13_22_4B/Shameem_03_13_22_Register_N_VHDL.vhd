LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity Shameem_03132022_Register_N_VHDL is
	generic (N: integer := 32);
	port (Shameem_03132022_CLK, Shameem_03132022_WREN, Shameem_03132022_RDEN, Shameem_03132022_CHEN: in STD_LOGIC; 
			Shameem_03132022_DATA: in STD_lOGIC_VECTOR(N-1 downto 0);
			Shameem_03132022_Q: out STD_lOGIC_VECTOR(N-1 downto 0));
end Shameem_03132022_Register_N_VHDL;

architecture arch of Shameem_03132022_Register_N_VHDL is
signal Shameem_03132022_Storage: STD_LOGIC_VECTOR(N-1 downto 0);
begin
	process (Shameem_03132022_CLK)
	begin
		if (rising_edge(Shameem_03132022_clk) and Shameem_03132022_WREN = '1')
			then Shameem_03132022_Storage <= Shameem_03132022_data;
		end if;
	end process;
	process (Shameem_03132022_RDEN, Shameem_03132022_CHEN, Shameem_03132022_Storage)
	begin 
		if (Shameem_03132022_RDEN = '1' and Shameem_03132022_CHEN = '1')
			then Shameem_03132022_Q <= Shameem_03132022_Storage;
		elsif (Shameem_03132022_CHEN = '0')
			then Shameem_03132022_Q <= (others => 'Z');
		end if;
	end process;
end arch;
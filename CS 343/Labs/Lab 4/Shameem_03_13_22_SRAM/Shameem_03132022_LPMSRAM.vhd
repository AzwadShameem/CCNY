LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY Shameem_03132022_LPMSRAM IS
	PORT (Shameem_03132022_address: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
<<<<<<< HEAD:Labs/Lab 4/Shameem_03_13_22_SRAM/Shameem_03132022_LPMSRAM.vhd
			Shameem_03132022_clock: IN STD_LOGIC;
			Shameem_03132022_data: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Shameem_03132022_wren: IN STD_LOGIC;
=======
			Shameem_03132022_clock: IN STD_LOGIC  := '1';
			Shameem_03132022_data: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			Shameem_03132022_wren: IN STD_LOGIC ;
>>>>>>> de6422383e664b5f8d1ccefa82bf1cf47094556e:Labs/Lab 4/Shameem_03132022_SRAM/Shameem_03132022_LPMSRAM.vhd
			Shameem_03132022_q: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END Shameem_03132022_LPMSRAM;

ARCHITECTURE SYN OF Shameem_03132022_LPMSRAM IS
SIGNAL Shameem_03132022_sub_wire0: STD_LOGIC_VECTOR (3 DOWNTO 0);
BEGIN
	Shameem_03132022_q <= Shameem_03132022_sub_wire0(3 DOWNTO 0);
	altsyncram_component : altsyncram
	GENERIC MAP (clock_enable_input_a => "BYPASS",
					 clock_enable_output_a => "BYPASS",
					 intended_device_family => "Cyclone V",
					 lpm_hint => "ENABLE_RUNTIME_MOD=NO",
					 lpm_type => "altsyncram",
					 numwords_a => 16,
					 operation_mode => "SINGLE_PORT",
					 outdata_aclr_a => "NONE",
					 outdata_reg_a => "CLOCK0",
				 	 power_up_uninitialized => "FALSE",
					 read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
					 widthad_a => 4,
					 width_a => 4,
					 width_byteena_a => 1)
	PORT MAP (address_a => Shameem_03132022_address,
				 clock0 => Shameem_03132022_clock,
				 data_a => Shameem_03132022_data,
				 wren_a => Shameem_03132022_wren,
				 q_a => Shameem_03132022_sub_wire0);
END SYN;
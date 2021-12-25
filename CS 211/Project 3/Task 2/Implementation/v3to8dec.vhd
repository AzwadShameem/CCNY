----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:59:57 04/17/2021 
-- Design Name: 
-- Module Name:    v3to8dec - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity v3to8dec is
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           EN: in  STD_LOGIC;
           O : out STD_LOGIC_VECTOR (7 downto 0));
end v3to8dec;

architecture v3to8dec_arch of v3to8dec is
	signal A2_INV, A2_INV_EN, A2_EN: STD_LOGIC;
	component v2to4dec
		port ( EN : in   STD_LOGIC;
				 I0 : in   STD_LOGIC;
				 I1 : in   STD_LOGIC;
				 Y0 : out  STD_LOGIC;
				 Y1 : out  STD_LOGIC;
				 Y2 : out  STD_LOGIC;
				 Y3 : out  STD_LOGIC);
	end component;
	component INV port (I: in STD_LOGIC; O: out STD_LOGIC); end component;
	component AND2 port (I0,I1: in STD_LOGIC; O: out STD_LOGIC); end component;

begin
	U1: INV  port map (I=>A(2), O=>A2_INV);
	U2: AND2 port map (I0=>A2_INV, I1=>EN, O=>A2_INV_EN);
	U3: AND2 port map (I0=>EN, I1=>A(2), O=>A2_EN);
	U4: v2to4dec
		port map ( EN=>A2_INV_EN, I0=>A(0),
					  I1=>A(1),
                 Y0=>O(0),
                 Y1=>O(1),
                 Y2=>O(2),
                 Y3=>O(3));
	U5: v2to4dec
		port map ( EN=>A2_EN,
                 I0=>A(0),
                 I1=>A(1),
                 Y0=>O(4),
                 Y1=>O(5),
                 Y2=>O(6),
                 Y3=>O(7));

end v3to8dec_arch;
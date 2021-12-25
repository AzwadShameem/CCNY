----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:16 04/17/2021 
-- Design Name: 
-- Module Name:    adder4b - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity adder4b is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           CIN : in  STD_LOGIC;
           COUT : out  STD_LOGIC);
end adder4b;

architecture adder4b_arch of adder4b is
	signal CIN_1, CIN_2, CIN_3: STD_LOGIC;
	component adder1b
		Port ( X : in  STD_LOGIC;
				 Y : in  STD_LOGIC;
             CIN : in  STD_LOGIC;
				 S : out  STD_LOGIC;
				 COUT : out  STD_LOGIC);
	end component;
			 
begin
	U1: adder1b port map (X=>X(0), Y=>Y(0), S=>S(0), CIN=>CIN, COUT=>CIN_1);
	U2: adder1b port map (X=>X(1), Y=>Y(1), S=>S(1), CIN=>CIN_1, COUT=>CIN_2);
	U3: adder1b port map (X=>X(2), Y=>Y(2), S=>S(2), CIN=>CIN_2, COUT=>CIN_3);
	U4: adder1b port map (X=>X(3), Y=>Y(3), S=>S(3), CIN=>CIN_3, COUT=>COUT);

end adder4b_arch;


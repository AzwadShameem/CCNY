----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:17:33 04/17/2021 
-- Design Name: 
-- Module Name:    adder1b - Behavioral 
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

entity adder1b is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           CIN : in  STD_LOGIC;
           S : out  STD_LOGIC;
           COUT : out  STD_LOGIC);
end adder1b;

architecture adder1b_arch of adder1b is
	signal X_Y, Y_X, CIN_X, CIN_Y: STD_LOGIC;
	component XOR2 port (I0,I1: in STD_LOGIC; O: out STD_LOGIC); end component;
	component AND2 port (I0,I1: in STD_LOGIC; O: out STD_LOGIC); end component;
	component OR3 port (I0,I1, I2: in STD_LOGIC; O: out STD_LOGIC); end component;
 
begin
	U1: XOR2 port map (I0=>X, I1=>Y, O=>X_Y);
	U2: XOR2 port map (I0=>X_Y, I1=>CIN, O=>S);
	U3: AND2 port map (I0=>CIN, I1=>X, O=>CIN_X);
	U4: AND2 port map (I0=>CIN, I1=>Y, O=>CIN_Y);
	U5: AND2 port map (I0=>Y, I1=>X, O=>Y_X);
	U6: OR3 port map (I0=>CIN_X, I1=>CIN_Y, I2=>Y_X, O=>COUT);
	
end adder1b_arch;


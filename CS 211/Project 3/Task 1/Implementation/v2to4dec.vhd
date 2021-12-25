----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:44:25 04/17/2021 
-- Design Name: 
-- Module Name:    v2to4dec - Behavioral 
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
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity v2to4dec is
   port ( EN : in    std_logic; 
          I0 : in    std_logic; 
          I1 : in    std_logic; 
          Y0 : out   std_logic; 
          Y1 : out   std_logic; 
          Y2 : out   std_logic; 
          Y3 : out   std_logic);
end v2to4dec;

architecture v2to4dec_arch of v2to4dec is
   signal I0_INV, I1_INV : std_logic;
   component INV port (I: in std_logic; O: out std_logic); end component;  
   component AND3 port (I0: in std_logic; I1: in std_logic; I2 : in std_logic; O: out std_logic); end component;
   
begin
   U1: INV port map (I=>I0, O=>I0_INV);
   U2: INV port map (I=>I1, O=>I1_INV);
   U3: AND3 port map (I0=>EN, I1=>I1_INV, I2=>I0_INV, O=>Y0);
   U4: AND3 port map (I0=>EN, I1=>I1_INV, I2=>I0, O=>Y1);
   U5: AND3 port map (I0=>EN, I1=>I1, I2=>I0_INV, O=>Y2);
   U6: AND3 port map (I0=>EN, I1=>I1, I2=>I0,O=>Y3);
   
end v2to4dec_arch;
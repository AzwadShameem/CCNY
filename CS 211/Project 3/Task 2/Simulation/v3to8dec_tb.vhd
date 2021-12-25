--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:00:47 04/17/2021
-- Design Name:   
-- Module Name:   /home/student/Desktop/task2/v3to8dec_tb.vhd
-- Project Name:  task2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: v3to8dec
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY v3to8dec_testbench IS
END v3to8dec_testbench;
 
ARCHITECTURE behavior OF v3to8dec_testbench IS 
 
    COMPONENT v3to8dec PORT(
         A : IN  std_logic_vector(2 downto 0);
         EN : IN  std_logic;
         O : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   signal A : std_logic_vector(2 downto 0) := (others => '0');
   signal EN : std_logic := '0';
   signal O : std_logic_vector(7 downto 0);
	
BEGIN
   uut: v3to8dec PORT MAP (
          A => A,
          EN => EN,
          O => O );

   stim_proc: process
   begin        
        EN<='0'; A<="000"; wait for 10ns;
        EN<='0'; A<="001"; wait for 10ns;
        EN<='0'; A<="010"; wait for 10ns;
        EN<='0'; A<="011"; wait for 10ns;
        EN<='0'; A<="100"; wait for 10ns;
        EN<='0'; A<="101"; wait for 10ns;
        EN<='0'; A<="110"; wait for 10ns;
        EN<='0'; A<="111"; wait for 10ns;
        
        EN<='1'; A<="000"; wait for 10ns;
        EN<='1'; A<="001"; wait for 10ns;
        EN<='1'; A<="010"; wait for 10ns;
        EN<='1'; A<="011"; wait for 10ns;
        EN<='1'; A<="100"; wait for 10ns;
        EN<='1'; A<="101"; wait for 10ns;
        EN<='1'; A<="110"; wait for 10ns;
        EN<='1'; A<="111"; wait for 10ns;
      wait;
   end process;
END;
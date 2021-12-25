--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:06:57 04/17/2021
-- Design Name:   
-- Module Name:   /home/student/Desktop/task2/adder4b_tb.vhd
-- Project Name:  task2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder4b
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
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_signed.ALL;
ENTITY adder4b_tb IS
END adder4b_tb;
ARCHITECTURE behavior OF adder4b_tb IS 
    COMPONENT adder4b PORT(
            X : IN std_logic_vector(3 downto 0);
            Y : IN std_logic_vector(3 downto 0);       
            S : OUT std_logic_vector(3 downto 0);
            CIN : IN std_logic;
            COUT : OUT std_logic
        );
    END COMPONENT;
    --Inputs
    signal X :  std_logic_vector(3 downto 0) := (others => '0');
    signal Y :  std_logic_vector(3 downto 0) := (others => '0');
    signal CIN : std_logic := '0'; 
    --Outputs
    signal S : std_logic_vector(3 downto 0);
    signal COUT : std_logic;
BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: adder4b PORT MAP (X => X, Y => Y, S => S, CIN => CIN, COUT => COUT);
    -- Stimulus Process
    stim_proc: process
    begin
        -- hold reset state for 10 ns.
        wait for 10 ns;
        -- insert stimulus here
        CIN <= '0';
        for i in 0 to 15 loop
            X <= std_logic_vector(to_unsigned(i,4));
            for j in 0 to 15 loop
                Y <= std_logic_vector(to_unsigned(j,4));
                wait for 2 ns;
            end loop;
        end loop;
        CIN <= '1';
        for i in 0 to 15 loop
            X <= std_logic_vector(to_unsigned(i,4));
            for j in 0 to 15 loop
                Y <= std_logic_vector(to_unsigned(j,4));
                wait for 2 ns;
            end loop;
        end loop;
        wait;
    end process;
END;
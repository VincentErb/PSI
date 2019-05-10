--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:17:48 05/07/2019
-- Design Name:   
-- Module Name:   /home/arens/Documents/SysInfo/PSI/Processeur/Processor/tb_UAL.vhd
-- Project Name:  Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UAL
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_UAL IS
END tb_UAL;
 
ARCHITECTURE behavior OF tb_UAL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UAL
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Ctrl : IN  std_logic_vector(2 downto 0);
         S : OUT  std_logic_vector(7 downto 0);
         Z : OUT  std_logic;
         V : OUT  std_logic;
         C : OUT  std_logic;
         Nf : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Ctrl : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
   signal Z : std_logic;
   signal V : std_logic;
   signal C : std_logic;
   signal Nf : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UAL PORT MAP (
          A => A,
          B => B,
          Ctrl => Ctrl,
          S => S,
          Z => Z,
          V => V,
          C => C,
          Nf => Nf
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


	 --=====================
	 --ARITHMETIC OPERATIONS
	 --=====================
		
      -- 3+2 = 5, no flags
		-- A <= X"03";
		-- B <= X"02";
		-- Ctrl <= "001";
		-- wait for 100 ns;
		
		-- 2*5 = 10, no flags
		-- A <= X"02";
		-- B <= X"05";
		-- Ctrl <= "011";
		-- wait for 100 ns;
		
		-- 2-4 = -2, Nf flag
		A <= X"02";
		B <= X"04";
		Ctrl <= "010";
		wait for 100 ns;
		
		-- FF+FF = C + N flag
		A <= X"ff";
		B <= X"ff";
		Ctrl <= "001";
		wait for 100 ns;
		
		-- 7F+7F = V + N flag
		A <= "01111111";
		B <= "01111111";
		Ctrl <= "001";
		wait for 100 ns;
		
		-- 2-2 = 0, Z flag
		A <= X"02";
		B <= X"02";
		Ctrl <= "010";
		wait for 100 ns;
		
	 --=====================
	 --LOGIC OPERATIONS
	 --=====================
		-- DIFZ OK
		Ctrl <= "100";
		wait for 100 ns;
		A<= X"00";
		
		-- NOT OK
		Ctrl <= "101";
		wait for 100 ns;
		A<= X"05";
		wait for 100 ns;
		
		-- A < B
		Ctrl <= "110";
		wait for 100 ns;
		A <= X"01";
		
      wait;
   end process;

END;

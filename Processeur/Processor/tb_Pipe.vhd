--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:45:43 05/13/2019
-- Design Name:   
-- Module Name:   /home/arens/Documents/SysInfo/PSI/Processeur/Processor/tb_Pipe.vhd
-- Project Name:  Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Pipe
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
 
ENTITY tb_Pipe IS
END tb_Pipe;
 
ARCHITECTURE behavior OF tb_Pipe IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Pipe
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         C : IN  std_logic_vector(7 downto 0);
         Op : IN  std_logic_vector(7 downto 0);
         Clk : IN  std_logic;
         eA : OUT  std_logic_vector(7 downto 0);
         eB : OUT  std_logic_vector(7 downto 0);
         eC : OUT  std_logic_vector(7 downto 0);
         eOp : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal C : std_logic_vector(7 downto 0) := (others => '0');
   signal Op : std_logic_vector(7 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal eA : std_logic_vector(7 downto 0);
   signal eB : std_logic_vector(7 downto 0);
   signal eC : std_logic_vector(7 downto 0);
   signal eOp : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Pipe PORT MAP (
          A => A,
          B => B,
          C => C,
          Op => Op,
          Clk => Clk,
          eA => eA,
          eB => eB,
          eC => eC,
          eOp => eOp
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;
		
		A  <= x"01";
		B  <= x"02";
		C  <= x"03";
		Op <= x"04";
		
      wait;
   end process;

END;

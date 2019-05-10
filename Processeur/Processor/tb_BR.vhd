--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:43:51 05/10/2019
-- Design Name:   
-- Module Name:   /home/arens/Documents/SysInfo/PSI/Processeur/Processor/tb_BR.vhd
-- Project Name:  Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BR
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
 
ENTITY tb_BR IS
END tb_BR;
 
ARCHITECTURE behavior OF tb_BR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BR
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic_vector(3 downto 0);
         aW : IN  std_logic;
         Data : IN  std_logic_vector(7 downto 0);
         Rst : IN  std_logic;
         Clk : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic_vector(3 downto 0) := (others => '0');
   signal aW : std_logic := '0';
   signal Data : std_logic_vector(7 downto 0) := (others => '0');
   signal Rst : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BR PORT MAP (
          A => A,
          B => B,
          W => W,
          aW => aW,
          Data => Data,
          Rst => Rst,
          Clk => Clk,
          QA => QA,
          QB => QB
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
      -- insert stimulus here
		Rst <= '0';
		wait for Clk_period*10;
		Rst <= '1';
		aW <= '1';
		W <= x"0";
		Data <= "10101010";
		wait for Clk_period*10;
		W <= x"F";
		Data <= "01100110";
		B <= x"F";
		

      wait;
   end process;

END;

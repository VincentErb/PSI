--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:11:16 05/13/2019
-- Design Name:   
-- Module Name:   /home/arens/Documents/SysInfo/PSI/Processeur/Processor/tb_INST.vhd
-- Project Name:  Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instr_memory
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
 
ENTITY tb_INST IS
END tb_INST;
 
ARCHITECTURE behavior OF tb_INST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instr_memory
    PORT(
         sel : IN  std_logic_vector(15 downto 0);
         qA : OUT  std_logic_vector(7 downto 0);
         qB : OUT  std_logic_vector(7 downto 0);
         qC : OUT  std_logic_vector(7 downto 0);
         qOp : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal qA : std_logic_vector(7 downto 0);
   signal qB : std_logic_vector(7 downto 0);
   signal qC : std_logic_vector(7 downto 0);
   signal qOp : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instr_memory PORT MAP (
          sel => sel,
          qA => qA,
          qB => qB,
          qC => qC,
          qOp => qOp
        );


   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	

      -- insert stimulus here 
		sel <= x"0000";
	
      wait for 100 ns;	
		
		sel <= x"0001";

      wait;
   end process;

END;

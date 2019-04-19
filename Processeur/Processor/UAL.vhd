----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:55 04/19/2019 
-- Design Name: 
-- Module Name:    UAL - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UAL is
	generic(N:natural :=8);
	port(	-- Entries
			A    : in  std_logic_vector(N-1 downto 0);
			B 	  : in  std_logic_vector(N-1 downto 0);
			-- Operation
			Ctrl : in std_logic_vector(2 downto 0);
			-- Result
			S    : out std_logic_vector(N-1 downto 0);
			-- Flags
			Z	  : out std_logic; -- Zero
			O	  : out std_logic; -- Overflow
			C    : out std_logic; -- Carry
			N    : out std_logic  -- Negative
	);
end UAL;

architecture Behavioral of UAL is
	signal  Add   : std_logic_vector(N downto 0);
	signal  Sub   : std_logic_vector(N-1 downto 0);
	signal  Mul   : std_logic_vector(N-1 downto 0);
	signal  Difz  : std_logic_vector(1 downto 0);
	signal  Nott  : std_logic_vector(1 downto 0);
	signal  Inf   : std_logic_vector(1 downto 0);
	constant Zeros: std_logic_vector(N-2 downto 0) := (others => '0');
	
begin
	S <= Add(N-1 downto 0) 	when Ctrl=x"001";
		  Sub 					when Ctrl=x"010";
		  Mul(N-1 downto 0) 	when Ctrl=x"011";
		  Zeros&Difz 			when Ctrl=x"100";
		  Zeros&Nott			when Ctrl=x"101";
		  Zeros&Inf				when Ctrl=x"110"
		  
	Add <= 			
	
	
	--(Zeros&A) + (Zeros&B) 
	--		(Zeros&A) - (Zeros&B)  
	--	A * B  
	-- 00000000&(A / B) when Ctrl=x"100" --else -- on peut pas car trop gros physiquement
				
	
	

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:10:42 05/13/2019 
-- Design Name: 
-- Module Name:    Pipe - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Pipe is
	generic(N:natural :=8);
	port (-- Entries
			A     : in  std_logic_vector(N-1 downto 0);
			B  	: in  std_logic_vector(N-1 downto 0);
			C  	: in  std_logic_vector(N-1 downto 0);
			Op 	: in  std_logic_vector(N-1 downto 0);

			Clk	: in  std_logic;
			-- Exits
			eA    : out std_logic_vector(N-1 downto 0);
			eB  	: out std_logic_vector(N-1 downto 0);
			eC  	: out std_logic_vector(N-1 downto 0);
			eOp 	: out std_logic_vector(N-1 downto 0)
			);
end Pipe;



architecture Behavioral of Pipe is 
	
begin
	
	process 
	begin
		wait until Clk' event and Clk='1'; -- front montant d'horloge
			eA  <= A;
			eB  <= B;
			eC  <= C;
			eOp <= Op;
	end process;
	

end Behavioral;


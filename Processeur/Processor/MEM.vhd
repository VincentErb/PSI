----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:01:21 05/10/2019 
-- Design Name: 
-- Module Name:    MEM - Behavioral 
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
USE ieee.numeric_std.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MEM is
	generic(N:natural :=8);
	port (
			-- DATA MEMORY
			-- Entries
			Adrd     : in  std_logic_vector(7 downto 0);
			Inp  	: in  std_logic_vector(N-1 downto 0);
			Rw		: in  std_logic;
			Rst	: in  std_logic; 	-- 0 -> active
			Clk	: in  std_logic;
			-- Exits
			Outd   : out std_logic_vector(N-1 downto 0)
			
			);
end MEM;



architecture Behavioral of MEM is
	type memory is array (0 to 255) of std_logic_vector(N-1 downto 0);
	signal  arrayMem : memory;    
	
begin
	-- DATA MEMORY
	process 
	begin
		wait until Clk' event and Clk='1'; -- front montant d'horloge
		--Reset
		if RST='0' then 
			arrayMem <= (others => (others => '0'));
		--Reading
		elsif Rw='1' then 
			Outd <= arrayMem(to_integer(unsigned(Adrd)));
		--Writing
		elsif Rw='0' then 
			arrayMem(to_integer(unsigned(Adrd))) <= Inp;
		end if;
	end process;
	

end Behavioral;



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:33:37 05/10/2019 
-- Design Name: 
-- Module Name:    BR - Behavioral 
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

entity BR is
	generic(N:natural :=8);
	port (-- Entries
			A     : in  std_logic_vector(3 downto 0);
			B  	: in  std_logic_vector(3 downto 0);
			W		: in  std_logic_vector(3 downto 0);
			aW		: in  std_logic; 	-- 1 -> active
			Data 	: in  std_logic_vector(N-1 downto 0);
			Rst	: in  std_logic; 	-- 0 -> active
			Clk	: in  std_logic;
			-- Exits
			QA    : out std_logic_vector(N-1 downto 0);
			QB    : out std_logic_vector(N-1 downto 0)
			);
end BR;



architecture Behavioral of BR is
	type registers is array (0 to N*2-1) of std_logic_vector(N-1 downto 0);
	signal  arrayReg : registers;    
	
begin
	-- Writing + reset synchronous (process)+ Reading asysnchronous
	
	-- Reading
	QA <= Data when Rst='1' and aW='1' and W=A else	--bypass writing on reading
		arrayReg(to_integer(unsigned(A))) ;
	QB <= Data when Rst='1' and aW='1' and W=B else	--bypass writing on reading
		   arrayReg(to_integer(unsigned(B))) ;		
	
	process 
	begin
		wait until Clk' event and Clk='1'; -- front montant d'horloge
		--Reset
		if RST='0' then 
			arrayReg <= (others => (others => '0'));
		--Writing
		elsif aW='1' then 
			arrayReg(to_integer(unsigned(W))) <= DATA;
		end if;
	end process;
	

end Behavioral;


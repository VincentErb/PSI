----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:19:54 03/20/2019 
-- Design Name: 
-- Module Name:    Compteur8bitSynchrone - Behavioral 
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

entity Compteur8bitSynchrone is
	generic(N:natural :=8);
	port(CK,EN,SENS,RST,LOAD : in std_logic;
			
			Din:in std_logic_vector(N-1 downto 0);
			Dout: out std_logic_vector(N-1 downto 0)
	);
			
end Compteur8bitSynchrone;

architecture Behavioral of Compteur8bitSynchrone is
	signal D: std_logic_vector(N-1 downto 0);
	--constant A: std_logic_vector(N-1 downto 0) <= (Champ0 => 1,others => 0);
begin
	
	
	Dout<= D ;

	process -- car synchrone
	begin
		wait until CK' event and CK='1'; -- front montant d'horloge
		if RST='0' then D <= (others => '0');
		elsif LOAD='1' then D <= Din ;
		elsif EN='0' and SENS='1' then D <= D + 1 ;
		elsif EN='0' and SENS='0' then D <= D - 1 ;
		end if	;
	end process;

end Behavioral;


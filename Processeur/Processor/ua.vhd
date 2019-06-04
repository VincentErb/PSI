----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:44:06 05/28/2019 
-- Design Name: 
-- Module Name:    ua - Behavioral 
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

entity ua is
generic(N:natural :=8);
port(
		P1_IN_OP, P1_IN_A, P1_IN_B, P1_IN_C : in std_logic_vector(N-1 downto 0);
		P2_IN_OP, P2_IN_A, P2_IN_B, P2_IN_C, P2_OUT_OP, P2_OUT_A, P2_OUT_B, P2_OUT_C : in std_logic_vector(N-1 downto 0);
		P3_IN_OP, P3_IN_A, P3_IN_B, P3_IN_C, P3_OUT_OP, P3_OUT_A, P3_OUT_B, P3_OUT_C : in std_logic_vector(N-1 downto 0);
		P4_IN_OP, P4_IN_A, P4_IN_B, P4_IN_C : in std_logic_vector(N-1 downto 0);
		alea : out std_logic
	);
	
end ua;

architecture Behavioral of ua is
	
begin
	process -- car synchrone
	begin
		wait until CK' event and CK='1'; -- front montant d'horloge
		if 
		or 
		or 
		or 
		
		then
			alea <= '1';
		else
			alea <= '0';
end if;
	end process;


end Behavioral;


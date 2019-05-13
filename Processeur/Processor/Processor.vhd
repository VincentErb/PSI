----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:19:45 05/13/2019 
-- Design Name: 
-- Module Name:    Processor - Behavioral 
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

entity Processor is
	generic(N:natural :=8);
end Processor;

architecture Behavioral of Processor is
	type stage_record is record
		op 		: std_logic_vector(N-1 downto 0);
		a, b, c  : std_logic_vector(N-1 downto 0);
	end record;
	
	signal li, di, me, ex, re : stage_record; 
	
	------- Compteur -------
	 COMPONENT CompteurSynchrone
    PORT(
         CK		: IN  std_logic;
         EN 	: IN  std_logic;
         SENS 	: IN  std_logic;
         RST 	: IN  std_logic;
         LOAD 	: IN  std_logic;
         Din	: IN  std_logic_vector(15 downto 0);
         Dout  : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    	
	------- Memoire d'instructions -------
	 COMPONENT instr_memory
    PORT(
         sel : IN  std_logic_vector(15 downto 0);
         qA  : OUT  std_logic_vector(7 downto 0);
         qB  : OUT  std_logic_vector(7 downto 0);
         qC  : OUT  std_logic_vector(7 downto 0);
         qOp : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	------- Banc de registre -------
	 COMPONENT BR
    PORT(
         A		: IN  std_logic_vector(3 downto 0);
         B 		: IN  std_logic_vector(3 downto 0);
         W 		: IN  std_logic_vector(3 downto 0);
         aW 	: IN  std_logic;
         Data 	: IN  std_logic_vector(7 downto 0);
         Rst 	: IN  std_logic;
         Clk 	: IN  std_logic;
         QA 	: OUT  std_logic_vector(7 downto 0);
         QB 	: OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	------- UAL -------
	 COMPONENT UAL
    PORT(
         A 		: IN  std_logic_vector(7 downto 0);
         B 		: IN  std_logic_vector(7 downto 0);
         Ctrl 	: IN  std_logic_vector(2 downto 0);
         S 		: OUT  std_logic_vector(7 downto 0);
         Z 		: OUT  std_logic;
         V 		: OUT  std_logic;
         C 		: OUT  std_logic;
         Nf 	: OUT  std_logic
        );
    END COMPONENT;
    
	------- Memoire -------
	 COMPONENT MEM
    PORT(
         Adrd : IN  std_logic_vector(7 downto 0);
         Inp  : IN  std_logic_vector(7 downto 0);
         Rw   : IN  std_logic;
         Rst  : IN  std_logic;
         Clk  : IN  std_logic;
         Outd : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	------- Pipelines -------
	 COMPONENT Pipe
    PORT(
         A	 : IN  std_logic_vector(7 downto 0);
         B 	 : IN  std_logic_vector(7 downto 0);
         C 	 : IN  std_logic_vector(7 downto 0);
         Op  : IN  std_logic_vector(7 downto 0);
         Clk : IN  std_logic;
         eA  : OUT  std_logic_vector(7 downto 0);
         eB  : OUT  std_logic_vector(7 downto 0);
         eC  : OUT  std_logic_vector(7 downto 0);
         eOp : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
begin

	

end Behavioral;


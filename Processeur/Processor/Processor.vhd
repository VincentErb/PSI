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
	port(Clk : in std_logic;
		  Rst : in std_logic
		  );
end Processor;

architecture Behavioral of Processor is
	
	
	------- Compteur -------
	 COMPONENT CompteurSynchrone
    PORT(
         CK		: IN  std_logic;
         EN 	: IN  std_logic;
         SENS 	: IN  std_logic;
         RST 	: IN  std_logic;
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
         aW 	: IN  std_logic; -- 1 -> active
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
	 
	 
	------------------------
	---------Signal---------
	------------------------
	--signal Clk : std_logic := '0';

	------- Compteur -------
	--Inputs
   signal cpt_EN 		: std_logic := '0';
   signal cpt_SENS 	: std_logic := '0';
   signal cpt_RST 	: std_logic := '0';
 	--Outputs
   signal cpt_Dout 	: std_logic_vector(15 downto 0);
    	
	------- Memoire d'instructions -------
	 --Inputs
   --signal mi_sel 		: std_logic_vector(15 downto 0) := (others => '0'); --cpt_Dout

 	--Outputs
   signal mi_qA 		: std_logic_vector(7 downto 0);
   signal mi_qB 		: std_logic_vector(7 downto 0);
   signal mi_qC 		: std_logic_vector(7 downto 0);
   signal mi_qOp 		: std_logic_vector(7 downto 0);
	
	------- Banc de registre -------
	 --Inputs
   signal br_A 		: std_logic_vector(3 downto 0) := (others => '0');
   signal br_B 		: std_logic_vector(3 downto 0) := (others => '0');
   signal br_W 		: std_logic_vector(3 downto 0) := (others => '0');
   signal br_aW 		: std_logic := '0';
   signal br_Data		: std_logic_vector(7 downto 0) := (others => '0');
   signal br_Rst 		: std_logic := '0';

 	--Outputs
   signal br_QA 		: std_logic_vector(7 downto 0);
   signal br_QB 		: std_logic_vector(7 downto 0);
	 
	------- UAL -------
	--Inputs
   signal ual_A	   : std_logic_vector(7 downto 0) := (others => '0');
   signal ual_B 		: std_logic_vector(7 downto 0) := (others => '0');
   signal ual_Ctrl 	: std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal ual_S 		: std_logic_vector(7 downto 0);
   signal ual_Z 		: std_logic;
   signal ual_V 		: std_logic;
   signal ual_C 		: std_logic;
   signal ual_Nf	   : std_logic;
    
	------- Memoire -------
	--Inputs
   signal mem_Adrd 	: std_logic_vector(7 downto 0) := (others => '0');
   signal mem_Inp 	: std_logic_vector(7 downto 0) := (others => '0');
   signal mem_Rw 		: std_logic := '0';
   signal mem_Rst 	: std_logic := '0';

 	--Outputs
   signal mem_Outd	: std_logic_vector(7 downto 0);
	 
	------- Pipelines -------
	 type stage_record is record
		Op, eOp			: std_logic_vector(N-1 downto 0);
		A, B, C  		: std_logic_vector(N-1 downto 0);
		eA,eB, eC		: std_logic_vector(N-1 downto 0);
	end record;
	
	
	signal liDi, diEx, exMem, memRe : stage_record; 
	
	signal ual_lc, mem_lc, re_lc    : std_logic := '0';
	
begin
	------------------------
	-----Instanciation------
	------------------------
	------- Compteur -------
	cpt_uut: CompteurSynchrone PORT MAP (
				CK 	=> Clk,
				EN 	=> '0',
				SENS 	=> '1',
				RST	=> Rst,
				Dout 	=> cpt_Dout
        );

	------- Memoire d'instructions -------
	mi_uut: 	instr_memory PORT MAP (
				sel => cpt_Dout,
				qA	 => mi_qA,
				qB  => mi_qB,
				qC  => mi_qC,
				qOp => mi_qOp
        );
	----------- Pipeline -----------
	liDi_uut: Pipe PORT MAP (
				 A 	=> mi_qA,
				 B 	=> mi_qB,
				 C 	=> mi_qC,
				 Op 	=> mi_qOp,
				 Clk 	=> Clk,
			  	 eA 	=> liDi.eA,
				 eB	=> liDi.eB,
				 eC 	=> liDi.eC,
				 eOp 	=> liDi.eOp
       );
		  
		 
	------- Banc de registre -------
	 br_uut: BR PORT MAP (
				A 		=> br_A,
				B 		=> br_B,
				W 		=> memRe.eA(3 downto 0),
				aW 	=> re_lc,-- 1-> active
				Data 	=> memRe.eB,
				Rst	=> Rst,
				Clk	=> Clk,
				QA		=> br_QA,
				QB		=> br_QB
        );

	----------- Pipeline -----------
	diEx_uut: Pipe PORT MAP (
				 A 	=> liDi.eA,
				 B 	=> liDi.eB,
				 C 	=>	liDi.eC,
				 Op 	=> liDi.eOp,
				 Clk 	=> Clk,
				 eA 	=> diEx.eA,
				 eB	=> diEx.eB,
				 eC 	=> diEx.eC,
				 eOp 	=> diEx.eOp
        );
	------- UAL -------
	ual_uut: UAL PORT MAP (
				A	   => ual_A,
				B 	   => ual_B,
				Ctrl  => ual_Ctrl,
				S 	   => ual_S,
				Z	   => ual_Z,
				V 	   => ual_V,
				C 	   => ual_C,
				Nf    => ual_Nf
        );
	----------- Pipeline -----------
	exMem_uut: Pipe PORT MAP (
				 A 	=> diEx.eA,
				 B 	=> diEx.eB,
				 C 	=>	(others => '0'),
				 Op 	=> diEx.eOp,
				 Clk 	=> Clk,
				 eA 	=> exMem.eA,
				 eB	=> exMem.eB,
				 eC 	=> open,
				 eOp 	=> exMem.eOp
        );  
    
	------- Memoire -------
	mem_uut: MEM PORT MAP (
				Adrd  => mem_Adrd,
				Inp 	=> mem_Inp,
				Rw 	=> mem_Rw,
				Rst 	=> mem_Rst,
				Clk 	=> Clk,
				Outd 	=> mem_Outd
        );
	----------- Pipeline -----------
	memRe_uut: Pipe PORT MAP (
				 A 	=> exMem.eA,
				 B 	=> exMem.eB,
				 C 	=>	(others => '0'),
				 Op 	=> exMem.eOp,
				 Clk 	=> Clk,
				 eA 	=> memRe.eA,
				 eB	=> memRe.eB,
				 eC 	=> open,
				 eOp 	=> memRe.eOp
     );  	  
		  
	 re_lc <= '1' when memRe.eOp=x"06" else '0';
	

end Behavioral;


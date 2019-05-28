library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.common.all;


entity instr_memory is
	generic(
		LEN_REG: natural := 8;
		LEN_SEL: natural := 16;
		LEN_INSTR: natural := 32
	);
	port(
		sel: in std_logic_vector(LEN_SEL-1 downto 0);
		qA: out std_logic_vector(LEN_REG-1 downto 0);
		qB: out std_logic_vector(LEN_REG-1 downto 0);
		qC: out std_logic_vector(LEN_REG-1 downto 0);
		qOp: out std_logic_vector(LEN_REG-1 downto 0)
	);
end entity;


architecture beh of instr_memory is

	--signal instr_memory: instrArray := init_rom(filename => "<path_to_your_code>");

	signal instr_memory: instrArray := (
		0 => x"060004FF", --AFC r0, 4
		1 => x"FFFFFFFF",
		2 => x"FFFFFFFF", 
		3 => x"FFFFFFFF",
		4 => x"FFFFFFFF",
		5 => x"081400FF", -- STORE @14 r0
--		5 => x"050100FF", -- COP r1 r0
		6 => x"FFFFFFFF",
		7 => x"FFFFFFFF", 
		8 => x"FFFFFFFF",
		9 => x"FFFFFFFF",
		10 => x"070114FF", -- LOAD r1 @14
		
		11 => x"FFFFFFFF",
		12 => x"FFFFFFFF", 
		13 => x"FFFFFFFF",
		14 => x"FFFFFFFF",
		15 => x"060007FF", --AFC r0, 7
		16 => x"FFFFFFFF",
		17 => x"FFFFFFFF", 
		18 => x"FFFFFFFF",
		19 => x"FFFFFFFF",
		20 => x"085500FF", -- STORE @55 r0
--		5 => x"050100FF", -- COP r1 r0
		21 => x"FFFFFFFF",
		22 => x"FFFFFFFF", 
		23 => x"FFFFFFFF",
		24 => x"FFFFFFFF",
		25 => x"070255FF", -- LOAD r2 @55
--		10 => x"01020001", --ADD r2 r0 r1
--		11 => x"02030001", --MUL r3 r0 r1
--		12 => x"03010001", --SOU r1 r0 r1
--		13 => x"FFFFFFFF",
--		14 => x"FFFFFFFF", 
--		15 => x"FFFFFFFF",
--		16 => x"FFFFFFFF",
--		17 => x"090400FF", --DIFZ r4 r0
--		18 => x"0A0501FF", --NOTT r5 r1
--		19 => x"0B060003", --INF r6 r0 r3
		
		
		
		
		others => x"FFFFFFFF"
	);
	signal q : std_logic_vector(LEN_INSTR-1 downto 0);

begin

	q   <= instr_memory(to_integer(unsigned(sel)));
	qA  <= q(LEN_INSTR-LEN_REG-1 	 downto LEN_INSTR- 2*LEN_REG);
	qB  <= q(LEN_INSTR-2*LEN_REG-1 downto LEN_INSTR- 3*LEN_REG);
	qC  <= q(LEN_INSTR-3*LEN_REG-1 downto 0);
	qOp <= q(LEN_INSTR-1			 	 downto LEN_INSTR- LEN_REG);

end architecture;


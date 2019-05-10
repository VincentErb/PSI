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
			V	  : out std_logic; -- Overflow
			C    : out std_logic; -- Carry
			Nf    : out std_logic  -- Negative
	);
end UAL;

architecture Behavioral of UAL is
	signal  Add   : std_logic_vector(N downto 0);
	signal  Sub   : std_logic_vector(N-1 downto 0);
	signal  Mul   : std_logic_vector(N*2-1 downto 0);
	signal  Difz  : std_logic;
	signal  Nott  : std_logic;
	signal  Inf   : std_logic;
	
	constant Zeros7: std_logic_vector(N-2 downto 0) := (others => '0');
	constant Zeros8: std_logic_vector(N-1 downto 0) := (others => '0');
	constant Zeros16: std_logic_vector(N*2-1 downto 0) := (others => '0');
	
begin
	S 	<= Add(N-1 downto 0) 	when Ctrl="001" else
			Sub 						when Ctrl="010" else
			Mul(N-1 downto 0) 	when Ctrl="011" else
			Zeros7&Difz 			when Ctrl="100" else
			Zeros7&Nott				when Ctrl="101" else
			Zeros7&Inf				when Ctrl="110" else
			Zeros8 ;
		  
	Add  <= 	('0' & A) + ('0' & B);
	Sub  <= 	A - B;
	Mul  <=  A * B;
	Difz <=  '1' 					when A /= Zeros8 else
				'0' ; 
	Nott <=  '1' 					when A = Zeros8 else
			   '0' ;
	Inf  <=  '1' 					when A < B else
			   '0' ;
	
	Z <= 		'1'					when Ctrl="001" and Add = x"0"&Zeros8	else -- add
				'1'					when Ctrl="010" and Sub = Zeros8 		else -- sub
				'1'					when Ctrl="011" and Mul = Zeros16 		else -- mul
				'0';
				
	V <= 		'1'					when Ctrl="001" and (A(A'high) = B(B'high) and Add(Add'high-1) /= A(A'high))	 				else -- add
				'1' 					when Ctrl="010" and (A(A'high) = '0'	  	 and B(B'high) = '1' and Sub(Sub'high) = '1') 	else -- sub
				'1' 					when Ctrl="010" and (A(A'high) = '1'   	 and B(B'high) = '0' and Sub(Sub'high) = '0') 	else -- sub
				'1'					when Ctrl="011" and Mul(N*2-1 downto N) /= Zeros8 else -- mul
				'0';
	
	C <=  	'1'					when Ctrl="001" and Add(Add'high) = '1' else -- add
				'0';
	
	Nf <= 	'1'					when Ctrl="001" and Add(Add'high-1) = '1' else -- add
				'1'					when Ctrl="010" and Sub(Sub'high) = '1' else -- sub
				'1' 					when Ctrl="011" and Mul(Mul'high) = '1' else -- mul
				'0';
	
				--  A <= x"0000000" after 100ns, x"1111111" after 100ns;
	
	

end Behavioral;


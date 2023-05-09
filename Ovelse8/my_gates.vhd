library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity my_gates is
	port
	( 
		-- inputs
		a: in std_logic;
		b: in std_logic;

		-- outputs
		and_out: out std_logic;
		or_out: out std_logic;
		xor_out: out std_logic
	);
end my_gates;

architecture my_gates_impl of my_gates is
	-- XOR function
	function my_xor (a: std_logic; b: std_logic) return std_logic is
	begin
		return (a xor b);
	end my_xor;
	
	-- AND OR procedure
	procedure my_and_or (a: in std_logic; b: in std_logic; signal and_out: out std_logic; signal or_out: out std_logic) is
	begin
		and_out <= (a and b);
		or_out <= (a or b);
	end my_and_or;

begin
	-- Run XOR function
	xor_out <= my_xor(a, b);
	
	-- Run AND OR procedure
	my_and_or(a, b, and_out, or_out);
	
end my_gates_impl;
 
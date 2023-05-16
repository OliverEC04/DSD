library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package my_gates_package is

	function my_xor (a: std_logic; b: std_logic) return std_logic;
	procedure my_and_or (a: in std_logic; b: in std_logic; signal and_out: out std_logic; signal or_out: out std_logic);

end my_gates_package;

package body my_gates_package is

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
	
end my_gates_package;

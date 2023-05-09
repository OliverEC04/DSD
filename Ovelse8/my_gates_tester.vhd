library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.my_gates_package.all;

entity my_gates_tester is
	port
	( 
		-- inputs
		SW : in std_logic_vector(1 downto 0);

		-- outputs
		LEDR : out std_logic_vector(2 downto 0)
	);
end my_gates_tester;

architecture my_gates_tester_impl of my_gates_tester is
begin

	LEDR(0) <= my_xor(SW(0), SW(1));
	
	my_and_or(SW(0), SW(1), LEDR(1), LEDR(2));

end my_gates_tester_impl;
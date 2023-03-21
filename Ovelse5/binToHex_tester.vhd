library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binToHex_tester is
	
	port 
	(
		SW	   : in std_logic_vector	(3 downto 0);
		hex0 : out std_logic_vector (6 downto 0)
	);

end entity;

ARCHITECTURE bintoHex_tester_impl OF bintoHex_tester IS
BEGIN
dut: entity work.binToHex
	port map 
	(
		bin => sw,
		segment => hex0
	);

END binToHex_tester_impl;
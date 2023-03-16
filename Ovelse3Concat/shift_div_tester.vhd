library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


entity shift_div_tester is 
port(
GreenLeds 	: out std_logic_vector(7 downto 0);
RedLeds 		: out std_logic_vector(15 downto 0);
Switches		: in std_logic_vector(7 downto 0)
);
end entity;

architecture tester_impl of shift_div_tester is 
begin
start: entity shift_div port map(
	a => Switches (7 downto 0),

	a_shl => RedLeds (15 downto 8),
	
	a_shr => GreenLeds (7 downto 0),
	
	a_ror => RedLeds (7 downto 0)
);
end architecture;
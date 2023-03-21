library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binToHex is

	
	
	port 
	(
		bin	   : in std_logic_vector	(3 downto 0);
		segment : out std_logic_vector (6 downto 0)
	);

end entity;

architecture binToHex_impl of binToHex is
begin

	

end binToHex_impl;

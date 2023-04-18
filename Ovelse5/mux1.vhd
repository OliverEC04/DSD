library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux1 is 

	port 
	(
		show	  		: in std_logic;
		secret_value: in std_logic_vector(7 downto 0);
		input 		: in std_logic_vector(7 downto 0);
		bin 			: out std_logic_vector (3 downto 0)
	);

end entity;

architecture mux1_impl of mux1 is
begin
	
	
	bin <= std_logic_vector(to_unsigned(0, 4));
	
	process (show, input, secret_value)
	begin
		if show = '1' then
			bin <= secret_value(7 downto 4);
		else
			bin <= input(3 downto 0);
		end if;
	end process;
	
end mux1_impl;
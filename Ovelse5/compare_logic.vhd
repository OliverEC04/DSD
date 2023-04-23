library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compare_logic is
	port (
		-- inputs
		try : in std_logic;
		input : in std_logic_vector(7 downto 0);
		secret_value: in std_logic_vector(7 downto 0);
		
		-- outputs	
		result : out std_logic_vector(1 downto 0)
	);

end entity;

architecture compare_logic_impl of compare_logic is
begin
	process(input, secret_value)
	begin
		if try = '0' then
			if input < secret_value then
				result <= "01";
			elsif input > secret_value then
				result <= "10";
			elsif input = secret_value then
				result <= "11";
			end if;
		else
			result <= "00";
		end if;
	end process;
end architecture compare_logic_impl;

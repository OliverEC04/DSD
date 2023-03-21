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

	process(bin)
	begin
		case bin is
		when "0000" => segment <= "1000000"; -- 0
		when "0001" => segment <= "1111001"; -- 1
		when "0010" => segment <= "0100100"; -- 2
		when "0011" => segment <= "0110000"; -- 3
		when "0100" => segment <= "0011001"; -- 4
		when "0101" => segment <= "0010010"; -- 5
		when "0110" => segment <= "0000010"; -- 6
		when "0111" => segment <= "1111000"; -- 7
		when "1000" => segment <= "0000000"; -- 8
		when "1001" => segment <= "0010000"; -- 9
		when "1010" => segment <= "0001000"; -- A
		when "1011" => segment <= "0000011"; -- B
		when "1100" => segment <= "1000110"; -- C
		when "1101" => segment <= "0100001"; -- D
		when "1110" => segment <= "0000110"; -- E
		when "1111" => segment <= "0001110"; -- F
		end case;
	end process;
	
end binToHex_impl;

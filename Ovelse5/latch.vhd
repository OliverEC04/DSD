library ieee;
use ieee.std_logic_1164.all;


entity latch is
		port(
			input : in std_logic_vector(7 downto 0);
			secret_value : out std_logic_vector(7 downto 0);
			set : in std_logic
		);
		
end latch;


architecture latch_impl of latch is
begin
	secret_value <= input WHEN set = '0';
end;
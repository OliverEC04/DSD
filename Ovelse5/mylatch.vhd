library ieee;
use ieee.std_logic_1164.all;


entity mylatch is
		port(
			input : in std_logic_vector(7 downto 0);
			secret_value : out std_logic_vector(7 downto 0);
			set : in std_logic
		);
		
end mylatch;


architecture latch_impl of mylatch is
begin
	secret_value <= input WHEN set = '0';
end;
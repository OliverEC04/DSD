library ieee;
use ieee.std_logic_1164.all;


entity latch is

signal input : std_logic_vector(7 downto 0);
signal secret_value : std_logic_vector(7 downto 0);
signal set : std_logic;



end;


architecture latch_impl of latch is
begin
secret_value <= input WHEN set = '0';
end;
library ieee;
use ieee.std_logic_1164.all;


entity latch is

input : std_logic_vector(7 downto 0);
secret_value : std_logic_vector(7 downto 0);
set : std_logic;



end;


architecture latch_impl of latch is
begin

secret_value <= input WHEN set = '0';

end;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity shift_div is
port (
a : in std_logic_vector(7 downto 0);
a_shl, a_shr, a_ror: out std_logic_vector(7 downto 0)
);
end;


architecture shift_imple of shift_div is
begin

--Shift til venstre og fyld et 0 på LSB med 0
a_shl <= a(6 downto 0) & '0';

--Shift til højre 2 gange og fyld de 2 pladser med 00
a_shr <= "00" & a(7 downto 2);

--Rotér og shift MSB ned til LSB 
a_ror <= a(2 downto 0) & a(7 downto 3);


end architecture;
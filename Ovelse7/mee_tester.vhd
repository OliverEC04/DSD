library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity mee_tester is port(
    SW : in std_logic_vector(1 downto 0);
    KEY : in std_logic_vector(1 downto 0);
    LEDR : out std_logic_vector(1 downto 0)
 );
end;

architecture impl of mee_tester is
begin
    state : entity Mee_Moo port map(
        clk => KEY(0), reset => KEY(1),
        input_a => SW(0), input_b => SW(1),
        output_moo => LEDR(0), output_mee => LEDR(1)
    );
end;
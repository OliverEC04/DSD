library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity mult_tester is
  port (
    LEDR: out std_logic_vector(15 downto 0);
     SW: in std_logic_vector(15 downto 0)
  );
end entity;

architecture dataflow of mult_tester is
begin
  mul: entity work.mult
  port map(
  Produkt(15 downto 0) => LEDR(15 downto 0),
  A(7 downto 0) => SW(7 downto 0),
  B(7 downto 0) => SW(15 downto 8)
  );
  end architecture;
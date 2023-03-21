library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity mult is
port 
(
	A, B : in std_logic_vector(7 downto 0);
	Produkt: out std_logic_vector(15 downto 0)
);
end entity;


architecture dataflow_impl of mult is
begin

Produkt <= std_logic_vector(unsigned(A) * unsigned(B));

end dataflow_impl;
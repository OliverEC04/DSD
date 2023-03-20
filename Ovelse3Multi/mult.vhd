library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mult is

generic
	(
			DATA_WIDTH : natural := 8
	);
	


port 
(
	A, B : in std_logic_vector(7 downto 0);
	Produkt: out std_logic_vector(2*DATA_WIDTH-1 downto 0)
);
end entity;


architecture mult_impl of mult is
begin

Produkt <= std_logic_vector(unsigned(A) * unsigned(B));

end mult_impl;
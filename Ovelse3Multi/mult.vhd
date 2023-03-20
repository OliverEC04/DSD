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
	Produkt: out std_logic_vector(7 downto 0)
);
end;


architecture mult_impl of mult is
begin

end;
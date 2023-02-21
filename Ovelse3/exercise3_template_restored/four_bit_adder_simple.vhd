LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

ENTITY four_bit_adder_simple IS

	GENERIC -- mulig anvendelse af "generic"
	(
		DATA_WIDTH : NATURAL := 4
	);

	PORT
	(
		a   : IN STD_LOGIC_VECTOR ((DATA_WIDTH - 1) DOWNTO 0);
		b   : IN STD_LOGIC_VECTOR ((DATA_WIDTH - 1) DOWNTO 0);
		sum : OUT STD_LOGIC_VECTOR ((DATA_WIDTH - 1) DOWNTO 0)
	);

END ENTITY;

ARCHITECTURE unsigned_impl OF four_bit_adder_simple IS

BEGIN
	sum <= STD_LOGIC_VECTOR(unsigned(a) + unsigned(b));

END unsigned_impl;

ARCHITECTURE signed_impl OF four_bit_adder_simple IS
BEGIN

END signed_impl;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY four_bit_adder_tester IS
	PORT
	(
		-- Input ports
		SW   : IN STD_LOGIC_VECTOR(8 DOWNTO 1);

		-- Output ports
		LEDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

	);
END four_bit_adder_tester;

component four_bit_adder_simple 
	port (
		a   : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		b   : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		sum : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
	end component;

ARCHITECTURE four_bit_adder_tester_impl OF four_bit_adder_tester IS
BEGIN

	uut : ENTITY work.four_bit_adder_simple(unsigned_impl) PORT MAP
		(
		a(3 downto 0) => SW(4 downto 1),
		b(3 downto 0) => SW(8 downto 5),
		sum(3 downto 0) => LEDR(3 downto 0)
		);

END four_bit_adder_tester_impl;

implementeret_simple_unsigned_adder: four_bit_adder_simple
		port map(
		
		);
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;

------------Ved simulering skal denne entity vaere "top level"------------------
--DUS/DUT skal aendres alt efter hvilken udgave af four_bit_adderen jeg vil simulere

ENTITY four_bit_adder_simulering IS

	PORT
	(
		-- Input ports
		SIGNAL A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

		-- Output ports
		Sum         : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END four_bit_adder_simulering;

ARCHITECTURE four_bit_adder_simulering_impl OF four_bit_adder_simulering IS
BEGIN
	-----Instantierer den four_bit adder jeg vil simulere, jeg kan nu vælge hvilken arkitektur jeg vil simulere
	DUS : ENTITY four_bit_adder_simple(unsigned_impl)

		PORT MAP
		(
			A   => A, -- porte mappes "en-til-en"
			B   => B,
			Sum => Sum
		);

END four_bit_adder_simulering_impl;
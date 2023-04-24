library ieee;
use ieee.std_logic_1164.all;

entity seg_writer is
	port(
		-- Inputs

		-- Outputs
		HEX0 : out std_logic_vector(6 downto 0);
		HEX1 : out std_logic_vector(6 downto 0)
	);
end seg_writer;

architecture seg_writer_impl of seg_writer is
begin
	HEX0 <= "1111001";
	HEX1 <= "1001001";
end seg_writer_impl;

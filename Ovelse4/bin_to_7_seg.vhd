LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;
ENTITY bin_to_7_seg IS
	PORT (
		-- Input ports
		bin : IN STD_LOGIC_VECTOR (3 downto 0);

		-- Output ports
		sSeg : OUT STD_LOGIC_VECTOR (6 downto 0)
	);
END bin_to_7_seg;

ARCHITECTURE bin_to_7_seg_impl OF bin_to_7_seg IS
BEGIN
	with bin select sSeg <=
	"1111111" when "0000",
	"1111110" when "0001",
	"1111101" when "0010",
	"1111011" when "0011",
	"1110111" when "0100",
	"1101111" when "0101",
	"1011111" when "0110",
	"0111111" when "0111",
	"0000000" when "1000",
	"0000100" when "1001",
	"1111111" when others;

END bin_to_7_seg_impl;
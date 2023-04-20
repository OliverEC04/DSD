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
	"1000000" when "0000", -- 0 : 0
	"1111001" when "0001", -- 1 : 1
	"0100100" when "0010", -- 2 : 2
	"0110000" when "0011", -- 3 : 3
	"0011001" when "0100", -- 4 : 4
	"0010010" when "0101", -- 5 : 5
	"0000010" when "0110", -- 6 : 6
	"1111000" when "0111", -- 7 : 7
	"0000000" when "1000", -- 8 : 8
	"0010000" when "1001", -- 9 : 9
	"0001000" when "1010", -- A : 10
	"0000011" when "1011", -- b : 11
	"1000110" when "1100", -- C : 12
	"0100001" when "1101", -- d : 13
	"0000110" when "1110", -- E : 14
	"0001110" when "1111", -- F : 15
	"1111111" when others; -- slukket

END bin_to_7_seg_impl;
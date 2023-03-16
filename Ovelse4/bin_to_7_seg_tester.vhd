LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;
ENTITY bin_to_7_seg_tester IS
	PORT (
		-- Input ports
		sw : IN STD_LOGIC_VECTOR (3 downto 0);

		-- Output ports
		hex0 : OUT STD_LOGIC_VECTOR (6 downto 0)
	);
END bin_to_7_seg_tester;

ARCHITECTURE bin_to_7_seg_tester_impl OF bin_to_7_seg_tester IS
BEGIN
dut: entity work.bin_to_7_seg
	port map 
	(
		bin => sw,
		sSeg => hex0
	);

END bin_to_7_seg_tester_impl;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;
ENTITY hex_mux_tester IS
	PORT (
		-- Input ports
		sw : IN STD_LOGIC_VECTOR (11 downto 0);
		key : IN STD_LOGIC_VECTOR (1 downto 0);

		-- Output ports
		hex0 : OUT STD_LOGIC_VECTOR (6 downto 0);
		hex1 : OUT STD_LOGIC_VECTOR (6 downto 0);
		hex2 : OUT STD_LOGIC_VECTOR (6 downto 0)
	);
END hex_mux_tester;

ARCHITECTURE hex_mux_tester_impl OF hex_mux_tester IS
BEGIN
dut: entity work.hex_mux
	port map 
	(
		bin => sw,
		sel => key,
		sSeg0 => hex0,
		sSeg1 => hex1,
		sSeg2 => hex2
	);

END hex_mux_tester_impl;
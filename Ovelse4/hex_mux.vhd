LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.ALL;
ENTITY hex_mux IS
	PORT (
		-- Input ports
		bin : IN STD_LOGIC_VECTOR (11 downto 0);
		sel : IN STD_LOGIC_VECTOR (1 downto 0);

		-- Output ports
		sSeg0 : OUT STD_LOGIC_VECTOR (6 downto 0);
		sSeg1 : OUT STD_LOGIC_VECTOR (6 downto 0);
		sSeg2 : OUT STD_LOGIC_VECTOR (6 downto 0);
		sSeg3 : OUT STD_LOGIC_VECTOR (6 downto 0)
	);
END hex_mux;

ARCHITECTURE hex_mux_impl OF hex_mux IS
BEGIN
	
END hex_mux_impl;
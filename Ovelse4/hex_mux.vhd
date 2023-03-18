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
		tsseg : OUT STD_LOGIC_VECTOR (20 downto 0)
	);
END hex_mux;

ARCHITECTURE hex_mux_impl OF hex_mux IS
	signal tissesek : STD_LOGIC_VECTOR (20 downto 0);
	
BEGIN
	tsseg <= "000011001011110101111" when sel = "01" else -- Err
				tissesek 					when sel = "10" else -- decoder
				"111111110000000101011" when sel = "11" else -- On
				"100011110000001000111"; -- LOL
					
	dec0 : entity work.bin_to_7_seg
		port map(
			bin(3 downto 0) => bin(3 downto 0),
			sSeg(6 downto 0) => tissesek(6 downto 0)
		);
		
	dec1 : entity work.bin_to_7_seg
		port map(
			bin(3 downto 0) => bin(7 downto 4),
			sSeg(6 downto 0) => tissesek(13 downto 7)
		);
		
	dec2 : entity work.bin_to_7_seg
		port map(
			bin(3 downto 0) => bin(11 downto 8),
			sSeg(6 downto 0) => tissesek(20 downto 14)
		);
	
END hex_mux_impl;
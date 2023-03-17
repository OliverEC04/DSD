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
		sSeg2 : OUT STD_LOGIC_VECTOR (6 downto 0)
	);
END hex_mux;

ARCHITECTURE hex_mux_impl OF hex_mux IS
BEGIN
	dec0 : bin_to_7_seg
		port map (
			bin => bin,
			sSeg0 => sSeg
		);
	process(sel)
		begin
			case sel is
				when "01" => -- Err
					sSeg0 <= "0101111";
					sSeg1 <= "0101111";
					sSeg2 <= "0000110";
				when "10" => -- bin2sev
					sSeg0 <= "1111111";
					sSeg1 <= "1111111";
					sSeg2 <= "1111111";
				when "11" => -- On
					sSeg0 <= "0101011";
					sSeg1 <= "1000000";
					sSeg2 <= "1111111";
				when others => -- Slukker naar andet
					sSeg0 <= "1111111";
					sSeg1 <= "1111111";
					sSeg2 <= "1111111";
			end case;
	end process;
END hex_mux_impl;
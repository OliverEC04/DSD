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
		--sSeg0 : OUT STD_LOGIC_VECTOR (6 downto 0);
		--sSeg1 : OUT STD_LOGIC_VECTOR (6 downto 0);
		--sSeg2 : OUT STD_LOGIC_VECTOR (6 downto 0)
		tsseg : OUT STD_LOGIC_VECTOR (20 downto 0)
	);
END hex_mux;

ARCHITECTURE hex_mux_impl OF hex_mux IS

	--signal sSeg0_int : STD_LOGIC_VECTOR (6 downto 0);
	--signal sSeg1_int : STD_LOGIC_VECTOR (6 downto 0);
	--signal sSeg2_int : STD_LOGIC_VECTOR (6 downto 0);

BEGIN
	process(sel)
		begin
			case sel is
			when "01" => -- Err
				tsseg <= "010111101011110000110";
			when "10" => -- bin2sev
				tsseg <= "111111111111111111111";
			when "11" => -- On
				tsseg <= "010101110000001111111";
			when others => -- Slukker naar andet
				tsseg <= "111111111111111111111";
		end case;
	end process;
	
	dec0 : entity work.bin_to_7_seg
		port map(
			bin => bin(3 downto 0),
			sSeg => tsseg(6 downto 0)
		);
	dec1 : entity work.bin_to_7_seg
		port map(
			bin => bin(7 downto 4),
			sSeg => tsseg(13 downto 7)
		);
	dec2 : entity work.bin_to_7_seg
		port map(
			bin => bin(11 downto 8),
			sSeg => tsseg(20 downto 14)
		);
	
	--sSeg0 <= sSeg0_int(6 downto 0);
	--sSeg1 <= sSeg1_int(6 downto 0);
	--sSeg2 <= sSeg2_int(6 downto 0);
	
END hex_mux_impl;
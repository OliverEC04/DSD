library ieee;
use ieee.std_logic_1164.all;

entity guess_game_tester is
	port(
		-- Inputs
		KEY: in std_logic_vector(2 downto 0); -- Knap til at saette tal som staar paa 7seg
		SW: in std_logic_vector(7 downto 0);

		-- Outputs
		HEX6 : out std_logic_vector(6 downto 0); -- 7-segment enere
		HEX7: out std_logic_vector(6 downto 0) -- 7-segment tiere
	);
end;

architecture guess_game_tester_beh of guess_game_tester is
begin
	guess_game : entity work.guess_game port map (
		input => SW(7 downto 0),
		set => KEY(0), -- Knap til at sætte tal som står på 7-segment displayet
		show => KEY(1), -- Vis sat tal
		try => KEY(2), -- Sammenlign gæt

		-- Outputs
		hexEt => HEX6, -- 7-segment enere
		hexTi => HEX7 -- 7-segment tiere
   );
end architecture guess_game_tester_beh;

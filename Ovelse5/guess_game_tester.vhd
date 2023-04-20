library ieee;
use ieee.std_logic_1164.all;

entity guess_game_tester is
port(
-- Inputs
inputs : in std_logic_vector(7 downto 0);
set : in std_logic; -- Knap til at saette tal som staar paa 7seg
show : in std_logic; -- Vis sat tal
try : in std_logic; -- Sammenlign gaet

-- Outputs
hex1 : out std_logic_vector(6 downto 0); -- 7-segment enere
hex10: out std_logic_vector(6 downto 0) -- 7-segment tiere
);

end;


architecture guess_game_tester_beh of guess_game_tester is
begin
	guess_game : entity work.guess_game port map (
		inputs => inputs std_logic_vector(7 downto 0),
		set => set std_logic, -- Knap til at saette tal som staar paa 7seg
		show => show std_logic, -- Vis sat tal
		try => try std_logic, -- Sammenlign gaet

		-- Outputs
		hex1 => hex1 std_logic_vector(6 downto 0), -- 7-segment enere
		hex10 => hex10 std_logic_vector(6 downto 0) -- 7-segment tiere
   );
end guess_game_tester_beh;
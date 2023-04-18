library ieee;
use ieee.std_logic_1164.all;

entity guess_game is
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


architecture guess_game_beh of guess_game is
begin
	compare_logic : entity work.compare_logic port map (
		input => inputs,
      secret_value => secret_value std_logic_vector(7 downto 0)
		set => set
   );

	mylatch : entity work.latch port map (
		input => inputs,
      secret_value => secret_value std_logic_vector(7 downto 0)
		set => set
   );
	
	mux1 : entity work.mux1 port map (
		input => inputs,
      secret_value => secret_value std_logic_vector(7 downto 0)
		set => set
   );
	
	mux2 : entity work.mux2 port map (
		input => inputs,
      secret_value => secret_value std_logic_vector(7 downto 0)
		set => set
   );
	
	hex1 : entity work.binToHex port map (
		bin => display_value(3 downto 0),
      segment => bin2hex_out(6 downto 0)
   );
	 
	hex2 : entity work.binToHex port map (
      bin => display_value(3 downto 0),
      segment => bin2hex_out(6 downto 0)
   );
end guess_game_beh;
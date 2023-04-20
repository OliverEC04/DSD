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
hexEt : out std_logic_vector(6 downto 0); -- 7-segment en'ere
hexTi: out std_logic_vector(6 downto 0) -- 7-segment ti'ere
);

end;


architecture guess_game_beh of guess_game is

	signal compare_logic : std_logic_vector(1 downto 0);		-- true/false som viser om gættet er rigtigt
	signal secret_value : std_logic_vector(7 downto 0);		-- værdi indtastet af spiller
	signal mux1toBinToHex : std_logic_vector(7 downto 0);		-- signal mellem mux1 og bin2hex
	signal binToHexOut : std_logic_vector(13 downto 0);		-- signal fra bin2hex til mux2
	signal display_value : std_logic_vector(13 downto 0);		-- sidste signal ud til 7seg
	
	
begin
	

    latch_inst : entity work.latch port map(
        set => set,
        secret_value => secret_value,
        input => inputs
    );	
	
	compare_logic : entity work.compare_logic port map(
	secret_value => secret_value, input => inputs, try => try
	);
	
	mux1 : entity work.mux1 port map(
	show => show, input => inputs, secret_value => secret_value, bin => mux1toBinToHex
	);
	
--	binToHex : entity work.binToHex port map(
	
--	);
	
	
	
	 
end guess_game_beh;
library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity guess_game is 
	port(
		-- Inputs
		input : in std_logic_vector(7 downto 0);
		set : in std_logic; -- Knap til at saette tal som staar paa 7seg
		show : in std_logic; -- Vis sat tal
		try : in std_logic; -- Sammenlign gaet

		-- Outputs
		hexEt : out std_logic_vector(6 downto 0); -- 7-segment en'ere
		hexTi: out std_logic_vector(6 downto 0) -- 7-segment ti'ere
	);
end;

architecture guess_game_beh of guess_game is

	signal comparison : std_logic_vector(1 downto 0);		-- true/false som viser om gættet er rigtigt
	signal secret_value : std_logic_vector(7 downto 0);		-- værdi indtastet af spiller
	signal mux1toBinToHex : std_logic_vector(7 downto 0);		-- signal mellem mux1 og bin2hex
	signal binToHexOut : std_logic_vector(13 downto 0);		-- signal fra bin2hex til mux2
	signal display_value : std_logic_vector(13 downto 0);		-- sidste signal ud til 7seg
	
begin
	latch_inst : entity work.mylatch port map(
			-- Inputs
        set => set,
        input => input,
		  
		  -- Outputs
		  secret_value => secret_value
    );	
	
	compare_logic_inst : entity work.compare_logic port map(
		-- Inputs
		secret_value => secret_value,
		input => input,
		try => try,
		
		-- outputs
		result => comparison
	);
	
	mux1_inst : entity work.mux1 port map(
		-- Inputs
		show => show,
		input => input,
		secret_value => secret_value,
		
		-- outputs
		bin => mux1toBinToHex
	);
	
	binToHex1 : entity work.binToHex port map(
		-- Inputs
		bin => mux1toBinToHex (7 downto 4),
		
		-- outputs
		segment => binToHexOut (13 downto 7)
	);
	
	binToHex2 : entity work.binToHex port map(
		-- Inputs
		bin => mux1toBinToHex (3 downto 0),
		
		-- outputs
		segment => binToHexOut (6 downto 0)
	);
	
	mux2 : entity work.mux2 port map(
		-- Inputs
		result => comparison,
		segment => binToHexOut,
		try_btn => try,
	 
		-- Outputs
		hexEt => hexEt,
		hexTi => hexTi
	);
	 
end guess_game_beh;
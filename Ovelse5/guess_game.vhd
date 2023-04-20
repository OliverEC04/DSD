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
hex1 : out std_logic_vector(6 downto 0); -- 7-segment en'ere
hex10: out std_logic_vector(6 downto 0) -- 7-segment ti'ere
);

end;


architecture guess_game_beh of guess_game is

	signal compare_logic : std_logic_vector(1 downto 0);		-- true/false som viser om gættet er rigtigt
	signal secret_value : std_logic_vector(7 downto 0);		-- værdi indtastet af spiller
	signal display_value : std_logic_vector(7 downto 0);		-- 
	signal binToHexOut : std_logic_vector(13 downto 8);		-- 

begin

		--Processen for at saette secret value fra input switches
    process(set)
    begin
        if set = '0' then
            secret_value <= inputs;
        end if;
    end process;
	 
	     -- Processen der tjekker gaettet og opdaterer compare_logic signalet
    process(try)
    begin
        if try = '0' then
            -- Tjek om inputvalue er det samme som guess value
            if inputs = secret_value then
                compare_logic <= "01"; -- Correct guess
            elsif secret_value > inputs then
                compare_logic <= "10"; -- Input value is too low
            elsif secret_value < inputs then
                compare_logic <= "11"; -- Input value is too high
            else
                compare_logic <= "00"; -- No comparison made
            end if;
        end if;
    end process;

end guess_game_beh;
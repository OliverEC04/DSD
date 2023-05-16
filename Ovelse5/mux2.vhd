library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2 is 
port (
	-- Inputs
    result    : in std_logic_vector(1 downto 0);
    segment   : in std_logic_vector(13 downto 0);
	 try_btn   : in std_logic;
	 
	 -- Outputs
    hexEt      : out std_logic_vector (6 downto 0);
    hexTi     : out std_logic_vector (6 downto 0)
);
end entity;

architecture mux2_impl of mux2 is
    signal sel : std_logic_vector(1 downto 0);
    signal hex_out : std_logic_vector(6 downto 0);
    signal guess : std_logic_vector(3 downto 0);
    signal try_btn_state : std_logic := '0';
begin

    sel <= result;

    process(sel, segment, try_btn)
        variable guess_var : std_logic_vector(3 downto 0);
    begin
        try_btn_state <= try_btn;

        case sel is
            when "00" =>
                hex_out <= "0000001"; -- Hex value for 0
            when "01" =>
                hex_out <= "1001111"; -- Hex value for 1
            when "10" =>
                hex_out <= "0010010"; -- Hex value for 2
            when "11" =>
                hex_out <= "0000110"; -- Hex value for 3
        end case;

        if try_btn_state = '1' then -- Check if the try button is pressed
            -- Evaluate the guess
            if segment = "0111111" then -- Guessed value is 0
                guess_var := "0001"; -- Hex value for 0
            elsif segment = "0000110" then -- Guessed value is 8 or H
                guess_var(3) := '1'; -- Set the 4-bit guess value
            elsif segment = "0001101" then -- Guessed value is 4 or L
                guess_var(2) := '1'; -- Set the 4-bit guess value
            elsif segment = "0111001" then -- Guessed value is 2 or i
                guess_var(1) := '1'; -- Set the 4-bit guess value
            end if;
        else
            guess_var := "0000"; -- Clear the guess value
        end if;

        guess <= guess_var; -- Assign the variable value to the signal

        hexEt <= hex_out;
        hexTi <= hex_out;
    end process;
	
end mux2_impl;
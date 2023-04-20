library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity one_digit_clock_tester is
	port
	( 
		-- inputs
		SW : in std_logic_vector (17 downto 16);
		KEY : in std_logic_vector (3 downto 0);
		CLOCK_50 : in std_logic;

		-- outputs
		HEX0 : out std_logic_vector (6 downto 0);
		LEDR : out std_logic_vector (0 downto 0)
	);
end one_digit_clock_tester;

architecture one_digit_clock_tester_impl of one_digit_clock_tester is
signal count_alt : std_logic_vector (3 downto 0);
signal clk_en_out : STD_LOGIC;
begin
	counter : entity work.multi_counter port map
	(
		clken => clk_en_out, -- clock enable
		clk => CLOCK_50, -- clock
		mode(1 downto 0) => SW (17 downto 16), -- mode
		reset => KEY(3), -- reset
		count => count_alt, -- counter
		cout => LEDR(0) -- carry out
	);

	hex : entity work.bin_to_7_seg port map
	(
		bin => count_alt, -- binary input
		sSeg(6 downto 0) => HEX0(6 downto 0) -- hexadecimal output
	);
	
	clock_gen : entity work.clock_gen port map
	(
		clk => CLOCK_50,
		speed => KEY(0),
		reset => KEY(3),
		clk_out => clk_en_out
	);
end one_digit_clock_tester_impl;

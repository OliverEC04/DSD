library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity watch is
	port
	( 
		-- inputs
		clk : in STD_LOGIC;
      speed : in STD_LOGIC;
      reset : in STD_LOGIC;

		-- outputs
		sec_1 : out std_LOGIC_vector (6 downto 0);
		sec_10 : out std_LOGIC_vector (6 downto 0);
		min_1 : out std_LOGIC_vector (6 downto 0);
		min_10 : out std_LOGIC_vector (6 downto 0);
		hrs_1 : out std_LOGIC_vector (6 downto 0);
		hrs_10 : out std_LOGIC_vector (6 downto 0)
	);
end watch;

architecture watch_impl of watch is

	signal reset_counters : std_logic; -- reset all counters

	-- count in binary for each digit
	signal bin_count_sec_1 : std_LOGIC_vector (3 downto 0);
	signal bin_count_sec_10 : std_LOGIC_vector (3 downto 0);
	signal bin_count_min_1 : std_LOGIC_vector (3 downto 0);
	signal bin_count_min_10 : std_LOGIC_vector (3 downto 0);
	signal bin_count_hrs_1 : std_LOGIC_vector (3 downto 0);
	signal bin_count_hrs_10 : std_LOGIC_vector (3 downto 0);

	-- carry out for each digit
	signal cout_sec_1 : std_logic;
	signal cout_sec_10 : std_logic;
	signal cout_min_1 : std_logic;
	signal cout_min_10 : std_logic;
	signal cout_hrs_1 : std_logic;
	signal cout_hrs_10 : std_logic;
	
	signal clk_out_gen : std_LOGIC; -- clock from clock_gen

begin
	clock_gen : entity work.clock_gen port map
	(
		clk => clk,
		speed => speed,
		reset => reset,
		clk_out => clk_out_gen
	);
	
	reset_logic : entity work.reset_logic port map
	(
		clk => clk,
		reset_in => reset,
		bin_count_hrs_1 => bin_count_hrs_1,
		bin_count_hrs_10 => bin_count_hrs_10,
		reset_out => reset_counters
	);

	counter_sec_1 : entity work.multi_counter port map
	(
		clken => clk_out_gen, -- clock enable
		clk => clk, -- clock
		mode(1 downto 0) => "00", -- mode
		reset => reset_counters, -- reset
		count => bin_count_sec_1, -- counter
		cout => cout_sec_1 -- carry out
	);
	
	counter_sec_10 : entity work.multi_counter port map
	(
		clken => cout_sec_1, -- clock enable
		clk => clk, -- clock
		mode(1 downto 0) => "01", -- mode
		reset => reset_counters, -- reset
		count => bin_count_sec_10, -- counter
		cout => cout_sec_10 -- carry out
	);
	
	counter_min_1 : entity work.multi_counter port map
	(
		clken => cout_sec_10, -- clock enable
		clk => clk, -- clock
		mode(1 downto 0) => "00", -- mode
		reset => reset_counters, -- reset
		count => bin_count_min_1, -- counter
		cout => cout_min_1 -- carry out
	);
	
	counter_min_10 : entity work.multi_counter port map
	(
		clken => cout_min_1, -- clock enable
		clk => clk, -- clock
		mode(1 downto 0) => "01", -- mode
		reset => reset_counters, -- reset
		count => bin_count_min_10, -- counter
		cout => cout_min_10 -- carry out
	);
	
	counter_hrs_1 : entity work.multi_counter port map
	(
		clken => cout_min_10, -- clock enable
		clk => clk, -- clock
		mode(1 downto 0) => "00", -- mode
		reset => reset_counters, -- reset
		count => bin_count_hrs_1, -- counter
		cout => cout_hrs_1 -- carry out
	);
	
	counter_hrs_10 : entity work.multi_counter port map
	(
		clken => cout_hrs_1, -- clock enable
		clk => clk, -- clock
		mode(1 downto 0) => "11", -- mode
		reset => reset_counters, -- reset
		count => bin_count_hrs_10, -- counter
		cout => cout_hrs_10 -- carry out
	);

	b27_sec_1 : entity work.bin_to_7_seg port map
	(
		bin => bin_count_sec_1, -- binary input
		sSeg(6 downto 0) => sec_1 -- hexadecimal output
	);
	
	b27_sec_10 : entity work.bin_to_7_seg port map
	(
		bin => bin_count_sec_10, -- binary input
		sSeg(6 downto 0) => sec_10 -- hexadecimal output
	);
	
	b27_min_1 : entity work.bin_to_7_seg port map
	(
		bin => bin_count_min_1, -- binary input
		sSeg(6 downto 0) => min_1 -- hexadecimal output
	);
	
	b27_min_10 : entity work.bin_to_7_seg port map
	(
		bin => bin_count_min_10, -- binary input
		sSeg(6 downto 0) => min_10 -- hexadecimal output
	);
	
	b27_hrs_1 : entity work.bin_to_7_seg port map
	(
		bin => bin_count_hrs_1, -- binary input
		sSeg(6 downto 0) => hrs_1 -- hexadecimal output
	);
	
	b27_hrs_10 : entity work.bin_to_7_seg port map
	(
		bin => bin_count_hrs_10, -- binary input
		sSeg(6 downto 0) => hrs_10 -- hexadecimal output
	);
	
end watch_impl;

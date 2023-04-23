library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alarm_watch_tester is
	port
	( 
		-- inputs
		KEY : in std_LOGIC_VECTOR (3 downto 0);
		SW : in std_LOGIC_VECTOR (15 downto 0);
		CLOCK_50 : in std_logic;

		-- outputs
		HEX2 : out std_LOGIC_VECTOR (6 downto 0);
		HEX3 : out std_LOGIC_VECTOR (6 downto 0);
		HEX4 : out std_LOGIC_VECTOR (6 downto 0);
		HEX5 : out std_LOGIC_VECTOR (6 downto 0);
		HEX6 : out std_LOGIC_VECTOR (6 downto 0);
		HEX7 : out std_LOGIC_VECTOR (6 downto 0);
		LEDR : out std_LOGIC_VECTOR (0 downto 0)
	);
end alarm_watch_tester;

architecture alarm_watch_tester_impl of alarm_watch_tester is
signal alarm_time : STD_LOGIC_VECTOR (15 downto 0);
signal watch_time : STD_LOGIC_VECTOR (15 downto 0);

-- watch 7seg
signal watch_sec_1 : std_LOGIC_vector (6 downto 0);
signal watch_sec_10 : std_LOGIC_vector (6 downto 0);
signal watch_min_1 : std_LOGIC_vector (6 downto 0);
signal watch_min_10 : std_LOGIC_vector (6 downto 0);
signal watch_hrs_1 : std_LOGIC_vector (6 downto 0);
signal watch_hrs_10 : std_LOGIC_vector (6 downto 0);

-- alarm 7seg
signal alarm_min_1 : std_LOGIC_vector (6 downto 0);
signal alarm_min_10 : std_LOGIC_vector (6 downto 0);
signal alarm_hrs_1 : std_LOGIC_vector (6 downto 0);
signal alarm_hrs_10 : std_LOGIC_vector (6 downto 0);

begin
	process(KEY(2))
	begin
		if (KEY(2) = '1') then
			HEX2 <= 
			HEX3 : out std_LOGIC_VECTOR (6 downto 0);
			HEX4 : out std_LOGIC_VECTOR (6 downto 0);
			HEX5 : out std_LOGIC_VECTOR (6 downto 0);
			HEX6 : out std_LOGIC_VECTOR (6 downto 0);
			HEX7 : out std_LOGIC_VECTOR (6 downto 0);
			LEDR : out std_LOGIC_VECTOR (0 downto 0)
		else

		end if;
	end process;

	input_limiter : entity work.input_limiter port map
	(
		-- inputs
		bin_min_1 => SW (3 downto 0),
		bin_min_10 => SW (7 downto 4),
		bin_hrs_1 => SW (11 downto 8),
		bin_hrs_10 => SW (15 downto 12),

		-- outputs
		alarm_time => alarm_time
	);
	
	compare : entity work.compare port map
	(
		-- inputs
		watch_time => watch_time,
		alarm_time => alarm_time,

		-- outputs
		alarm => LEDR(0)
	);
	
	watch : entity work.alarm_watch port map
	(
		-- inputs
		clk => CLOCK_50,
		speed => KEY(0),
		reset => KEY(3),

		-- outputs
		sec_1 => watch_sec_1,
		sec_10 => watch_sec_10,
		min_1 => watch_min_1,
		min_10 => watch_min_10,
		hrs_1 => watch_hrs_1,
		hrs_10 => watch_hrs_10,
		watch_time => watch_time
	);

	b27_min_1 : entity work.bin_to_7_seg port map
	(
		-- inputs
		bin => alarm_time(3 downto 0),

		-- outputs
		sSeg => alarm_min_1,
	);

	b27_min_10 : entity work.bin_to_7_seg port map
	(
		-- inputs
		bin => alarm_time(7 downto 4),

		-- outputs
		sSeg => alarm_min_10,
	);

	b27_hrs_1 : entity work.bin_to_7_seg port map
	(
		-- inputs
		bin => alarm_time(11 downto 8),

		-- outputs
		sSeg => alarm_hrs_1,
	);

	b27_hrs_10 : entity work.bin_to_7_seg port map
	(
		-- inputs
		bin => alarm_time(15 downto 12),

		-- outputs
		sSeg => alarm_hrs_10,
	);

end alarm_watch_tester_impl;

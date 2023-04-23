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
begin
	input_limiter : entity work.input_limiter port map
	(
		bin_min_1 => SW (3 downto 0),
		bin_min_10 => SW (7 downto 4),
		bin_hrs_1 => SW (11 downto 8),
		bin_hrs_10 => SW (15 downto 12),
		alarm_time => alarm_time
	);
	
	compare : entity work.compare port map
	(
		watch_time => watch_time,
		alarm_time => alarm_time,
		alarm => LEDR(0)
	);
	
	watch : entity work.alarm_watch port map
	(
		watch_time => watch_time,
		alarm_time => alarm_time,
		alarm => LEDR(0)
	);

end alarm_watch_tester_impl;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity watch_tester is
	port
	( 
		-- inputs
		CLOCK_50 : in STD_LOGIC;
      KEY : in STD_LOGIC_vector (3 downto 0);

		-- outputs
		HEX2 : out std_LOGIC_vector (6 downto 0);
		HEX3 : out std_LOGIC_vector (6 downto 0);
		HEX4 : out std_LOGIC_vector (6 downto 0);
		HEX5 : out std_LOGIC_vector (6 downto 0);
		HEX6 : out std_LOGIC_vector (6 downto 0);
		HEX7 : out std_LOGIC_vector (6 downto 0)
	);
end watch_tester;

architecture watch_tester_impl of watch_tester is
begin
	watch : entity work.watch port map
	(
		clk => CLOCK_50,
      speed => KEY(0),
      reset => KEY(3),
		sec_1(6 downto 0) => HEX2(6 downto 0),
		sec_10(6 downto 0) => HEX3(6 downto 0),
		min_1(6 downto 0) => HEX4(6 downto 0),
		min_10(6 downto 0) => HEX5(6 downto 0),
		hrs_1(6 downto 0) => HEX6(6 downto 0),
		hrs_10(6 downto 0) => HEX7(6 downto 0)
	);
end watch_tester_impl;

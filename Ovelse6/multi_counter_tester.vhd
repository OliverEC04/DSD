LIBRARY ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use work.all;

entity multi_counter_tester is
	port
	(
		 -- inputs
		 SW : in std_logic_vector (17 downto 16);
		 KEY : in std_logic_vector (3 downto 0);

		 -- outputs
		 HEX0 : out std_logic_vector (6 downto 0);
		 LEDR : out std_logic_vector (0 downto 0)
	);
end;

architecture multi_counter_tester_impl of multi_counter_tester is
signal count_alt : std_logic_vector (3 downto 0);
begin
counter : entity work.multi_counter port map
(
	clken => '0', -- clock enable
	clk => KEY(0), -- clock
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
end;
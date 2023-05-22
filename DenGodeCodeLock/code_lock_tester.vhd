library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity code_lock_tester is
	port 
	(
		-- Inputs
		CLOCK_50 : in std_logic;
		KEY : in std_logic_vector (3 downto 2);
		SW : in std_logic_vector(3 downto 0);
		
		-- Outputs
		LEDG : out std_logic_vector (0 downto 0)
	);
end code_lock_tester;

architecture code_lock_tester_impl of code_lock_tester is 
begin 

	i1: entity code_lock_err port map
	(
		clk => CLOCK_50,
		reset => KEY(2),
		enter => KEY(3),
		pin => SW(3 downto 0),
		lock => LEDG(0)
	);
	
end code_lock_tester_impl;
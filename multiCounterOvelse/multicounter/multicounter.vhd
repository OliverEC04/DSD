library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


entity multi_counter is
generic
	(
		MIN_COUNT : natural := 0; -- min og max count for tæller
		MAX_COUNT : natural := 10
	);


	port
	(
		-- Input ports
		clk	: in  std_logic;
		mode	: in  std_logic_vector(1 downto 0);
		reset : in	std_logic;
		clken	: in std_logic;
		

		-- Output ports
		count	: out std_logic_vector(3 downto 0);
		cout	: out std_logic
	);
end multi_counter;

architecture multi_counter_impl of multi_counter is


begin
	
	bth: entity binToHex port map
	(
	bin 
	segment 
	);
	
	
	counter_proc: 
	process (clk,reset) --process reagerer både clk og reset
		variable   cnt		 : integer range MIN_COUNT to MAX_COUNT; -- bruger "variable" for øjeblikkelig opdatering af counter variable
		-- MAX_COUNT betyder IKKE at counteren af sig selv ikke tæller højere end til MAX_COUNT
	begin
		if reset = '0'  then-- asynkron reset, ikke afhængig af clk
			-- Reset the counter to 0
			cnt := 0;
		elsif (rising_edge(clk)) then
			if clken='1' then
			------"Pseudo kode"------------------------
			-- increment counter
			-- test counter værdier afhængig af mode (og reset counter på passende vis)
			-- set cout hvis betingelse er tilstede
			---------------------------------------
				if (cnt < MAX_COUNT) then
					cnt := cnt+1;
				
				elsif (cnt = MAX_COUNT) then
					cnt := 0;
				end if;
			
			end if;
		end if;

		-- Output the current count
		count<= std_logic_vector(to_unsigned(cnt, count'length));
		
	end process;

end multi_counter_impl;


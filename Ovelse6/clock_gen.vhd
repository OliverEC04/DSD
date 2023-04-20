library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_gen is
	port
	( 
		-- inputs
		clk : in STD_LOGIC;
		speed : in STD_LOGIC;
		reset : in STD_LOGIC;
			  
		-- outputs
      clk_out : out STD_LOGIC
	);
end clock_gen;

architecture clock_gen_impl of clock_gen is
variable tick : integer := 0;
begin
	clock_proc:
	process (clk,reset,speed)
	begin
		if (reset = '0') then -- Reset 
			tick <= 0;
			clk_out <= 0;
		
		elsif (rising_edge(clk)) then -- Clock pulse
			clk_out <= 0;
			
			if (speed = 0 and tick = 250000) then
				clk_out <= 1;
				
			elsif (speed = 1 and tick = 50000000) then
				clk_out <= 1;
				
			end if;
		end if;
end clock_gen_impl;
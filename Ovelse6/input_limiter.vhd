library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity input_limiter is
	port
	( 
		-- inputs
		bin_min_1 : in STD_LOGIC_VECTOR (3 downto 0);
		bin_min_10 : in STD_LOGIC_VECTOR (3 downto 0);
		bin_hrs_1 : in STD_LOGIC_VECTOR (3 downto 0);
		bin_hrs_10 : in STD_LOGIC_VECTOR (3 downto 0);

		-- outputs
		alarm_time : out STD_LOGIC_VECTOR (15 downto 0)
	);
end input_limiter;

architecture input_limiter_impl of input_limiter is
begin
	process(bin_min_1, bin_min_10, bin_hrs_1, bin_hrs_10)
	begin
		if (bin_min_10 < 6 and (bin_hrs_10 < 2 or (bin_hrs_10 = 2 and bin_hrs_1 < 4))) then
			alarm_time <= bin_hrs_10 & bin_hrs_1 & bin_min_10 & bin_min_1;
		else
			alarm_time <= 0;
		end if;
	end process;
end input_limiter_impl;

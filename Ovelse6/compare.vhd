library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity compare is
	port
	( 
		-- inputs
		watch_time : in std_LOGIC_VECTOR (15 downto 0);
		alarm_time : in std_LOGIC_VECTOR (15 downto 0);

		-- outputs
		alarm : out Std_LOGIC
	);
end compare;

architecture compare_impl of compare is
begin
	process(watch_time, alarm_time)
	begin
		if (watch_time = alarm_time) then
			alarm <= '1';
		else
			alarm <= '0';
		end if;
	end process;
end compare_impl;

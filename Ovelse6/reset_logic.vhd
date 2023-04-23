library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity reset_logic is
	port(
      -- inputs
      clk : in STD_LOGIC;
		reset_in : in STD_LOGIC;
		bin_count_hrs_1 : std_LOGIC_vector (3 downto 0);
		bin_count_hrs_10 : std_LOGIC_vector (3 downto 0);

		-- outputs
		reset_out : out STD_LOGIC
	);
end reset_logic;

architecture reset_logic_impl of reset_logic is
begin
	reset_proc: process(clk, reset_in)
	begin
		if (reset_in = '0') then -- Reset
			reset_out <= '0';

      elsif (rising_edge(clk)) then -- Clock pulse
			if (bin_count_hrs_1 = "0100" and bin_count_hrs_10 = "0010") then -- 24-hour condition
            reset_out <= '0';
				
			else
				reset_out <= '1';
				
			end if;
		end if;
	end process;
end reset_logic_impl;

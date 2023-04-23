library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity multi_counter is
	port
	( 
		-- inputs
		clken : in STD_LOGIC;
		clk : in STD_LOGIC;
		mode : in STD_LOGIC_VECTOR(1 downto 0);
		reset : in STD_LOGIC;
			  
		-- outputs
      count : out STD_LOGIC_VECTOR(3 downto 0);
      cout : out STD_LOGIC
	);
end multi_counter;

architecture multi_counter_impl of multi_counter is
signal count_alt : unsigned(3 downto 0); -- alternative counter used inside logic
begin
	counter_proc:
	process (clk,reset)
	begin
		if (reset = '0') then -- Reset 
			count_alt <= "0000";
			cout <= '0';
		
		elsif (rising_edge(clk)) then -- Clock pulse
			cout <= '0';
			
			if (clken = '1') then
				count_alt <= count_alt+1; -- Increment counter
				 
				if (mode = "00" and count_alt = 9) then -- Mode 00
					count_alt <= "0000";
					cout <= '1';
					 
				elsif (mode = "01" and count_alt = 5) then -- Mode 01
					count_alt <= "0000";
					cout <= '1';
					 
				elsif ((mode = "10" or mode = "11") and count_alt = 2) then -- Mode 10 and 11
					count_alt <= "0000";
					cout <= '1';
					 
				else
					cout <= '0';
				
				end if;
			end if;
		end if;
		
		count (3 downto 0) <= std_logic_vector(count_alt);
	
	end process;
end multi_counter_impl;

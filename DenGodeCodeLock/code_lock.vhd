library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity code_lock is
	port 
	(
		-- Inputs
		clk : in std_logic;
		reset : in std_logic;
		enter : in std_logic;
		pin : in std_logic_vector(3 downto 0);
		
		-- Outputs
		lock : out std_logic
	);
end code_lock;

architecture code_lock_impl of code_lock is

	type state is(idle, ev_code_1, ev_code_2, get_code_2, go_idle, unlock);
	signal present_state, next_state : state;

	type code_state is (locked, unlocked);
	signal pc_state : code_state;

	constant code1 : std_logic_vector(3 downto 0) := "1011";
	constant code2 : std_logic_vector(3 downto 0) := "0010";

begin 
	code_lock_state: process(clk, reset)
	begin
		if reset = '0' then
			present_state <= idle;
			
		elsif rising_edge(clk) then
			present_state <= next_state;
			
		end if;
	end process;
		
	code_lock_next_state: process (pin)
	begin 
	next_state <= present_state;
		case present_state is 
			when idle =>
				next_state <= idle;
				pc_state <= locked;
				if enter = '0' then 
					next_state <= ev_code_1;
				end if;
			
			when ev_code_1 =>
				if enter = '1' and pin = code1 then
					next_state <= get_code_2;
				elsif enter = '1' and pin /= code1 then 
					next_state <= idle;
				end if;
				
			when get_code_2 =>
				if enter = '0' then
					next_state <= ev_code_2;
				end if;
				
			when ev_code_2 => 
				if enter = '1' and pin = code2 then
					next_state <= unlock;
				elsif enter = '1' and pin /= code2 then
					next_state <= idle;
				end if;
			when go_idle => 
				pc_state <= locked;
				if enter = '1' then
					next_state <= idle;
				end if;
				
			when unlock =>
				pc_state <= unlocked;
				if enter = '0' then
					next_state <= go_idle;
				end if;
		end case;
	end process;
	
	code_lock_out : process(pc_state)
	begin
		case pc_state is
			when locked => 
				lock <= '1';
			
			when unlocked =>
				lock <= '0';
		end case;
	end process;
end code_lock_impl;
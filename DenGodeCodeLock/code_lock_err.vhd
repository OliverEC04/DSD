library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity code_lock_err is
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
end code_lock_err;

architecture code_lock_err_impl of code_lock_err is
type state is (idle, ev_code_1, ev_code_2, get_code_2, go_idle, unlock, W_pin, P_lock);
signal present_state, next_state : state;

type wc_state is (Err_0, Err_1, Err_2, Err_3 );
signal wc_present, wc_next : wc_state;

signal locked, err_event, failed : std_logic;

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
	variable tries: integer := 0;
	begin 
	next_state <= present_state;
		case present_state is 
			when idle =>
				err_event <= '0';
				next_state <= idle;
				locked <= '1';
				if enter = '0' then 
					next_state <= ev_code_1;
				end if;
				
			when ev_code_1 =>
				locked <= '1';
				err_event <= '0';
				if enter = '1' and pin = code1 then
					next_state <= get_code_2;
				elsif enter = '1' and pin /= code1 then 
					err_event <= '1';
					next_state <= W_pin;
				end if;
				
			when get_code_2 =>
				locked <= '1';
				err_event <= '0';
				if enter = '0' then
					next_state <= ev_code_2;
				end if;
				
			when ev_code_2 => 
				locked <= '1';
				err_event <= '0';
				if enter = '1' and pin = code2 then
					next_state <= unlock;
				elsif enter = '1' and pin /= code2 then
					err_event <= '1';
					next_state <= W_pin;
				end if;
				
			when go_idle => 
				locked <= '1';
				err_event <= '0';
				if enter = '1' then
					next_state <= idle;
				end if;
				
			when W_pin =>
				locked <= '1';
				err_event <= '0';
				if (failed = '1' and enter = '0') then
					next_state <= P_lock;
				elsif (enter = '0') then
					next_state <= go_idle;
				end if;
				
			when P_lock =>
				err_event <= '0';
				locked <= '1';
				
			when unlock =>
				err_event <= '0';
				locked <= '0';
				if enter = '0' then
					next_state <= go_idle;
				end if;
		end case;
	end process;
	
	code_lock_out : process(present_state)
	begin
		lock <= locked;
	end process;
	
	wc_sr: process (reset, clk)
	
		begin
		if reset = '0' then
			wc_present <= Err_0;
			
		elsif rising_edge(clk) then
			wc_present <= wc_next;
		end if;
	end process;
	
	wc_ns: process (wc_present, err_event)
	begin
		wc_next <= wc_present;
		case wc_present is
			when Err_0 =>
				if err_event = '1' then
					wc_next <= Err_1;
				end if;
				
			when Err_1 =>
				if err_event = '1' then
					wc_next <= Err_2;
				end if;
				
			when Err_2 =>
				if err_event = '1' then
					wc_next <= Err_3;
				end if;
				
			when Err_3 =>
		end case;
	end process;
	
	wc_os: process (wc_present)
	begin
		case wc_present is
			when Err_3 =>
				failed <= '1';
			when others =>
				failed <= '0';
		end case;
	end process;
	
end code_lock_err_impl;
-- Quartus II VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity test_sim is

	port(
	--Inputs
		clk				: in	std_logic;
		input_a	 		: in	std_logic;
		input_b			: in 	std_logic;
		reset	 	 		: in	std_logic;
	--Outputs
		output_mee	 	: out	std_logic;
		output_moo		: out std_logic
	);

end entity;

architecture test_sim_impl of test_sim is

	type state_type is (idle_state, init_state, active_state); --De 3 forskellige states

	signal present_state, next_state : state_type; --Register til den nuværende state

begin 	--Implementering af state-skift
	state_register : process(clk)
	
	begin
		if reset = '0' then --Kun når reset er 0, da knapperne er active-low
			present_state <= idle_state;
			
		elsif (rising_edge(clk)) then
			present_state <= next_state;
		end if;
	end process;
	
	outputs : process(present_state, input_a, input_b)
	begin
		case present_state is
			when idle_state =>
				output_moo <= '0';
				if input_b = '1' then
					output_mee <= '0';
					
				elsif input_b = '1' then
					output_mee <= '0';
				end if;
				
				--init_state 
				when init_state =>
					output_moo <= '1';
					if input_b = '1' and input_a = '0' then
						output_mee <= '0';
					
					elsif input_b = '1' and input_a = '1' then
						output_mee <= '1';
						
					elsif input_b = '0' and input_a = '1' then
						output_mee <= '0';
					end if;
						
					--active_state output
				when active_state =>
					output_moo <= '1';
			end case;
		end process;
	
		next_next_state : process (present_state, input_a, input_b)
		begin
			next_state <= present_state;
			case present_state is
			
			when idle_state =>
				if input_b = '0' then
					next_state <= idle_state;
					
					elsif input_b = '1' then
						next_state <= init_state;
					end if;
					--når man går fra next til init
			when init_state =>
				if input_b = '1' and input_a = '0' then
					next_state <= init_state;
					
					elsif input_b = '1' and input_a = '1' then
						next_state <= init_state;
					
					elsif input_b = '0' and input_a = '1' then
						next_state <= active_state; 
					end if;
					
			when active_state =>
				next_state <= idle_state;
			
			when others =>
				next_state <= idle_state;
			end case;
		end process;
	end;

--end test_sim_impl;

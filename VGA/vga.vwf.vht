-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/10/2021 22:38:39"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          vga
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY vga_vhd_vec_tst IS
END vga_vhd_vec_tst;
ARCHITECTURE vga_arch OF vga_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL blank : STD_LOGIC;
SIGNAL blue : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL clockOut : STD_LOGIC;
SIGNAL compSync : STD_LOGIC;
SIGNAL green : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL hsync : STD_LOGIC;
SIGNAL red : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL vsync : STD_LOGIC;
COMPONENT vga
	PORT (
	blank : OUT STD_LOGIC;
	blue : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	clk : IN STD_LOGIC;
	clockOut : OUT STD_LOGIC;
	compSync : OUT STD_LOGIC;
	green : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	hsync : OUT STD_LOGIC;
	red : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	reset : IN STD_LOGIC;
	vsync : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : vga
	PORT MAP (
-- list connections between master ports and signals
	blank => blank,
	blue => blue,
	clk => clk,
	clockOut => clockOut,
	compSync => compSync,
	green => green,
	hsync => hsync,
	red => red,
	reset => reset,
	vsync => vsync
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 20000 ps;
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;
END vga_arch;

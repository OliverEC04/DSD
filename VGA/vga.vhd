-- NOTE: cef 2017-1805: PROJECT IS READY FOR TEST AS-IS: CLK in and VGA output pins already assigned. See
--         clk Location PIN_N2
--         hsync Location PIN_A7
--         vsync Location PIN_D8
---        blank Location	PIN_D6
--         red[9] Location PIN_E10...
--       etc in "Assignments | Assignments Editor"
-- NOTE: cef 2017-1805: project cleaned up, removed temporary compilations files and added 
--        "set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files" 
--       to vga.qsf project file. Pretty-formated VHDL code.
--
-- Template for VGA output by: Rene Kristensen
-- This design template uses gated clocks which generally are bad design practice.
-- This implies that the template design is not optimized for speed and will only serve for educational purpose. 
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga is
	port (
		clk,reset : in std_logic;
		red, green, blue : out std_logic_vector(9 downto 0);
		hsync, vsync, clockOut, blank, compSync: out std_logic
	);		
end vga;

architecture testGenerator of vga is

	-- horizontal Timing constants for 640 x 480 @ 60Hz
	constant hFrontPorch : natural := 16; -- units are number of 25 MHz clocks
	constant hBackPorch  : natural := 48; 
	constant hDataLen    : natural := 640;
	constant hSynWidth   : natural := 96;

	-- vertical Timing constants for 640 x 480 @ 60Hz 
	constant vFrontPorch : natural := 10;  -- units are number of lines
	constant vBackPorch  : natural := 33;
	constant vDataLen    : natural := 480;
	constant vSynWidth   : natural := 2;

	-- signal declaration
	signal hSyncCounter, vSyncCounter : integer range 0 to 1023; -- contrain integer to 10 bit.
	signal hSyncOut,vSyncOut,clk25,vBlank,hBlank : std_logic;

	-- attributes ensuring the signals defined below are not reduced away before simulation.
	attribute keep: boolean; -- don't reduce vSyncCounter and hSyncCounter signals away, so we can watch these signals i simulator
	attribute keep of vSyncCounter : signal is true;  --   ||   --
	attribute keep of hSyncCounter : signal is true;  --   ||   --

	-- INSERT YOUR PROCEDURE HERE.
	-- Your procedure should circular increment syncCounter, produce blanking and sync output.  

begin

	clkdiv: process (reset,clk)  -- creates a 25 MHz pixel clock (clk25) from a 50 MHz input (clk).
	begin
		if (reset = '0') then
			clk25 <= '0';
		elsif rising_edge(clk) then
			clk25 <= not clk25;
		end if; 
	end process;

	-- horizontal process using the generic syncGenerator function to generate a proper hsync pulse.
	hsyn: process (reset,clk25) -- reacts on reset and 25 MHz clock.
	begin	
		if reset = '0' then
			hSyncCounter <= 0;
		elsif rising_edge(clk25) then
			-- generates active low pulse after every line
			syncGenerator(hSyncCounter,hSyncOut,hBlank,hFrontPorch,hBackPorch,hDataLen,hSynWidth); 
		end if;
	end process;

	-- vertical process using the generic syncGenerator function to generate a proper vsync pulse.
	vsyn: process (reset,hSyncOut) -- reacts on reset and hsync (meaning every line).
	begin
	  if reset = '0' then
		 vSyncCounter <= 0;
	  elsif rising_edge(hSyncOut) then
			-- generates active low pulse after every picture
			syncGenerator(vSyncCounter,vSyncOut,vBlank,vFrontPorch,vBackPorch,vDataLen,vSynWidth); 
		end if;
	end process;

	color: process (reset, hSyncCounter,vSyncCounter)  -- draws italian flag color scheme
	begin
		if ((hSyncCounter > hBackPorch) and (hSyncCounter <= hBackPorch+213)) then
			red   <= (others => '0');  -- Green
			green <= (others => '1');
			blue  <= (others => '0');  
		elsif ((hSyncCounter > hBackPorch+213) and (hSyncCounter <= hBackPorch+426)) then
			red   <= (others => '1');  -- White
			green <= (others => '1');
			blue  <= (others => '1');
		else
			red   <= (others => '1');  -- Red
			green <= (others => '0');
			blue  <= (others => '0');   
		end if;
	end process;

	vsync    <= vSyncOut;		            -- connect vsync to entity
	hsync    <= hSyncOut;               -- connect hsync to entity
	clockOut <= clk25;                  -- 25 MHz clock for DAC 
	blank    <= not (vBlank or hBlank); -- active low blanking.
	compSync <= '1'; 				            -- Never perform any composite sync. 
	
end testGenerator;


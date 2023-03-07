library verilog;
use verilog.vl_types.all;
entity four_bit_adder_tester is
    port(
        SW              : in     vl_logic_vector(8 downto 1);
        LEDR            : out    vl_logic_vector(3 downto 0)
    );
end four_bit_adder_tester;

/*
 * @file testBench_frequencySynthesizer.v
 * @brief Test bench for module that generates freqiencies from a 50MHz Clock.
 * @engeineer: Matthew Hardenburgh
 * @date 7/11/18
 */

 `timescale 1ns / 1ps // clock units/resolution of clock

 module testBench_clockDivider;

    //inputs are regs
    reg clk;
    reg rst;


    //outputs are wires
    wire slowerClock;

    clockDivider #(5000)dut(clk, rst, slowerClock);

    initial
    begin
        clk <= 0;
        rst <= 1;
        #20
        rst <= 0;
    end

    always #10 clk = ~clk;

 endmodule

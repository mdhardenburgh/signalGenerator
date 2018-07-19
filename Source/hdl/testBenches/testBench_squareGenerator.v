`timescale 1ns / 1ps // clock units/resolution of clock

module testBench_squareGenerator;

    reg clk;
    reg rst;
    reg[31:0] phase;
    reg[31:0] frequency;

    wire[7:0] dacLevel;

    squareGenerator dut(clk, rst, phase, frequency, dacLevel);

    initial
    begin
        clk <= 0;
        rst <= 1;
        phase <= 32'h00000000;
        frequency <= 32'd429496;
        #20
        rst <= 0;
    end
    always #10 clk = ~clk;
endmodule


module squareGenerator //For an 8 bit dac and a 50MHz clock there are 39 cycles per divison for a 5KHz sine wave.
(
    input clk, //Clock from the fpga or clock divider.
    input rst,
    input[31:0] phase,
    input[31:0] frequency, //Frequency is in terms of step sizes. larger step sizes increase the frequency.

    output[7:0] dacLevel
);
    reg[31:0] phaseAccumulator;

    assign dacLevel = {8{phaseAccumulator[31]}};

    always@(posedge clk, posedge rst)
    begin
        if(rst == 1'b1)
        begin
            phaseAccumulator <= 32'b0;
        end

        else
        begin
            phaseAccumulator <= phaseAccumulator + frequency + phase;
        end
    end
endmodule

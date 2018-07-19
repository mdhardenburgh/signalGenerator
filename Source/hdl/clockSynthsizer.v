module clockDivider #(parameter frequencySel = 5000)
(
    input clk,
    input rst,

    output reg slowerClock
);

    reg[15:0] counter;
    always@(posedge clk, posedge rst)
    begin
        if(rst == 1'b1)
        begin
            slowerClock <= 1'b0;
            counter <= 16'b0;
        end

        else
        begin
            if(counter == frequencySel)
            begin
                counter <= 16'b0;
                slowerClock <= ~slowerClock;
            end

            else
            begin
                counter <= counter + 1'b1;
            end
        end
    end

endmodule

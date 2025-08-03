`timescale 1ns / 1ps

module tb_baud;

    parameter BAUD = 115200;
    parameter EN = 868;

    reg clk;
    reg rst;
    reg i_run;
    wire baud_en;

    baud u_but (
        .clk(clk),
        .rst(rst),
        .i_run(i_run),
        .baud_en(baud_en)
    );

    always
    #5 clk = ~clk;

    initial begin
        rst = 0;
        clk = 0;
        i_run = 0;
    #10
        rst = 1;
    #10 
        rst = 0;
    #10
        i_run = 1;
    #5000
        $finish;
    end
endmodule
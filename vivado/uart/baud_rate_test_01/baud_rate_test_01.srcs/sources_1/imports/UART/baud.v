`timescale 1ns / 1ps

module baud #(
    parameter BAUD = 115200,
    parameter EN = 868
)
(
    input clk,
    input rst,
    input i_run,
    output baud_en
);

    reg [9:0] cnt_baud;
    reg       r_baud_en;

    always @ (posedge clk) begin
        if (rst) begin
            cnt_baud <= 0;
        end else if (i_run) begin
            if (cnt_baud == EN) begin
                cnt_baud <= 0;
            end else begin 
                cnt_baud <= cnt_baud + 1;
            end
        end
    end

    always @ (posedge clk) begin
        if (rst) begin
            r_baud_en <= 0;
        end else if (i_run && cnt_baud == EN) begin
            r_baud_en <= 1;
        end else begin
            r_baud_en <= 0;
        end
    end

    assign baud_en = r_baud_en;

endmodule
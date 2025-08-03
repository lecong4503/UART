`timescale 1ns / 1ps

module tx #(
    parameter BAUD = 115200,
    parameter EN = 868,
    parameter DWIDTH = 8
)
(
    input clk,
    input rst,
    input baud_en,

    input [DWIDTH-1:0] i_data,
    output ot_tx
);

    reg [DWIDTH-1:0] r_data;

    always @ (posedge clk) begin
        if (rst) begin
            r_data <= 0;
        end else begin
            r_data <= i_data;
        end
    end

    reg tx_send;
    integer i;

    always @ (posedge clk) begin
        for (i=0; i<DWIDTH; i=i+1) begin
            if (rst) begin
                tx_send <= 0;
            end else if(baud_en == 1) begin
                tx_send <= r_data[i];
            end
        end
    end

    assign ot_tx = tx_send;

endmodule    
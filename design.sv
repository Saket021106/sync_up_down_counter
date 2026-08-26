module sync_up_down_counter(
    input wire clk,
    input logic M,
    output wire [2:0] Q
);

    genvar i;
    wire [1:0] gated_input;

    assign gated_input[0] = (M & Q[0]) | (~M & ~Q[0]);
    assign gated_input[1] = (M & Q[0] & Q[1]) | (~M & ~Q[0] & ~Q[1]);

    generate
        for(i = 0; i < 3; i = i + 1) begin : jk_chain
            if(i == 0) begin
                jk_ff JK (
                    .clk(clk),
                    .j(1'b1),
                    .k(1'b1),
                    .q(Q[i])
                );
            end else begin
                jk_ff JK (
                    .clk(clk),
                    .j(gated_input[i-1]),
                    .k(gated_input[i-1]),
                    .q(Q[i])
                );
            end
        end
    endgenerate

endmodule

module jk_ff (
    input clk,
    input j,
    input k,
    output reg q = 1'b0
);

    always @(negedge clk) begin
        case ({j, k})
            2'b00 : q <= q;
            2'b01 : q <= 1'b0;
            2'b10 : q <= 1'b1;
            2'b11 : q <= ~q;
        endcase
    end

endmodule

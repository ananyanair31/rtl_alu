`timescale 1ns / 1ps

module alu(
    input [7:0] a,b,
    input [3:0] alu_sel,
    output [7:0] alu_out,
    output zero
    );
    reg [7:0] alu_result;
    wire [8:0] tmp;
    assign alu_out = alu_result;
    assign tmp = {1'b0,a} + {1'b0,b};
    assign carryout = tmp[8];
    always @(*)
    begin
        case(alu_sel)
        4'b0000:
            alu_result = a+b;
        4'b0001:
            alu_result = a-b;
        4'b0010:
            alu_result = a*b;
        4'b0011:
            alu_result = a/b;
        // logical shift left
        4'b0100:
            alu_result = a<<1;
        // shift right
        4'b0101:
            alu_result = a>>1;
        4'b0110:    // rotate left
            alu_result = {a[6:0],a[7]};
        4'b0111:    // rotate right
            alu_result = {a[0],a[7:1]};
        4'b1000: 
            alu_result = a&b;
        4'b1001:
            alu_result = a|b;
        4'b1010:
            alu_result = a^b;
        4'b1011:
            alu_result = ~(a|b);
        4'b1100:
            alu_result = ~(a&b);
        4'b1101:
            alu_result = ~(a^b);
        4'b1110:
            alu_result = (a>b)?8'd1:8'd0;
        4'b1111:
            alu_result = (a==b)?8'd1:8'd0;
        default: alu_result = a+b;
        endcase
      end
endmodule

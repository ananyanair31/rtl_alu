`timescale 1ns / 1ps

module stimuli;
    reg [7:0] a,b;
    reg [3:0] alu_sel;
    wire [7:0] alu_out;
    wire carryout;
    integer i;
    
    alu test_unit(
            a,b,  // ALU 8-bit Inputs                 
            alu_sel,// ALU Selection
            alu_out, // ALU 8-bit Output
            carryout // Carry Out Flag
     );

    initial begin
         a = 8'h0A;
         b = 8'h02;
         alu_sel = 4'h0;
                  
         for (i=0;i<=15;i=i+1)
          begin
           $monitor("A=%d B=%d ALU_Sel=%b → ALU_Out=%d carryout=%b", a, b, alu_sel,alu_out,carryout);
           alu_sel = alu_sel + 8'h01;
           #10;
          end;
          
          a = 8'hF2;
          b = 8'hD3;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:02:00 01/25/2025 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_Sel,
    output [31:0] ALU_Out,
    output CarryOut
    );
	 
	 reg [31:0] ALU_Result;
	 wire [32:0] temp;
	 
	 assign ALU_Out = ALU_Result;
	 assign temp = {1'b0, A} + {1'b0, B};
	 assign CarryOut = temp[32];
	 always@(*)
	 begin 
		case(ALU_Sel)
		4'b0000: //for addition
			ALU_Result = A + B;
		4'b0001: //for subtraction
			ALU_Result = A - B;
		4'b0010: //for multiplication
			ALU_Result = A * B;
		4'b0011: //for division
			ALU_Result = A / B;
		4'b0100: //logical shift left
			ALU_Result = A << 1;
		4'b0101: //logical shift right
			ALU_Result = A >> 1;
		4'b0110: //rotate left
			ALU_Result = {A[30:0],A[31]};
		4'b0111: //rotate right
			ALU_Result = {A[0],A[31:1]};
		4'b1000: //logical and
			ALU_Result = A & B;
		4'b1001: //logical or
			ALU_Result = A | B;
		4'b1010: //logical Xor;
			ALU_Result = A ^ B;
		4'b1011:	//logical Nor
			ALU_Result = ~(A | B);
		4'b1100: //logical Nand
			ALU_Result = ~(A & B);
		4'b1101: //logical XNOR;
			ALU_Result = ~(A ^ B);
		4'b1110: //Greater comparison
			ALU_Result = (A > B) ? 32'd1 : 32'd0;
		4'b1111: //Equal comparison
			ALU_Result = (A == B)? 32'd1 : 32'd0;
		default: ALU_Result = A + B;
		endcase
	end
			
	 

endmodule

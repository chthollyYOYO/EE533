////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : detect7B.vf
// /___/   /\     Timestamp : 02/01/2025 07:13:33
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "C:/Documents and Settings/student/Desktop/lab4/detect7B.sch" detect7B.vf
//Design Name: detect7B
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module detect7B(ce, 
                clk, 
                hwregA, 
                match_en, 
                mrst, 
                pipe1, 
                match);

    input ce;
    input clk;
    input [63:0] hwregA;
    input match_en;
    input mrst;
    input [71:0] pipe1;
   output match;
   
   wire [71:0] pipe0;
   wire XLXN_6;
   wire XLXN_8;
   wire XLXN_11;
   wire [111:0] XLXN_17;
   wire match_DUMMY;
   
   assign match = match_DUMMY;
   reg9B XLXI_1 (.ce(ce), 
                 .clk(clk), 
                 .clr(XLXN_6), 
                 .d(pipe1[71:0]), 
                 .q(pipe0[71:0]));
   busmerge XLXI_2 (.da(pipe0[47:0]), 
                    .db(pipe1[63:0]), 
                    .q(XLXN_17[111:0]));
   wordmatch XLXI_3 (.datacomp(hwregA[55:0]), 
                     .datain(XLXN_17[111:0]), 
                     .wildcard(hwregA[62:56]), 
                     .match(XLXN_8));
   AND3B1 XLXI_4 (.I0(match_DUMMY), 
                  .I1(match_en), 
                  .I2(XLXN_8), 
                  .O(XLXN_11));
   FDCE XLXI_5 (.C(clk), 
                .CE(XLXN_11), 
                .CLR(XLXN_6), 
                .D(XLXN_11), 
                .Q(match_DUMMY));
   defparam XLXI_5.INIT = 1'b0;
   FD XLXI_6 (.C(clk), 
              .D(mrst), 
              .Q(XLXN_6));
   defparam XLXI_6.INIT = 1'b0;
endmodule

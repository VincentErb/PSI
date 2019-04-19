////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.87xd
//  \   \         Application: netgen
//  /   /         Filename: Compteur8bitSynchrone_synthesis.v
// /___/   /\     Timestamp: Thu Mar 21 08:58:19 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim Compteur8bitSynchrone.ngc Compteur8bitSynchrone_synthesis.v 
// Device	: xc3sd1800a-4-fg676
// Input file	: Compteur8bitSynchrone.ngc
// Output file	: /home/arens/CompteurSynchrone/netgen/synthesis/Compteur8bitSynchrone_synthesis.v
// # of Modules	: 1
// Design Name	: Compteur8bitSynchrone
// Xilinx        : /usr/local/insa/Xilinx.ISE/13.4/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module Compteur8bitSynchrone (
  CK, SENS, EN, RST, LOAD, Dout, Din
);
  input CK;
  input SENS;
  input EN;
  input RST;
  input LOAD;
  output [7 : 0] Dout;
  input [7 : 0] Din;
  wire CK_BUFGP_1;
  wire D_and0000;
  wire D_not0001;
  wire Din_0_IBUF_20;
  wire Din_1_IBUF_21;
  wire Din_2_IBUF_22;
  wire Din_3_IBUF_23;
  wire Din_4_IBUF_24;
  wire Din_5_IBUF_25;
  wire Din_6_IBUF_26;
  wire Din_7_IBUF_27;
  wire EN_IBUF_37;
  wire LOAD_IBUF_39;
  wire LOAD_inv;
  wire Mcount_D;
  wire Mcount_D1_42;
  wire Mcount_D2;
  wire Mcount_D3;
  wire Mcount_D4;
  wire Mcount_D5;
  wire Mcount_D6;
  wire Mcount_D7;
  wire Mcount_D8;
  wire Mcount_D_mand_65;
  wire Mcount_D_mand1;
  wire Mcount_D_mand2;
  wire Mcount_D_mand3;
  wire Mcount_D_mand4;
  wire Mcount_D_mand5;
  wire Mcount_D_mand6;
  wire RST_IBUF_73;
  wire RST_inv;
  wire SENS_IBUF_76;
  wire [7 : 0] D;
  wire [6 : 0] Mcount_D_cy;
  wire [7 : 0] Mcount_D_lut;
  MULT_AND   Mcount_D_mand (
    .I0(D[0]),
    .I1(LOAD_inv),
    .LO(Mcount_D_mand_65)
  );
  LUT4 #(
    .INIT ( 16'h3ACA ))
  \Mcount_D_lut<0>  (
    .I0(Din_0_IBUF_20),
    .I1(D_and0000),
    .I2(LOAD_inv),
    .I3(D[0]),
    .O(Mcount_D_lut[0])
  );
  MUXCY   \Mcount_D_cy<0>  (
    .CI(Mcount_D),
    .DI(Mcount_D_mand_65),
    .S(Mcount_D_lut[0]),
    .O(Mcount_D_cy[0])
  );
  XORCY   \Mcount_D_xor<0>  (
    .CI(Mcount_D),
    .LI(Mcount_D_lut[0]),
    .O(Mcount_D1_42)
  );
  MULT_AND   Mcount_D_mand_0 (
    .I0(D[1]),
    .I1(LOAD_inv),
    .LO(Mcount_D_mand1)
  );
  LUT4 #(
    .INIT ( 16'hCA3A ))
  \Mcount_D_lut<1>  (
    .I0(Din_1_IBUF_21),
    .I1(D_and0000),
    .I2(LOAD_inv),
    .I3(D[1]),
    .O(Mcount_D_lut[1])
  );
  MUXCY   \Mcount_D_cy<1>  (
    .CI(Mcount_D_cy[0]),
    .DI(Mcount_D_mand1),
    .S(Mcount_D_lut[1]),
    .O(Mcount_D_cy[1])
  );
  XORCY   \Mcount_D_xor<1>  (
    .CI(Mcount_D_cy[0]),
    .LI(Mcount_D_lut[1]),
    .O(Mcount_D2)
  );
  MULT_AND   Mcount_D_mand_1 (
    .I0(D[2]),
    .I1(LOAD_inv),
    .LO(Mcount_D_mand2)
  );
  LUT4 #(
    .INIT ( 16'hCA3A ))
  \Mcount_D_lut<2>  (
    .I0(Din_2_IBUF_22),
    .I1(D_and0000),
    .I2(LOAD_inv),
    .I3(D[2]),
    .O(Mcount_D_lut[2])
  );
  MUXCY   \Mcount_D_cy<2>  (
    .CI(Mcount_D_cy[1]),
    .DI(Mcount_D_mand2),
    .S(Mcount_D_lut[2]),
    .O(Mcount_D_cy[2])
  );
  XORCY   \Mcount_D_xor<2>  (
    .CI(Mcount_D_cy[1]),
    .LI(Mcount_D_lut[2]),
    .O(Mcount_D3)
  );
  MULT_AND   Mcount_D_mand_2 (
    .I0(D[3]),
    .I1(LOAD_inv),
    .LO(Mcount_D_mand3)
  );
  LUT4 #(
    .INIT ( 16'hCA3A ))
  \Mcount_D_lut<3>  (
    .I0(Din_3_IBUF_23),
    .I1(D_and0000),
    .I2(LOAD_inv),
    .I3(D[3]),
    .O(Mcount_D_lut[3])
  );
  MUXCY   \Mcount_D_cy<3>  (
    .CI(Mcount_D_cy[2]),
    .DI(Mcount_D_mand3),
    .S(Mcount_D_lut[3]),
    .O(Mcount_D_cy[3])
  );
  XORCY   \Mcount_D_xor<3>  (
    .CI(Mcount_D_cy[2]),
    .LI(Mcount_D_lut[3]),
    .O(Mcount_D4)
  );
  MULT_AND   Mcount_D_mand_3 (
    .I0(D[4]),
    .I1(LOAD_inv),
    .LO(Mcount_D_mand4)
  );
  LUT4 #(
    .INIT ( 16'hCA3A ))
  \Mcount_D_lut<4>  (
    .I0(Din_4_IBUF_24),
    .I1(D_and0000),
    .I2(LOAD_inv),
    .I3(D[4]),
    .O(Mcount_D_lut[4])
  );
  MUXCY   \Mcount_D_cy<4>  (
    .CI(Mcount_D_cy[3]),
    .DI(Mcount_D_mand4),
    .S(Mcount_D_lut[4]),
    .O(Mcount_D_cy[4])
  );
  XORCY   \Mcount_D_xor<4>  (
    .CI(Mcount_D_cy[3]),
    .LI(Mcount_D_lut[4]),
    .O(Mcount_D5)
  );
  MULT_AND   Mcount_D_mand_4 (
    .I0(D[5]),
    .I1(LOAD_inv),
    .LO(Mcount_D_mand5)
  );
  LUT4 #(
    .INIT ( 16'hCA3A ))
  \Mcount_D_lut<5>  (
    .I0(Din_5_IBUF_25),
    .I1(D_and0000),
    .I2(LOAD_inv),
    .I3(D[5]),
    .O(Mcount_D_lut[5])
  );
  MUXCY   \Mcount_D_cy<5>  (
    .CI(Mcount_D_cy[4]),
    .DI(Mcount_D_mand5),
    .S(Mcount_D_lut[5]),
    .O(Mcount_D_cy[5])
  );
  XORCY   \Mcount_D_xor<5>  (
    .CI(Mcount_D_cy[4]),
    .LI(Mcount_D_lut[5]),
    .O(Mcount_D6)
  );
  MULT_AND   Mcount_D_mand_5 (
    .I0(D[6]),
    .I1(LOAD_inv),
    .LO(Mcount_D_mand6)
  );
  LUT4 #(
    .INIT ( 16'hCA3A ))
  \Mcount_D_lut<6>  (
    .I0(Din_6_IBUF_26),
    .I1(D_and0000),
    .I2(LOAD_inv),
    .I3(D[6]),
    .O(Mcount_D_lut[6])
  );
  MUXCY   \Mcount_D_cy<6>  (
    .CI(Mcount_D_cy[5]),
    .DI(Mcount_D_mand6),
    .S(Mcount_D_lut[6]),
    .O(Mcount_D_cy[6])
  );
  XORCY   \Mcount_D_xor<6>  (
    .CI(Mcount_D_cy[5]),
    .LI(Mcount_D_lut[6]),
    .O(Mcount_D7)
  );
  LUT4 #(
    .INIT ( 16'hD782 ))
  \Mcount_D_lut<7>  (
    .I0(LOAD_inv),
    .I1(D[7]),
    .I2(D_and0000),
    .I3(Din_7_IBUF_27),
    .O(Mcount_D_lut[7])
  );
  XORCY   \Mcount_D_xor<7>  (
    .CI(Mcount_D_cy[6]),
    .LI(Mcount_D_lut[7]),
    .O(Mcount_D8)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  D_0 (
    .C(CK_BUFGP_1),
    .CE(D_not0001),
    .D(Mcount_D1_42),
    .R(RST_inv),
    .Q(D[0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  D_1 (
    .C(CK_BUFGP_1),
    .CE(D_not0001),
    .D(Mcount_D2),
    .R(RST_inv),
    .Q(D[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  D_2 (
    .C(CK_BUFGP_1),
    .CE(D_not0001),
    .D(Mcount_D3),
    .R(RST_inv),
    .Q(D[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  D_3 (
    .C(CK_BUFGP_1),
    .CE(D_not0001),
    .D(Mcount_D4),
    .R(RST_inv),
    .Q(D[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  D_4 (
    .C(CK_BUFGP_1),
    .CE(D_not0001),
    .D(Mcount_D5),
    .R(RST_inv),
    .Q(D[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  D_5 (
    .C(CK_BUFGP_1),
    .CE(D_not0001),
    .D(Mcount_D6),
    .R(RST_inv),
    .Q(D[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  D_6 (
    .C(CK_BUFGP_1),
    .CE(D_not0001),
    .D(Mcount_D7),
    .R(RST_inv),
    .Q(D[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  D_7 (
    .C(CK_BUFGP_1),
    .CE(D_not0001),
    .D(Mcount_D8),
    .R(RST_inv),
    .Q(D[7])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  D_not00011 (
    .I0(EN_IBUF_37),
    .I1(LOAD_IBUF_39),
    .O(D_not0001)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  D_and00001 (
    .I0(EN_IBUF_37),
    .I1(SENS_IBUF_76),
    .O(D_and0000)
  );
  IBUF   SENS_IBUF (
    .I(SENS),
    .O(SENS_IBUF_76)
  );
  IBUF   EN_IBUF (
    .I(EN),
    .O(EN_IBUF_37)
  );
  IBUF   RST_IBUF (
    .I(RST),
    .O(RST_IBUF_73)
  );
  IBUF   LOAD_IBUF (
    .I(LOAD),
    .O(LOAD_IBUF_39)
  );
  IBUF   Din_7_IBUF (
    .I(Din[7]),
    .O(Din_7_IBUF_27)
  );
  IBUF   Din_6_IBUF (
    .I(Din[6]),
    .O(Din_6_IBUF_26)
  );
  IBUF   Din_5_IBUF (
    .I(Din[5]),
    .O(Din_5_IBUF_25)
  );
  IBUF   Din_4_IBUF (
    .I(Din[4]),
    .O(Din_4_IBUF_24)
  );
  IBUF   Din_3_IBUF (
    .I(Din[3]),
    .O(Din_3_IBUF_23)
  );
  IBUF   Din_2_IBUF (
    .I(Din[2]),
    .O(Din_2_IBUF_22)
  );
  IBUF   Din_1_IBUF (
    .I(Din[1]),
    .O(Din_1_IBUF_21)
  );
  IBUF   Din_0_IBUF (
    .I(Din[0]),
    .O(Din_0_IBUF_20)
  );
  OBUF   Dout_7_OBUF (
    .I(D[7]),
    .O(Dout[7])
  );
  OBUF   Dout_6_OBUF (
    .I(D[6]),
    .O(Dout[6])
  );
  OBUF   Dout_5_OBUF (
    .I(D[5]),
    .O(Dout[5])
  );
  OBUF   Dout_4_OBUF (
    .I(D[4]),
    .O(Dout[4])
  );
  OBUF   Dout_3_OBUF (
    .I(D[3]),
    .O(Dout[3])
  );
  OBUF   Dout_2_OBUF (
    .I(D[2]),
    .O(Dout[2])
  );
  OBUF   Dout_1_OBUF (
    .I(D[1]),
    .O(Dout[1])
  );
  OBUF   Dout_0_OBUF (
    .I(D[0]),
    .O(Dout[0])
  );
  LUT3 #(
    .INIT ( 8'h51 ))
  Mcount_D1 (
    .I0(LOAD_IBUF_39),
    .I1(SENS_IBUF_76),
    .I2(EN_IBUF_37),
    .O(Mcount_D)
  );
  BUFGP   CK_BUFGP (
    .I(CK),
    .O(CK_BUFGP_1)
  );
  INV   RST_inv1_INV_0 (
    .I(RST_IBUF_73),
    .O(RST_inv)
  );
  INV   LOAD_inv1_INV_0 (
    .I(LOAD_IBUF_39),
    .O(LOAD_inv)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif


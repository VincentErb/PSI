////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.87xd
//  \   \         Application: netgen
//  /   /         Filename: Compteur8bitSynchrone_timesim.v
// /___/   /\     Timestamp: Thu Mar 28 11:40:06 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 3 -pcf Compteur8bitSynchrone.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -insert_pp_buffers true -w -dir netgen/par -ofmt verilog -sim Compteur8bitSynchrone.ncd Compteur8bitSynchrone_timesim.v 
// Device	: 6slx16csg324-3 (PRODUCTION 1.21 2012-01-07)
// Input file	: Compteur8bitSynchrone.ncd
// Output file	: /home/arens/CompteurSynchrone/netgen/par/Compteur8bitSynchrone_timesim.v
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
  CK, EN, SENS, RST, LOAD, Din, Dout
);
  input CK;
  input EN;
  input SENS;
  input RST;
  input LOAD;
  input [7 : 0] Din;
  output [7 : 0] Dout;
  wire \CK_BUFGP/IBUFG_0 ;
  wire CK_BUFGP;
  wire Mcount_D;
  wire LOAD_IBUF_0;
  wire SENS_IBUF_0;
  wire EN_IBUF_0;
  wire _n0030_inv;
  wire Din_0_IBUF_0;
  wire Din_1_IBUF_0;
  wire Din_2_IBUF_0;
  wire Din_3_IBUF_0;
  wire RST_inv;
  wire Din_4_IBUF_0;
  wire Din_5_IBUF_0;
  wire Din_6_IBUF_0;
  wire Din_7_IBUF_0;
  wire Mcount_D_mand2;
  wire Mcount_D1_33;
  wire Mcount_D2;
  wire Mcount_D3;
  wire Mcount_D4;
  wire Mcount_D_mand_18;
  wire Mcount_D_mand1;
  wire Mcount_D_mand3;
  wire Mcount_D_mand5;
  wire Mcount_D_mand6;
  wire Mcount_D5;
  wire Mcount_D6;
  wire Mcount_D7;
  wire Mcount_D8;
  wire Mcount_D_mand4;
  wire \CK_BUFGP/IBUFG_98 ;
  wire LOAD_IBUF_101;
  wire EN_IBUF_104;
  wire SENS_IBUF_107;
  wire \ProtoComp7.IINV.OUT ;
  wire RST_inv_non_inverted;
  wire Din_0_IBUF_114;
  wire Din_1_IBUF_117;
  wire Din_2_IBUF_120;
  wire Din_3_IBUF_123;
  wire Din_4_IBUF_126;
  wire Din_5_IBUF_131;
  wire Din_6_IBUF_136;
  wire Din_7_IBUF_141;
  wire \NlwBufferSignal_CK_BUFGP/BUFG/IN ;
  wire \NlwBufferSignal_D_3/CLK ;
  wire \NlwBufferSignal_D_2/CLK ;
  wire \NlwBufferSignal_D_1/CLK ;
  wire \NlwBufferSignal_D_0/CLK ;
  wire \NlwBufferSignal_D_7/CLK ;
  wire \NlwBufferSignal_D_6/CLK ;
  wire \NlwBufferSignal_D_5/CLK ;
  wire \NlwBufferSignal_D_4/CLK ;
  wire \NlwBufferSignal_Dout_4_OBUF/I ;
  wire \NlwBufferSignal_Dout_5_OBUF/I ;
  wire \NlwBufferSignal_Dout_6_OBUF/I ;
  wire \NlwBufferSignal_Dout_7_OBUF/I ;
  wire \NlwBufferSignal_Dout_0_OBUF/I ;
  wire \NlwBufferSignal_Dout_1_OBUF/I ;
  wire \NlwBufferSignal_Dout_2_OBUF/I ;
  wire \NlwBufferSignal_Dout_3_OBUF/I ;
  wire GND;
  wire \NLW_Mcount_D_cy<3>_CO[0]_UNCONNECTED ;
  wire \NLW_Mcount_D_cy<3>_CO[1]_UNCONNECTED ;
  wire \NLW_Mcount_D_cy<3>_CO[2]_UNCONNECTED ;
  wire \NLW_Mcount_D_xor<7>_CO[0]_UNCONNECTED ;
  wire \NLW_Mcount_D_xor<7>_CO[1]_UNCONNECTED ;
  wire \NLW_Mcount_D_xor<7>_CO[2]_UNCONNECTED ;
  wire \NLW_Mcount_D_xor<7>_CO[3]_UNCONNECTED ;
  wire \NLW_Mcount_D_xor<7>_DI[3]_UNCONNECTED ;
  wire [7 : 0] D;
  wire [3 : 3] Mcount_D_cy;
  wire [7 : 0] Mcount_D_lut;
  initial $sdf_annotate("netgen/par/Compteur8bitSynchrone_timesim.sdf");
  X_CKBUF #(
    .LOC ( "BUFGMUX_X3Y13" ))
  \CK_BUFGP/BUFG  (
    .I(\NlwBufferSignal_CK_BUFGP/BUFG/IN ),
    .O(CK_BUFGP)
  );
  X_SFF #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 1'b0 ))
  D_3 (
    .CE(_n0030_inv),
    .CLK(\NlwBufferSignal_D_3/CLK ),
    .I(Mcount_D4),
    .O(D[3]),
    .SRST(RST_inv),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 64'hD1C0E2F3D1C0E2F3 ))
  \Mcount_D_lut<3>  (
    .ADR2(Din_3_IBUF_0),
    .ADR3(SENS_IBUF_0),
    .ADR0(EN_IBUF_0),
    .ADR4(D[3]),
    .ADR1(LOAD_IBUF_0),
    .ADR5(1'b1),
    .O(Mcount_D_lut[3])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 32'h33330000 ))
  Mcount_D_mand_2 (
    .ADR0(1'b1),
    .ADR3(1'b1),
    .ADR2(1'b1),
    .ADR4(D[3]),
    .ADR1(LOAD_IBUF_0),
    .O(Mcount_D_mand3)
  );
  X_SFF #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 1'b0 ))
  D_2 (
    .CE(_n0030_inv),
    .CLK(\NlwBufferSignal_D_2/CLK ),
    .I(Mcount_D3),
    .O(D[2]),
    .SRST(RST_inv),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X16Y12" ))
  \Mcount_D_cy<3>  (
    .CI(1'b0),
    .CYINIT(Mcount_D),
    .CO({Mcount_D_cy[3], \NLW_Mcount_D_cy<3>_CO[2]_UNCONNECTED , \NLW_Mcount_D_cy<3>_CO[1]_UNCONNECTED , \NLW_Mcount_D_cy<3>_CO[0]_UNCONNECTED }),
    .DI({Mcount_D_mand3, Mcount_D_mand2, Mcount_D_mand1, Mcount_D_mand_18}),
    .O({Mcount_D4, Mcount_D3, Mcount_D2, Mcount_D1_33}),
    .S({Mcount_D_lut[3], Mcount_D_lut[2], Mcount_D_lut[1], Mcount_D_lut[0]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 64'hA3A0ACAFA3A0ACAF ))
  \Mcount_D_lut<2>  (
    .ADR0(Din_2_IBUF_0),
    .ADR3(SENS_IBUF_0),
    .ADR1(EN_IBUF_0),
    .ADR4(D[2]),
    .ADR2(LOAD_IBUF_0),
    .ADR5(1'b1),
    .O(Mcount_D_lut[2])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 32'h0F0F0000 ))
  Mcount_D_mand_1 (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR3(1'b1),
    .ADR4(D[2]),
    .ADR2(LOAD_IBUF_0),
    .O(Mcount_D_mand2)
  );
  X_SFF #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 1'b0 ))
  D_1 (
    .CE(_n0030_inv),
    .CLK(\NlwBufferSignal_D_1/CLK ),
    .I(Mcount_D2),
    .O(D[1]),
    .SRST(RST_inv),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 64'h88D8DD8D88D8DD8D ))
  \Mcount_D_lut<1>  (
    .ADR1(Din_1_IBUF_0),
    .ADR2(SENS_IBUF_0),
    .ADR3(EN_IBUF_0),
    .ADR4(D[1]),
    .ADR0(LOAD_IBUF_0),
    .ADR5(1'b1),
    .O(Mcount_D_lut[1])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 32'h55550000 ))
  Mcount_D_mand_0 (
    .ADR3(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(D[1]),
    .ADR0(LOAD_IBUF_0),
    .O(Mcount_D_mand1)
  );
  X_SFF #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 1'b0 ))
  D_0 (
    .CE(_n0030_inv),
    .CLK(\NlwBufferSignal_D_0/CLK ),
    .I(Mcount_D1_33),
    .O(D[0]),
    .SRST(RST_inv),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 64'hF0BBF044F0BBF044 ))
  \Mcount_D_lut<0>  (
    .ADR2(Din_0_IBUF_0),
    .ADR1(SENS_IBUF_0),
    .ADR0(EN_IBUF_0),
    .ADR4(D[0]),
    .ADR3(LOAD_IBUF_0),
    .ADR5(1'b1),
    .O(Mcount_D_lut[0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X16Y12" ),
    .INIT ( 32'h00FF0000 ))
  Mcount_D_mand (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(D[0]),
    .ADR3(LOAD_IBUF_0),
    .O(Mcount_D_mand_18)
  );
  X_SFF #(
    .LOC ( "SLICE_X16Y13" ),
    .INIT ( 1'b0 ))
  D_7 (
    .CE(_n0030_inv),
    .CLK(\NlwBufferSignal_D_7/CLK ),
    .I(Mcount_D8),
    .O(D[7]),
    .SRST(RST_inv),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y13" ),
    .INIT ( 64'hC0E2C0E2F3D1F3D1 ))
  \Mcount_D_lut<7>  (
    .ADR4(1'b1),
    .ADR2(Din_7_IBUF_0),
    .ADR0(SENS_IBUF_0),
    .ADR5(D[7]),
    .ADR3(EN_IBUF_0),
    .ADR1(LOAD_IBUF_0),
    .O(Mcount_D_lut[7])
  );
  X_SFF #(
    .LOC ( "SLICE_X16Y13" ),
    .INIT ( 1'b0 ))
  D_6 (
    .CE(_n0030_inv),
    .CLK(\NlwBufferSignal_D_6/CLK ),
    .I(Mcount_D7),
    .O(D[6]),
    .SRST(RST_inv),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X16Y13" ))
  \Mcount_D_xor<7>  (
    .CI(Mcount_D_cy[3]),
    .CYINIT(1'b0),
    .CO({\NLW_Mcount_D_xor<7>_CO[3]_UNCONNECTED , \NLW_Mcount_D_xor<7>_CO[2]_UNCONNECTED , \NLW_Mcount_D_xor<7>_CO[1]_UNCONNECTED , 
\NLW_Mcount_D_xor<7>_CO[0]_UNCONNECTED }),
    .DI({\NLW_Mcount_D_xor<7>_DI[3]_UNCONNECTED , Mcount_D_mand6, Mcount_D_mand5, Mcount_D_mand4}),
    .O({Mcount_D8, Mcount_D7, Mcount_D6, Mcount_D5}),
    .S({Mcount_D_lut[7], Mcount_D_lut[6], Mcount_D_lut[5], Mcount_D_lut[4]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y13" ),
    .INIT ( 64'hF044F0BBF044F0BB ))
  \Mcount_D_lut<6>  (
    .ADR2(Din_6_IBUF_0),
    .ADR1(SENS_IBUF_0),
    .ADR0(EN_IBUF_0),
    .ADR4(D[6]),
    .ADR3(LOAD_IBUF_0),
    .ADR5(1'b1),
    .O(Mcount_D_lut[6])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X16Y13" ),
    .INIT ( 32'h00FF0000 ))
  Mcount_D_mand_5 (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(D[6]),
    .ADR3(LOAD_IBUF_0),
    .O(Mcount_D_mand6)
  );
  X_SFF #(
    .LOC ( "SLICE_X16Y13" ),
    .INIT ( 1'b0 ))
  D_5 (
    .CE(_n0030_inv),
    .CLK(\NlwBufferSignal_D_5/CLK ),
    .I(Mcount_D6),
    .O(D[5]),
    .SRST(RST_inv),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y13" ),
    .INIT ( 64'hF022F0DDF022F0DD ))
  \Mcount_D_lut<5>  (
    .ADR2(Din_5_IBUF_0),
    .ADR0(SENS_IBUF_0),
    .ADR1(EN_IBUF_0),
    .ADR4(D[5]),
    .ADR3(LOAD_IBUF_0),
    .ADR5(1'b1),
    .O(Mcount_D_lut[5])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X16Y13" ),
    .INIT ( 32'h00FF0000 ))
  Mcount_D_mand_4 (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(D[5]),
    .ADR3(LOAD_IBUF_0),
    .O(Mcount_D_mand5)
  );
  X_SFF #(
    .LOC ( "SLICE_X16Y13" ),
    .INIT ( 1'b0 ))
  D_4 (
    .CE(_n0030_inv),
    .CLK(\NlwBufferSignal_D_4/CLK ),
    .I(Mcount_D5),
    .O(D[4]),
    .SRST(RST_inv),
    .SET(GND),
    .RST(GND),
    .SSET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y13" ),
    .INIT ( 64'hF022F0DDF022F0DD ))
  \Mcount_D_lut<4>  (
    .ADR2(Din_4_IBUF_0),
    .ADR0(SENS_IBUF_0),
    .ADR1(EN_IBUF_0),
    .ADR4(D[4]),
    .ADR3(LOAD_IBUF_0),
    .ADR5(1'b1),
    .O(Mcount_D_lut[4])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X16Y13" ),
    .INIT ( 32'h00FF0000 ))
  Mcount_D_mand_3 (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(D[4]),
    .ADR3(LOAD_IBUF_0),
    .O(Mcount_D_mand4)
  );
  X_OPAD #(
    .LOC ( "PAD130" ))
  \Dout<4>  (
    .PAD(Dout[4])
  );
  X_OBUF #(
    .LOC ( "PAD130" ))
  Dout_4_OBUF (
    .I(\NlwBufferSignal_Dout_4_OBUF/I ),
    .O(Dout[4])
  );
  X_OPAD #(
    .LOC ( "PAD129" ))
  \Dout<5>  (
    .PAD(Dout[5])
  );
  X_OBUF #(
    .LOC ( "PAD129" ))
  Dout_5_OBUF (
    .I(\NlwBufferSignal_Dout_5_OBUF/I ),
    .O(Dout[5])
  );
  X_OPAD #(
    .LOC ( "PAD126" ))
  \Dout<6>  (
    .PAD(Dout[6])
  );
  X_OBUF #(
    .LOC ( "PAD126" ))
  Dout_6_OBUF (
    .I(\NlwBufferSignal_Dout_6_OBUF/I ),
    .O(Dout[6])
  );
  X_OPAD #(
    .LOC ( "PAD125" ))
  \Dout<7>  (
    .PAD(Dout[7])
  );
  X_OBUF #(
    .LOC ( "PAD125" ))
  Dout_7_OBUF (
    .I(\NlwBufferSignal_Dout_7_OBUF/I ),
    .O(Dout[7])
  );
  X_IPAD #(
    .LOC ( "PAD216" ))
  CK_45 (
    .PAD(CK)
  );
  X_BUF #(
    .LOC ( "PAD216" ))
  \CK_BUFGP/IBUFG  (
    .O(\CK_BUFGP/IBUFG_98 ),
    .I(CK)
  );
  X_BUF #(
    .LOC ( "PAD216" ))
  \ProtoComp6.IMUX  (
    .I(\CK_BUFGP/IBUFG_98 ),
    .O(\CK_BUFGP/IBUFG_0 )
  );
  X_IPAD #(
    .LOC ( "PAD29" ))
  LOAD_49 (
    .PAD(LOAD)
  );
  X_BUF #(
    .LOC ( "PAD29" ))
  LOAD_IBUF (
    .O(LOAD_IBUF_101),
    .I(LOAD)
  );
  X_BUF #(
    .LOC ( "PAD29" ))
  \ProtoComp6.IMUX.1  (
    .I(LOAD_IBUF_101),
    .O(LOAD_IBUF_0)
  );
  X_IPAD #(
    .LOC ( "PAD28" ))
  EN_53 (
    .PAD(EN)
  );
  X_BUF #(
    .LOC ( "PAD28" ))
  EN_IBUF (
    .O(EN_IBUF_104),
    .I(EN)
  );
  X_BUF #(
    .LOC ( "PAD28" ))
  \ProtoComp6.IMUX.2  (
    .I(EN_IBUF_104),
    .O(EN_IBUF_0)
  );
  X_IPAD #(
    .LOC ( "PAD2" ))
  SENS_57 (
    .PAD(SENS)
  );
  X_BUF #(
    .LOC ( "PAD2" ))
  SENS_IBUF (
    .O(SENS_IBUF_107),
    .I(SENS)
  );
  X_BUF #(
    .LOC ( "PAD2" ))
  \ProtoComp6.IMUX.3  (
    .I(SENS_IBUF_107),
    .O(SENS_IBUF_0)
  );
  X_IPAD #(
    .LOC ( "PAD30" ))
  RST_62 (
    .PAD(RST)
  );
  X_BUF #(
    .LOC ( "PAD30" ))
  RST_IBUF (
    .O(RST_inv_non_inverted),
    .I(RST)
  );
  X_BUF #(
    .LOC ( "PAD30" ))
  \ProtoComp7.IMUX  (
    .I(\ProtoComp7.IINV.OUT ),
    .O(RST_inv)
  );
  X_INV #(
    .LOC ( "PAD30" ))
  \ProtoComp7.IINV  (
    .I(RST_inv_non_inverted),
    .O(\ProtoComp7.IINV.OUT )
  );
  X_IPAD #(
    .LOC ( "PAD178" ))
  \Din<0>  (
    .PAD(Din[0])
  );
  X_BUF #(
    .LOC ( "PAD178" ))
  Din_0_IBUF (
    .O(Din_0_IBUF_114),
    .I(Din[0])
  );
  X_BUF #(
    .LOC ( "PAD178" ))
  \ProtoComp6.IMUX.4  (
    .I(Din_0_IBUF_114),
    .O(Din_0_IBUF_0)
  );
  X_IPAD #(
    .LOC ( "PAD164" ))
  \Din<1>  (
    .PAD(Din[1])
  );
  X_BUF #(
    .LOC ( "PAD164" ))
  Din_1_IBUF (
    .O(Din_1_IBUF_117),
    .I(Din[1])
  );
  X_BUF #(
    .LOC ( "PAD164" ))
  \ProtoComp6.IMUX.5  (
    .I(Din_1_IBUF_117),
    .O(Din_1_IBUF_0)
  );
  X_IPAD #(
    .LOC ( "PAD163" ))
  \Din<2>  (
    .PAD(Din[2])
  );
  X_BUF #(
    .LOC ( "PAD163" ))
  Din_2_IBUF (
    .O(Din_2_IBUF_120),
    .I(Din[2])
  );
  X_BUF #(
    .LOC ( "PAD163" ))
  \ProtoComp6.IMUX.6  (
    .I(Din_2_IBUF_120),
    .O(Din_2_IBUF_0)
  );
  X_IPAD #(
    .LOC ( "PAD162" ))
  \Din<3>  (
    .PAD(Din[3])
  );
  X_BUF #(
    .LOC ( "PAD162" ))
  Din_3_IBUF (
    .O(Din_3_IBUF_123),
    .I(Din[3])
  );
  X_BUF #(
    .LOC ( "PAD162" ))
  \ProtoComp6.IMUX.7  (
    .I(Din_3_IBUF_123),
    .O(Din_3_IBUF_0)
  );
  X_IPAD #(
    .LOC ( "PAD161" ))
  \Din<4>  (
    .PAD(Din[4])
  );
  X_BUF #(
    .LOC ( "PAD161" ))
  Din_4_IBUF (
    .O(Din_4_IBUF_126),
    .I(Din[4])
  );
  X_BUF #(
    .LOC ( "PAD161" ))
  \ProtoComp6.IMUX.8  (
    .I(Din_4_IBUF_126),
    .O(Din_4_IBUF_0)
  );
  X_OPAD #(
    .LOC ( "PAD142" ))
  \Dout<0>  (
    .PAD(Dout[0])
  );
  X_OBUF #(
    .LOC ( "PAD142" ))
  Dout_0_OBUF (
    .I(\NlwBufferSignal_Dout_0_OBUF/I ),
    .O(Dout[0])
  );
  X_IPAD #(
    .LOC ( "PAD160" ))
  \Din<5>  (
    .PAD(Din[5])
  );
  X_BUF #(
    .LOC ( "PAD160" ))
  Din_5_IBUF (
    .O(Din_5_IBUF_131),
    .I(Din[5])
  );
  X_BUF #(
    .LOC ( "PAD160" ))
  \ProtoComp6.IMUX.9  (
    .I(Din_5_IBUF_131),
    .O(Din_5_IBUF_0)
  );
  X_OPAD #(
    .LOC ( "PAD141" ))
  \Dout<1>  (
    .PAD(Dout[1])
  );
  X_OBUF #(
    .LOC ( "PAD141" ))
  Dout_1_OBUF (
    .I(\NlwBufferSignal_Dout_1_OBUF/I ),
    .O(Dout[1])
  );
  X_IPAD #(
    .LOC ( "PAD159" ))
  \Din<6>  (
    .PAD(Din[6])
  );
  X_BUF #(
    .LOC ( "PAD159" ))
  Din_6_IBUF (
    .O(Din_6_IBUF_136),
    .I(Din[6])
  );
  X_BUF #(
    .LOC ( "PAD159" ))
  \ProtoComp6.IMUX.10  (
    .I(Din_6_IBUF_136),
    .O(Din_6_IBUF_0)
  );
  X_OPAD #(
    .LOC ( "PAD140" ))
  \Dout<2>  (
    .PAD(Dout[2])
  );
  X_OBUF #(
    .LOC ( "PAD140" ))
  Dout_2_OBUF (
    .I(\NlwBufferSignal_Dout_2_OBUF/I ),
    .O(Dout[2])
  );
  X_IPAD #(
    .LOC ( "PAD154" ))
  \Din<7>  (
    .PAD(Din[7])
  );
  X_BUF #(
    .LOC ( "PAD154" ))
  Din_7_IBUF (
    .O(Din_7_IBUF_141),
    .I(Din[7])
  );
  X_BUF #(
    .LOC ( "PAD154" ))
  \ProtoComp6.IMUX.11  (
    .I(Din_7_IBUF_141),
    .O(Din_7_IBUF_0)
  );
  X_OPAD #(
    .LOC ( "PAD139" ))
  \Dout<3>  (
    .PAD(Dout[3])
  );
  X_OBUF #(
    .LOC ( "PAD139" ))
  Dout_3_OBUF (
    .I(\NlwBufferSignal_Dout_3_OBUF/I ),
    .O(Dout[3])
  );
  X_LUT6 #(
    .LOC ( "SLICE_X16Y25" ),
    .INIT ( 64'h00FF00FF00330033 ))
  Mcount_D1 (
    .ADR0(1'b1),
    .ADR4(1'b1),
    .ADR2(1'b1),
    .ADR3(LOAD_IBUF_0),
    .ADR1(SENS_IBUF_0),
    .ADR5(EN_IBUF_0),
    .O(Mcount_D)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X17Y17" ),
    .INIT ( 64'hF0F0F0F0FFFFFFFF ))
  _n0030_inv1 (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(LOAD_IBUF_0),
    .ADR5(EN_IBUF_0),
    .O(_n0030_inv)
  );
  X_BUF   \NlwBufferBlock_CK_BUFGP/BUFG/IN  (
    .I(\CK_BUFGP/IBUFG_0 ),
    .O(\NlwBufferSignal_CK_BUFGP/BUFG/IN )
  );
  X_BUF   \NlwBufferBlock_D_3/CLK  (
    .I(CK_BUFGP),
    .O(\NlwBufferSignal_D_3/CLK )
  );
  X_BUF   \NlwBufferBlock_D_2/CLK  (
    .I(CK_BUFGP),
    .O(\NlwBufferSignal_D_2/CLK )
  );
  X_BUF   \NlwBufferBlock_D_1/CLK  (
    .I(CK_BUFGP),
    .O(\NlwBufferSignal_D_1/CLK )
  );
  X_BUF   \NlwBufferBlock_D_0/CLK  (
    .I(CK_BUFGP),
    .O(\NlwBufferSignal_D_0/CLK )
  );
  X_BUF   \NlwBufferBlock_D_7/CLK  (
    .I(CK_BUFGP),
    .O(\NlwBufferSignal_D_7/CLK )
  );
  X_BUF   \NlwBufferBlock_D_6/CLK  (
    .I(CK_BUFGP),
    .O(\NlwBufferSignal_D_6/CLK )
  );
  X_BUF   \NlwBufferBlock_D_5/CLK  (
    .I(CK_BUFGP),
    .O(\NlwBufferSignal_D_5/CLK )
  );
  X_BUF   \NlwBufferBlock_D_4/CLK  (
    .I(CK_BUFGP),
    .O(\NlwBufferSignal_D_4/CLK )
  );
  X_BUF   \NlwBufferBlock_Dout_4_OBUF/I  (
    .I(D[4]),
    .O(\NlwBufferSignal_Dout_4_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_Dout_5_OBUF/I  (
    .I(D[5]),
    .O(\NlwBufferSignal_Dout_5_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_Dout_6_OBUF/I  (
    .I(D[6]),
    .O(\NlwBufferSignal_Dout_6_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_Dout_7_OBUF/I  (
    .I(D[7]),
    .O(\NlwBufferSignal_Dout_7_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_Dout_0_OBUF/I  (
    .I(D[0]),
    .O(\NlwBufferSignal_Dout_0_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_Dout_1_OBUF/I  (
    .I(D[1]),
    .O(\NlwBufferSignal_Dout_1_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_Dout_2_OBUF/I  (
    .I(D[2]),
    .O(\NlwBufferSignal_Dout_2_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_Dout_3_OBUF/I  (
    .I(D[3]),
    .O(\NlwBufferSignal_Dout_3_OBUF/I )
  );
  X_ZERO   NlwBlock_Compteur8bitSynchrone_GND (
    .O(GND)
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


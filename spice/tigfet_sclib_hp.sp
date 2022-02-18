*tigfet_sclib_hp.sp

*****************************************************************************
* cellname: AND2                                                            *
* brief:    2-bit AND gate                                                  *
*****************************************************************************
.SUBCKT AND2 A B Z VDD VSS nw=4
XNAND2_0 (A  B ZI VDD VSS) NAND2 nw=nw
XINV1_0  (ZI   Z  VDD VSS) INV1  nw=nw
.ENDS

*****************************************************************************
* cellname: AOI21                                                           *
* brief:    2-1 AND-OR-Invert gate [function: /(AB + C)]                    *
*****************************************************************************
.SUBCKT AOI21 A B C Z VDD VSS nw=4
X1 (Z VSS B C   VDD) TIGFET nw=nw
X2 (Z VSS A C   VDD) TIGFET nw=nw
X3 (Z VDD A B   VSS) TIGFET nw=nw
X4 (Z VDD C VDD VSS) TIGFET nw=nw
.ENDS

*****************************************************************************
* cellname: BUF1                                                            *
* brief:    1-bit buffer                                                    *
*****************************************************************************
.SUBCKT BUF1 A Z VDD VSS nw=4
XINV1_0 (A O VDD VSS) INV1 nw=nw
XINV1_1 (O Z VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: DFFNQ1                                                          *
* brief:    1-bit flip-flop with inverted input clock                       *
* inputs:   CKN, D                                                          *
* outputs:  Q                                                               *
*****************************************************************************
.SUBCKT DFFNQ1 CKN D Q VDD VSS nw=4
X1 (Q VSS X CKN VDD) TIGFET nw=nw
X2 (Q VDD X CK  VSS) TIGFET nw=nw
X3 (X VSS D CK  VDD) TIGFET nw=nw
X4 (X VDD D CKN VSS) TIGFET nw=nw
XINV1_0 (CKN CK VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: DFFQ1                                                           *
* brief:    1-bit flip-flop                                                 *
* inputs:   CK, D                                                           *
* outputs:  Q                                                               *
*****************************************************************************
.SUBCKT DFFQ1 CK D Q VDD VSS nw=4
X1 (Q VSS X CKN VDD) TIGFET nw=nw
X2 (Q VDD X CK  VSS) TIGFET nw=nw
X3 (X VSS D CK  VDD) TIGFET nw=nw
X4 (X VDD D CKN VSS) TIGFET nw=nw
XINV1_0 (CK CKN VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: INV1                                                            *
* brief:    1-bit inverter                                                  *
*****************************************************************************
.SUBCKT INV1 A Z VDD VSS nw=4
X1 (Z VSS A VSS VDD) TIGFET nw=nw
X2 (Z VDD A VDD VSS) TIGFET nw=nw
.ENDS

*****************************************************************************
* cellname: LATNQ1                                                          *
* brief:    1-bit latch with inverted enable signal                         *
* inputs:   D, GN (enable)                                                  *
* outputs:  Q                                                               *
*****************************************************************************
.SUBCKT LATNQ1 D GN Q VDD VSS nw=4
X1 (QN VSS D GN VDD) TIGFET nw=nw
X2 (QN VDD D G  VSS) TIGFET nw=nw
XINV1_0 (GN G VDD VSS) INV1 nw=nw
XINV1_1 (QN Q VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: LATNQN1                                                         *
* brief:    1-bit latch with inverted enable and inverted output            *
* inputs:   D, GN (enable)                                                  *
* outputs:  QN                                                              *
*****************************************************************************
.SUBCKT LATNQN1 D GN QN VDD VSS nw=4
X1 (QN VSS D GN VDD) TIGFET nw=nw
X2 (QN VDD D G  VSS) TIGFET nw=nw
XINV1_0 (GN G VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: LATQ1                                                           *
* brief:    1-bit latch                                                     *
* inputs:   D, G (enable)                                                   *
* outputs:  Q                                                               *
*****************************************************************************
.SUBCKT LATQ1 D G Q VDD VSS nw=4
X1 (QN VSS D GN VDD) TIGFET nw=nw
X2 (QN VDD D G  VSS) TIGFET nw=nw
XINV1_0 (G  GN VDD VSS) INV1 nw=nw
XINV1_1 (QN Q  VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: LATQN1                                                          *
* brief:    1-bit latch with inverted output                                *
* inputs:   D, G (enable)                                                   *
* outputs:  QN                                                              *
*****************************************************************************
.SUBCKT LATQN1 D G QN VDD VSS nw=4
X1 (QN VSS D GN VDD) TIGFET nw=nw
X2 (QN VDD D G  VSS) TIGFET nw=nw
XINV1_0 (G GN VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: MAJ3                                                            *
* brief:    3-to-1 majority gate                                            *
* note:     Require an output load to avoid uncertain states!               *
*****************************************************************************
.SUBCKT MAJ3 A B C Z VDD VSS nw=4
X1 (C AI B  AI Z) TIGFET nw=nw
X2 (C A  BI A  Z) TIGFET nw=nw
X3 (A AI BI AI Z) TIGFET nw=nw
X4 (A A  B  A  Z) TIGFET nw=nw
XINV1_0 (A AI VDD VSS) INV1 nw=nw
XINV1_1 (B BI VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: MIN3                                                            *
* brief:    3-to-1 minority gate (inverted 3-to-1 majority gate)            *
*****************************************************************************
.SUBCKT MIN3 A B C Z VDD VSS nw=4
X1 (Z VSS A B VDD) TIGFET nw=nw
X2 (Z VSS C A VDD) TIGFET nw=nw
X3 (Z VSS C B VDD) TIGFET nw=nw
X4 (Z VDD A B VSS) TIGFET nw=nw
X5 (Z VDD C A VSS) TIGFET nw=nw
X6 (Z VDD C B VSS) TIGFET nw=nw
.ENDS

*****************************************************************************
* cellname: MUX2                                                            *
* brief:    2-to-1 multiplexer                                              *
* inputs:   A, B, SEL                                                       *
* outputs:  Z                                                               *
*****************************************************************************
.SUBCKT MUX2 A B SEL Z VDD VSS nw=4
X1 (ZI VSS SEL  B VDD) TIGFET nw=nw
X2 (ZI VSS SELI A VDD) TIGFET nw=nw
X3 (ZI VDD SELI B VSS) TIGFET nw=nw
X4 (ZI VDD SEL  A VSS) TIGFET nw=nw
XINV1_0 (SEL SELI VDD VSS) INV1 nw=nw
XINV1_1 (ZI  Z    VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: MUXI2                                                           *
* brief:    2-to-1 multiplexer with inverted output                         *
* inputs:   A, B, SEL                                                       *
* outputs:  ZI                                                              *
*****************************************************************************
.SUBCKT MUXI2 A B SEL ZI VDD VSS nw=4
X1 (ZI VSS SEL  B VDD) TIGFET nw=nw
X2 (ZI VSS SELI A VDD) TIGFET nw=nw
X3 (ZI VDD SELI B VSS) TIGFET nw=nw
X4 (ZI VDD SEL  A VSS) TIGFET nw=nw
XINV1_0 (SEL SELI VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: NAND2                                                           *
* brief:    2-bit NAND gate                                                 *
*****************************************************************************
.SUBCKT NAND2 A B Z VDD VSS nw=4
X1 (Z VSS A VSS VDD) TIGFET nw=nw
X2 (Z VSS B VSS VDD) TIGFET nw=nw
X3 (Z VDD A B   VSS) TIGFET nw=nw
.ENDS

*****************************************************************************
* cellname: NOR2                                                            *
* brief:    1-bit NOR gate                                                  *
*****************************************************************************
.SUBCKT NOR2 A B Z VDD VSS nw=4
X1 (Z VSS B A   VDD) TIGFET nw=nw
X2 (Z VDD A VDD VSS) TIGFET nw=nw
X3 (Z VDD B VDD VSS) TIGFET nw=nw
.ENDS

*****************************************************************************
* cellname: OAI21                                                           *
* brief:    2-1 OR-AND-Invert gate [function: /((A+B).C)]                   *
*****************************************************************************
.SUBCKT OAI21 A B C Z VDD VSS nw=4
X1 (Z VSS B A   VDD) TIGFET nw=nw
X2 (Z VSS C VSS VDD) TIGFET nw=nw
X3 (Z VDD B C   VSS) TIGFET nw=nw
X4 (Z VDD A C   VSS) TIGFET nw=nw
.ENDS

*****************************************************************************
* cellname: OR2                                                             *
* brief:    2-bit OR gate                                                   *
*****************************************************************************
.SUBCKT OR2 A B Z VDD VSS nw=4
XNOR2_0 (A  B ZB VDD VSS) NOR2 nw=nw
XINV1_0 (ZB   Z  VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: XNOR2                                                           *
* brief:    2-bit XNOR gate                                                 *
*****************************************************************************
.SUBCKT XNOR2 A B Z VDD VSS nw=4
X1 (Z AI BI AI VDD) TIGFET nw=nw
X2 (Z A  B  A  VDD) TIGFET nw=nw
X3 (Z B  AI B  VSS) TIGFET nw=nw
X4 (Z BI A  BI VSS) TIGFET nw=nw
XINV1_0 (A AI VDD VSS) INV1 nw=nw
XINV1_1 (B BI VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: XNOR3                                                           *
* brief:    3-bit XNOR gate                                                 *
* note:     Require an output load to avoid uncertain states!               *
*****************************************************************************
.SUBCKT XNOR3 A B C Z VDD VSS nw=4
X1 (CI AI BI AI Z) TIGFET nw=nw
X2 (CI A  B  A  Z) TIGFET nw=nw
X3 (Z  AI B  AI C) TIGFET nw=nw
X4 (Z  A  BI A  C) TIGFET nw=nw
XINV1_0 (A AI VDD VSS) INV1 nw=nw
XINV1_1 (B BI VDD VSS) INV1 nw=nw
XINV1_2 (C CI VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: XOR2                                                            *
* brief:    2-bit XOR gate                                                  *
*****************************************************************************
.SUBCKT XOR2 A B Z VDD VSS nw=4
X1 (Z B  AI B  VDD) TIGFET nw=nw
X2 (Z BI A  BI VDD) TIGFET nw=nw
X3 (Z AI BI AI VSS) TIGFET nw=nw
X4 (Z A  B  A  VSS) TIGFET nw=nw
XINV1_0 (A AI VDD VSS) INV1 nw=nw
XINV1_1 (B BI VDD VSS) INV1 nw=nw
.ENDS

*****************************************************************************
* cellname: XOR3                                                            *
* brief:    3-bit XOR gate                                                  *
* note:     Require an output load to avoid uncertain states!               *
*****************************************************************************
.SUBCKT XOR3 A B C Z VDD VSS nw=4
X1 (CI AI B  AI Z) TIGFET nw=nw
X2 (CI A  BI A  Z) TIGFET nw=nw
X3 (Z  AI BI AI C) TIGFET nw=nw
X4 (Z  A  B  A  C) TIGFET nw=nw
XINV1_0 (A AI VDD VSS) INV1 nw=nw
XINV1_1 (B BI VDD VSS) INV1 nw=nw
XINV1_2 (C CI VDD VSS) INV1 nw=nw
.ENDS


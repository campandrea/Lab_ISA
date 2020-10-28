/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Wed Oct 28 10:59:23 2020
/////////////////////////////////////////////////////////////


module IIR_filter ( CLK, RST_n, DIN, VIN, a0, a1, b0, b1, DOUT, VOUT );
  input [9:0] DIN;
  input [9:0] a0;
  input [9:0] a1;
  input [9:0] b0;
  input [9:0] b1;
  output [9:0] DOUT;
  input CLK, RST_n, VIN;
  output VOUT;
  wire   VIN_samp, count_tc, n2, n3, n4, n5, n6, DIN_reg_n12, DIN_reg_n11,
         DIN_reg_n10, DIN_reg_n9, DIN_reg_n8, DIN_reg_n7, DIN_reg_n6,
         DIN_reg_n5, DIN_reg_n4, DIN_reg_n3, DIN_reg_n2, DIN_reg_n1,
         DIN_reg_n26, DIN_reg_n25, DIN_reg_n24, DIN_reg_n23, DIN_reg_n22,
         DIN_reg_n21, DIN_reg_n20, DIN_reg_n19, DIN_reg_n18, DIN_reg_n17,
         DIN_reg_n16, DIN_reg_n15, DIN_reg_n14, DIN_reg_n13, VIN_reg_n2,
         VIN_reg_n4, VIN_reg_n3, VIN_reg_n1, reg0_n40, reg0_n39, reg0_n38,
         reg0_n37, reg0_n36, reg0_n35, reg0_n34, reg0_n33, reg0_n32, reg0_n31,
         reg0_n30, reg0_n29, reg0_n28, reg0_n27, reg0_n12, reg0_n11, reg0_n10,
         reg0_n9, reg0_n8, reg0_n7, reg0_n6, reg0_n5, reg0_n4, reg0_n3,
         reg0_n2, reg0_n1, mult_b0_R_0_, mult_b0_R_23_, mult_b0_mult_15_n663,
         mult_b0_mult_15_n662, mult_b0_mult_15_n661, mult_b0_mult_15_n660,
         mult_b0_mult_15_n659, mult_b0_mult_15_n658, mult_b0_mult_15_n657,
         mult_b0_mult_15_n656, mult_b0_mult_15_n655, mult_b0_mult_15_n654,
         mult_b0_mult_15_n653, mult_b0_mult_15_n652, mult_b0_mult_15_n651,
         mult_b0_mult_15_n650, mult_b0_mult_15_n649, mult_b0_mult_15_n648,
         mult_b0_mult_15_n647, mult_b0_mult_15_n646, mult_b0_mult_15_n645,
         mult_b0_mult_15_n644, mult_b0_mult_15_n643, mult_b0_mult_15_n642,
         mult_b0_mult_15_n641, mult_b0_mult_15_n640, mult_b0_mult_15_n639,
         mult_b0_mult_15_n638, mult_b0_mult_15_n637, mult_b0_mult_15_n636,
         mult_b0_mult_15_n635, mult_b0_mult_15_n634, mult_b0_mult_15_n633,
         mult_b0_mult_15_n632, mult_b0_mult_15_n631, mult_b0_mult_15_n630,
         mult_b0_mult_15_n629, mult_b0_mult_15_n628, mult_b0_mult_15_n627,
         mult_b0_mult_15_n626, mult_b0_mult_15_n625, mult_b0_mult_15_n624,
         mult_b0_mult_15_n623, mult_b0_mult_15_n622, mult_b0_mult_15_n621,
         mult_b0_mult_15_n620, mult_b0_mult_15_n619, mult_b0_mult_15_n618,
         mult_b0_mult_15_n617, mult_b0_mult_15_n616, mult_b0_mult_15_n615,
         mult_b0_mult_15_n614, mult_b0_mult_15_n613, mult_b0_mult_15_n612,
         mult_b0_mult_15_n611, mult_b0_mult_15_n610, mult_b0_mult_15_n609,
         mult_b0_mult_15_n608, mult_b0_mult_15_n607, mult_b0_mult_15_n606,
         mult_b0_mult_15_n605, mult_b0_mult_15_n604, mult_b0_mult_15_n603,
         mult_b0_mult_15_n602, mult_b0_mult_15_n601, mult_b0_mult_15_n600,
         mult_b0_mult_15_n599, mult_b0_mult_15_n598, mult_b0_mult_15_n597,
         mult_b0_mult_15_n596, mult_b0_mult_15_n595, mult_b0_mult_15_n594,
         mult_b0_mult_15_n593, mult_b0_mult_15_n592, mult_b0_mult_15_n591,
         mult_b0_mult_15_n590, mult_b0_mult_15_n589, mult_b0_mult_15_n588,
         mult_b0_mult_15_n587, mult_b0_mult_15_n586, mult_b0_mult_15_n585,
         mult_b0_mult_15_n584, mult_b0_mult_15_n583, mult_b0_mult_15_n582,
         mult_b0_mult_15_n581, mult_b0_mult_15_n580, mult_b0_mult_15_n579,
         mult_b0_mult_15_n578, mult_b0_mult_15_n577, mult_b0_mult_15_n576,
         mult_b0_mult_15_n575, mult_b0_mult_15_n574, mult_b0_mult_15_n573,
         mult_b0_mult_15_n572, mult_b0_mult_15_n571, mult_b0_mult_15_n570,
         mult_b0_mult_15_n569, mult_b0_mult_15_n568, mult_b0_mult_15_n567,
         mult_b0_mult_15_n566, mult_b0_mult_15_n565, mult_b0_mult_15_n564,
         mult_b0_mult_15_n563, mult_b0_mult_15_n562, mult_b0_mult_15_n561,
         mult_b0_mult_15_n560, mult_b0_mult_15_n559, mult_b0_mult_15_n558,
         mult_b0_mult_15_n557, mult_b0_mult_15_n556, mult_b0_mult_15_n555,
         mult_b0_mult_15_n554, mult_b0_mult_15_n553, mult_b0_mult_15_n552,
         mult_b0_mult_15_n551, mult_b0_mult_15_n550, mult_b0_mult_15_n549,
         mult_b0_mult_15_n548, mult_b0_mult_15_n547, mult_b0_mult_15_n546,
         mult_b0_mult_15_n545, mult_b0_mult_15_n544, mult_b0_mult_15_n543,
         mult_b0_mult_15_n542, mult_b0_mult_15_n541, mult_b0_mult_15_n540,
         mult_b0_mult_15_n539, mult_b0_mult_15_n538, mult_b0_mult_15_n537,
         mult_b0_mult_15_n536, mult_b0_mult_15_n535, mult_b0_mult_15_n534,
         mult_b0_mult_15_n533, mult_b0_mult_15_n532, mult_b0_mult_15_n531,
         mult_b0_mult_15_n530, mult_b0_mult_15_n529, mult_b0_mult_15_n528,
         mult_b0_mult_15_n527, mult_b0_mult_15_n526, mult_b0_mult_15_n525,
         mult_b0_mult_15_n524, mult_b0_mult_15_n523, mult_b0_mult_15_n522,
         mult_b0_mult_15_n521, mult_b0_mult_15_n520, mult_b0_mult_15_n519,
         mult_b0_mult_15_n518, mult_b0_mult_15_n517, mult_b0_mult_15_n516,
         mult_b0_mult_15_n515, mult_b0_mult_15_n514, mult_b0_mult_15_n513,
         mult_b0_mult_15_n512, mult_b0_mult_15_n511, mult_b0_mult_15_n510,
         mult_b0_mult_15_n509, mult_b0_mult_15_n508, mult_b0_mult_15_n507,
         mult_b0_mult_15_n506, mult_b0_mult_15_n505, mult_b0_mult_15_n504,
         mult_b0_mult_15_n503, mult_b0_mult_15_n502, mult_b0_mult_15_n501,
         mult_b0_mult_15_n500, mult_b0_mult_15_n499, mult_b0_mult_15_n498,
         mult_b0_mult_15_n497, mult_b0_mult_15_n496, mult_b0_mult_15_n495,
         mult_b0_mult_15_n494, mult_b0_mult_15_n493, mult_b0_mult_15_n492,
         mult_b0_mult_15_n491, mult_b0_mult_15_n490, mult_b0_mult_15_n489,
         mult_b0_mult_15_n488, mult_b0_mult_15_n487, mult_b0_mult_15_n486,
         mult_b0_mult_15_n485, mult_b0_mult_15_n484, mult_b0_mult_15_n483,
         mult_b0_mult_15_n482, mult_b0_mult_15_n481, mult_b0_mult_15_n480,
         mult_b0_mult_15_n479, mult_b0_mult_15_n478, mult_b0_mult_15_n477,
         mult_b0_mult_15_n476, mult_b0_mult_15_n475, mult_b0_mult_15_n474,
         mult_b0_mult_15_n473, mult_b0_mult_15_n472, mult_b0_mult_15_n471,
         mult_b0_mult_15_n470, mult_b0_mult_15_n469, mult_b0_mult_15_n468,
         mult_b0_mult_15_n467, mult_b0_mult_15_n466, mult_b0_mult_15_n465,
         mult_b0_mult_15_n464, mult_b0_mult_15_n463, mult_b0_mult_15_n462,
         mult_b0_mult_15_n461, mult_b0_mult_15_n460, mult_b0_mult_15_n459,
         mult_b0_mult_15_n458, mult_b0_mult_15_n457, mult_b0_mult_15_n456,
         mult_b0_mult_15_n455, mult_b0_mult_15_n454, mult_b0_mult_15_n453,
         mult_b0_mult_15_n452, mult_b0_mult_15_n451, mult_b0_mult_15_n450,
         mult_b0_mult_15_n449, mult_b0_mult_15_n448, mult_b0_mult_15_n447,
         mult_b0_mult_15_n446, mult_b0_mult_15_n445, mult_b0_mult_15_n444,
         mult_b0_mult_15_n443, mult_b0_mult_15_n442, mult_b0_mult_15_n441,
         mult_b0_mult_15_n440, mult_b0_mult_15_n439, mult_b0_mult_15_n438,
         mult_b0_mult_15_n437, mult_b0_mult_15_n436, mult_b0_mult_15_n435,
         mult_b0_mult_15_n434, mult_b0_mult_15_n433, mult_b0_mult_15_n432,
         mult_b0_mult_15_n431, mult_b0_mult_15_n430, mult_b0_mult_15_n429,
         mult_b0_mult_15_n428, mult_b0_mult_15_n427, mult_b0_mult_15_n426,
         mult_b0_mult_15_n425, mult_b0_mult_15_n424, mult_b0_mult_15_n423,
         mult_b0_mult_15_n422, mult_b0_mult_15_n421, mult_b0_mult_15_n420,
         mult_b0_mult_15_n419, mult_b0_mult_15_n418, mult_b0_mult_15_n417,
         mult_b0_mult_15_n416, mult_b0_mult_15_n415, mult_b0_mult_15_n414,
         mult_b0_mult_15_product_22_, mult_b0_mult_15_product_21_,
         mult_b0_mult_15_product_8_, mult_b0_mult_15_product_7_,
         mult_b0_mult_15_product_6_, mult_b0_mult_15_product_5_,
         mult_b0_mult_15_product_4_, mult_b0_mult_15_product_3_,
         mult_b0_mult_15_product_2_, mult_b0_mult_15_product_1_,
         mult_b0_mult_15_n228, mult_b0_mult_15_n227, mult_b0_mult_15_n226,
         mult_b0_mult_15_n225, mult_b0_mult_15_n224, mult_b0_mult_15_n223,
         mult_b0_mult_15_n222, mult_b0_mult_15_n221, mult_b0_mult_15_n220,
         mult_b0_mult_15_n217, mult_b0_mult_15_n216, mult_b0_mult_15_n215,
         mult_b0_mult_15_n214, mult_b0_mult_15_n213, mult_b0_mult_15_n212,
         mult_b0_mult_15_n211, mult_b0_mult_15_n210, mult_b0_mult_15_n209,
         mult_b0_mult_15_n208, mult_b0_mult_15_n206, mult_b0_mult_15_n205,
         mult_b0_mult_15_n204, mult_b0_mult_15_n203, mult_b0_mult_15_n202,
         mult_b0_mult_15_n201, mult_b0_mult_15_n200, mult_b0_mult_15_n199,
         mult_b0_mult_15_n197, mult_b0_mult_15_n196, mult_b0_mult_15_n194,
         mult_b0_mult_15_n193, mult_b0_mult_15_n192, mult_b0_mult_15_n191,
         mult_b0_mult_15_n190, mult_b0_mult_15_n189, mult_b0_mult_15_n188,
         mult_b0_mult_15_n187, mult_b0_mult_15_n186, mult_b0_mult_15_n185,
         mult_b0_mult_15_n184, mult_b0_mult_15_n182, mult_b0_mult_15_n181,
         mult_b0_mult_15_n180, mult_b0_mult_15_n179, mult_b0_mult_15_n177,
         mult_b0_mult_15_n176, mult_b0_mult_15_n175, mult_b0_mult_15_n174,
         mult_b0_mult_15_n173, mult_b0_mult_15_n172, mult_b0_mult_15_n170,
         mult_b0_mult_15_n169, mult_b0_mult_15_n168, mult_b0_mult_15_n167,
         mult_b0_mult_15_n166, mult_b0_mult_15_n165, mult_b0_mult_15_n164,
         mult_b0_mult_15_n163, mult_b0_mult_15_n162, mult_b0_mult_15_n161,
         mult_b0_mult_15_n160, mult_b0_mult_15_n156, mult_b0_mult_15_n155,
         mult_b0_mult_15_n154, mult_b0_mult_15_n153, mult_b0_mult_15_n134,
         mult_b0_mult_15_n133, mult_b0_mult_15_n132, mult_b0_mult_15_n131,
         mult_b0_mult_15_n130, mult_b0_mult_15_n129, mult_b0_mult_15_n128,
         mult_b0_mult_15_n126, mult_b0_mult_15_n125, mult_b0_mult_15_n124,
         mult_b0_mult_15_n123, mult_b0_mult_15_n122, mult_b0_mult_15_n121,
         mult_b0_mult_15_n120, mult_b0_mult_15_n119, mult_b0_mult_15_n118,
         mult_b0_mult_15_n117, mult_b0_mult_15_n116, mult_b0_mult_15_n115,
         mult_b0_mult_15_n114, mult_b0_mult_15_n113, mult_b0_mult_15_n112,
         mult_b0_mult_15_n111, mult_b0_mult_15_n110, mult_b0_mult_15_n109,
         mult_b0_mult_15_n108, mult_b0_mult_15_n107, mult_b0_mult_15_n106,
         mult_b0_mult_15_n105, mult_b0_mult_15_n104, mult_b0_mult_15_n103,
         mult_b0_mult_15_n102, mult_b0_mult_15_n101, mult_b0_mult_15_n100,
         mult_b0_mult_15_n99, mult_b0_mult_15_n98, mult_b0_mult_15_n97,
         mult_b0_mult_15_n96, mult_b0_mult_15_n95, mult_b0_mult_15_n94,
         mult_b0_mult_15_n93, mult_b0_mult_15_n92, mult_b0_mult_15_n91,
         mult_b0_mult_15_n90, mult_b0_mult_15_n89, mult_b0_mult_15_n88,
         mult_b0_mult_15_n87, mult_b0_mult_15_n86, mult_b0_mult_15_n85,
         mult_b0_mult_15_n84, mult_b0_mult_15_n83, mult_b0_mult_15_n82,
         mult_b0_mult_15_n81, mult_b0_mult_15_n80, mult_b0_mult_15_n79,
         mult_b0_mult_15_n78, mult_b0_mult_15_n77, mult_b0_mult_15_n76,
         mult_b0_mult_15_n75, mult_b0_mult_15_n73, mult_b0_mult_15_n72,
         mult_b0_mult_15_n71, mult_b0_mult_15_n70, mult_b0_mult_15_n69,
         mult_b0_mult_15_n68, mult_b0_mult_15_n67, mult_b0_mult_15_n66,
         mult_b0_mult_15_n65, mult_b0_mult_15_n64, mult_b0_mult_15_n63,
         mult_b0_mult_15_n62, mult_b0_mult_15_n61, mult_b0_mult_15_n60,
         mult_b0_mult_15_n59, mult_b0_mult_15_n58, mult_b0_mult_15_n57,
         mult_b0_mult_15_n55, mult_b0_mult_15_n54, mult_b0_mult_15_n53,
         mult_b0_mult_15_n52, mult_b0_mult_15_n51, mult_b0_mult_15_n50,
         mult_b0_mult_15_n49, mult_b0_mult_15_n48, mult_b0_mult_15_n47,
         mult_b0_mult_15_n46, mult_b0_mult_15_n45, mult_b0_mult_15_n44,
         mult_b0_mult_15_n43, mult_b0_mult_15_n41, mult_b0_mult_15_n40,
         mult_b0_mult_15_n39, mult_b0_mult_15_n38, mult_b0_mult_15_n37,
         mult_b0_mult_15_n36, mult_b0_mult_15_n35, mult_b0_mult_15_n34,
         mult_b0_mult_15_n33, mult_b0_mult_15_n31, mult_b0_mult_15_n30,
         mult_b0_mult_15_n29, mult_b0_mult_15_n28, mult_b0_mult_15_n27,
         mult_b0_mult_15_n17, mult_b0_mult_15_n16, mult_b0_mult_15_n15,
         mult_b0_mult_15_n14, mult_b0_mult_15_n13, mult_b0_mult_15_n12,
         mult_b0_mult_15_n11, mult_b0_mult_15_n10, mult_b0_mult_15_n9,
         mult_b0_mult_15_n8, mult_b0_mult_15_n7, mult_b0_mult_15_n6,
         mult_b0_mult_15_n5, mult_b1_R_0_, mult_b1_R_23_, mult_b1_mult_15_n553,
         mult_b1_mult_15_n552, mult_b1_mult_15_n551, mult_b1_mult_15_n550,
         mult_b1_mult_15_n549, mult_b1_mult_15_n548, mult_b1_mult_15_n547,
         mult_b1_mult_15_n546, mult_b1_mult_15_n545, mult_b1_mult_15_n544,
         mult_b1_mult_15_n543, mult_b1_mult_15_n542, mult_b1_mult_15_n541,
         mult_b1_mult_15_n540, mult_b1_mult_15_n539, mult_b1_mult_15_n538,
         mult_b1_mult_15_n537, mult_b1_mult_15_n536, mult_b1_mult_15_n535,
         mult_b1_mult_15_n534, mult_b1_mult_15_n533, mult_b1_mult_15_n532,
         mult_b1_mult_15_n531, mult_b1_mult_15_n530, mult_b1_mult_15_n529,
         mult_b1_mult_15_n528, mult_b1_mult_15_n527, mult_b1_mult_15_n526,
         mult_b1_mult_15_n525, mult_b1_mult_15_n524, mult_b1_mult_15_n523,
         mult_b1_mult_15_n522, mult_b1_mult_15_n521, mult_b1_mult_15_n520,
         mult_b1_mult_15_n519, mult_b1_mult_15_n518, mult_b1_mult_15_n517,
         mult_b1_mult_15_n516, mult_b1_mult_15_n515, mult_b1_mult_15_n514,
         mult_b1_mult_15_n513, mult_b1_mult_15_n512, mult_b1_mult_15_n511,
         mult_b1_mult_15_n510, mult_b1_mult_15_n509, mult_b1_mult_15_n508,
         mult_b1_mult_15_n507, mult_b1_mult_15_n506, mult_b1_mult_15_n505,
         mult_b1_mult_15_n504, mult_b1_mult_15_n503, mult_b1_mult_15_n502,
         mult_b1_mult_15_n501, mult_b1_mult_15_n500, mult_b1_mult_15_n499,
         mult_b1_mult_15_n498, mult_b1_mult_15_n497, mult_b1_mult_15_n496,
         mult_b1_mult_15_n495, mult_b1_mult_15_n494, mult_b1_mult_15_n493,
         mult_b1_mult_15_n492, mult_b1_mult_15_n491, mult_b1_mult_15_n490,
         mult_b1_mult_15_n489, mult_b1_mult_15_n488, mult_b1_mult_15_n487,
         mult_b1_mult_15_n486, mult_b1_mult_15_n485, mult_b1_mult_15_n484,
         mult_b1_mult_15_n483, mult_b1_mult_15_n482, mult_b1_mult_15_n481,
         mult_b1_mult_15_n480, mult_b1_mult_15_n479, mult_b1_mult_15_n478,
         mult_b1_mult_15_n477, mult_b1_mult_15_n476, mult_b1_mult_15_n475,
         mult_b1_mult_15_n474, mult_b1_mult_15_n473, mult_b1_mult_15_n472,
         mult_b1_mult_15_n471, mult_b1_mult_15_n470, mult_b1_mult_15_n469,
         mult_b1_mult_15_n468, mult_b1_mult_15_n467, mult_b1_mult_15_n466,
         mult_b1_mult_15_n465, mult_b1_mult_15_n464, mult_b1_mult_15_n463,
         mult_b1_mult_15_n462, mult_b1_mult_15_n461, mult_b1_mult_15_n460,
         mult_b1_mult_15_n459, mult_b1_mult_15_n458, mult_b1_mult_15_n457,
         mult_b1_mult_15_n456, mult_b1_mult_15_n455, mult_b1_mult_15_n454,
         mult_b1_mult_15_n453, mult_b1_mult_15_n452, mult_b1_mult_15_n451,
         mult_b1_mult_15_n450, mult_b1_mult_15_n449, mult_b1_mult_15_n448,
         mult_b1_mult_15_n447, mult_b1_mult_15_n446, mult_b1_mult_15_n445,
         mult_b1_mult_15_n444, mult_b1_mult_15_n443, mult_b1_mult_15_n442,
         mult_b1_mult_15_n441, mult_b1_mult_15_n440, mult_b1_mult_15_n439,
         mult_b1_mult_15_n438, mult_b1_mult_15_n437, mult_b1_mult_15_n436,
         mult_b1_mult_15_n435, mult_b1_mult_15_n434, mult_b1_mult_15_n433,
         mult_b1_mult_15_n432, mult_b1_mult_15_n431, mult_b1_mult_15_n430,
         mult_b1_mult_15_n429, mult_b1_mult_15_n428, mult_b1_mult_15_n427,
         mult_b1_mult_15_n426, mult_b1_mult_15_n425, mult_b1_mult_15_n424,
         mult_b1_mult_15_n423, mult_b1_mult_15_n422, mult_b1_mult_15_n421,
         mult_b1_mult_15_n420, mult_b1_mult_15_n419, mult_b1_mult_15_n418,
         mult_b1_mult_15_n417, mult_b1_mult_15_n416, mult_b1_mult_15_n415,
         mult_b1_mult_15_n414, mult_b1_mult_15_product_22_,
         mult_b1_mult_15_product_21_, mult_b1_mult_15_product_8_,
         mult_b1_mult_15_product_7_, mult_b1_mult_15_product_6_,
         mult_b1_mult_15_product_5_, mult_b1_mult_15_product_4_,
         mult_b1_mult_15_product_3_, mult_b1_mult_15_product_2_,
         mult_b1_mult_15_product_1_, mult_b1_mult_15_n228,
         mult_b1_mult_15_n227, mult_b1_mult_15_n226, mult_b1_mult_15_n225,
         mult_b1_mult_15_n224, mult_b1_mult_15_n223, mult_b1_mult_15_n222,
         mult_b1_mult_15_n221, mult_b1_mult_15_n220, mult_b1_mult_15_n217,
         mult_b1_mult_15_n216, mult_b1_mult_15_n215, mult_b1_mult_15_n214,
         mult_b1_mult_15_n213, mult_b1_mult_15_n212, mult_b1_mult_15_n211,
         mult_b1_mult_15_n210, mult_b1_mult_15_n209, mult_b1_mult_15_n208,
         mult_b1_mult_15_n206, mult_b1_mult_15_n205, mult_b1_mult_15_n204,
         mult_b1_mult_15_n203, mult_b1_mult_15_n202, mult_b1_mult_15_n201,
         mult_b1_mult_15_n200, mult_b1_mult_15_n199, mult_b1_mult_15_n197,
         mult_b1_mult_15_n196, mult_b1_mult_15_n194, mult_b1_mult_15_n193,
         mult_b1_mult_15_n192, mult_b1_mult_15_n191, mult_b1_mult_15_n190,
         mult_b1_mult_15_n189, mult_b1_mult_15_n188, mult_b1_mult_15_n187,
         mult_b1_mult_15_n186, mult_b1_mult_15_n185, mult_b1_mult_15_n184,
         mult_b1_mult_15_n182, mult_b1_mult_15_n181, mult_b1_mult_15_n180,
         mult_b1_mult_15_n179, mult_b1_mult_15_n177, mult_b1_mult_15_n176,
         mult_b1_mult_15_n175, mult_b1_mult_15_n174, mult_b1_mult_15_n173,
         mult_b1_mult_15_n172, mult_b1_mult_15_n170, mult_b1_mult_15_n169,
         mult_b1_mult_15_n168, mult_b1_mult_15_n167, mult_b1_mult_15_n166,
         mult_b1_mult_15_n165, mult_b1_mult_15_n164, mult_b1_mult_15_n163,
         mult_b1_mult_15_n162, mult_b1_mult_15_n161, mult_b1_mult_15_n160,
         mult_b1_mult_15_n156, mult_b1_mult_15_n155, mult_b1_mult_15_n154,
         mult_b1_mult_15_n153, mult_b1_mult_15_n134, mult_b1_mult_15_n133,
         mult_b1_mult_15_n132, mult_b1_mult_15_n131, mult_b1_mult_15_n130,
         mult_b1_mult_15_n129, mult_b1_mult_15_n128, mult_b1_mult_15_n127,
         mult_b1_mult_15_n126, mult_b1_mult_15_n125, mult_b1_mult_15_n124,
         mult_b1_mult_15_n123, mult_b1_mult_15_n122, mult_b1_mult_15_n121,
         mult_b1_mult_15_n120, mult_b1_mult_15_n119, mult_b1_mult_15_n118,
         mult_b1_mult_15_n117, mult_b1_mult_15_n116, mult_b1_mult_15_n115,
         mult_b1_mult_15_n114, mult_b1_mult_15_n113, mult_b1_mult_15_n112,
         mult_b1_mult_15_n111, mult_b1_mult_15_n110, mult_b1_mult_15_n109,
         mult_b1_mult_15_n108, mult_b1_mult_15_n107, mult_b1_mult_15_n106,
         mult_b1_mult_15_n105, mult_b1_mult_15_n104, mult_b1_mult_15_n103,
         mult_b1_mult_15_n102, mult_b1_mult_15_n101, mult_b1_mult_15_n100,
         mult_b1_mult_15_n99, mult_b1_mult_15_n98, mult_b1_mult_15_n97,
         mult_b1_mult_15_n96, mult_b1_mult_15_n95, mult_b1_mult_15_n94,
         mult_b1_mult_15_n93, mult_b1_mult_15_n92, mult_b1_mult_15_n91,
         mult_b1_mult_15_n90, mult_b1_mult_15_n89, mult_b1_mult_15_n88,
         mult_b1_mult_15_n87, mult_b1_mult_15_n86, mult_b1_mult_15_n85,
         mult_b1_mult_15_n84, mult_b1_mult_15_n83, mult_b1_mult_15_n82,
         mult_b1_mult_15_n81, mult_b1_mult_15_n80, mult_b1_mult_15_n79,
         mult_b1_mult_15_n78, mult_b1_mult_15_n77, mult_b1_mult_15_n76,
         mult_b1_mult_15_n75, mult_b1_mult_15_n73, mult_b1_mult_15_n72,
         mult_b1_mult_15_n71, mult_b1_mult_15_n70, mult_b1_mult_15_n69,
         mult_b1_mult_15_n68, mult_b1_mult_15_n67, mult_b1_mult_15_n66,
         mult_b1_mult_15_n65, mult_b1_mult_15_n64, mult_b1_mult_15_n63,
         mult_b1_mult_15_n62, mult_b1_mult_15_n61, mult_b1_mult_15_n60,
         mult_b1_mult_15_n59, mult_b1_mult_15_n58, mult_b1_mult_15_n57,
         mult_b1_mult_15_n55, mult_b1_mult_15_n54, mult_b1_mult_15_n53,
         mult_b1_mult_15_n52, mult_b1_mult_15_n51, mult_b1_mult_15_n50,
         mult_b1_mult_15_n49, mult_b1_mult_15_n48, mult_b1_mult_15_n47,
         mult_b1_mult_15_n46, mult_b1_mult_15_n45, mult_b1_mult_15_n44,
         mult_b1_mult_15_n43, mult_b1_mult_15_n41, mult_b1_mult_15_n40,
         mult_b1_mult_15_n39, mult_b1_mult_15_n38, mult_b1_mult_15_n37,
         mult_b1_mult_15_n36, mult_b1_mult_15_n35, mult_b1_mult_15_n34,
         mult_b1_mult_15_n33, mult_b1_mult_15_n31, mult_b1_mult_15_n30,
         mult_b1_mult_15_n29, mult_b1_mult_15_n28, mult_b1_mult_15_n27,
         mult_b1_mult_15_n17, mult_b1_mult_15_n16, mult_b1_mult_15_n15,
         mult_b1_mult_15_n14, mult_b1_mult_15_n13, mult_b1_mult_15_n12,
         mult_b1_mult_15_n11, mult_b1_mult_15_n10, mult_b1_mult_15_n9,
         mult_b1_mult_15_n8, mult_b1_mult_15_n7, mult_b1_mult_15_n6,
         mult_b1_mult_15_n5, add_b0_add_16_n35, add_b0_add_16_n34,
         add_b0_add_16_n33, add_b0_add_16_n32, add_b0_add_16_n31,
         add_b0_add_16_n30, add_b0_add_16_n29, add_b0_add_16_n28,
         add_b0_add_16_n27, add_b0_add_16_n26, add_b0_add_16_n25,
         add_b0_add_16_n24, add_b0_add_16_n23, add_b0_add_16_n22,
         add_b0_add_16_n21, add_b0_add_16_n20, add_b0_add_16_n19,
         add_b0_add_16_n18, add_b0_add_16_n17, add_b0_add_16_n16,
         add_b0_add_16_n15, add_b0_add_16_n14, add_b0_add_16_n13,
         add_b0_add_16_n12, add_b0_add_16_n11, add_b0_add_16_n10,
         add_b0_add_16_n9, add_b0_add_16_n8, add_b0_add_16_n7,
         add_b0_add_16_n6, add_b0_add_16_n5, add_b0_add_16_n4,
         add_b0_add_16_n3, add_b0_add_16_n2, add_b0_add_16_n1, mult_a0_R_0_,
         mult_a0_R_23_, mult_a0_mult_15_n647, mult_a0_mult_15_n646,
         mult_a0_mult_15_n645, mult_a0_mult_15_n644, mult_a0_mult_15_n643,
         mult_a0_mult_15_n642, mult_a0_mult_15_n641, mult_a0_mult_15_n640,
         mult_a0_mult_15_n639, mult_a0_mult_15_n638, mult_a0_mult_15_n637,
         mult_a0_mult_15_n636, mult_a0_mult_15_n635, mult_a0_mult_15_n634,
         mult_a0_mult_15_n633, mult_a0_mult_15_n632, mult_a0_mult_15_n631,
         mult_a0_mult_15_n630, mult_a0_mult_15_n629, mult_a0_mult_15_n628,
         mult_a0_mult_15_n627, mult_a0_mult_15_n626, mult_a0_mult_15_n625,
         mult_a0_mult_15_n624, mult_a0_mult_15_n623, mult_a0_mult_15_n622,
         mult_a0_mult_15_n621, mult_a0_mult_15_n620, mult_a0_mult_15_n619,
         mult_a0_mult_15_n618, mult_a0_mult_15_n617, mult_a0_mult_15_n616,
         mult_a0_mult_15_n615, mult_a0_mult_15_n614, mult_a0_mult_15_n613,
         mult_a0_mult_15_n612, mult_a0_mult_15_n611, mult_a0_mult_15_n610,
         mult_a0_mult_15_n609, mult_a0_mult_15_n608, mult_a0_mult_15_n607,
         mult_a0_mult_15_n606, mult_a0_mult_15_n605, mult_a0_mult_15_n604,
         mult_a0_mult_15_n603, mult_a0_mult_15_n602, mult_a0_mult_15_n601,
         mult_a0_mult_15_n600, mult_a0_mult_15_n599, mult_a0_mult_15_n598,
         mult_a0_mult_15_n597, mult_a0_mult_15_n596, mult_a0_mult_15_n595,
         mult_a0_mult_15_n594, mult_a0_mult_15_n593, mult_a0_mult_15_n592,
         mult_a0_mult_15_n591, mult_a0_mult_15_n590, mult_a0_mult_15_n589,
         mult_a0_mult_15_n588, mult_a0_mult_15_n587, mult_a0_mult_15_n586,
         mult_a0_mult_15_n585, mult_a0_mult_15_n584, mult_a0_mult_15_n583,
         mult_a0_mult_15_n582, mult_a0_mult_15_n581, mult_a0_mult_15_n580,
         mult_a0_mult_15_n579, mult_a0_mult_15_n578, mult_a0_mult_15_n577,
         mult_a0_mult_15_n576, mult_a0_mult_15_n575, mult_a0_mult_15_n574,
         mult_a0_mult_15_n573, mult_a0_mult_15_n572, mult_a0_mult_15_n571,
         mult_a0_mult_15_n570, mult_a0_mult_15_n569, mult_a0_mult_15_n568,
         mult_a0_mult_15_n567, mult_a0_mult_15_n566, mult_a0_mult_15_n565,
         mult_a0_mult_15_n564, mult_a0_mult_15_n563, mult_a0_mult_15_n562,
         mult_a0_mult_15_n561, mult_a0_mult_15_n560, mult_a0_mult_15_n559,
         mult_a0_mult_15_n558, mult_a0_mult_15_n557, mult_a0_mult_15_n556,
         mult_a0_mult_15_n555, mult_a0_mult_15_n554, mult_a0_mult_15_n553,
         mult_a0_mult_15_n552, mult_a0_mult_15_n551, mult_a0_mult_15_n550,
         mult_a0_mult_15_n549, mult_a0_mult_15_n548, mult_a0_mult_15_n547,
         mult_a0_mult_15_n546, mult_a0_mult_15_n545, mult_a0_mult_15_n544,
         mult_a0_mult_15_n543, mult_a0_mult_15_n542, mult_a0_mult_15_n541,
         mult_a0_mult_15_n540, mult_a0_mult_15_n539, mult_a0_mult_15_n538,
         mult_a0_mult_15_n537, mult_a0_mult_15_n536, mult_a0_mult_15_n535,
         mult_a0_mult_15_n534, mult_a0_mult_15_n533, mult_a0_mult_15_n532,
         mult_a0_mult_15_n531, mult_a0_mult_15_n530, mult_a0_mult_15_n529,
         mult_a0_mult_15_n528, mult_a0_mult_15_n527, mult_a0_mult_15_n526,
         mult_a0_mult_15_n525, mult_a0_mult_15_n524, mult_a0_mult_15_n523,
         mult_a0_mult_15_n522, mult_a0_mult_15_n521, mult_a0_mult_15_n520,
         mult_a0_mult_15_n519, mult_a0_mult_15_n518, mult_a0_mult_15_n517,
         mult_a0_mult_15_n516, mult_a0_mult_15_n515, mult_a0_mult_15_n514,
         mult_a0_mult_15_n513, mult_a0_mult_15_n512, mult_a0_mult_15_n511,
         mult_a0_mult_15_n510, mult_a0_mult_15_n509, mult_a0_mult_15_n508,
         mult_a0_mult_15_n507, mult_a0_mult_15_n506, mult_a0_mult_15_n505,
         mult_a0_mult_15_n504, mult_a0_mult_15_n503, mult_a0_mult_15_n502,
         mult_a0_mult_15_n501, mult_a0_mult_15_n500, mult_a0_mult_15_n499,
         mult_a0_mult_15_n498, mult_a0_mult_15_n497, mult_a0_mult_15_n496,
         mult_a0_mult_15_n495, mult_a0_mult_15_n494, mult_a0_mult_15_n493,
         mult_a0_mult_15_n492, mult_a0_mult_15_n491, mult_a0_mult_15_n490,
         mult_a0_mult_15_n489, mult_a0_mult_15_n488, mult_a0_mult_15_n487,
         mult_a0_mult_15_n486, mult_a0_mult_15_n485, mult_a0_mult_15_n484,
         mult_a0_mult_15_n483, mult_a0_mult_15_n482, mult_a0_mult_15_n481,
         mult_a0_mult_15_n480, mult_a0_mult_15_n479, mult_a0_mult_15_n478,
         mult_a0_mult_15_n477, mult_a0_mult_15_n476, mult_a0_mult_15_n475,
         mult_a0_mult_15_n474, mult_a0_mult_15_n473, mult_a0_mult_15_n472,
         mult_a0_mult_15_n471, mult_a0_mult_15_n470, mult_a0_mult_15_n469,
         mult_a0_mult_15_n468, mult_a0_mult_15_n467, mult_a0_mult_15_n466,
         mult_a0_mult_15_n465, mult_a0_mult_15_n464, mult_a0_mult_15_n463,
         mult_a0_mult_15_n462, mult_a0_mult_15_n461, mult_a0_mult_15_n460,
         mult_a0_mult_15_n459, mult_a0_mult_15_n458, mult_a0_mult_15_n457,
         mult_a0_mult_15_n456, mult_a0_mult_15_n455, mult_a0_mult_15_n454,
         mult_a0_mult_15_n453, mult_a0_mult_15_n452, mult_a0_mult_15_n451,
         mult_a0_mult_15_n450, mult_a0_mult_15_n449, mult_a0_mult_15_n448,
         mult_a0_mult_15_n447, mult_a0_mult_15_n446, mult_a0_mult_15_n445,
         mult_a0_mult_15_n444, mult_a0_mult_15_n443, mult_a0_mult_15_n442,
         mult_a0_mult_15_n441, mult_a0_mult_15_n440, mult_a0_mult_15_n439,
         mult_a0_mult_15_n438, mult_a0_mult_15_n437, mult_a0_mult_15_n436,
         mult_a0_mult_15_n435, mult_a0_mult_15_n434, mult_a0_mult_15_n433,
         mult_a0_mult_15_n432, mult_a0_mult_15_n431, mult_a0_mult_15_n430,
         mult_a0_mult_15_n429, mult_a0_mult_15_n428, mult_a0_mult_15_n427,
         mult_a0_mult_15_n426, mult_a0_mult_15_n425, mult_a0_mult_15_n424,
         mult_a0_mult_15_n423, mult_a0_mult_15_n422, mult_a0_mult_15_n421,
         mult_a0_mult_15_n420, mult_a0_mult_15_n419, mult_a0_mult_15_n418,
         mult_a0_mult_15_n417, mult_a0_mult_15_n416, mult_a0_mult_15_n415,
         mult_a0_mult_15_n414, mult_a0_mult_15_product_22_,
         mult_a0_mult_15_product_21_, mult_a0_mult_15_product_8_,
         mult_a0_mult_15_product_7_, mult_a0_mult_15_product_6_,
         mult_a0_mult_15_product_5_, mult_a0_mult_15_product_4_,
         mult_a0_mult_15_product_3_, mult_a0_mult_15_product_2_,
         mult_a0_mult_15_product_1_, mult_a0_mult_15_n228,
         mult_a0_mult_15_n227, mult_a0_mult_15_n226, mult_a0_mult_15_n225,
         mult_a0_mult_15_n224, mult_a0_mult_15_n223, mult_a0_mult_15_n222,
         mult_a0_mult_15_n221, mult_a0_mult_15_n220, mult_a0_mult_15_n217,
         mult_a0_mult_15_n216, mult_a0_mult_15_n215, mult_a0_mult_15_n214,
         mult_a0_mult_15_n213, mult_a0_mult_15_n212, mult_a0_mult_15_n211,
         mult_a0_mult_15_n210, mult_a0_mult_15_n209, mult_a0_mult_15_n208,
         mult_a0_mult_15_n206, mult_a0_mult_15_n205, mult_a0_mult_15_n204,
         mult_a0_mult_15_n203, mult_a0_mult_15_n202, mult_a0_mult_15_n201,
         mult_a0_mult_15_n200, mult_a0_mult_15_n199, mult_a0_mult_15_n197,
         mult_a0_mult_15_n196, mult_a0_mult_15_n194, mult_a0_mult_15_n193,
         mult_a0_mult_15_n192, mult_a0_mult_15_n191, mult_a0_mult_15_n190,
         mult_a0_mult_15_n189, mult_a0_mult_15_n188, mult_a0_mult_15_n187,
         mult_a0_mult_15_n186, mult_a0_mult_15_n185, mult_a0_mult_15_n184,
         mult_a0_mult_15_n182, mult_a0_mult_15_n181, mult_a0_mult_15_n180,
         mult_a0_mult_15_n179, mult_a0_mult_15_n177, mult_a0_mult_15_n176,
         mult_a0_mult_15_n175, mult_a0_mult_15_n174, mult_a0_mult_15_n173,
         mult_a0_mult_15_n172, mult_a0_mult_15_n170, mult_a0_mult_15_n169,
         mult_a0_mult_15_n168, mult_a0_mult_15_n167, mult_a0_mult_15_n166,
         mult_a0_mult_15_n165, mult_a0_mult_15_n164, mult_a0_mult_15_n163,
         mult_a0_mult_15_n162, mult_a0_mult_15_n161, mult_a0_mult_15_n160,
         mult_a0_mult_15_n156, mult_a0_mult_15_n155, mult_a0_mult_15_n154,
         mult_a0_mult_15_n153, mult_a0_mult_15_n134, mult_a0_mult_15_n133,
         mult_a0_mult_15_n132, mult_a0_mult_15_n131, mult_a0_mult_15_n130,
         mult_a0_mult_15_n129, mult_a0_mult_15_n128, mult_a0_mult_15_n126,
         mult_a0_mult_15_n125, mult_a0_mult_15_n124, mult_a0_mult_15_n123,
         mult_a0_mult_15_n122, mult_a0_mult_15_n121, mult_a0_mult_15_n120,
         mult_a0_mult_15_n119, mult_a0_mult_15_n118, mult_a0_mult_15_n117,
         mult_a0_mult_15_n116, mult_a0_mult_15_n115, mult_a0_mult_15_n114,
         mult_a0_mult_15_n113, mult_a0_mult_15_n112, mult_a0_mult_15_n111,
         mult_a0_mult_15_n110, mult_a0_mult_15_n109, mult_a0_mult_15_n108,
         mult_a0_mult_15_n107, mult_a0_mult_15_n106, mult_a0_mult_15_n105,
         mult_a0_mult_15_n104, mult_a0_mult_15_n103, mult_a0_mult_15_n102,
         mult_a0_mult_15_n101, mult_a0_mult_15_n100, mult_a0_mult_15_n99,
         mult_a0_mult_15_n98, mult_a0_mult_15_n97, mult_a0_mult_15_n96,
         mult_a0_mult_15_n95, mult_a0_mult_15_n94, mult_a0_mult_15_n93,
         mult_a0_mult_15_n92, mult_a0_mult_15_n91, mult_a0_mult_15_n90,
         mult_a0_mult_15_n89, mult_a0_mult_15_n88, mult_a0_mult_15_n87,
         mult_a0_mult_15_n86, mult_a0_mult_15_n85, mult_a0_mult_15_n84,
         mult_a0_mult_15_n83, mult_a0_mult_15_n82, mult_a0_mult_15_n81,
         mult_a0_mult_15_n80, mult_a0_mult_15_n79, mult_a0_mult_15_n78,
         mult_a0_mult_15_n77, mult_a0_mult_15_n76, mult_a0_mult_15_n75,
         mult_a0_mult_15_n73, mult_a0_mult_15_n72, mult_a0_mult_15_n71,
         mult_a0_mult_15_n70, mult_a0_mult_15_n69, mult_a0_mult_15_n68,
         mult_a0_mult_15_n67, mult_a0_mult_15_n66, mult_a0_mult_15_n65,
         mult_a0_mult_15_n64, mult_a0_mult_15_n63, mult_a0_mult_15_n62,
         mult_a0_mult_15_n61, mult_a0_mult_15_n60, mult_a0_mult_15_n59,
         mult_a0_mult_15_n58, mult_a0_mult_15_n57, mult_a0_mult_15_n55,
         mult_a0_mult_15_n54, mult_a0_mult_15_n53, mult_a0_mult_15_n52,
         mult_a0_mult_15_n51, mult_a0_mult_15_n50, mult_a0_mult_15_n49,
         mult_a0_mult_15_n48, mult_a0_mult_15_n47, mult_a0_mult_15_n46,
         mult_a0_mult_15_n45, mult_a0_mult_15_n44, mult_a0_mult_15_n43,
         mult_a0_mult_15_n41, mult_a0_mult_15_n40, mult_a0_mult_15_n39,
         mult_a0_mult_15_n38, mult_a0_mult_15_n37, mult_a0_mult_15_n36,
         mult_a0_mult_15_n35, mult_a0_mult_15_n34, mult_a0_mult_15_n33,
         mult_a0_mult_15_n31, mult_a0_mult_15_n30, mult_a0_mult_15_n29,
         mult_a0_mult_15_n28, mult_a0_mult_15_n27, mult_a0_mult_15_n17,
         mult_a0_mult_15_n16, mult_a0_mult_15_n15, mult_a0_mult_15_n14,
         mult_a0_mult_15_n13, mult_a0_mult_15_n12, mult_a0_mult_15_n11,
         mult_a0_mult_15_n10, mult_a0_mult_15_n9, mult_a0_mult_15_n8,
         mult_a0_mult_15_n7, mult_a0_mult_15_n6, mult_a0_mult_15_n5, add_a0_n4,
         add_a0_add_16_n32, add_a0_add_16_n31, add_a0_add_16_n30,
         add_a0_add_16_n29, add_a0_add_16_n28, add_a0_add_16_n27,
         add_a0_add_16_n26, add_a0_add_16_n25, add_a0_add_16_n24,
         add_a0_add_16_n23, add_a0_add_16_n22, add_a0_add_16_n21,
         add_a0_add_16_n20, add_a0_add_16_n19, add_a0_add_16_n18,
         add_a0_add_16_n17, add_a0_add_16_n16, add_a0_add_16_n15,
         add_a0_add_16_n14, add_a0_add_16_n13, add_a0_add_16_n12,
         add_a0_add_16_n11, add_a0_add_16_n10, add_a0_add_16_n9,
         add_a0_add_16_n8, add_a0_add_16_n7, add_a0_add_16_n6,
         add_a0_add_16_n5, add_a0_add_16_n4, add_a0_add_16_n3,
         add_a0_add_16_n2, add_a0_add_16_n1, count_n5, count_n4, count_n3,
         count_n2, count_n20, count_n19, count_n18, count_n17, count_n16,
         count_n15, count_n14, count_n13, count_n12, count_n11, count_n8,
         count_cnt_0_, count_cnt_1_, DOUT_reg_n10, DOUT_reg_n9, DOUT_reg_n8,
         DOUT_reg_n7, DOUT_reg_n6, DOUT_reg_n5, DOUT_reg_n4, DOUT_reg_n3,
         DOUT_reg_n2, DOUT_reg_n1, DOUT_reg_n22, DOUT_reg_n21, DOUT_reg_n20,
         DOUT_reg_n19, DOUT_reg_n18, DOUT_reg_n17, DOUT_reg_n16, DOUT_reg_n15,
         DOUT_reg_n14, DOUT_reg_n13, DOUT_reg_n12, DOUT_reg_n11, VOUT_reg_n7,
         VOUT_reg_n6, VOUT_reg_n5, VOUT_reg_n2, saturation_n18, saturation_n17,
         saturation_n16, saturation_n13, saturation_n12, saturation_n11,
         saturation_n10, saturation_n9, saturation_n8, saturation_n7,
         saturation_n6, saturation_n5, saturation_n4, saturation_n3,
         saturation_n2, saturation_n1, saturation_n15, saturation_n14;
  wire   [11:0] DIN_samp;
  wire   [11:0] sum_a0;
  wire   [11:0] reg_out;
  wire   [20:9] prod_b0_2N;
  wire   [20:9] prod_b1_2N;
  wire   [10:0] sum_b0;
  wire   [20:9] prod_a1_2N;
  wire   [9:0] sat_out;
  wire   [11:2] add_b0_add_16_carry;
  wire   [11:2] add_a0_add_16_carry;

  CLKBUF_X3 U4 ( .A(sum_a0[7]), .Z(n4) );
  BUF_X1 U5 ( .A(reg_out[1]), .Z(n5) );
  INV_X1 U6 ( .A(RST_n), .ZN(n6) );
  BUF_X4 U7 ( .A(sum_a0[3]), .Z(n2) );
  BUF_X4 U8 ( .A(sum_a0[5]), .Z(n3) );
  AOI22_X1 DIN_reg_U28 ( .A1(DIN[9]), .A2(DIN_reg_n14), .B1(DIN_samp[11]), 
        .B2(DIN_reg_n15), .ZN(DIN_reg_n26) );
  INV_X1 DIN_reg_U27 ( .A(DIN_reg_n26), .ZN(DIN_reg_n1) );
  AOI22_X1 DIN_reg_U26 ( .A1(DIN[9]), .A2(DIN_reg_n14), .B1(DIN_samp[10]), 
        .B2(DIN_reg_n15), .ZN(DIN_reg_n25) );
  INV_X1 DIN_reg_U25 ( .A(DIN_reg_n25), .ZN(DIN_reg_n2) );
  AOI22_X1 DIN_reg_U24 ( .A1(DIN[9]), .A2(DIN_reg_n14), .B1(DIN_samp[9]), .B2(
        DIN_reg_n15), .ZN(DIN_reg_n24) );
  INV_X1 DIN_reg_U23 ( .A(DIN_reg_n24), .ZN(DIN_reg_n3) );
  AOI22_X1 DIN_reg_U22 ( .A1(DIN[8]), .A2(DIN_reg_n14), .B1(DIN_samp[8]), .B2(
        DIN_reg_n15), .ZN(DIN_reg_n23) );
  INV_X1 DIN_reg_U21 ( .A(DIN_reg_n23), .ZN(DIN_reg_n4) );
  AOI22_X1 DIN_reg_U20 ( .A1(DIN[7]), .A2(DIN_reg_n14), .B1(DIN_samp[7]), .B2(
        DIN_reg_n15), .ZN(DIN_reg_n22) );
  INV_X1 DIN_reg_U19 ( .A(DIN_reg_n22), .ZN(DIN_reg_n5) );
  AOI22_X1 DIN_reg_U18 ( .A1(DIN[6]), .A2(DIN_reg_n14), .B1(DIN_samp[6]), .B2(
        DIN_reg_n15), .ZN(DIN_reg_n21) );
  INV_X1 DIN_reg_U17 ( .A(DIN_reg_n21), .ZN(DIN_reg_n6) );
  AOI22_X1 DIN_reg_U15 ( .A1(DIN[5]), .A2(DIN_reg_n14), .B1(DIN_samp[5]), .B2(
        DIN_reg_n15), .ZN(DIN_reg_n20) );
  INV_X1 DIN_reg_U14 ( .A(DIN_reg_n20), .ZN(DIN_reg_n7) );
  AOI22_X1 DIN_reg_U13 ( .A1(DIN[4]), .A2(DIN_reg_n14), .B1(DIN_samp[4]), .B2(
        DIN_reg_n15), .ZN(DIN_reg_n19) );
  INV_X1 DIN_reg_U12 ( .A(DIN_reg_n19), .ZN(DIN_reg_n8) );
  AOI22_X1 DIN_reg_U11 ( .A1(DIN[3]), .A2(DIN_reg_n14), .B1(DIN_samp[3]), .B2(
        DIN_reg_n15), .ZN(DIN_reg_n18) );
  INV_X1 DIN_reg_U10 ( .A(DIN_reg_n18), .ZN(DIN_reg_n9) );
  AOI22_X1 DIN_reg_U9 ( .A1(DIN[2]), .A2(DIN_reg_n14), .B1(DIN_samp[2]), .B2(
        DIN_reg_n15), .ZN(DIN_reg_n17) );
  INV_X1 DIN_reg_U8 ( .A(DIN_reg_n17), .ZN(DIN_reg_n10) );
  AOI22_X1 DIN_reg_U7 ( .A1(DIN[1]), .A2(DIN_reg_n14), .B1(DIN_samp[1]), .B2(
        DIN_reg_n15), .ZN(DIN_reg_n16) );
  INV_X1 DIN_reg_U6 ( .A(DIN_reg_n16), .ZN(DIN_reg_n11) );
  AOI22_X1 DIN_reg_U5 ( .A1(DIN[0]), .A2(DIN_reg_n14), .B1(DIN_samp[0]), .B2(
        DIN_reg_n15), .ZN(DIN_reg_n13) );
  INV_X1 DIN_reg_U4 ( .A(DIN_reg_n13), .ZN(DIN_reg_n12) );
  NOR2_X1 DIN_reg_U3 ( .A1(DIN_reg_n15), .A2(n6), .ZN(DIN_reg_n14) );
  NOR2_X2 DIN_reg_U16 ( .A1(1'b1), .A2(n6), .ZN(DIN_reg_n15) );
  DFF_X1 DIN_reg_Q_reg_0_ ( .D(DIN_reg_n12), .CK(CLK), .Q(DIN_samp[0]) );
  DFF_X1 DIN_reg_Q_reg_1_ ( .D(DIN_reg_n11), .CK(CLK), .Q(DIN_samp[1]) );
  DFF_X1 DIN_reg_Q_reg_2_ ( .D(DIN_reg_n10), .CK(CLK), .Q(DIN_samp[2]) );
  DFF_X1 DIN_reg_Q_reg_3_ ( .D(DIN_reg_n9), .CK(CLK), .Q(DIN_samp[3]) );
  DFF_X1 DIN_reg_Q_reg_4_ ( .D(DIN_reg_n8), .CK(CLK), .Q(DIN_samp[4]) );
  DFF_X1 DIN_reg_Q_reg_5_ ( .D(DIN_reg_n7), .CK(CLK), .Q(DIN_samp[5]) );
  DFF_X1 DIN_reg_Q_reg_6_ ( .D(DIN_reg_n6), .CK(CLK), .Q(DIN_samp[6]) );
  DFF_X1 DIN_reg_Q_reg_7_ ( .D(DIN_reg_n5), .CK(CLK), .Q(DIN_samp[7]) );
  DFF_X1 DIN_reg_Q_reg_8_ ( .D(DIN_reg_n4), .CK(CLK), .Q(DIN_samp[8]) );
  DFF_X1 DIN_reg_Q_reg_9_ ( .D(DIN_reg_n3), .CK(CLK), .Q(DIN_samp[9]) );
  DFF_X1 DIN_reg_Q_reg_10_ ( .D(DIN_reg_n2), .CK(CLK), .Q(DIN_samp[10]) );
  DFF_X1 DIN_reg_Q_reg_11_ ( .D(DIN_reg_n1), .CK(CLK), .Q(DIN_samp[11]) );
  INV_X1 VIN_reg_U4 ( .A(n6), .ZN(VIN_reg_n2) );
  OAI21_X1 VIN_reg_U2 ( .B1(VIN_reg_n3), .B2(1'b1), .A(VIN_reg_n1), .ZN(
        VIN_reg_n4) );
  NAND3_X1 VIN_reg_U3 ( .A1(VIN), .A2(VIN_reg_n2), .A3(1'b1), .ZN(VIN_reg_n1)
         );
  DFF_X1 VIN_reg_Q_reg ( .D(VIN_reg_n4), .CK(CLK), .Q(VIN_samp), .QN(
        VIN_reg_n3) );
  AOI22_X1 reg0_U28 ( .A1(sum_a0[11]), .A2(reg0_n39), .B1(reg_out[11]), .B2(
        reg0_n38), .ZN(reg0_n27) );
  NOR2_X2 reg0_U27 ( .A1(VIN_samp), .A2(n6), .ZN(reg0_n38) );
  AOI22_X1 reg0_U26 ( .A1(sum_a0[4]), .A2(reg0_n39), .B1(reg_out[4]), .B2(
        reg0_n38), .ZN(reg0_n34) );
  INV_X1 reg0_U25 ( .A(reg0_n34), .ZN(reg0_n8) );
  AOI22_X1 reg0_U24 ( .A1(n2), .A2(reg0_n39), .B1(reg_out[3]), .B2(reg0_n38), 
        .ZN(reg0_n35) );
  INV_X1 reg0_U23 ( .A(reg0_n35), .ZN(reg0_n9) );
  AOI22_X1 reg0_U22 ( .A1(sum_a0[2]), .A2(reg0_n39), .B1(reg_out[2]), .B2(
        reg0_n38), .ZN(reg0_n36) );
  INV_X1 reg0_U21 ( .A(reg0_n36), .ZN(reg0_n10) );
  AOI22_X1 reg0_U20 ( .A1(sum_a0[0]), .A2(reg0_n39), .B1(reg_out[0]), .B2(
        reg0_n38), .ZN(reg0_n40) );
  INV_X1 reg0_U19 ( .A(reg0_n40), .ZN(reg0_n12) );
  AOI22_X1 reg0_U18 ( .A1(sum_a0[1]), .A2(reg0_n39), .B1(reg_out[1]), .B2(
        reg0_n38), .ZN(reg0_n37) );
  INV_X1 reg0_U17 ( .A(reg0_n37), .ZN(reg0_n11) );
  AOI22_X1 reg0_U16 ( .A1(sum_a0[10]), .A2(reg0_n39), .B1(reg_out[10]), .B2(
        reg0_n38), .ZN(reg0_n28) );
  INV_X1 reg0_U15 ( .A(reg0_n28), .ZN(reg0_n2) );
  AOI22_X1 reg0_U14 ( .A1(sum_a0[9]), .A2(reg0_n39), .B1(reg_out[9]), .B2(
        reg0_n38), .ZN(reg0_n29) );
  INV_X1 reg0_U13 ( .A(reg0_n29), .ZN(reg0_n3) );
  AOI22_X1 reg0_U12 ( .A1(sum_a0[8]), .A2(reg0_n39), .B1(reg_out[8]), .B2(
        reg0_n38), .ZN(reg0_n30) );
  INV_X1 reg0_U11 ( .A(reg0_n30), .ZN(reg0_n4) );
  AOI22_X1 reg0_U10 ( .A1(n4), .A2(reg0_n39), .B1(reg_out[7]), .B2(reg0_n38), 
        .ZN(reg0_n31) );
  INV_X1 reg0_U9 ( .A(reg0_n31), .ZN(reg0_n5) );
  AOI22_X1 reg0_U8 ( .A1(sum_a0[6]), .A2(reg0_n39), .B1(reg_out[6]), .B2(
        reg0_n38), .ZN(reg0_n32) );
  INV_X1 reg0_U7 ( .A(reg0_n32), .ZN(reg0_n6) );
  AOI22_X1 reg0_U6 ( .A1(n3), .A2(reg0_n39), .B1(reg_out[5]), .B2(reg0_n38), 
        .ZN(reg0_n33) );
  INV_X1 reg0_U5 ( .A(reg0_n33), .ZN(reg0_n7) );
  INV_X1 reg0_U4 ( .A(reg0_n27), .ZN(reg0_n1) );
  NOR2_X1 reg0_U3 ( .A1(reg0_n38), .A2(n6), .ZN(reg0_n39) );
  DFF_X1 reg0_Q_reg_0_ ( .D(reg0_n12), .CK(CLK), .Q(reg_out[0]) );
  DFF_X1 reg0_Q_reg_1_ ( .D(reg0_n11), .CK(CLK), .Q(reg_out[1]) );
  DFF_X1 reg0_Q_reg_2_ ( .D(reg0_n10), .CK(CLK), .Q(reg_out[2]) );
  DFF_X1 reg0_Q_reg_3_ ( .D(reg0_n9), .CK(CLK), .Q(reg_out[3]) );
  DFF_X1 reg0_Q_reg_4_ ( .D(reg0_n8), .CK(CLK), .Q(reg_out[4]) );
  DFF_X1 reg0_Q_reg_5_ ( .D(reg0_n7), .CK(CLK), .Q(reg_out[5]) );
  DFF_X1 reg0_Q_reg_6_ ( .D(reg0_n6), .CK(CLK), .Q(reg_out[6]) );
  DFF_X1 reg0_Q_reg_7_ ( .D(reg0_n5), .CK(CLK), .Q(reg_out[7]) );
  DFF_X1 reg0_Q_reg_8_ ( .D(reg0_n4), .CK(CLK), .Q(reg_out[8]) );
  DFF_X1 reg0_Q_reg_9_ ( .D(reg0_n3), .CK(CLK), .Q(reg_out[9]) );
  DFF_X1 reg0_Q_reg_10_ ( .D(reg0_n2), .CK(CLK), .Q(reg_out[10]) );
  DFF_X1 reg0_Q_reg_11_ ( .D(reg0_n1), .CK(CLK), .Q(reg_out[11]) );
  OR3_X1 mult_b0_mult_15_U679 ( .A1(mult_b0_mult_15_n514), .A2(b0[0]), .A3(
        mult_b0_mult_15_n532), .ZN(mult_b0_mult_15_n662) );
  OAI21_X1 mult_b0_mult_15_U678 ( .B1(mult_b0_mult_15_n532), .B2(
        mult_b0_mult_15_n560), .A(mult_b0_mult_15_n662), .ZN(
        mult_b0_mult_15_n153) );
  OAI21_X1 mult_b0_mult_15_U677 ( .B1(mult_b0_mult_15_n510), .B2(
        mult_b0_mult_15_n506), .A(mult_b0_mult_15_n660), .ZN(
        mult_b0_mult_15_n154) );
  OR3_X1 mult_b0_mult_15_U676 ( .A1(mult_b0_mult_15_n580), .A2(b0[0]), .A3(
        mult_b0_mult_15_n540), .ZN(mult_b0_mult_15_n658) );
  OAI21_X1 mult_b0_mult_15_U675 ( .B1(mult_b0_mult_15_n540), .B2(
        mult_b0_mult_15_n579), .A(mult_b0_mult_15_n658), .ZN(
        mult_b0_mult_15_n155) );
  XNOR2_X1 mult_b0_mult_15_U674 ( .A(mult_b0_mult_15_n544), .B(sum_a0[4]), 
        .ZN(mult_b0_mult_15_n657) );
  OR3_X1 mult_b0_mult_15_U673 ( .A1(mult_b0_mult_15_n567), .A2(b0[0]), .A3(
        mult_b0_mult_15_n544), .ZN(mult_b0_mult_15_n656) );
  OAI21_X1 mult_b0_mult_15_U672 ( .B1(mult_b0_mult_15_n544), .B2(
        mult_b0_mult_15_n566), .A(mult_b0_mult_15_n656), .ZN(
        mult_b0_mult_15_n156) );
  XNOR2_X1 mult_b0_mult_15_U671 ( .A(b0[9]), .B(mult_b0_mult_15_n490), .ZN(
        mult_b0_mult_15_n655) );
  XNOR2_X1 mult_b0_mult_15_U670 ( .A(b0[9]), .B(mult_b0_mult_15_n490), .ZN(
        mult_b0_mult_15_n559) );
  OAI22_X1 mult_b0_mult_15_U669 ( .A1(mult_b0_mult_15_n655), .A2(
        mult_b0_mult_15_n512), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n559), .ZN(mult_b0_mult_15_n160) );
  XNOR2_X1 mult_b0_mult_15_U668 ( .A(b0[8]), .B(mult_b0_mult_15_n490), .ZN(
        mult_b0_mult_15_n654) );
  OAI22_X1 mult_b0_mult_15_U667 ( .A1(mult_b0_mult_15_n654), .A2(
        mult_b0_mult_15_n512), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n655), .ZN(mult_b0_mult_15_n161) );
  XNOR2_X1 mult_b0_mult_15_U666 ( .A(b0[7]), .B(mult_b0_mult_15_n490), .ZN(
        mult_b0_mult_15_n653) );
  OAI22_X1 mult_b0_mult_15_U665 ( .A1(mult_b0_mult_15_n653), .A2(
        mult_b0_mult_15_n512), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n654), .ZN(mult_b0_mult_15_n162) );
  XNOR2_X1 mult_b0_mult_15_U664 ( .A(b0[6]), .B(mult_b0_mult_15_n490), .ZN(
        mult_b0_mult_15_n652) );
  OAI22_X1 mult_b0_mult_15_U663 ( .A1(mult_b0_mult_15_n652), .A2(
        mult_b0_mult_15_n512), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n653), .ZN(mult_b0_mult_15_n163) );
  XNOR2_X1 mult_b0_mult_15_U662 ( .A(b0[5]), .B(mult_b0_mult_15_n490), .ZN(
        mult_b0_mult_15_n651) );
  OAI22_X1 mult_b0_mult_15_U661 ( .A1(mult_b0_mult_15_n651), .A2(
        mult_b0_mult_15_n512), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n652), .ZN(mult_b0_mult_15_n164) );
  XNOR2_X1 mult_b0_mult_15_U660 ( .A(b0[4]), .B(mult_b0_mult_15_n490), .ZN(
        mult_b0_mult_15_n650) );
  OAI22_X1 mult_b0_mult_15_U659 ( .A1(mult_b0_mult_15_n650), .A2(
        mult_b0_mult_15_n512), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n651), .ZN(mult_b0_mult_15_n165) );
  XNOR2_X1 mult_b0_mult_15_U658 ( .A(b0[3]), .B(sum_a0[11]), .ZN(
        mult_b0_mult_15_n649) );
  OAI22_X1 mult_b0_mult_15_U657 ( .A1(mult_b0_mult_15_n649), .A2(
        mult_b0_mult_15_n512), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n650), .ZN(mult_b0_mult_15_n166) );
  XNOR2_X1 mult_b0_mult_15_U656 ( .A(b0[2]), .B(sum_a0[11]), .ZN(
        mult_b0_mult_15_n648) );
  OAI22_X1 mult_b0_mult_15_U655 ( .A1(mult_b0_mult_15_n648), .A2(
        mult_b0_mult_15_n512), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n649), .ZN(mult_b0_mult_15_n167) );
  XNOR2_X1 mult_b0_mult_15_U654 ( .A(b0[1]), .B(sum_a0[11]), .ZN(
        mult_b0_mult_15_n647) );
  OAI22_X1 mult_b0_mult_15_U653 ( .A1(mult_b0_mult_15_n647), .A2(
        mult_b0_mult_15_n512), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n648), .ZN(mult_b0_mult_15_n168) );
  XNOR2_X1 mult_b0_mult_15_U652 ( .A(sum_a0[11]), .B(b0[0]), .ZN(
        mult_b0_mult_15_n646) );
  OAI22_X1 mult_b0_mult_15_U651 ( .A1(mult_b0_mult_15_n560), .A2(
        mult_b0_mult_15_n646), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n647), .ZN(mult_b0_mult_15_n169) );
  XOR2_X1 mult_b0_mult_15_U650 ( .A(sum_a0[2]), .B(sum_a0[1]), .Z(
        mult_b0_mult_15_n643) );
  NAND2_X1 mult_b0_mult_15_U649 ( .A1(sum_a0[1]), .A2(mult_b0_mult_15_n552), 
        .ZN(mult_b0_mult_15_n585) );
  XNOR2_X1 mult_b0_mult_15_U648 ( .A(b0[2]), .B(sum_a0[1]), .ZN(
        mult_b0_mult_15_n584) );
  OAI22_X1 mult_b0_mult_15_U647 ( .A1(b0[1]), .A2(mult_b0_mult_15_n585), .B1(
        mult_b0_mult_15_n584), .B2(mult_b0_mult_15_n552), .ZN(
        mult_b0_mult_15_n645) );
  XNOR2_X1 mult_b0_mult_15_U646 ( .A(mult_b0_mult_15_n549), .B(sum_a0[2]), 
        .ZN(mult_b0_mult_15_n644) );
  NAND3_X1 mult_b0_mult_15_U645 ( .A1(mult_b0_mult_15_n643), .A2(
        mult_b0_mult_15_n554), .A3(n2), .ZN(mult_b0_mult_15_n642) );
  OAI21_X1 mult_b0_mult_15_U644 ( .B1(mult_b0_mult_15_n549), .B2(
        mult_b0_mult_15_n574), .A(mult_b0_mult_15_n642), .ZN(
        mult_b0_mult_15_n641) );
  AOI222_X1 mult_b0_mult_15_U643 ( .A1(mult_b0_mult_15_n507), .A2(
        mult_b0_mult_15_n134), .B1(mult_b0_mult_15_n641), .B2(
        mult_b0_mult_15_n507), .C1(mult_b0_mult_15_n641), .C2(
        mult_b0_mult_15_n134), .ZN(mult_b0_mult_15_n640) );
  AOI222_X1 mult_b0_mult_15_U642 ( .A1(mult_b0_mult_15_n546), .A2(
        mult_b0_mult_15_n132), .B1(mult_b0_mult_15_n546), .B2(
        mult_b0_mult_15_n133), .C1(mult_b0_mult_15_n133), .C2(
        mult_b0_mult_15_n132), .ZN(mult_b0_mult_15_n639) );
  AOI222_X1 mult_b0_mult_15_U641 ( .A1(mult_b0_mult_15_n545), .A2(
        mult_b0_mult_15_n128), .B1(mult_b0_mult_15_n545), .B2(
        mult_b0_mult_15_n131), .C1(mult_b0_mult_15_n131), .C2(
        mult_b0_mult_15_n128), .ZN(mult_b0_mult_15_n638) );
  OAI222_X1 mult_b0_mult_15_U640 ( .A1(mult_b0_mult_15_n638), .A2(
        mult_b0_mult_15_n541), .B1(mult_b0_mult_15_n638), .B2(
        mult_b0_mult_15_n415), .C1(mult_b0_mult_15_n415), .C2(
        mult_b0_mult_15_n541), .ZN(mult_b0_mult_15_n637) );
  AOI222_X1 mult_b0_mult_15_U639 ( .A1(mult_b0_mult_15_n637), .A2(
        mult_b0_mult_15_n118), .B1(mult_b0_mult_15_n637), .B2(
        mult_b0_mult_15_n123), .C1(mult_b0_mult_15_n118), .C2(
        mult_b0_mult_15_n123), .ZN(mult_b0_mult_15_n636) );
  XNOR2_X1 mult_b0_mult_15_U638 ( .A(b0[9]), .B(mult_b0_mult_15_n438), .ZN(
        mult_b0_mult_15_n583) );
  OAI22_X1 mult_b0_mult_15_U637 ( .A1(mult_b0_mult_15_n583), .A2(
        mult_b0_mult_15_n414), .B1(mult_b0_mult_15_n511), .B2(
        mult_b0_mult_15_n583), .ZN(mult_b0_mult_15_n635) );
  XNOR2_X1 mult_b0_mult_15_U636 ( .A(b0[9]), .B(mult_b0_mult_15_n438), .ZN(
        mult_b0_mult_15_n634) );
  XNOR2_X1 mult_b0_mult_15_U635 ( .A(b0[9]), .B(mult_b0_mult_15_n438), .ZN(
        mult_b0_mult_15_n582) );
  OAI22_X1 mult_b0_mult_15_U634 ( .A1(mult_b0_mult_15_n634), .A2(
        mult_b0_mult_15_n511), .B1(mult_b0_mult_15_n414), .B2(
        mult_b0_mult_15_n582), .ZN(mult_b0_mult_15_n172) );
  XNOR2_X1 mult_b0_mult_15_U633 ( .A(b0[8]), .B(mult_b0_mult_15_n438), .ZN(
        mult_b0_mult_15_n633) );
  OAI22_X1 mult_b0_mult_15_U632 ( .A1(mult_b0_mult_15_n633), .A2(
        mult_b0_mult_15_n511), .B1(mult_b0_mult_15_n414), .B2(
        mult_b0_mult_15_n634), .ZN(mult_b0_mult_15_n173) );
  XNOR2_X1 mult_b0_mult_15_U631 ( .A(b0[7]), .B(mult_b0_mult_15_n438), .ZN(
        mult_b0_mult_15_n632) );
  OAI22_X1 mult_b0_mult_15_U630 ( .A1(mult_b0_mult_15_n632), .A2(
        mult_b0_mult_15_n511), .B1(mult_b0_mult_15_n414), .B2(
        mult_b0_mult_15_n633), .ZN(mult_b0_mult_15_n174) );
  XNOR2_X1 mult_b0_mult_15_U629 ( .A(b0[6]), .B(mult_b0_mult_15_n438), .ZN(
        mult_b0_mult_15_n631) );
  OAI22_X1 mult_b0_mult_15_U628 ( .A1(mult_b0_mult_15_n631), .A2(
        mult_b0_mult_15_n511), .B1(mult_b0_mult_15_n414), .B2(
        mult_b0_mult_15_n632), .ZN(mult_b0_mult_15_n175) );
  XNOR2_X1 mult_b0_mult_15_U627 ( .A(b0[5]), .B(mult_b0_mult_15_n438), .ZN(
        mult_b0_mult_15_n630) );
  OAI22_X1 mult_b0_mult_15_U626 ( .A1(mult_b0_mult_15_n630), .A2(
        mult_b0_mult_15_n511), .B1(mult_b0_mult_15_n414), .B2(
        mult_b0_mult_15_n631), .ZN(mult_b0_mult_15_n176) );
  XNOR2_X1 mult_b0_mult_15_U625 ( .A(b0[4]), .B(mult_b0_mult_15_n438), .ZN(
        mult_b0_mult_15_n572) );
  OAI22_X1 mult_b0_mult_15_U624 ( .A1(mult_b0_mult_15_n572), .A2(
        mult_b0_mult_15_n511), .B1(mult_b0_mult_15_n414), .B2(
        mult_b0_mult_15_n630), .ZN(mult_b0_mult_15_n177) );
  XNOR2_X1 mult_b0_mult_15_U623 ( .A(b0[2]), .B(mult_b0_mult_15_n438), .ZN(
        mult_b0_mult_15_n629) );
  XNOR2_X1 mult_b0_mult_15_U622 ( .A(b0[3]), .B(mult_b0_mult_15_n438), .ZN(
        mult_b0_mult_15_n569) );
  OAI22_X1 mult_b0_mult_15_U621 ( .A1(mult_b0_mult_15_n629), .A2(
        mult_b0_mult_15_n511), .B1(mult_b0_mult_15_n414), .B2(
        mult_b0_mult_15_n569), .ZN(mult_b0_mult_15_n179) );
  XNOR2_X1 mult_b0_mult_15_U620 ( .A(b0[1]), .B(sum_a0[9]), .ZN(
        mult_b0_mult_15_n628) );
  OAI22_X1 mult_b0_mult_15_U619 ( .A1(mult_b0_mult_15_n628), .A2(
        mult_b0_mult_15_n511), .B1(mult_b0_mult_15_n414), .B2(
        mult_b0_mult_15_n629), .ZN(mult_b0_mult_15_n180) );
  XNOR2_X1 mult_b0_mult_15_U618 ( .A(sum_a0[9]), .B(b0[0]), .ZN(
        mult_b0_mult_15_n627) );
  OAI22_X1 mult_b0_mult_15_U617 ( .A1(mult_b0_mult_15_n510), .A2(
        mult_b0_mult_15_n627), .B1(mult_b0_mult_15_n414), .B2(
        mult_b0_mult_15_n628), .ZN(mult_b0_mult_15_n181) );
  NOR2_X1 mult_b0_mult_15_U616 ( .A1(mult_b0_mult_15_n414), .A2(
        mult_b0_mult_15_n554), .ZN(mult_b0_mult_15_n182) );
  XNOR2_X1 mult_b0_mult_15_U615 ( .A(b0[9]), .B(mult_b0_mult_15_n423), .ZN(
        mult_b0_mult_15_n581) );
  OAI22_X1 mult_b0_mult_15_U614 ( .A1(mult_b0_mult_15_n581), .A2(
        mult_b0_mult_15_n580), .B1(mult_b0_mult_15_n579), .B2(
        mult_b0_mult_15_n581), .ZN(mult_b0_mult_15_n626) );
  XNOR2_X1 mult_b0_mult_15_U613 ( .A(b0[9]), .B(mult_b0_mult_15_n423), .ZN(
        mult_b0_mult_15_n625) );
  XNOR2_X1 mult_b0_mult_15_U612 ( .A(b0[9]), .B(mult_b0_mult_15_n423), .ZN(
        mult_b0_mult_15_n578) );
  OAI22_X1 mult_b0_mult_15_U611 ( .A1(mult_b0_mult_15_n625), .A2(
        mult_b0_mult_15_n579), .B1(mult_b0_mult_15_n580), .B2(
        mult_b0_mult_15_n578), .ZN(mult_b0_mult_15_n184) );
  XNOR2_X1 mult_b0_mult_15_U610 ( .A(b0[8]), .B(n4), .ZN(mult_b0_mult_15_n624)
         );
  OAI22_X1 mult_b0_mult_15_U609 ( .A1(mult_b0_mult_15_n624), .A2(
        mult_b0_mult_15_n579), .B1(mult_b0_mult_15_n580), .B2(
        mult_b0_mult_15_n625), .ZN(mult_b0_mult_15_n185) );
  XNOR2_X1 mult_b0_mult_15_U608 ( .A(b0[7]), .B(mult_b0_mult_15_n423), .ZN(
        mult_b0_mult_15_n623) );
  OAI22_X1 mult_b0_mult_15_U607 ( .A1(mult_b0_mult_15_n623), .A2(
        mult_b0_mult_15_n579), .B1(mult_b0_mult_15_n580), .B2(
        mult_b0_mult_15_n624), .ZN(mult_b0_mult_15_n186) );
  XNOR2_X1 mult_b0_mult_15_U606 ( .A(b0[6]), .B(n4), .ZN(mult_b0_mult_15_n622)
         );
  OAI22_X1 mult_b0_mult_15_U605 ( .A1(mult_b0_mult_15_n622), .A2(
        mult_b0_mult_15_n579), .B1(mult_b0_mult_15_n580), .B2(
        mult_b0_mult_15_n623), .ZN(mult_b0_mult_15_n187) );
  XNOR2_X1 mult_b0_mult_15_U604 ( .A(b0[5]), .B(n4), .ZN(mult_b0_mult_15_n621)
         );
  OAI22_X1 mult_b0_mult_15_U603 ( .A1(mult_b0_mult_15_n621), .A2(
        mult_b0_mult_15_n579), .B1(mult_b0_mult_15_n580), .B2(
        mult_b0_mult_15_n622), .ZN(mult_b0_mult_15_n188) );
  XNOR2_X1 mult_b0_mult_15_U602 ( .A(b0[4]), .B(n4), .ZN(mult_b0_mult_15_n620)
         );
  OAI22_X1 mult_b0_mult_15_U601 ( .A1(mult_b0_mult_15_n620), .A2(
        mult_b0_mult_15_n579), .B1(mult_b0_mult_15_n580), .B2(
        mult_b0_mult_15_n621), .ZN(mult_b0_mult_15_n189) );
  XNOR2_X1 mult_b0_mult_15_U600 ( .A(b0[3]), .B(n4), .ZN(mult_b0_mult_15_n619)
         );
  OAI22_X1 mult_b0_mult_15_U599 ( .A1(mult_b0_mult_15_n619), .A2(
        mult_b0_mult_15_n579), .B1(mult_b0_mult_15_n580), .B2(
        mult_b0_mult_15_n620), .ZN(mult_b0_mult_15_n190) );
  XNOR2_X1 mult_b0_mult_15_U598 ( .A(b0[2]), .B(n4), .ZN(mult_b0_mult_15_n618)
         );
  OAI22_X1 mult_b0_mult_15_U597 ( .A1(mult_b0_mult_15_n618), .A2(
        mult_b0_mult_15_n579), .B1(mult_b0_mult_15_n580), .B2(
        mult_b0_mult_15_n619), .ZN(mult_b0_mult_15_n191) );
  XNOR2_X1 mult_b0_mult_15_U596 ( .A(b0[1]), .B(n4), .ZN(mult_b0_mult_15_n617)
         );
  OAI22_X1 mult_b0_mult_15_U595 ( .A1(mult_b0_mult_15_n617), .A2(
        mult_b0_mult_15_n579), .B1(mult_b0_mult_15_n580), .B2(
        mult_b0_mult_15_n618), .ZN(mult_b0_mult_15_n192) );
  XNOR2_X1 mult_b0_mult_15_U594 ( .A(n4), .B(b0[0]), .ZN(mult_b0_mult_15_n616)
         );
  OAI22_X1 mult_b0_mult_15_U593 ( .A1(mult_b0_mult_15_n616), .A2(
        mult_b0_mult_15_n579), .B1(mult_b0_mult_15_n580), .B2(
        mult_b0_mult_15_n617), .ZN(mult_b0_mult_15_n193) );
  NOR2_X1 mult_b0_mult_15_U592 ( .A1(mult_b0_mult_15_n580), .A2(
        mult_b0_mult_15_n554), .ZN(mult_b0_mult_15_n194) );
  XNOR2_X1 mult_b0_mult_15_U591 ( .A(b0[9]), .B(n3), .ZN(mult_b0_mult_15_n577)
         );
  OAI22_X1 mult_b0_mult_15_U590 ( .A1(mult_b0_mult_15_n577), .A2(
        mult_b0_mult_15_n567), .B1(mult_b0_mult_15_n463), .B2(
        mult_b0_mult_15_n577), .ZN(mult_b0_mult_15_n615) );
  XNOR2_X1 mult_b0_mult_15_U589 ( .A(b0[9]), .B(n3), .ZN(mult_b0_mult_15_n614)
         );
  XNOR2_X1 mult_b0_mult_15_U588 ( .A(b0[9]), .B(n3), .ZN(mult_b0_mult_15_n576)
         );
  OAI22_X1 mult_b0_mult_15_U587 ( .A1(mult_b0_mult_15_n614), .A2(
        mult_b0_mult_15_n463), .B1(mult_b0_mult_15_n567), .B2(
        mult_b0_mult_15_n576), .ZN(mult_b0_mult_15_n196) );
  XNOR2_X1 mult_b0_mult_15_U586 ( .A(b0[8]), .B(n3), .ZN(mult_b0_mult_15_n568)
         );
  OAI22_X1 mult_b0_mult_15_U585 ( .A1(mult_b0_mult_15_n568), .A2(
        mult_b0_mult_15_n463), .B1(mult_b0_mult_15_n567), .B2(
        mult_b0_mult_15_n614), .ZN(mult_b0_mult_15_n197) );
  XNOR2_X1 mult_b0_mult_15_U584 ( .A(b0[6]), .B(n3), .ZN(mult_b0_mult_15_n613)
         );
  XNOR2_X1 mult_b0_mult_15_U583 ( .A(b0[7]), .B(n3), .ZN(mult_b0_mult_15_n565)
         );
  OAI22_X1 mult_b0_mult_15_U582 ( .A1(mult_b0_mult_15_n613), .A2(
        mult_b0_mult_15_n463), .B1(mult_b0_mult_15_n567), .B2(
        mult_b0_mult_15_n565), .ZN(mult_b0_mult_15_n199) );
  XNOR2_X1 mult_b0_mult_15_U581 ( .A(b0[5]), .B(n3), .ZN(mult_b0_mult_15_n612)
         );
  OAI22_X1 mult_b0_mult_15_U580 ( .A1(mult_b0_mult_15_n612), .A2(
        mult_b0_mult_15_n463), .B1(mult_b0_mult_15_n567), .B2(
        mult_b0_mult_15_n613), .ZN(mult_b0_mult_15_n200) );
  XNOR2_X1 mult_b0_mult_15_U579 ( .A(b0[4]), .B(n3), .ZN(mult_b0_mult_15_n611)
         );
  OAI22_X1 mult_b0_mult_15_U578 ( .A1(mult_b0_mult_15_n611), .A2(
        mult_b0_mult_15_n463), .B1(mult_b0_mult_15_n567), .B2(
        mult_b0_mult_15_n612), .ZN(mult_b0_mult_15_n201) );
  XNOR2_X1 mult_b0_mult_15_U577 ( .A(b0[3]), .B(n3), .ZN(mult_b0_mult_15_n610)
         );
  OAI22_X1 mult_b0_mult_15_U576 ( .A1(mult_b0_mult_15_n610), .A2(
        mult_b0_mult_15_n566), .B1(mult_b0_mult_15_n567), .B2(
        mult_b0_mult_15_n611), .ZN(mult_b0_mult_15_n202) );
  XNOR2_X1 mult_b0_mult_15_U575 ( .A(b0[2]), .B(n3), .ZN(mult_b0_mult_15_n609)
         );
  OAI22_X1 mult_b0_mult_15_U574 ( .A1(mult_b0_mult_15_n609), .A2(
        mult_b0_mult_15_n566), .B1(mult_b0_mult_15_n567), .B2(
        mult_b0_mult_15_n610), .ZN(mult_b0_mult_15_n203) );
  XNOR2_X1 mult_b0_mult_15_U573 ( .A(b0[1]), .B(n3), .ZN(mult_b0_mult_15_n608)
         );
  OAI22_X1 mult_b0_mult_15_U572 ( .A1(mult_b0_mult_15_n608), .A2(
        mult_b0_mult_15_n566), .B1(mult_b0_mult_15_n567), .B2(
        mult_b0_mult_15_n609), .ZN(mult_b0_mult_15_n204) );
  XNOR2_X1 mult_b0_mult_15_U571 ( .A(n3), .B(b0[0]), .ZN(mult_b0_mult_15_n607)
         );
  OAI22_X1 mult_b0_mult_15_U570 ( .A1(mult_b0_mult_15_n607), .A2(
        mult_b0_mult_15_n566), .B1(mult_b0_mult_15_n567), .B2(
        mult_b0_mult_15_n608), .ZN(mult_b0_mult_15_n205) );
  NOR2_X1 mult_b0_mult_15_U569 ( .A1(mult_b0_mult_15_n567), .A2(
        mult_b0_mult_15_n554), .ZN(mult_b0_mult_15_n206) );
  XOR2_X1 mult_b0_mult_15_U568 ( .A(b0[9]), .B(mult_b0_mult_15_n549), .Z(
        mult_b0_mult_15_n575) );
  OAI22_X1 mult_b0_mult_15_U567 ( .A1(mult_b0_mult_15_n575), .A2(
        mult_b0_mult_15_n550), .B1(mult_b0_mult_15_n574), .B2(
        mult_b0_mult_15_n575), .ZN(mult_b0_mult_15_n606) );
  XNOR2_X1 mult_b0_mult_15_U566 ( .A(b0[9]), .B(n2), .ZN(mult_b0_mult_15_n605)
         );
  XNOR2_X1 mult_b0_mult_15_U565 ( .A(b0[9]), .B(n2), .ZN(mult_b0_mult_15_n573)
         );
  OAI22_X1 mult_b0_mult_15_U564 ( .A1(mult_b0_mult_15_n605), .A2(
        mult_b0_mult_15_n574), .B1(mult_b0_mult_15_n550), .B2(
        mult_b0_mult_15_n573), .ZN(mult_b0_mult_15_n208) );
  XNOR2_X1 mult_b0_mult_15_U563 ( .A(b0[8]), .B(n2), .ZN(mult_b0_mult_15_n604)
         );
  OAI22_X1 mult_b0_mult_15_U562 ( .A1(mult_b0_mult_15_n604), .A2(
        mult_b0_mult_15_n574), .B1(mult_b0_mult_15_n550), .B2(
        mult_b0_mult_15_n605), .ZN(mult_b0_mult_15_n209) );
  XNOR2_X1 mult_b0_mult_15_U561 ( .A(b0[7]), .B(n2), .ZN(mult_b0_mult_15_n603)
         );
  OAI22_X1 mult_b0_mult_15_U560 ( .A1(mult_b0_mult_15_n603), .A2(
        mult_b0_mult_15_n574), .B1(mult_b0_mult_15_n550), .B2(
        mult_b0_mult_15_n604), .ZN(mult_b0_mult_15_n210) );
  XNOR2_X1 mult_b0_mult_15_U559 ( .A(b0[6]), .B(n2), .ZN(mult_b0_mult_15_n602)
         );
  OAI22_X1 mult_b0_mult_15_U558 ( .A1(mult_b0_mult_15_n602), .A2(
        mult_b0_mult_15_n574), .B1(mult_b0_mult_15_n550), .B2(
        mult_b0_mult_15_n603), .ZN(mult_b0_mult_15_n211) );
  XNOR2_X1 mult_b0_mult_15_U557 ( .A(b0[5]), .B(n2), .ZN(mult_b0_mult_15_n601)
         );
  OAI22_X1 mult_b0_mult_15_U556 ( .A1(mult_b0_mult_15_n601), .A2(
        mult_b0_mult_15_n574), .B1(mult_b0_mult_15_n550), .B2(
        mult_b0_mult_15_n602), .ZN(mult_b0_mult_15_n212) );
  XNOR2_X1 mult_b0_mult_15_U555 ( .A(b0[4]), .B(n2), .ZN(mult_b0_mult_15_n600)
         );
  OAI22_X1 mult_b0_mult_15_U554 ( .A1(mult_b0_mult_15_n600), .A2(
        mult_b0_mult_15_n574), .B1(mult_b0_mult_15_n550), .B2(
        mult_b0_mult_15_n601), .ZN(mult_b0_mult_15_n213) );
  XNOR2_X1 mult_b0_mult_15_U553 ( .A(b0[3]), .B(n2), .ZN(mult_b0_mult_15_n599)
         );
  OAI22_X1 mult_b0_mult_15_U552 ( .A1(mult_b0_mult_15_n599), .A2(
        mult_b0_mult_15_n574), .B1(mult_b0_mult_15_n550), .B2(
        mult_b0_mult_15_n600), .ZN(mult_b0_mult_15_n214) );
  XNOR2_X1 mult_b0_mult_15_U551 ( .A(b0[2]), .B(n2), .ZN(mult_b0_mult_15_n598)
         );
  OAI22_X1 mult_b0_mult_15_U550 ( .A1(mult_b0_mult_15_n598), .A2(
        mult_b0_mult_15_n574), .B1(mult_b0_mult_15_n550), .B2(
        mult_b0_mult_15_n599), .ZN(mult_b0_mult_15_n215) );
  XNOR2_X1 mult_b0_mult_15_U549 ( .A(b0[1]), .B(n2), .ZN(mult_b0_mult_15_n597)
         );
  OAI22_X1 mult_b0_mult_15_U548 ( .A1(mult_b0_mult_15_n597), .A2(
        mult_b0_mult_15_n574), .B1(mult_b0_mult_15_n550), .B2(
        mult_b0_mult_15_n598), .ZN(mult_b0_mult_15_n216) );
  XNOR2_X1 mult_b0_mult_15_U547 ( .A(n2), .B(b0[0]), .ZN(mult_b0_mult_15_n596)
         );
  OAI22_X1 mult_b0_mult_15_U546 ( .A1(mult_b0_mult_15_n596), .A2(
        mult_b0_mult_15_n574), .B1(mult_b0_mult_15_n550), .B2(
        mult_b0_mult_15_n597), .ZN(mult_b0_mult_15_n217) );
  XNOR2_X1 mult_b0_mult_15_U545 ( .A(b0[9]), .B(sum_a0[1]), .ZN(
        mult_b0_mult_15_n594) );
  OAI22_X1 mult_b0_mult_15_U544 ( .A1(mult_b0_mult_15_n552), .A2(
        mult_b0_mult_15_n594), .B1(mult_b0_mult_15_n585), .B2(
        mult_b0_mult_15_n594), .ZN(mult_b0_mult_15_n595) );
  XNOR2_X1 mult_b0_mult_15_U543 ( .A(b0[9]), .B(sum_a0[1]), .ZN(
        mult_b0_mult_15_n593) );
  OAI22_X1 mult_b0_mult_15_U542 ( .A1(mult_b0_mult_15_n593), .A2(
        mult_b0_mult_15_n585), .B1(mult_b0_mult_15_n594), .B2(
        mult_b0_mult_15_n552), .ZN(mult_b0_mult_15_n220) );
  XNOR2_X1 mult_b0_mult_15_U541 ( .A(b0[9]), .B(sum_a0[1]), .ZN(
        mult_b0_mult_15_n592) );
  OAI22_X1 mult_b0_mult_15_U540 ( .A1(mult_b0_mult_15_n592), .A2(
        mult_b0_mult_15_n585), .B1(mult_b0_mult_15_n593), .B2(
        mult_b0_mult_15_n552), .ZN(mult_b0_mult_15_n221) );
  XNOR2_X1 mult_b0_mult_15_U539 ( .A(b0[8]), .B(sum_a0[1]), .ZN(
        mult_b0_mult_15_n591) );
  OAI22_X1 mult_b0_mult_15_U538 ( .A1(mult_b0_mult_15_n591), .A2(
        mult_b0_mult_15_n585), .B1(mult_b0_mult_15_n592), .B2(
        mult_b0_mult_15_n552), .ZN(mult_b0_mult_15_n222) );
  XNOR2_X1 mult_b0_mult_15_U537 ( .A(b0[7]), .B(sum_a0[1]), .ZN(
        mult_b0_mult_15_n590) );
  OAI22_X1 mult_b0_mult_15_U536 ( .A1(mult_b0_mult_15_n590), .A2(
        mult_b0_mult_15_n585), .B1(mult_b0_mult_15_n591), .B2(
        mult_b0_mult_15_n552), .ZN(mult_b0_mult_15_n223) );
  XNOR2_X1 mult_b0_mult_15_U535 ( .A(b0[6]), .B(sum_a0[1]), .ZN(
        mult_b0_mult_15_n589) );
  OAI22_X1 mult_b0_mult_15_U534 ( .A1(mult_b0_mult_15_n589), .A2(
        mult_b0_mult_15_n585), .B1(mult_b0_mult_15_n590), .B2(
        mult_b0_mult_15_n552), .ZN(mult_b0_mult_15_n224) );
  XNOR2_X1 mult_b0_mult_15_U533 ( .A(b0[5]), .B(sum_a0[1]), .ZN(
        mult_b0_mult_15_n588) );
  OAI22_X1 mult_b0_mult_15_U532 ( .A1(mult_b0_mult_15_n588), .A2(
        mult_b0_mult_15_n585), .B1(mult_b0_mult_15_n589), .B2(
        mult_b0_mult_15_n552), .ZN(mult_b0_mult_15_n225) );
  XNOR2_X1 mult_b0_mult_15_U531 ( .A(b0[4]), .B(sum_a0[1]), .ZN(
        mult_b0_mult_15_n587) );
  OAI22_X1 mult_b0_mult_15_U530 ( .A1(mult_b0_mult_15_n587), .A2(
        mult_b0_mult_15_n585), .B1(mult_b0_mult_15_n588), .B2(
        mult_b0_mult_15_n552), .ZN(mult_b0_mult_15_n226) );
  XNOR2_X1 mult_b0_mult_15_U529 ( .A(b0[3]), .B(sum_a0[1]), .ZN(
        mult_b0_mult_15_n586) );
  OAI22_X1 mult_b0_mult_15_U528 ( .A1(mult_b0_mult_15_n586), .A2(
        mult_b0_mult_15_n585), .B1(mult_b0_mult_15_n587), .B2(
        mult_b0_mult_15_n552), .ZN(mult_b0_mult_15_n227) );
  OAI22_X1 mult_b0_mult_15_U527 ( .A1(mult_b0_mult_15_n584), .A2(
        mult_b0_mult_15_n585), .B1(mult_b0_mult_15_n586), .B2(
        mult_b0_mult_15_n552), .ZN(mult_b0_mult_15_n228) );
  OAI22_X1 mult_b0_mult_15_U526 ( .A1(mult_b0_mult_15_n582), .A2(
        mult_b0_mult_15_n511), .B1(mult_b0_mult_15_n414), .B2(
        mult_b0_mult_15_n583), .ZN(mult_b0_mult_15_n31) );
  OAI22_X1 mult_b0_mult_15_U525 ( .A1(mult_b0_mult_15_n578), .A2(
        mult_b0_mult_15_n579), .B1(mult_b0_mult_15_n580), .B2(
        mult_b0_mult_15_n581), .ZN(mult_b0_mult_15_n41) );
  OAI22_X1 mult_b0_mult_15_U524 ( .A1(mult_b0_mult_15_n576), .A2(
        mult_b0_mult_15_n463), .B1(mult_b0_mult_15_n567), .B2(
        mult_b0_mult_15_n577), .ZN(mult_b0_mult_15_n55) );
  OAI22_X1 mult_b0_mult_15_U523 ( .A1(mult_b0_mult_15_n573), .A2(
        mult_b0_mult_15_n574), .B1(mult_b0_mult_15_n550), .B2(
        mult_b0_mult_15_n575), .ZN(mult_b0_mult_15_n73) );
  OAI22_X1 mult_b0_mult_15_U522 ( .A1(mult_b0_mult_15_n569), .A2(
        mult_b0_mult_15_n511), .B1(mult_b0_mult_15_n414), .B2(
        mult_b0_mult_15_n572), .ZN(mult_b0_mult_15_n563) );
  OAI22_X1 mult_b0_mult_15_U521 ( .A1(mult_b0_mult_15_n565), .A2(
        mult_b0_mult_15_n463), .B1(mult_b0_mult_15_n567), .B2(
        mult_b0_mult_15_n568), .ZN(mult_b0_mult_15_n564) );
  OR2_X1 mult_b0_mult_15_U520 ( .A1(mult_b0_mult_15_n563), .A2(
        mult_b0_mult_15_n564), .ZN(mult_b0_mult_15_n83) );
  XNOR2_X1 mult_b0_mult_15_U519 ( .A(mult_b0_mult_15_n563), .B(
        mult_b0_mult_15_n564), .ZN(mult_b0_mult_15_n84) );
  NOR2_X1 mult_b0_mult_15_U518 ( .A1(mult_b0_mult_15_n552), .A2(
        mult_b0_mult_15_n554), .ZN(mult_b0_R_0_) );
  XNOR2_X1 mult_b0_mult_15_U517 ( .A(b0[9]), .B(mult_b0_mult_15_n490), .ZN(
        mult_b0_mult_15_n562) );
  OAI22_X1 mult_b0_mult_15_U516 ( .A1(mult_b0_mult_15_n562), .A2(
        mult_b0_mult_15_n512), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n562), .ZN(mult_b0_mult_15_n558) );
  OAI22_X1 mult_b0_mult_15_U515 ( .A1(mult_b0_mult_15_n559), .A2(
        mult_b0_mult_15_n512), .B1(mult_b0_mult_15_n513), .B2(
        mult_b0_mult_15_n562), .ZN(mult_b0_mult_15_n555) );
  AOI222_X1 mult_b0_mult_15_U514 ( .A1(mult_b0_mult_15_n5), .A2(
        mult_b0_mult_15_n27), .B1(mult_b0_mult_15_n531), .B2(
        mult_b0_mult_15_n5), .C1(mult_b0_mult_15_n531), .C2(
        mult_b0_mult_15_n27), .ZN(mult_b0_mult_15_n557) );
  OAI22_X1 mult_b0_mult_15_U513 ( .A1(mult_b0_mult_15_n557), .A2(
        mult_b0_mult_15_n558), .B1(mult_b0_mult_15_n531), .B2(
        mult_b0_mult_15_n557), .ZN(mult_b0_mult_15_n556) );
  AOI21_X1 mult_b0_mult_15_U512 ( .B1(mult_b0_mult_15_n530), .B2(
        mult_b0_mult_15_n555), .A(mult_b0_mult_15_n556), .ZN(mult_b0_R_23_) );
  XOR2_X2 mult_b0_mult_15_U511 ( .A(sum_a0[4]), .B(mult_b0_mult_15_n549), .Z(
        mult_b0_mult_15_n567) );
  INV_X1 mult_b0_mult_15_U510 ( .A(sum_a0[9]), .ZN(mult_b0_mult_15_n535) );
  NAND3_X1 mult_b0_mult_15_U509 ( .A1(mult_b0_mult_15_n527), .A2(
        mult_b0_mult_15_n528), .A3(mult_b0_mult_15_n529), .ZN(
        mult_b0_mult_15_n16) );
  NAND2_X1 mult_b0_mult_15_U508 ( .A1(mult_b0_mult_15_n17), .A2(
        mult_b0_mult_15_n111), .ZN(mult_b0_mult_15_n529) );
  NAND2_X1 mult_b0_mult_15_U507 ( .A1(mult_b0_mult_15_n104), .A2(
        mult_b0_mult_15_n111), .ZN(mult_b0_mult_15_n528) );
  NAND2_X1 mult_b0_mult_15_U506 ( .A1(mult_b0_mult_15_n104), .A2(
        mult_b0_mult_15_n17), .ZN(mult_b0_mult_15_n527) );
  NAND3_X1 mult_b0_mult_15_U505 ( .A1(mult_b0_mult_15_n524), .A2(
        mult_b0_mult_15_n525), .A3(mult_b0_mult_15_n526), .ZN(
        mult_b0_mult_15_n10) );
  NAND2_X1 mult_b0_mult_15_U504 ( .A1(mult_b0_mult_15_n57), .A2(
        mult_b0_mult_15_n11), .ZN(mult_b0_mult_15_n526) );
  NAND2_X1 mult_b0_mult_15_U503 ( .A1(mult_b0_mult_15_n50), .A2(
        mult_b0_mult_15_n11), .ZN(mult_b0_mult_15_n525) );
  NAND2_X1 mult_b0_mult_15_U502 ( .A1(mult_b0_mult_15_n50), .A2(
        mult_b0_mult_15_n57), .ZN(mult_b0_mult_15_n524) );
  XOR2_X1 mult_b0_mult_15_U501 ( .A(mult_b0_mult_15_n523), .B(
        mult_b0_mult_15_n11), .Z(prod_b0_2N[15]) );
  XOR2_X1 mult_b0_mult_15_U500 ( .A(mult_b0_mult_15_n50), .B(
        mult_b0_mult_15_n57), .Z(mult_b0_mult_15_n523) );
  NAND2_X1 mult_b0_mult_15_U499 ( .A1(mult_b0_mult_15_n65), .A2(
        mult_b0_mult_15_n459), .ZN(mult_b0_mult_15_n522) );
  NAND2_X1 mult_b0_mult_15_U498 ( .A1(mult_b0_mult_15_n58), .A2(
        mult_b0_mult_15_n12), .ZN(mult_b0_mult_15_n521) );
  NAND2_X1 mult_b0_mult_15_U497 ( .A1(mult_b0_mult_15_n58), .A2(
        mult_b0_mult_15_n65), .ZN(mult_b0_mult_15_n520) );
  XOR2_X1 mult_b0_mult_15_U496 ( .A(mult_b0_mult_15_n519), .B(
        mult_b0_mult_15_n12), .Z(prod_b0_2N[14]) );
  XOR2_X1 mult_b0_mult_15_U495 ( .A(mult_b0_mult_15_n58), .B(
        mult_b0_mult_15_n65), .Z(mult_b0_mult_15_n519) );
  INV_X1 mult_b0_mult_15_U494 ( .A(sum_a0[11]), .ZN(mult_b0_mult_15_n532) );
  NAND3_X1 mult_b0_mult_15_U493 ( .A1(mult_b0_mult_15_n517), .A2(
        mult_b0_mult_15_n516), .A3(mult_b0_mult_15_n518), .ZN(
        mult_b0_mult_15_n15) );
  NAND2_X1 mult_b0_mult_15_U492 ( .A1(mult_b0_mult_15_n418), .A2(
        mult_b0_mult_15_n103), .ZN(mult_b0_mult_15_n518) );
  NAND2_X1 mult_b0_mult_15_U491 ( .A1(mult_b0_mult_15_n16), .A2(
        mult_b0_mult_15_n103), .ZN(mult_b0_mult_15_n517) );
  NAND2_X1 mult_b0_mult_15_U490 ( .A1(mult_b0_mult_15_n430), .A2(
        mult_b0_mult_15_n418), .ZN(mult_b0_mult_15_n516) );
  XOR2_X1 mult_b0_mult_15_U489 ( .A(mult_b0_mult_15_n431), .B(
        mult_b0_mult_15_n515), .Z(prod_b0_2N[10]) );
  XOR2_X1 mult_b0_mult_15_U488 ( .A(mult_b0_mult_15_n96), .B(
        mult_b0_mult_15_n103), .Z(mult_b0_mult_15_n515) );
  XOR2_X1 mult_b0_mult_15_U487 ( .A(sum_a0[10]), .B(mult_b0_mult_15_n535), .Z(
        mult_b0_mult_15_n561) );
  NAND2_X1 mult_b0_mult_15_U486 ( .A1(mult_b0_mult_15_n514), .A2(
        mult_b0_mult_15_n663), .ZN(mult_b0_mult_15_n560) );
  NAND2_X1 mult_b0_mult_15_U485 ( .A1(mult_b0_mult_15_n661), .A2(
        mult_b0_mult_15_n414), .ZN(mult_b0_mult_15_n570) );
  NAND2_X2 mult_b0_mult_15_U484 ( .A1(mult_b0_mult_15_n580), .A2(
        mult_b0_mult_15_n659), .ZN(mult_b0_mult_15_n579) );
  BUF_X1 mult_b0_mult_15_U483 ( .A(mult_b0_mult_15_n570), .Z(
        mult_b0_mult_15_n510) );
  INV_X1 mult_b0_mult_15_U482 ( .A(b0[1]), .ZN(mult_b0_mult_15_n553) );
  INV_X1 mult_b0_mult_15_U481 ( .A(b0[0]), .ZN(mult_b0_mult_15_n554) );
  AND3_X1 mult_b0_mult_15_U480 ( .A1(mult_b0_mult_15_n645), .A2(
        mult_b0_mult_15_n553), .A3(sum_a0[1]), .ZN(mult_b0_mult_15_n509) );
  AND2_X1 mult_b0_mult_15_U479 ( .A1(mult_b0_mult_15_n643), .A2(
        mult_b0_mult_15_n645), .ZN(mult_b0_mult_15_n508) );
  MUX2_X1 mult_b0_mult_15_U478 ( .A(mult_b0_mult_15_n508), .B(
        mult_b0_mult_15_n509), .S(mult_b0_mult_15_n554), .Z(
        mult_b0_mult_15_n507) );
  INV_X1 mult_b0_mult_15_U477 ( .A(mult_b0_mult_15_n626), .ZN(
        mult_b0_mult_15_n539) );
  INV_X1 mult_b0_mult_15_U476 ( .A(mult_b0_mult_15_n73), .ZN(
        mult_b0_mult_15_n547) );
  INV_X1 mult_b0_mult_15_U475 ( .A(mult_b0_mult_15_n606), .ZN(
        mult_b0_mult_15_n548) );
  INV_X1 mult_b0_mult_15_U474 ( .A(mult_b0_mult_15_n615), .ZN(
        mult_b0_mult_15_n543) );
  INV_X1 mult_b0_mult_15_U473 ( .A(mult_b0_mult_15_n635), .ZN(
        mult_b0_mult_15_n534) );
  INV_X1 mult_b0_mult_15_U472 ( .A(mult_b0_mult_15_n31), .ZN(
        mult_b0_mult_15_n533) );
  INV_X1 mult_b0_mult_15_U471 ( .A(mult_b0_mult_15_n41), .ZN(
        mult_b0_mult_15_n538) );
  INV_X1 mult_b0_mult_15_U470 ( .A(mult_b0_mult_15_n595), .ZN(
        mult_b0_mult_15_n551) );
  INV_X1 mult_b0_mult_15_U469 ( .A(sum_a0[0]), .ZN(mult_b0_mult_15_n552) );
  INV_X1 mult_b0_mult_15_U468 ( .A(mult_b0_mult_15_n640), .ZN(
        mult_b0_mult_15_n546) );
  INV_X1 mult_b0_mult_15_U467 ( .A(mult_b0_mult_15_n639), .ZN(
        mult_b0_mult_15_n545) );
  INV_X1 mult_b0_mult_15_U466 ( .A(mult_b0_mult_15_n558), .ZN(
        mult_b0_mult_15_n530) );
  INV_X1 mult_b0_mult_15_U465 ( .A(mult_b0_mult_15_n555), .ZN(
        mult_b0_mult_15_n531) );
  INV_X1 mult_b0_mult_15_U464 ( .A(mult_b0_mult_15_n112), .ZN(
        mult_b0_mult_15_n536) );
  INV_X1 mult_b0_mult_15_U463 ( .A(mult_b0_mult_15_n117), .ZN(
        mult_b0_mult_15_n537) );
  INV_X1 mult_b0_mult_15_U462 ( .A(n3), .ZN(mult_b0_mult_15_n544) );
  INV_X1 mult_b0_mult_15_U461 ( .A(n4), .ZN(mult_b0_mult_15_n540) );
  INV_X1 mult_b0_mult_15_U460 ( .A(n2), .ZN(mult_b0_mult_15_n549) );
  INV_X1 mult_b0_mult_15_U459 ( .A(mult_b0_mult_15_n55), .ZN(
        mult_b0_mult_15_n542) );
  INV_X1 mult_b0_mult_15_U458 ( .A(mult_b0_mult_15_n643), .ZN(
        mult_b0_mult_15_n550) );
  INV_X1 mult_b0_mult_15_U457 ( .A(mult_b0_mult_15_n124), .ZN(
        mult_b0_mult_15_n541) );
  BUF_X1 mult_b0_mult_15_U456 ( .A(mult_b0_mult_15_n535), .Z(
        mult_b0_mult_15_n506) );
  NAND3_X1 mult_b0_mult_15_U455 ( .A1(mult_b0_mult_15_n504), .A2(
        mult_b0_mult_15_n503), .A3(mult_b0_mult_15_n505), .ZN(
        mult_b0_mult_15_n12) );
  NAND2_X1 mult_b0_mult_15_U454 ( .A1(mult_b0_mult_15_n66), .A2(
        mult_b0_mult_15_n75), .ZN(mult_b0_mult_15_n505) );
  NAND2_X1 mult_b0_mult_15_U453 ( .A1(mult_b0_mult_15_n13), .A2(
        mult_b0_mult_15_n75), .ZN(mult_b0_mult_15_n504) );
  NAND2_X1 mult_b0_mult_15_U452 ( .A1(mult_b0_mult_15_n461), .A2(
        mult_b0_mult_15_n66), .ZN(mult_b0_mult_15_n503) );
  XOR2_X1 mult_b0_mult_15_U451 ( .A(mult_b0_mult_15_n13), .B(
        mult_b0_mult_15_n502), .Z(prod_b0_2N[13]) );
  XOR2_X1 mult_b0_mult_15_U450 ( .A(mult_b0_mult_15_n66), .B(
        mult_b0_mult_15_n75), .Z(mult_b0_mult_15_n502) );
  NAND3_X1 mult_b0_mult_15_U449 ( .A1(mult_b0_mult_15_n501), .A2(
        mult_b0_mult_15_n500), .A3(mult_b0_mult_15_n499), .ZN(
        mult_b0_mult_15_n6) );
  NAND2_X1 mult_b0_mult_15_U448 ( .A1(mult_b0_mult_15_n33), .A2(
        mult_b0_mult_15_n432), .ZN(mult_b0_mult_15_n501) );
  NAND2_X1 mult_b0_mult_15_U447 ( .A1(mult_b0_mult_15_n30), .A2(
        mult_b0_mult_15_n7), .ZN(mult_b0_mult_15_n500) );
  NAND2_X1 mult_b0_mult_15_U446 ( .A1(mult_b0_mult_15_n30), .A2(
        mult_b0_mult_15_n33), .ZN(mult_b0_mult_15_n499) );
  XOR2_X1 mult_b0_mult_15_U445 ( .A(mult_b0_mult_15_n498), .B(
        mult_b0_mult_15_n433), .Z(prod_b0_2N[19]) );
  XOR2_X1 mult_b0_mult_15_U444 ( .A(mult_b0_mult_15_n30), .B(
        mult_b0_mult_15_n33), .Z(mult_b0_mult_15_n498) );
  NAND3_X1 mult_b0_mult_15_U443 ( .A1(mult_b0_mult_15_n496), .A2(
        mult_b0_mult_15_n497), .A3(mult_b0_mult_15_n495), .ZN(
        mult_b0_mult_15_n7) );
  NAND2_X1 mult_b0_mult_15_U442 ( .A1(mult_b0_mult_15_n37), .A2(
        mult_b0_mult_15_n8), .ZN(mult_b0_mult_15_n497) );
  NAND2_X1 mult_b0_mult_15_U441 ( .A1(mult_b0_mult_15_n34), .A2(
        mult_b0_mult_15_n8), .ZN(mult_b0_mult_15_n496) );
  NAND2_X1 mult_b0_mult_15_U440 ( .A1(mult_b0_mult_15_n34), .A2(
        mult_b0_mult_15_n37), .ZN(mult_b0_mult_15_n495) );
  XOR2_X1 mult_b0_mult_15_U439 ( .A(mult_b0_mult_15_n494), .B(
        mult_b0_mult_15_n462), .Z(prod_b0_2N[18]) );
  XOR2_X1 mult_b0_mult_15_U438 ( .A(mult_b0_mult_15_n34), .B(
        mult_b0_mult_15_n37), .Z(mult_b0_mult_15_n494) );
  NAND3_X1 mult_b0_mult_15_U437 ( .A1(mult_b0_mult_15_n491), .A2(
        mult_b0_mult_15_n492), .A3(mult_b0_mult_15_n493), .ZN(
        mult_b0_mult_15_n105) );
  NAND2_X1 mult_b0_mult_15_U436 ( .A1(mult_b0_mult_15_n115), .A2(
        mult_b0_mult_15_n222), .ZN(mult_b0_mult_15_n493) );
  NAND2_X1 mult_b0_mult_15_U435 ( .A1(mult_b0_mult_15_n417), .A2(
        mult_b0_mult_15_n222), .ZN(mult_b0_mult_15_n492) );
  NAND2_X1 mult_b0_mult_15_U434 ( .A1(mult_b0_mult_15_n417), .A2(
        mult_b0_mult_15_n115), .ZN(mult_b0_mult_15_n491) );
  XOR2_X1 mult_b0_mult_15_U433 ( .A(sum_a0[10]), .B(sum_a0[11]), .Z(
        mult_b0_mult_15_n663) );
  NAND3_X1 mult_b0_mult_15_U432 ( .A1(mult_b0_mult_15_n488), .A2(
        mult_b0_mult_15_n487), .A3(mult_b0_mult_15_n489), .ZN(
        mult_b0_mult_15_n8) );
  NAND2_X1 mult_b0_mult_15_U431 ( .A1(mult_b0_mult_15_n43), .A2(
        mult_b0_mult_15_n38), .ZN(mult_b0_mult_15_n489) );
  NAND2_X1 mult_b0_mult_15_U430 ( .A1(mult_b0_mult_15_n9), .A2(
        mult_b0_mult_15_n38), .ZN(mult_b0_mult_15_n488) );
  NAND2_X1 mult_b0_mult_15_U429 ( .A1(mult_b0_mult_15_n473), .A2(
        mult_b0_mult_15_n43), .ZN(mult_b0_mult_15_n487) );
  XOR2_X1 mult_b0_mult_15_U428 ( .A(mult_b0_mult_15_n9), .B(
        mult_b0_mult_15_n486), .Z(prod_b0_2N[17]) );
  XOR2_X1 mult_b0_mult_15_U427 ( .A(mult_b0_mult_15_n43), .B(
        mult_b0_mult_15_n38), .Z(mult_b0_mult_15_n486) );
  NAND3_X1 mult_b0_mult_15_U426 ( .A1(mult_b0_mult_15_n483), .A2(
        mult_b0_mult_15_n484), .A3(mult_b0_mult_15_n485), .ZN(
        mult_b0_mult_15_n13) );
  NAND2_X1 mult_b0_mult_15_U425 ( .A1(mult_b0_mult_15_n76), .A2(
        mult_b0_mult_15_n85), .ZN(mult_b0_mult_15_n485) );
  NAND2_X1 mult_b0_mult_15_U424 ( .A1(mult_b0_mult_15_n14), .A2(
        mult_b0_mult_15_n85), .ZN(mult_b0_mult_15_n484) );
  NAND2_X1 mult_b0_mult_15_U423 ( .A1(mult_b0_mult_15_n451), .A2(
        mult_b0_mult_15_n76), .ZN(mult_b0_mult_15_n483) );
  XOR2_X1 mult_b0_mult_15_U422 ( .A(mult_b0_mult_15_n451), .B(
        mult_b0_mult_15_n482), .Z(prod_b0_2N[12]) );
  XOR2_X1 mult_b0_mult_15_U421 ( .A(mult_b0_mult_15_n76), .B(
        mult_b0_mult_15_n85), .Z(mult_b0_mult_15_n482) );
  NAND2_X1 mult_b0_mult_15_U420 ( .A1(mult_b0_mult_15_n421), .A2(
        mult_b0_mult_15_n97), .ZN(mult_b0_mult_15_n481) );
  NAND2_X1 mult_b0_mult_15_U419 ( .A1(mult_b0_mult_15_n88), .A2(
        mult_b0_mult_15_n97), .ZN(mult_b0_mult_15_n480) );
  NAND2_X1 mult_b0_mult_15_U418 ( .A1(mult_b0_mult_15_n88), .A2(
        mult_b0_mult_15_n421), .ZN(mult_b0_mult_15_n479) );
  XNOR2_X1 mult_b0_mult_15_U417 ( .A(mult_b0_mult_15_n115), .B(
        mult_b0_mult_15_n222), .ZN(mult_b0_mult_15_n478) );
  XNOR2_X1 mult_b0_mult_15_U416 ( .A(mult_b0_mult_15_n110), .B(
        mult_b0_mult_15_n478), .ZN(mult_b0_mult_15_n106) );
  NAND3_X1 mult_b0_mult_15_U415 ( .A1(mult_b0_mult_15_n476), .A2(
        mult_b0_mult_15_n475), .A3(mult_b0_mult_15_n477), .ZN(
        mult_b0_mult_15_n9) );
  NAND2_X1 mult_b0_mult_15_U414 ( .A1(mult_b0_mult_15_n44), .A2(
        mult_b0_mult_15_n49), .ZN(mult_b0_mult_15_n477) );
  NAND2_X1 mult_b0_mult_15_U413 ( .A1(mult_b0_mult_15_n10), .A2(
        mult_b0_mult_15_n49), .ZN(mult_b0_mult_15_n476) );
  NAND2_X1 mult_b0_mult_15_U412 ( .A1(mult_b0_mult_15_n10), .A2(
        mult_b0_mult_15_n44), .ZN(mult_b0_mult_15_n475) );
  XOR2_X1 mult_b0_mult_15_U411 ( .A(mult_b0_mult_15_n472), .B(
        mult_b0_mult_15_n474), .Z(prod_b0_2N[16]) );
  XOR2_X1 mult_b0_mult_15_U410 ( .A(mult_b0_mult_15_n44), .B(
        mult_b0_mult_15_n49), .Z(mult_b0_mult_15_n474) );
  NAND3_X1 mult_b0_mult_15_U409 ( .A1(mult_b0_mult_15_n475), .A2(
        mult_b0_mult_15_n476), .A3(mult_b0_mult_15_n477), .ZN(
        mult_b0_mult_15_n473) );
  NAND3_X1 mult_b0_mult_15_U408 ( .A1(mult_b0_mult_15_n524), .A2(
        mult_b0_mult_15_n525), .A3(mult_b0_mult_15_n526), .ZN(
        mult_b0_mult_15_n472) );
  NAND3_X1 mult_b0_mult_15_U407 ( .A1(mult_b0_mult_15_n469), .A2(
        mult_b0_mult_15_n470), .A3(mult_b0_mult_15_n471), .ZN(
        mult_b0_mult_15_n97) );
  NAND2_X1 mult_b0_mult_15_U406 ( .A1(mult_b0_mult_15_n109), .A2(
        mult_b0_mult_15_n102), .ZN(mult_b0_mult_15_n471) );
  NAND2_X1 mult_b0_mult_15_U405 ( .A1(mult_b0_mult_15_n107), .A2(
        mult_b0_mult_15_n102), .ZN(mult_b0_mult_15_n470) );
  NAND2_X1 mult_b0_mult_15_U404 ( .A1(mult_b0_mult_15_n107), .A2(
        mult_b0_mult_15_n109), .ZN(mult_b0_mult_15_n469) );
  NAND3_X1 mult_b0_mult_15_U403 ( .A1(mult_b0_mult_15_n466), .A2(
        mult_b0_mult_15_n467), .A3(mult_b0_mult_15_n468), .ZN(
        mult_b0_mult_15_n101) );
  NAND2_X1 mult_b0_mult_15_U402 ( .A1(mult_b0_mult_15_n221), .A2(
        mult_b0_mult_15_n170), .ZN(mult_b0_mult_15_n468) );
  NAND2_X1 mult_b0_mult_15_U401 ( .A1(mult_b0_mult_15_n190), .A2(
        mult_b0_mult_15_n170), .ZN(mult_b0_mult_15_n467) );
  NAND2_X1 mult_b0_mult_15_U400 ( .A1(mult_b0_mult_15_n190), .A2(
        mult_b0_mult_15_n221), .ZN(mult_b0_mult_15_n466) );
  XOR2_X1 mult_b0_mult_15_U399 ( .A(mult_b0_mult_15_n465), .B(
        mult_b0_mult_15_n170), .Z(mult_b0_mult_15_n102) );
  XOR2_X1 mult_b0_mult_15_U398 ( .A(mult_b0_mult_15_n190), .B(
        mult_b0_mult_15_n221), .Z(mult_b0_mult_15_n465) );
  XNOR2_X1 mult_b0_mult_15_U397 ( .A(mult_b0_mult_15_n107), .B(
        mult_b0_mult_15_n109), .ZN(mult_b0_mult_15_n464) );
  XNOR2_X1 mult_b0_mult_15_U396 ( .A(mult_b0_mult_15_n464), .B(
        mult_b0_mult_15_n102), .ZN(mult_b0_mult_15_n98) );
  NAND2_X1 mult_b0_mult_15_U395 ( .A1(mult_b0_mult_15_n567), .A2(
        mult_b0_mult_15_n657), .ZN(mult_b0_mult_15_n566) );
  NAND3_X1 mult_b0_mult_15_U394 ( .A1(mult_b0_mult_15_n488), .A2(
        mult_b0_mult_15_n487), .A3(mult_b0_mult_15_n489), .ZN(
        mult_b0_mult_15_n462) );
  NAND3_X1 mult_b0_mult_15_U393 ( .A1(mult_b0_mult_15_n483), .A2(
        mult_b0_mult_15_n484), .A3(mult_b0_mult_15_n485), .ZN(
        mult_b0_mult_15_n461) );
  XOR2_X1 mult_b0_mult_15_U392 ( .A(sum_a0[9]), .B(mult_b0_mult_15_n420), .Z(
        mult_b0_mult_15_n661) );
  XNOR2_X1 mult_b0_mult_15_U391 ( .A(mult_b0_mult_15_n422), .B(
        mult_b0_mult_15_n111), .ZN(mult_b0_mult_15_n460) );
  XNOR2_X1 mult_b0_mult_15_U390 ( .A(mult_b0_mult_15_n104), .B(
        mult_b0_mult_15_n460), .ZN(prod_b0_2N[9]) );
  NAND3_X1 mult_b0_mult_15_U389 ( .A1(mult_b0_mult_15_n504), .A2(
        mult_b0_mult_15_n503), .A3(mult_b0_mult_15_n505), .ZN(
        mult_b0_mult_15_n459) );
  NAND3_X1 mult_b0_mult_15_U388 ( .A1(mult_b0_mult_15_n456), .A2(
        mult_b0_mult_15_n457), .A3(mult_b0_mult_15_n458), .ZN(
        mult_b0_mult_15_n14) );
  NAND2_X1 mult_b0_mult_15_U387 ( .A1(mult_b0_mult_15_n86), .A2(
        mult_b0_mult_15_n95), .ZN(mult_b0_mult_15_n458) );
  NAND2_X1 mult_b0_mult_15_U386 ( .A1(mult_b0_mult_15_n429), .A2(
        mult_b0_mult_15_n95), .ZN(mult_b0_mult_15_n457) );
  NAND2_X1 mult_b0_mult_15_U385 ( .A1(mult_b0_mult_15_n15), .A2(
        mult_b0_mult_15_n86), .ZN(mult_b0_mult_15_n456) );
  XOR2_X1 mult_b0_mult_15_U384 ( .A(mult_b0_mult_15_n15), .B(
        mult_b0_mult_15_n455), .Z(prod_b0_2N[11]) );
  XOR2_X1 mult_b0_mult_15_U383 ( .A(mult_b0_mult_15_n86), .B(
        mult_b0_mult_15_n95), .Z(mult_b0_mult_15_n455) );
  NAND3_X1 mult_b0_mult_15_U382 ( .A1(mult_b0_mult_15_n452), .A2(
        mult_b0_mult_15_n453), .A3(mult_b0_mult_15_n454), .ZN(
        mult_b0_mult_15_n5) );
  NAND2_X1 mult_b0_mult_15_U381 ( .A1(mult_b0_mult_15_n28), .A2(
        mult_b0_mult_15_n29), .ZN(mult_b0_mult_15_n454) );
  NAND2_X1 mult_b0_mult_15_U380 ( .A1(mult_b0_mult_15_n6), .A2(
        mult_b0_mult_15_n29), .ZN(mult_b0_mult_15_n453) );
  NAND2_X1 mult_b0_mult_15_U379 ( .A1(mult_b0_mult_15_n6), .A2(
        mult_b0_mult_15_n28), .ZN(mult_b0_mult_15_n452) );
  NAND3_X1 mult_b0_mult_15_U378 ( .A1(mult_b0_mult_15_n456), .A2(
        mult_b0_mult_15_n457), .A3(mult_b0_mult_15_n458), .ZN(
        mult_b0_mult_15_n451) );
  XNOR2_X1 mult_b0_mult_15_U377 ( .A(mult_b0_mult_15_n6), .B(
        mult_b0_mult_15_n416), .ZN(prod_b0_2N[20]) );
  XNOR2_X1 mult_b0_mult_15_U376 ( .A(mult_b0_mult_15_n90), .B(
        mult_b0_mult_15_n97), .ZN(mult_b0_mult_15_n450) );
  XNOR2_X1 mult_b0_mult_15_U375 ( .A(mult_b0_mult_15_n450), .B(
        mult_b0_mult_15_n88), .ZN(mult_b0_mult_15_n86) );
  XOR2_X1 mult_b0_mult_15_U374 ( .A(n4), .B(sum_a0[6]), .Z(
        mult_b0_mult_15_n659) );
  BUF_X2 mult_b0_mult_15_U373 ( .A(mult_b0_mult_15_n561), .Z(
        mult_b0_mult_15_n513) );
  NAND2_X1 mult_b0_mult_15_U372 ( .A1(mult_b0_mult_15_n215), .A2(
        mult_b0_mult_15_n226), .ZN(mult_b0_mult_15_n449) );
  NAND2_X1 mult_b0_mult_15_U371 ( .A1(mult_b0_mult_15_n130), .A2(
        mult_b0_mult_15_n226), .ZN(mult_b0_mult_15_n448) );
  NAND2_X1 mult_b0_mult_15_U370 ( .A1(mult_b0_mult_15_n130), .A2(
        mult_b0_mult_15_n215), .ZN(mult_b0_mult_15_n447) );
  XOR2_X1 mult_b0_mult_15_U369 ( .A(mult_b0_mult_15_n130), .B(
        mult_b0_mult_15_n446), .Z(mult_b0_mult_15_n128) );
  XOR2_X1 mult_b0_mult_15_U368 ( .A(mult_b0_mult_15_n215), .B(
        mult_b0_mult_15_n226), .Z(mult_b0_mult_15_n446) );
  XNOR2_X2 mult_b0_mult_15_U367 ( .A(sum_a0[6]), .B(n3), .ZN(
        mult_b0_mult_15_n580) );
  NAND3_X1 mult_b0_mult_15_U366 ( .A1(mult_b0_mult_15_n443), .A2(
        mult_b0_mult_15_n444), .A3(mult_b0_mult_15_n445), .ZN(
        mult_b0_mult_15_n77) );
  NAND2_X1 mult_b0_mult_15_U365 ( .A1(mult_b0_mult_15_n91), .A2(
        mult_b0_mult_15_n428), .ZN(mult_b0_mult_15_n445) );
  NAND2_X1 mult_b0_mult_15_U364 ( .A1(mult_b0_mult_15_n82), .A2(
        mult_b0_mult_15_n428), .ZN(mult_b0_mult_15_n444) );
  NAND2_X1 mult_b0_mult_15_U363 ( .A1(mult_b0_mult_15_n82), .A2(
        mult_b0_mult_15_n91), .ZN(mult_b0_mult_15_n443) );
  XOR2_X1 mult_b0_mult_15_U362 ( .A(mult_b0_mult_15_n82), .B(
        mult_b0_mult_15_n91), .Z(mult_b0_mult_15_n442) );
  NAND3_X1 mult_b0_mult_15_U361 ( .A1(mult_b0_mult_15_n439), .A2(
        mult_b0_mult_15_n440), .A3(mult_b0_mult_15_n441), .ZN(
        mult_b0_mult_15_n89) );
  NAND2_X1 mult_b0_mult_15_U360 ( .A1(mult_b0_mult_15_n209), .A2(
        mult_b0_mult_15_n94), .ZN(mult_b0_mult_15_n441) );
  NAND2_X1 mult_b0_mult_15_U359 ( .A1(mult_b0_mult_15_n189), .A2(
        mult_b0_mult_15_n94), .ZN(mult_b0_mult_15_n440) );
  NAND2_X1 mult_b0_mult_15_U358 ( .A1(mult_b0_mult_15_n189), .A2(
        mult_b0_mult_15_n209), .ZN(mult_b0_mult_15_n439) );
  INV_X2 mult_b0_mult_15_U357 ( .A(mult_b0_mult_15_n437), .ZN(
        mult_b0_mult_15_n438) );
  INV_X1 mult_b0_mult_15_U356 ( .A(sum_a0[9]), .ZN(mult_b0_mult_15_n437) );
  NAND3_X1 mult_b0_mult_15_U355 ( .A1(mult_b0_mult_15_n434), .A2(
        mult_b0_mult_15_n435), .A3(mult_b0_mult_15_n436), .ZN(
        mult_b0_mult_15_n17) );
  OR2_X1 mult_b0_mult_15_U354 ( .A1(mult_b0_mult_15_n537), .A2(
        mult_b0_mult_15_n536), .ZN(mult_b0_mult_15_n436) );
  OR2_X1 mult_b0_mult_15_U353 ( .A1(mult_b0_mult_15_n636), .A2(
        mult_b0_mult_15_n537), .ZN(mult_b0_mult_15_n435) );
  OR2_X1 mult_b0_mult_15_U352 ( .A1(mult_b0_mult_15_n636), .A2(
        mult_b0_mult_15_n536), .ZN(mult_b0_mult_15_n434) );
  NAND3_X1 mult_b0_mult_15_U351 ( .A1(mult_b0_mult_15_n496), .A2(
        mult_b0_mult_15_n497), .A3(mult_b0_mult_15_n495), .ZN(
        mult_b0_mult_15_n433) );
  NAND3_X1 mult_b0_mult_15_U350 ( .A1(mult_b0_mult_15_n496), .A2(
        mult_b0_mult_15_n497), .A3(mult_b0_mult_15_n495), .ZN(
        mult_b0_mult_15_n432) );
  NAND3_X1 mult_b0_mult_15_U349 ( .A1(mult_b0_mult_15_n527), .A2(
        mult_b0_mult_15_n528), .A3(mult_b0_mult_15_n529), .ZN(
        mult_b0_mult_15_n431) );
  NAND3_X1 mult_b0_mult_15_U348 ( .A1(mult_b0_mult_15_n527), .A2(
        mult_b0_mult_15_n528), .A3(mult_b0_mult_15_n529), .ZN(
        mult_b0_mult_15_n430) );
  NAND3_X1 mult_b0_mult_15_U347 ( .A1(mult_b0_mult_15_n516), .A2(
        mult_b0_mult_15_n517), .A3(mult_b0_mult_15_n518), .ZN(
        mult_b0_mult_15_n429) );
  CLKBUF_X1 mult_b0_mult_15_U346 ( .A(mult_b0_mult_15_n89), .Z(
        mult_b0_mult_15_n428) );
  XNOR2_X1 mult_b0_mult_15_U345 ( .A(mult_b0_mult_15_n189), .B(
        mult_b0_mult_15_n209), .ZN(mult_b0_mult_15_n427) );
  XNOR2_X1 mult_b0_mult_15_U344 ( .A(mult_b0_mult_15_n427), .B(
        mult_b0_mult_15_n94), .ZN(mult_b0_mult_15_n90) );
  NAND3_X1 mult_b0_mult_15_U343 ( .A1(mult_b0_mult_15_n424), .A2(
        mult_b0_mult_15_n425), .A3(mult_b0_mult_15_n426), .ZN(
        mult_b0_mult_15_n75) );
  NAND2_X1 mult_b0_mult_15_U342 ( .A1(mult_b0_mult_15_n80), .A2(
        mult_b0_mult_15_n87), .ZN(mult_b0_mult_15_n426) );
  NAND2_X1 mult_b0_mult_15_U341 ( .A1(mult_b0_mult_15_n78), .A2(
        mult_b0_mult_15_n87), .ZN(mult_b0_mult_15_n425) );
  NAND2_X1 mult_b0_mult_15_U340 ( .A1(mult_b0_mult_15_n78), .A2(
        mult_b0_mult_15_n80), .ZN(mult_b0_mult_15_n424) );
  INV_X1 mult_b0_mult_15_U339 ( .A(mult_b0_mult_15_n540), .ZN(
        mult_b0_mult_15_n423) );
  NAND3_X1 mult_b0_mult_15_U338 ( .A1(mult_b0_mult_15_n434), .A2(
        mult_b0_mult_15_n435), .A3(mult_b0_mult_15_n436), .ZN(
        mult_b0_mult_15_n422) );
  CLKBUF_X1 mult_b0_mult_15_U337 ( .A(mult_b0_mult_15_n90), .Z(
        mult_b0_mult_15_n421) );
  OR3_X1 mult_b0_mult_15_U336 ( .A1(mult_b0_mult_15_n414), .A2(b0[0]), .A3(
        mult_b0_mult_15_n506), .ZN(mult_b0_mult_15_n660) );
  CLKBUF_X1 mult_b0_mult_15_U335 ( .A(sum_a0[8]), .Z(mult_b0_mult_15_n420) );
  NAND2_X2 mult_b0_mult_15_U334 ( .A1(mult_b0_mult_15_n550), .A2(
        mult_b0_mult_15_n644), .ZN(mult_b0_mult_15_n574) );
  XNOR2_X1 mult_b0_mult_15_U333 ( .A(mult_b0_mult_15_n80), .B(
        mult_b0_mult_15_n87), .ZN(mult_b0_mult_15_n419) );
  XNOR2_X1 mult_b0_mult_15_U332 ( .A(mult_b0_mult_15_n78), .B(
        mult_b0_mult_15_n419), .ZN(mult_b0_mult_15_n76) );
  BUF_X1 mult_b0_mult_15_U331 ( .A(mult_b0_mult_15_n96), .Z(
        mult_b0_mult_15_n418) );
  INV_X2 mult_b0_mult_15_U330 ( .A(mult_b0_mult_15_n532), .ZN(
        mult_b0_mult_15_n490) );
  BUF_X1 mult_b0_mult_15_U329 ( .A(mult_b0_mult_15_n110), .Z(
        mult_b0_mult_15_n417) );
  XNOR2_X1 mult_b0_mult_15_U328 ( .A(mult_b0_mult_15_n28), .B(
        mult_b0_mult_15_n29), .ZN(mult_b0_mult_15_n416) );
  AND3_X1 mult_b0_mult_15_U327 ( .A1(mult_b0_mult_15_n447), .A2(
        mult_b0_mult_15_n448), .A3(mult_b0_mult_15_n449), .ZN(
        mult_b0_mult_15_n415) );
  XOR2_X1 mult_b0_mult_15_U326 ( .A(sum_a0[8]), .B(mult_b0_mult_15_n540), .Z(
        mult_b0_mult_15_n571) );
  NAND3_X1 mult_b0_mult_15_U325 ( .A1(mult_b0_mult_15_n479), .A2(
        mult_b0_mult_15_n480), .A3(mult_b0_mult_15_n481), .ZN(
        mult_b0_mult_15_n85) );
  BUF_X2 mult_b0_mult_15_U324 ( .A(mult_b0_mult_15_n570), .Z(
        mult_b0_mult_15_n511) );
  NAND3_X1 mult_b0_mult_15_U323 ( .A1(mult_b0_mult_15_n521), .A2(
        mult_b0_mult_15_n522), .A3(mult_b0_mult_15_n520), .ZN(
        mult_b0_mult_15_n11) );
  XOR2_X1 mult_b0_mult_15_U322 ( .A(mult_b0_mult_15_n442), .B(
        mult_b0_mult_15_n89), .Z(mult_b0_mult_15_n78) );
  BUF_X1 mult_b0_mult_15_U321 ( .A(mult_b0_mult_15_n561), .Z(
        mult_b0_mult_15_n514) );
  BUF_X1 mult_b0_mult_15_U320 ( .A(mult_b0_mult_15_n566), .Z(
        mult_b0_mult_15_n463) );
  BUF_X2 mult_b0_mult_15_U319 ( .A(mult_b0_mult_15_n571), .Z(
        mult_b0_mult_15_n414) );
  NOR2_X2 mult_b0_mult_15_U318 ( .A1(mult_b0_mult_15_n514), .A2(
        mult_b0_mult_15_n554), .ZN(mult_b0_mult_15_n170) );
  CLKBUF_X3 mult_b0_mult_15_U317 ( .A(mult_b0_mult_15_n560), .Z(
        mult_b0_mult_15_n512) );
  HA_X1 mult_b0_mult_15_U81 ( .A(mult_b0_mult_15_n217), .B(
        mult_b0_mult_15_n228), .CO(mult_b0_mult_15_n133), .S(
        mult_b0_mult_15_n134) );
  FA_X1 mult_b0_mult_15_U80 ( .A(mult_b0_mult_15_n227), .B(
        mult_b0_mult_15_n206), .CI(mult_b0_mult_15_n216), .CO(
        mult_b0_mult_15_n131), .S(mult_b0_mult_15_n132) );
  HA_X1 mult_b0_mult_15_U79 ( .A(mult_b0_mult_15_n205), .B(
        mult_b0_mult_15_n156), .CO(mult_b0_mult_15_n129), .S(
        mult_b0_mult_15_n130) );
  FA_X1 mult_b0_mult_15_U77 ( .A(mult_b0_mult_15_n225), .B(
        mult_b0_mult_15_n194), .CI(mult_b0_mult_15_n214), .CO(
        mult_b0_mult_15_n125), .S(mult_b0_mult_15_n126) );
  FA_X1 mult_b0_mult_15_U76 ( .A(mult_b0_mult_15_n129), .B(
        mult_b0_mult_15_n204), .CI(mult_b0_mult_15_n126), .CO(
        mult_b0_mult_15_n123), .S(mult_b0_mult_15_n124) );
  HA_X1 mult_b0_mult_15_U75 ( .A(mult_b0_mult_15_n155), .B(
        mult_b0_mult_15_n193), .CO(mult_b0_mult_15_n121), .S(
        mult_b0_mult_15_n122) );
  FA_X1 mult_b0_mult_15_U74 ( .A(mult_b0_mult_15_n203), .B(
        mult_b0_mult_15_n224), .CI(mult_b0_mult_15_n213), .CO(
        mult_b0_mult_15_n119), .S(mult_b0_mult_15_n120) );
  FA_X1 mult_b0_mult_15_U73 ( .A(mult_b0_mult_15_n125), .B(
        mult_b0_mult_15_n122), .CI(mult_b0_mult_15_n120), .CO(
        mult_b0_mult_15_n117), .S(mult_b0_mult_15_n118) );
  FA_X1 mult_b0_mult_15_U72 ( .A(mult_b0_mult_15_n202), .B(
        mult_b0_mult_15_n182), .CI(mult_b0_mult_15_n223), .CO(
        mult_b0_mult_15_n115), .S(mult_b0_mult_15_n116) );
  FA_X1 mult_b0_mult_15_U71 ( .A(mult_b0_mult_15_n192), .B(
        mult_b0_mult_15_n212), .CI(mult_b0_mult_15_n121), .CO(
        mult_b0_mult_15_n113), .S(mult_b0_mult_15_n114) );
  FA_X1 mult_b0_mult_15_U70 ( .A(mult_b0_mult_15_n116), .B(
        mult_b0_mult_15_n119), .CI(mult_b0_mult_15_n114), .CO(
        mult_b0_mult_15_n111), .S(mult_b0_mult_15_n112) );
  HA_X1 mult_b0_mult_15_U69 ( .A(mult_b0_mult_15_n181), .B(
        mult_b0_mult_15_n154), .CO(mult_b0_mult_15_n109), .S(
        mult_b0_mult_15_n110) );
  FA_X1 mult_b0_mult_15_U68 ( .A(mult_b0_mult_15_n191), .B(
        mult_b0_mult_15_n201), .CI(mult_b0_mult_15_n211), .CO(
        mult_b0_mult_15_n107), .S(mult_b0_mult_15_n108) );
  FA_X1 mult_b0_mult_15_U66 ( .A(mult_b0_mult_15_n108), .B(
        mult_b0_mult_15_n113), .CI(mult_b0_mult_15_n106), .CO(
        mult_b0_mult_15_n103), .S(mult_b0_mult_15_n104) );
  FA_X1 mult_b0_mult_15_U64 ( .A(mult_b0_mult_15_n180), .B(
        mult_b0_mult_15_n210), .CI(mult_b0_mult_15_n200), .CO(
        mult_b0_mult_15_n99), .S(mult_b0_mult_15_n100) );
  FA_X1 mult_b0_mult_15_U62 ( .A(mult_b0_mult_15_n105), .B(
        mult_b0_mult_15_n100), .CI(mult_b0_mult_15_n98), .CO(
        mult_b0_mult_15_n95), .S(mult_b0_mult_15_n96) );
  HA_X1 mult_b0_mult_15_U61 ( .A(mult_b0_mult_15_n169), .B(
        mult_b0_mult_15_n153), .CO(mult_b0_mult_15_n93), .S(
        mult_b0_mult_15_n94) );
  FA_X1 mult_b0_mult_15_U60 ( .A(mult_b0_mult_15_n179), .B(
        mult_b0_mult_15_n199), .CI(mult_b0_mult_15_n220), .CO(
        mult_b0_mult_15_n91), .S(mult_b0_mult_15_n92) );
  FA_X1 mult_b0_mult_15_U58 ( .A(mult_b0_mult_15_n99), .B(mult_b0_mult_15_n101), .CI(mult_b0_mult_15_n92), .CO(mult_b0_mult_15_n87), .S(mult_b0_mult_15_n88)
         );
  FA_X1 mult_b0_mult_15_U54 ( .A(mult_b0_mult_15_n208), .B(
        mult_b0_mult_15_n188), .CI(mult_b0_mult_15_n551), .CO(
        mult_b0_mult_15_n81), .S(mult_b0_mult_15_n82) );
  FA_X1 mult_b0_mult_15_U53 ( .A(mult_b0_mult_15_n93), .B(mult_b0_mult_15_n168), .CI(mult_b0_mult_15_n84), .CO(mult_b0_mult_15_n79), .S(mult_b0_mult_15_n80)
         );
  FA_X1 mult_b0_mult_15_U49 ( .A(mult_b0_mult_15_n197), .B(
        mult_b0_mult_15_n177), .CI(mult_b0_mult_15_n167), .CO(
        mult_b0_mult_15_n71), .S(mult_b0_mult_15_n72) );
  FA_X1 mult_b0_mult_15_U48 ( .A(mult_b0_mult_15_n547), .B(
        mult_b0_mult_15_n187), .CI(mult_b0_mult_15_n83), .CO(
        mult_b0_mult_15_n69), .S(mult_b0_mult_15_n70) );
  FA_X1 mult_b0_mult_15_U47 ( .A(mult_b0_mult_15_n72), .B(mult_b0_mult_15_n81), 
        .CI(mult_b0_mult_15_n79), .CO(mult_b0_mult_15_n67), .S(
        mult_b0_mult_15_n68) );
  FA_X1 mult_b0_mult_15_U46 ( .A(mult_b0_mult_15_n77), .B(mult_b0_mult_15_n70), 
        .CI(mult_b0_mult_15_n68), .CO(mult_b0_mult_15_n65), .S(
        mult_b0_mult_15_n66) );
  FA_X1 mult_b0_mult_15_U45 ( .A(mult_b0_mult_15_n196), .B(
        mult_b0_mult_15_n166), .CI(mult_b0_mult_15_n548), .CO(
        mult_b0_mult_15_n63), .S(mult_b0_mult_15_n64) );
  FA_X1 mult_b0_mult_15_U44 ( .A(mult_b0_mult_15_n73), .B(mult_b0_mult_15_n186), .CI(mult_b0_mult_15_n176), .CO(mult_b0_mult_15_n61), .S(mult_b0_mult_15_n62)
         );
  FA_X1 mult_b0_mult_15_U43 ( .A(mult_b0_mult_15_n69), .B(mult_b0_mult_15_n71), 
        .CI(mult_b0_mult_15_n62), .CO(mult_b0_mult_15_n59), .S(
        mult_b0_mult_15_n60) );
  FA_X1 mult_b0_mult_15_U42 ( .A(mult_b0_mult_15_n67), .B(mult_b0_mult_15_n64), 
        .CI(mult_b0_mult_15_n60), .CO(mult_b0_mult_15_n57), .S(
        mult_b0_mult_15_n58) );
  FA_X1 mult_b0_mult_15_U40 ( .A(mult_b0_mult_15_n165), .B(
        mult_b0_mult_15_n175), .CI(mult_b0_mult_15_n185), .CO(
        mult_b0_mult_15_n53), .S(mult_b0_mult_15_n54) );
  FA_X1 mult_b0_mult_15_U39 ( .A(mult_b0_mult_15_n63), .B(mult_b0_mult_15_n542), .CI(mult_b0_mult_15_n61), .CO(mult_b0_mult_15_n51), .S(mult_b0_mult_15_n52)
         );
  FA_X1 mult_b0_mult_15_U38 ( .A(mult_b0_mult_15_n52), .B(mult_b0_mult_15_n54), 
        .CI(mult_b0_mult_15_n59), .CO(mult_b0_mult_15_n49), .S(
        mult_b0_mult_15_n50) );
  FA_X1 mult_b0_mult_15_U37 ( .A(mult_b0_mult_15_n174), .B(
        mult_b0_mult_15_n164), .CI(mult_b0_mult_15_n543), .CO(
        mult_b0_mult_15_n47), .S(mult_b0_mult_15_n48) );
  FA_X1 mult_b0_mult_15_U36 ( .A(mult_b0_mult_15_n55), .B(mult_b0_mult_15_n184), .CI(mult_b0_mult_15_n53), .CO(mult_b0_mult_15_n45), .S(mult_b0_mult_15_n46)
         );
  FA_X1 mult_b0_mult_15_U35 ( .A(mult_b0_mult_15_n51), .B(mult_b0_mult_15_n48), 
        .CI(mult_b0_mult_15_n46), .CO(mult_b0_mult_15_n43), .S(
        mult_b0_mult_15_n44) );
  FA_X1 mult_b0_mult_15_U33 ( .A(mult_b0_mult_15_n163), .B(
        mult_b0_mult_15_n173), .CI(mult_b0_mult_15_n538), .CO(
        mult_b0_mult_15_n39), .S(mult_b0_mult_15_n40) );
  FA_X1 mult_b0_mult_15_U32 ( .A(mult_b0_mult_15_n40), .B(mult_b0_mult_15_n47), 
        .CI(mult_b0_mult_15_n45), .CO(mult_b0_mult_15_n37), .S(
        mult_b0_mult_15_n38) );
  FA_X1 mult_b0_mult_15_U31 ( .A(mult_b0_mult_15_n172), .B(mult_b0_mult_15_n41), .CI(mult_b0_mult_15_n539), .CO(mult_b0_mult_15_n35), .S(mult_b0_mult_15_n36)
         );
  FA_X1 mult_b0_mult_15_U30 ( .A(mult_b0_mult_15_n39), .B(mult_b0_mult_15_n162), .CI(mult_b0_mult_15_n36), .CO(mult_b0_mult_15_n33), .S(mult_b0_mult_15_n34)
         );
  FA_X1 mult_b0_mult_15_U28 ( .A(mult_b0_mult_15_n533), .B(
        mult_b0_mult_15_n161), .CI(mult_b0_mult_15_n35), .CO(
        mult_b0_mult_15_n29), .S(mult_b0_mult_15_n30) );
  FA_X1 mult_b0_mult_15_U27 ( .A(mult_b0_mult_15_n160), .B(mult_b0_mult_15_n31), .CI(mult_b0_mult_15_n534), .CO(mult_b0_mult_15_n27), .S(mult_b0_mult_15_n28)
         );
  XNOR2_X1 mult_b1_mult_15_U530 ( .A(mult_b1_mult_15_n419), .B(reg_out[10]), 
        .ZN(mult_b1_mult_15_n553) );
  NAND2_X1 mult_b1_mult_15_U529 ( .A1(mult_b1_mult_15_n448), .A2(
        mult_b1_mult_15_n553), .ZN(mult_b1_mult_15_n447) );
  OR3_X1 mult_b1_mult_15_U528 ( .A1(mult_b1_mult_15_n448), .A2(b1[0]), .A3(
        mult_b1_mult_15_n419), .ZN(mult_b1_mult_15_n552) );
  OAI21_X1 mult_b1_mult_15_U527 ( .B1(mult_b1_mult_15_n419), .B2(
        mult_b1_mult_15_n447), .A(mult_b1_mult_15_n552), .ZN(
        mult_b1_mult_15_n153) );
  XNOR2_X1 mult_b1_mult_15_U526 ( .A(mult_b1_mult_15_n418), .B(reg_out[8]), 
        .ZN(mult_b1_mult_15_n551) );
  NAND2_X1 mult_b1_mult_15_U525 ( .A1(mult_b1_mult_15_n458), .A2(
        mult_b1_mult_15_n551), .ZN(mult_b1_mult_15_n457) );
  OR3_X1 mult_b1_mult_15_U524 ( .A1(mult_b1_mult_15_n458), .A2(b1[0]), .A3(
        mult_b1_mult_15_n418), .ZN(mult_b1_mult_15_n550) );
  OAI21_X1 mult_b1_mult_15_U523 ( .B1(mult_b1_mult_15_n418), .B2(
        mult_b1_mult_15_n457), .A(mult_b1_mult_15_n550), .ZN(
        mult_b1_mult_15_n154) );
  XNOR2_X1 mult_b1_mult_15_U522 ( .A(mult_b1_mult_15_n417), .B(reg_out[6]), 
        .ZN(mult_b1_mult_15_n549) );
  NAND2_X1 mult_b1_mult_15_U521 ( .A1(mult_b1_mult_15_n467), .A2(
        mult_b1_mult_15_n549), .ZN(mult_b1_mult_15_n466) );
  OR3_X1 mult_b1_mult_15_U520 ( .A1(mult_b1_mult_15_n467), .A2(b1[0]), .A3(
        mult_b1_mult_15_n417), .ZN(mult_b1_mult_15_n548) );
  OAI21_X1 mult_b1_mult_15_U519 ( .B1(mult_b1_mult_15_n417), .B2(
        mult_b1_mult_15_n466), .A(mult_b1_mult_15_n548), .ZN(
        mult_b1_mult_15_n155) );
  XNOR2_X1 mult_b1_mult_15_U518 ( .A(mult_b1_mult_15_n416), .B(reg_out[4]), 
        .ZN(mult_b1_mult_15_n547) );
  NAND2_X1 mult_b1_mult_15_U517 ( .A1(mult_b1_mult_15_n454), .A2(
        mult_b1_mult_15_n547), .ZN(mult_b1_mult_15_n453) );
  OR3_X1 mult_b1_mult_15_U516 ( .A1(mult_b1_mult_15_n454), .A2(b1[0]), .A3(
        mult_b1_mult_15_n416), .ZN(mult_b1_mult_15_n546) );
  OAI21_X1 mult_b1_mult_15_U515 ( .B1(mult_b1_mult_15_n416), .B2(
        mult_b1_mult_15_n453), .A(mult_b1_mult_15_n546), .ZN(
        mult_b1_mult_15_n156) );
  XNOR2_X1 mult_b1_mult_15_U514 ( .A(b1[9]), .B(reg_out[11]), .ZN(
        mult_b1_mult_15_n545) );
  XNOR2_X1 mult_b1_mult_15_U513 ( .A(b1[9]), .B(reg_out[11]), .ZN(
        mult_b1_mult_15_n446) );
  OAI22_X1 mult_b1_mult_15_U512 ( .A1(mult_b1_mult_15_n545), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n446), .ZN(mult_b1_mult_15_n160) );
  XNOR2_X1 mult_b1_mult_15_U511 ( .A(b1[8]), .B(reg_out[11]), .ZN(
        mult_b1_mult_15_n544) );
  OAI22_X1 mult_b1_mult_15_U510 ( .A1(mult_b1_mult_15_n544), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n545), .ZN(mult_b1_mult_15_n161) );
  XNOR2_X1 mult_b1_mult_15_U509 ( .A(b1[7]), .B(reg_out[11]), .ZN(
        mult_b1_mult_15_n543) );
  OAI22_X1 mult_b1_mult_15_U508 ( .A1(mult_b1_mult_15_n543), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n544), .ZN(mult_b1_mult_15_n162) );
  XNOR2_X1 mult_b1_mult_15_U507 ( .A(b1[6]), .B(reg_out[11]), .ZN(
        mult_b1_mult_15_n542) );
  OAI22_X1 mult_b1_mult_15_U506 ( .A1(mult_b1_mult_15_n542), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n543), .ZN(mult_b1_mult_15_n163) );
  XNOR2_X1 mult_b1_mult_15_U505 ( .A(b1[5]), .B(reg_out[11]), .ZN(
        mult_b1_mult_15_n541) );
  OAI22_X1 mult_b1_mult_15_U504 ( .A1(mult_b1_mult_15_n541), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n542), .ZN(mult_b1_mult_15_n164) );
  XNOR2_X1 mult_b1_mult_15_U503 ( .A(b1[4]), .B(reg_out[11]), .ZN(
        mult_b1_mult_15_n540) );
  OAI22_X1 mult_b1_mult_15_U502 ( .A1(mult_b1_mult_15_n540), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n541), .ZN(mult_b1_mult_15_n165) );
  XNOR2_X1 mult_b1_mult_15_U501 ( .A(b1[3]), .B(reg_out[11]), .ZN(
        mult_b1_mult_15_n539) );
  OAI22_X1 mult_b1_mult_15_U500 ( .A1(mult_b1_mult_15_n539), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n540), .ZN(mult_b1_mult_15_n166) );
  XNOR2_X1 mult_b1_mult_15_U499 ( .A(b1[2]), .B(reg_out[11]), .ZN(
        mult_b1_mult_15_n538) );
  OAI22_X1 mult_b1_mult_15_U498 ( .A1(mult_b1_mult_15_n538), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n539), .ZN(mult_b1_mult_15_n167) );
  XNOR2_X1 mult_b1_mult_15_U497 ( .A(b1[1]), .B(reg_out[11]), .ZN(
        mult_b1_mult_15_n537) );
  OAI22_X1 mult_b1_mult_15_U496 ( .A1(mult_b1_mult_15_n537), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n538), .ZN(mult_b1_mult_15_n168) );
  XNOR2_X1 mult_b1_mult_15_U495 ( .A(reg_out[11]), .B(b1[0]), .ZN(
        mult_b1_mult_15_n536) );
  OAI22_X1 mult_b1_mult_15_U494 ( .A1(mult_b1_mult_15_n536), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n537), .ZN(mult_b1_mult_15_n169) );
  XOR2_X1 mult_b1_mult_15_U493 ( .A(reg_out[2]), .B(mult_b1_mult_15_n414), .Z(
        mult_b1_mult_15_n530) );
  NAND2_X1 mult_b1_mult_15_U492 ( .A1(n5), .A2(mult_b1_mult_15_n439), .ZN(
        mult_b1_mult_15_n472) );
  XNOR2_X1 mult_b1_mult_15_U491 ( .A(b1[2]), .B(mult_b1_mult_15_n414), .ZN(
        mult_b1_mult_15_n471) );
  OAI22_X1 mult_b1_mult_15_U490 ( .A1(b1[1]), .A2(mult_b1_mult_15_n472), .B1(
        mult_b1_mult_15_n471), .B2(mult_b1_mult_15_n439), .ZN(
        mult_b1_mult_15_n535) );
  NAND2_X1 mult_b1_mult_15_U489 ( .A1(mult_b1_mult_15_n530), .A2(
        mult_b1_mult_15_n535), .ZN(mult_b1_mult_15_n533) );
  NAND3_X1 mult_b1_mult_15_U488 ( .A1(mult_b1_mult_15_n535), .A2(
        mult_b1_mult_15_n440), .A3(mult_b1_mult_15_n414), .ZN(
        mult_b1_mult_15_n534) );
  MUX2_X1 mult_b1_mult_15_U487 ( .A(mult_b1_mult_15_n533), .B(
        mult_b1_mult_15_n534), .S(mult_b1_mult_15_n441), .Z(
        mult_b1_mult_15_n532) );
  XNOR2_X1 mult_b1_mult_15_U486 ( .A(mult_b1_mult_15_n415), .B(reg_out[2]), 
        .ZN(mult_b1_mult_15_n531) );
  NAND2_X1 mult_b1_mult_15_U485 ( .A1(mult_b1_mult_15_n437), .A2(
        mult_b1_mult_15_n531), .ZN(mult_b1_mult_15_n461) );
  NAND3_X1 mult_b1_mult_15_U484 ( .A1(mult_b1_mult_15_n530), .A2(
        mult_b1_mult_15_n441), .A3(reg_out[3]), .ZN(mult_b1_mult_15_n529) );
  OAI21_X1 mult_b1_mult_15_U483 ( .B1(mult_b1_mult_15_n415), .B2(
        mult_b1_mult_15_n461), .A(mult_b1_mult_15_n529), .ZN(
        mult_b1_mult_15_n528) );
  AOI222_X1 mult_b1_mult_15_U482 ( .A1(mult_b1_mult_15_n436), .A2(
        mult_b1_mult_15_n134), .B1(mult_b1_mult_15_n528), .B2(
        mult_b1_mult_15_n436), .C1(mult_b1_mult_15_n528), .C2(
        mult_b1_mult_15_n134), .ZN(mult_b1_mult_15_n527) );
  AOI222_X1 mult_b1_mult_15_U481 ( .A1(mult_b1_mult_15_n433), .A2(
        mult_b1_mult_15_n132), .B1(mult_b1_mult_15_n433), .B2(
        mult_b1_mult_15_n133), .C1(mult_b1_mult_15_n133), .C2(
        mult_b1_mult_15_n132), .ZN(mult_b1_mult_15_n526) );
  AOI222_X1 mult_b1_mult_15_U480 ( .A1(mult_b1_mult_15_n432), .A2(
        mult_b1_mult_15_n128), .B1(mult_b1_mult_15_n432), .B2(
        mult_b1_mult_15_n131), .C1(mult_b1_mult_15_n131), .C2(
        mult_b1_mult_15_n128), .ZN(mult_b1_mult_15_n525) );
  OAI222_X1 mult_b1_mult_15_U479 ( .A1(mult_b1_mult_15_n525), .A2(
        mult_b1_mult_15_n428), .B1(mult_b1_mult_15_n525), .B2(
        mult_b1_mult_15_n429), .C1(mult_b1_mult_15_n429), .C2(
        mult_b1_mult_15_n428), .ZN(mult_b1_mult_15_n524) );
  AOI222_X1 mult_b1_mult_15_U478 ( .A1(mult_b1_mult_15_n524), .A2(
        mult_b1_mult_15_n118), .B1(mult_b1_mult_15_n524), .B2(
        mult_b1_mult_15_n123), .C1(mult_b1_mult_15_n123), .C2(
        mult_b1_mult_15_n118), .ZN(mult_b1_mult_15_n523) );
  OAI222_X1 mult_b1_mult_15_U477 ( .A1(mult_b1_mult_15_n523), .A2(
        mult_b1_mult_15_n424), .B1(mult_b1_mult_15_n523), .B2(
        mult_b1_mult_15_n425), .C1(mult_b1_mult_15_n425), .C2(
        mult_b1_mult_15_n424), .ZN(mult_b1_mult_15_n17) );
  NOR2_X1 mult_b1_mult_15_U476 ( .A1(mult_b1_mult_15_n448), .A2(
        mult_b1_mult_15_n441), .ZN(mult_b1_mult_15_n170) );
  XNOR2_X1 mult_b1_mult_15_U475 ( .A(b1[9]), .B(reg_out[9]), .ZN(
        mult_b1_mult_15_n470) );
  OAI22_X1 mult_b1_mult_15_U474 ( .A1(mult_b1_mult_15_n470), .A2(
        mult_b1_mult_15_n458), .B1(mult_b1_mult_15_n457), .B2(
        mult_b1_mult_15_n470), .ZN(mult_b1_mult_15_n522) );
  XNOR2_X1 mult_b1_mult_15_U473 ( .A(b1[9]), .B(reg_out[9]), .ZN(
        mult_b1_mult_15_n521) );
  XNOR2_X1 mult_b1_mult_15_U472 ( .A(b1[9]), .B(reg_out[9]), .ZN(
        mult_b1_mult_15_n469) );
  OAI22_X1 mult_b1_mult_15_U471 ( .A1(mult_b1_mult_15_n521), .A2(
        mult_b1_mult_15_n457), .B1(mult_b1_mult_15_n458), .B2(
        mult_b1_mult_15_n469), .ZN(mult_b1_mult_15_n172) );
  XNOR2_X1 mult_b1_mult_15_U470 ( .A(b1[8]), .B(reg_out[9]), .ZN(
        mult_b1_mult_15_n520) );
  OAI22_X1 mult_b1_mult_15_U469 ( .A1(mult_b1_mult_15_n520), .A2(
        mult_b1_mult_15_n457), .B1(mult_b1_mult_15_n458), .B2(
        mult_b1_mult_15_n521), .ZN(mult_b1_mult_15_n173) );
  XNOR2_X1 mult_b1_mult_15_U468 ( .A(b1[7]), .B(reg_out[9]), .ZN(
        mult_b1_mult_15_n519) );
  OAI22_X1 mult_b1_mult_15_U467 ( .A1(mult_b1_mult_15_n519), .A2(
        mult_b1_mult_15_n457), .B1(mult_b1_mult_15_n458), .B2(
        mult_b1_mult_15_n520), .ZN(mult_b1_mult_15_n174) );
  XNOR2_X1 mult_b1_mult_15_U466 ( .A(b1[6]), .B(reg_out[9]), .ZN(
        mult_b1_mult_15_n518) );
  OAI22_X1 mult_b1_mult_15_U465 ( .A1(mult_b1_mult_15_n518), .A2(
        mult_b1_mult_15_n457), .B1(mult_b1_mult_15_n458), .B2(
        mult_b1_mult_15_n519), .ZN(mult_b1_mult_15_n175) );
  XNOR2_X1 mult_b1_mult_15_U464 ( .A(b1[5]), .B(reg_out[9]), .ZN(
        mult_b1_mult_15_n517) );
  OAI22_X1 mult_b1_mult_15_U463 ( .A1(mult_b1_mult_15_n517), .A2(
        mult_b1_mult_15_n457), .B1(mult_b1_mult_15_n458), .B2(
        mult_b1_mult_15_n518), .ZN(mult_b1_mult_15_n176) );
  XNOR2_X1 mult_b1_mult_15_U462 ( .A(b1[4]), .B(reg_out[9]), .ZN(
        mult_b1_mult_15_n459) );
  OAI22_X1 mult_b1_mult_15_U461 ( .A1(mult_b1_mult_15_n459), .A2(
        mult_b1_mult_15_n457), .B1(mult_b1_mult_15_n458), .B2(
        mult_b1_mult_15_n517), .ZN(mult_b1_mult_15_n177) );
  XNOR2_X1 mult_b1_mult_15_U460 ( .A(b1[2]), .B(reg_out[9]), .ZN(
        mult_b1_mult_15_n516) );
  XNOR2_X1 mult_b1_mult_15_U459 ( .A(b1[3]), .B(reg_out[9]), .ZN(
        mult_b1_mult_15_n456) );
  OAI22_X1 mult_b1_mult_15_U458 ( .A1(mult_b1_mult_15_n516), .A2(
        mult_b1_mult_15_n457), .B1(mult_b1_mult_15_n458), .B2(
        mult_b1_mult_15_n456), .ZN(mult_b1_mult_15_n179) );
  XNOR2_X1 mult_b1_mult_15_U457 ( .A(b1[1]), .B(reg_out[9]), .ZN(
        mult_b1_mult_15_n515) );
  OAI22_X1 mult_b1_mult_15_U456 ( .A1(mult_b1_mult_15_n515), .A2(
        mult_b1_mult_15_n457), .B1(mult_b1_mult_15_n458), .B2(
        mult_b1_mult_15_n516), .ZN(mult_b1_mult_15_n180) );
  XNOR2_X1 mult_b1_mult_15_U455 ( .A(reg_out[9]), .B(b1[0]), .ZN(
        mult_b1_mult_15_n514) );
  OAI22_X1 mult_b1_mult_15_U454 ( .A1(mult_b1_mult_15_n514), .A2(
        mult_b1_mult_15_n457), .B1(mult_b1_mult_15_n458), .B2(
        mult_b1_mult_15_n515), .ZN(mult_b1_mult_15_n181) );
  NOR2_X1 mult_b1_mult_15_U453 ( .A1(mult_b1_mult_15_n458), .A2(
        mult_b1_mult_15_n441), .ZN(mult_b1_mult_15_n182) );
  XNOR2_X1 mult_b1_mult_15_U452 ( .A(b1[9]), .B(reg_out[7]), .ZN(
        mult_b1_mult_15_n468) );
  OAI22_X1 mult_b1_mult_15_U451 ( .A1(mult_b1_mult_15_n468), .A2(
        mult_b1_mult_15_n467), .B1(mult_b1_mult_15_n466), .B2(
        mult_b1_mult_15_n468), .ZN(mult_b1_mult_15_n513) );
  XNOR2_X1 mult_b1_mult_15_U450 ( .A(b1[9]), .B(reg_out[7]), .ZN(
        mult_b1_mult_15_n512) );
  XNOR2_X1 mult_b1_mult_15_U449 ( .A(b1[9]), .B(reg_out[7]), .ZN(
        mult_b1_mult_15_n465) );
  OAI22_X1 mult_b1_mult_15_U448 ( .A1(mult_b1_mult_15_n512), .A2(
        mult_b1_mult_15_n466), .B1(mult_b1_mult_15_n467), .B2(
        mult_b1_mult_15_n465), .ZN(mult_b1_mult_15_n184) );
  XNOR2_X1 mult_b1_mult_15_U447 ( .A(b1[8]), .B(reg_out[7]), .ZN(
        mult_b1_mult_15_n511) );
  OAI22_X1 mult_b1_mult_15_U446 ( .A1(mult_b1_mult_15_n511), .A2(
        mult_b1_mult_15_n466), .B1(mult_b1_mult_15_n467), .B2(
        mult_b1_mult_15_n512), .ZN(mult_b1_mult_15_n185) );
  XNOR2_X1 mult_b1_mult_15_U445 ( .A(b1[7]), .B(reg_out[7]), .ZN(
        mult_b1_mult_15_n510) );
  OAI22_X1 mult_b1_mult_15_U444 ( .A1(mult_b1_mult_15_n510), .A2(
        mult_b1_mult_15_n466), .B1(mult_b1_mult_15_n467), .B2(
        mult_b1_mult_15_n511), .ZN(mult_b1_mult_15_n186) );
  XNOR2_X1 mult_b1_mult_15_U443 ( .A(b1[6]), .B(reg_out[7]), .ZN(
        mult_b1_mult_15_n509) );
  OAI22_X1 mult_b1_mult_15_U442 ( .A1(mult_b1_mult_15_n509), .A2(
        mult_b1_mult_15_n466), .B1(mult_b1_mult_15_n467), .B2(
        mult_b1_mult_15_n510), .ZN(mult_b1_mult_15_n187) );
  XNOR2_X1 mult_b1_mult_15_U441 ( .A(b1[5]), .B(reg_out[7]), .ZN(
        mult_b1_mult_15_n508) );
  OAI22_X1 mult_b1_mult_15_U440 ( .A1(mult_b1_mult_15_n508), .A2(
        mult_b1_mult_15_n466), .B1(mult_b1_mult_15_n467), .B2(
        mult_b1_mult_15_n509), .ZN(mult_b1_mult_15_n188) );
  XNOR2_X1 mult_b1_mult_15_U439 ( .A(b1[4]), .B(reg_out[7]), .ZN(
        mult_b1_mult_15_n507) );
  OAI22_X1 mult_b1_mult_15_U438 ( .A1(mult_b1_mult_15_n507), .A2(
        mult_b1_mult_15_n466), .B1(mult_b1_mult_15_n467), .B2(
        mult_b1_mult_15_n508), .ZN(mult_b1_mult_15_n189) );
  XNOR2_X1 mult_b1_mult_15_U437 ( .A(b1[3]), .B(reg_out[7]), .ZN(
        mult_b1_mult_15_n506) );
  OAI22_X1 mult_b1_mult_15_U436 ( .A1(mult_b1_mult_15_n506), .A2(
        mult_b1_mult_15_n466), .B1(mult_b1_mult_15_n467), .B2(
        mult_b1_mult_15_n507), .ZN(mult_b1_mult_15_n190) );
  XNOR2_X1 mult_b1_mult_15_U435 ( .A(b1[2]), .B(reg_out[7]), .ZN(
        mult_b1_mult_15_n505) );
  OAI22_X1 mult_b1_mult_15_U434 ( .A1(mult_b1_mult_15_n505), .A2(
        mult_b1_mult_15_n466), .B1(mult_b1_mult_15_n467), .B2(
        mult_b1_mult_15_n506), .ZN(mult_b1_mult_15_n191) );
  XNOR2_X1 mult_b1_mult_15_U433 ( .A(b1[1]), .B(reg_out[7]), .ZN(
        mult_b1_mult_15_n504) );
  OAI22_X1 mult_b1_mult_15_U432 ( .A1(mult_b1_mult_15_n504), .A2(
        mult_b1_mult_15_n466), .B1(mult_b1_mult_15_n467), .B2(
        mult_b1_mult_15_n505), .ZN(mult_b1_mult_15_n192) );
  XNOR2_X1 mult_b1_mult_15_U431 ( .A(reg_out[7]), .B(b1[0]), .ZN(
        mult_b1_mult_15_n503) );
  OAI22_X1 mult_b1_mult_15_U430 ( .A1(mult_b1_mult_15_n503), .A2(
        mult_b1_mult_15_n466), .B1(mult_b1_mult_15_n467), .B2(
        mult_b1_mult_15_n504), .ZN(mult_b1_mult_15_n193) );
  NOR2_X1 mult_b1_mult_15_U429 ( .A1(mult_b1_mult_15_n467), .A2(
        mult_b1_mult_15_n441), .ZN(mult_b1_mult_15_n194) );
  XNOR2_X1 mult_b1_mult_15_U428 ( .A(b1[9]), .B(reg_out[5]), .ZN(
        mult_b1_mult_15_n464) );
  OAI22_X1 mult_b1_mult_15_U427 ( .A1(mult_b1_mult_15_n464), .A2(
        mult_b1_mult_15_n454), .B1(mult_b1_mult_15_n453), .B2(
        mult_b1_mult_15_n464), .ZN(mult_b1_mult_15_n502) );
  XNOR2_X1 mult_b1_mult_15_U426 ( .A(b1[9]), .B(reg_out[5]), .ZN(
        mult_b1_mult_15_n501) );
  XNOR2_X1 mult_b1_mult_15_U425 ( .A(b1[9]), .B(reg_out[5]), .ZN(
        mult_b1_mult_15_n463) );
  OAI22_X1 mult_b1_mult_15_U424 ( .A1(mult_b1_mult_15_n501), .A2(
        mult_b1_mult_15_n453), .B1(mult_b1_mult_15_n454), .B2(
        mult_b1_mult_15_n463), .ZN(mult_b1_mult_15_n196) );
  XNOR2_X1 mult_b1_mult_15_U423 ( .A(b1[8]), .B(reg_out[5]), .ZN(
        mult_b1_mult_15_n455) );
  OAI22_X1 mult_b1_mult_15_U422 ( .A1(mult_b1_mult_15_n455), .A2(
        mult_b1_mult_15_n453), .B1(mult_b1_mult_15_n454), .B2(
        mult_b1_mult_15_n501), .ZN(mult_b1_mult_15_n197) );
  XNOR2_X1 mult_b1_mult_15_U421 ( .A(b1[6]), .B(reg_out[5]), .ZN(
        mult_b1_mult_15_n500) );
  XNOR2_X1 mult_b1_mult_15_U420 ( .A(b1[7]), .B(reg_out[5]), .ZN(
        mult_b1_mult_15_n452) );
  OAI22_X1 mult_b1_mult_15_U419 ( .A1(mult_b1_mult_15_n500), .A2(
        mult_b1_mult_15_n453), .B1(mult_b1_mult_15_n454), .B2(
        mult_b1_mult_15_n452), .ZN(mult_b1_mult_15_n199) );
  XNOR2_X1 mult_b1_mult_15_U418 ( .A(b1[5]), .B(reg_out[5]), .ZN(
        mult_b1_mult_15_n499) );
  OAI22_X1 mult_b1_mult_15_U417 ( .A1(mult_b1_mult_15_n499), .A2(
        mult_b1_mult_15_n453), .B1(mult_b1_mult_15_n454), .B2(
        mult_b1_mult_15_n500), .ZN(mult_b1_mult_15_n200) );
  XNOR2_X1 mult_b1_mult_15_U416 ( .A(b1[4]), .B(reg_out[5]), .ZN(
        mult_b1_mult_15_n498) );
  OAI22_X1 mult_b1_mult_15_U415 ( .A1(mult_b1_mult_15_n498), .A2(
        mult_b1_mult_15_n453), .B1(mult_b1_mult_15_n454), .B2(
        mult_b1_mult_15_n499), .ZN(mult_b1_mult_15_n201) );
  XNOR2_X1 mult_b1_mult_15_U414 ( .A(b1[3]), .B(reg_out[5]), .ZN(
        mult_b1_mult_15_n497) );
  OAI22_X1 mult_b1_mult_15_U413 ( .A1(mult_b1_mult_15_n497), .A2(
        mult_b1_mult_15_n453), .B1(mult_b1_mult_15_n454), .B2(
        mult_b1_mult_15_n498), .ZN(mult_b1_mult_15_n202) );
  XNOR2_X1 mult_b1_mult_15_U412 ( .A(b1[2]), .B(reg_out[5]), .ZN(
        mult_b1_mult_15_n496) );
  OAI22_X1 mult_b1_mult_15_U411 ( .A1(mult_b1_mult_15_n496), .A2(
        mult_b1_mult_15_n453), .B1(mult_b1_mult_15_n454), .B2(
        mult_b1_mult_15_n497), .ZN(mult_b1_mult_15_n203) );
  XNOR2_X1 mult_b1_mult_15_U410 ( .A(b1[1]), .B(reg_out[5]), .ZN(
        mult_b1_mult_15_n495) );
  OAI22_X1 mult_b1_mult_15_U409 ( .A1(mult_b1_mult_15_n495), .A2(
        mult_b1_mult_15_n453), .B1(mult_b1_mult_15_n454), .B2(
        mult_b1_mult_15_n496), .ZN(mult_b1_mult_15_n204) );
  XNOR2_X1 mult_b1_mult_15_U408 ( .A(reg_out[5]), .B(b1[0]), .ZN(
        mult_b1_mult_15_n494) );
  OAI22_X1 mult_b1_mult_15_U407 ( .A1(mult_b1_mult_15_n494), .A2(
        mult_b1_mult_15_n453), .B1(mult_b1_mult_15_n454), .B2(
        mult_b1_mult_15_n495), .ZN(mult_b1_mult_15_n205) );
  NOR2_X1 mult_b1_mult_15_U406 ( .A1(mult_b1_mult_15_n454), .A2(
        mult_b1_mult_15_n441), .ZN(mult_b1_mult_15_n206) );
  XOR2_X1 mult_b1_mult_15_U405 ( .A(b1[9]), .B(mult_b1_mult_15_n415), .Z(
        mult_b1_mult_15_n462) );
  OAI22_X1 mult_b1_mult_15_U404 ( .A1(mult_b1_mult_15_n462), .A2(
        mult_b1_mult_15_n437), .B1(mult_b1_mult_15_n461), .B2(
        mult_b1_mult_15_n462), .ZN(mult_b1_mult_15_n493) );
  XNOR2_X1 mult_b1_mult_15_U403 ( .A(b1[9]), .B(reg_out[3]), .ZN(
        mult_b1_mult_15_n492) );
  XNOR2_X1 mult_b1_mult_15_U402 ( .A(b1[9]), .B(reg_out[3]), .ZN(
        mult_b1_mult_15_n460) );
  OAI22_X1 mult_b1_mult_15_U401 ( .A1(mult_b1_mult_15_n492), .A2(
        mult_b1_mult_15_n461), .B1(mult_b1_mult_15_n437), .B2(
        mult_b1_mult_15_n460), .ZN(mult_b1_mult_15_n208) );
  XNOR2_X1 mult_b1_mult_15_U400 ( .A(b1[8]), .B(reg_out[3]), .ZN(
        mult_b1_mult_15_n491) );
  OAI22_X1 mult_b1_mult_15_U399 ( .A1(mult_b1_mult_15_n491), .A2(
        mult_b1_mult_15_n461), .B1(mult_b1_mult_15_n437), .B2(
        mult_b1_mult_15_n492), .ZN(mult_b1_mult_15_n209) );
  XNOR2_X1 mult_b1_mult_15_U398 ( .A(b1[7]), .B(reg_out[3]), .ZN(
        mult_b1_mult_15_n490) );
  OAI22_X1 mult_b1_mult_15_U397 ( .A1(mult_b1_mult_15_n490), .A2(
        mult_b1_mult_15_n461), .B1(mult_b1_mult_15_n437), .B2(
        mult_b1_mult_15_n491), .ZN(mult_b1_mult_15_n210) );
  XNOR2_X1 mult_b1_mult_15_U396 ( .A(b1[6]), .B(reg_out[3]), .ZN(
        mult_b1_mult_15_n489) );
  OAI22_X1 mult_b1_mult_15_U395 ( .A1(mult_b1_mult_15_n489), .A2(
        mult_b1_mult_15_n461), .B1(mult_b1_mult_15_n437), .B2(
        mult_b1_mult_15_n490), .ZN(mult_b1_mult_15_n211) );
  XNOR2_X1 mult_b1_mult_15_U394 ( .A(b1[5]), .B(reg_out[3]), .ZN(
        mult_b1_mult_15_n488) );
  OAI22_X1 mult_b1_mult_15_U393 ( .A1(mult_b1_mult_15_n488), .A2(
        mult_b1_mult_15_n461), .B1(mult_b1_mult_15_n437), .B2(
        mult_b1_mult_15_n489), .ZN(mult_b1_mult_15_n212) );
  XNOR2_X1 mult_b1_mult_15_U392 ( .A(b1[4]), .B(reg_out[3]), .ZN(
        mult_b1_mult_15_n487) );
  OAI22_X1 mult_b1_mult_15_U391 ( .A1(mult_b1_mult_15_n487), .A2(
        mult_b1_mult_15_n461), .B1(mult_b1_mult_15_n437), .B2(
        mult_b1_mult_15_n488), .ZN(mult_b1_mult_15_n213) );
  XNOR2_X1 mult_b1_mult_15_U390 ( .A(b1[3]), .B(reg_out[3]), .ZN(
        mult_b1_mult_15_n486) );
  OAI22_X1 mult_b1_mult_15_U389 ( .A1(mult_b1_mult_15_n486), .A2(
        mult_b1_mult_15_n461), .B1(mult_b1_mult_15_n437), .B2(
        mult_b1_mult_15_n487), .ZN(mult_b1_mult_15_n214) );
  XNOR2_X1 mult_b1_mult_15_U388 ( .A(b1[2]), .B(reg_out[3]), .ZN(
        mult_b1_mult_15_n485) );
  OAI22_X1 mult_b1_mult_15_U387 ( .A1(mult_b1_mult_15_n485), .A2(
        mult_b1_mult_15_n461), .B1(mult_b1_mult_15_n437), .B2(
        mult_b1_mult_15_n486), .ZN(mult_b1_mult_15_n215) );
  XNOR2_X1 mult_b1_mult_15_U386 ( .A(b1[1]), .B(reg_out[3]), .ZN(
        mult_b1_mult_15_n484) );
  OAI22_X1 mult_b1_mult_15_U385 ( .A1(mult_b1_mult_15_n484), .A2(
        mult_b1_mult_15_n461), .B1(mult_b1_mult_15_n437), .B2(
        mult_b1_mult_15_n485), .ZN(mult_b1_mult_15_n216) );
  XNOR2_X1 mult_b1_mult_15_U384 ( .A(reg_out[3]), .B(b1[0]), .ZN(
        mult_b1_mult_15_n483) );
  OAI22_X1 mult_b1_mult_15_U383 ( .A1(mult_b1_mult_15_n483), .A2(
        mult_b1_mult_15_n461), .B1(mult_b1_mult_15_n437), .B2(
        mult_b1_mult_15_n484), .ZN(mult_b1_mult_15_n217) );
  XNOR2_X1 mult_b1_mult_15_U382 ( .A(b1[9]), .B(mult_b1_mult_15_n414), .ZN(
        mult_b1_mult_15_n481) );
  OAI22_X1 mult_b1_mult_15_U381 ( .A1(mult_b1_mult_15_n439), .A2(
        mult_b1_mult_15_n481), .B1(mult_b1_mult_15_n472), .B2(
        mult_b1_mult_15_n481), .ZN(mult_b1_mult_15_n482) );
  XNOR2_X1 mult_b1_mult_15_U380 ( .A(b1[9]), .B(mult_b1_mult_15_n414), .ZN(
        mult_b1_mult_15_n480) );
  OAI22_X1 mult_b1_mult_15_U379 ( .A1(mult_b1_mult_15_n480), .A2(
        mult_b1_mult_15_n472), .B1(mult_b1_mult_15_n481), .B2(
        mult_b1_mult_15_n439), .ZN(mult_b1_mult_15_n220) );
  XNOR2_X1 mult_b1_mult_15_U378 ( .A(b1[9]), .B(mult_b1_mult_15_n414), .ZN(
        mult_b1_mult_15_n479) );
  OAI22_X1 mult_b1_mult_15_U377 ( .A1(mult_b1_mult_15_n479), .A2(
        mult_b1_mult_15_n472), .B1(mult_b1_mult_15_n480), .B2(
        mult_b1_mult_15_n439), .ZN(mult_b1_mult_15_n221) );
  XNOR2_X1 mult_b1_mult_15_U376 ( .A(b1[8]), .B(mult_b1_mult_15_n414), .ZN(
        mult_b1_mult_15_n478) );
  OAI22_X1 mult_b1_mult_15_U375 ( .A1(mult_b1_mult_15_n478), .A2(
        mult_b1_mult_15_n472), .B1(mult_b1_mult_15_n479), .B2(
        mult_b1_mult_15_n439), .ZN(mult_b1_mult_15_n222) );
  XNOR2_X1 mult_b1_mult_15_U374 ( .A(b1[7]), .B(mult_b1_mult_15_n414), .ZN(
        mult_b1_mult_15_n477) );
  OAI22_X1 mult_b1_mult_15_U373 ( .A1(mult_b1_mult_15_n477), .A2(
        mult_b1_mult_15_n472), .B1(mult_b1_mult_15_n478), .B2(
        mult_b1_mult_15_n439), .ZN(mult_b1_mult_15_n223) );
  XNOR2_X1 mult_b1_mult_15_U372 ( .A(b1[6]), .B(mult_b1_mult_15_n414), .ZN(
        mult_b1_mult_15_n476) );
  OAI22_X1 mult_b1_mult_15_U371 ( .A1(mult_b1_mult_15_n476), .A2(
        mult_b1_mult_15_n472), .B1(mult_b1_mult_15_n477), .B2(
        mult_b1_mult_15_n439), .ZN(mult_b1_mult_15_n224) );
  XNOR2_X1 mult_b1_mult_15_U370 ( .A(b1[5]), .B(mult_b1_mult_15_n414), .ZN(
        mult_b1_mult_15_n475) );
  OAI22_X1 mult_b1_mult_15_U369 ( .A1(mult_b1_mult_15_n475), .A2(
        mult_b1_mult_15_n472), .B1(mult_b1_mult_15_n476), .B2(
        mult_b1_mult_15_n439), .ZN(mult_b1_mult_15_n225) );
  XNOR2_X1 mult_b1_mult_15_U368 ( .A(b1[4]), .B(mult_b1_mult_15_n414), .ZN(
        mult_b1_mult_15_n474) );
  OAI22_X1 mult_b1_mult_15_U367 ( .A1(mult_b1_mult_15_n474), .A2(
        mult_b1_mult_15_n472), .B1(mult_b1_mult_15_n475), .B2(
        mult_b1_mult_15_n439), .ZN(mult_b1_mult_15_n226) );
  XNOR2_X1 mult_b1_mult_15_U366 ( .A(b1[3]), .B(mult_b1_mult_15_n414), .ZN(
        mult_b1_mult_15_n473) );
  OAI22_X1 mult_b1_mult_15_U365 ( .A1(mult_b1_mult_15_n473), .A2(
        mult_b1_mult_15_n472), .B1(mult_b1_mult_15_n474), .B2(
        mult_b1_mult_15_n439), .ZN(mult_b1_mult_15_n227) );
  OAI22_X1 mult_b1_mult_15_U364 ( .A1(mult_b1_mult_15_n471), .A2(
        mult_b1_mult_15_n472), .B1(mult_b1_mult_15_n473), .B2(
        mult_b1_mult_15_n439), .ZN(mult_b1_mult_15_n228) );
  OAI22_X1 mult_b1_mult_15_U363 ( .A1(mult_b1_mult_15_n469), .A2(
        mult_b1_mult_15_n457), .B1(mult_b1_mult_15_n458), .B2(
        mult_b1_mult_15_n470), .ZN(mult_b1_mult_15_n31) );
  OAI22_X1 mult_b1_mult_15_U362 ( .A1(mult_b1_mult_15_n465), .A2(
        mult_b1_mult_15_n466), .B1(mult_b1_mult_15_n467), .B2(
        mult_b1_mult_15_n468), .ZN(mult_b1_mult_15_n41) );
  OAI22_X1 mult_b1_mult_15_U361 ( .A1(mult_b1_mult_15_n463), .A2(
        mult_b1_mult_15_n453), .B1(mult_b1_mult_15_n454), .B2(
        mult_b1_mult_15_n464), .ZN(mult_b1_mult_15_n55) );
  OAI22_X1 mult_b1_mult_15_U360 ( .A1(mult_b1_mult_15_n460), .A2(
        mult_b1_mult_15_n461), .B1(mult_b1_mult_15_n437), .B2(
        mult_b1_mult_15_n462), .ZN(mult_b1_mult_15_n73) );
  OAI22_X1 mult_b1_mult_15_U359 ( .A1(mult_b1_mult_15_n456), .A2(
        mult_b1_mult_15_n457), .B1(mult_b1_mult_15_n458), .B2(
        mult_b1_mult_15_n459), .ZN(mult_b1_mult_15_n450) );
  OAI22_X1 mult_b1_mult_15_U358 ( .A1(mult_b1_mult_15_n452), .A2(
        mult_b1_mult_15_n453), .B1(mult_b1_mult_15_n454), .B2(
        mult_b1_mult_15_n455), .ZN(mult_b1_mult_15_n451) );
  OR2_X1 mult_b1_mult_15_U357 ( .A1(mult_b1_mult_15_n450), .A2(
        mult_b1_mult_15_n451), .ZN(mult_b1_mult_15_n83) );
  XNOR2_X1 mult_b1_mult_15_U356 ( .A(mult_b1_mult_15_n450), .B(
        mult_b1_mult_15_n451), .ZN(mult_b1_mult_15_n84) );
  NOR2_X1 mult_b1_mult_15_U355 ( .A1(mult_b1_mult_15_n439), .A2(
        mult_b1_mult_15_n441), .ZN(mult_b1_R_0_) );
  XNOR2_X1 mult_b1_mult_15_U354 ( .A(b1[9]), .B(reg_out[11]), .ZN(
        mult_b1_mult_15_n449) );
  OAI22_X1 mult_b1_mult_15_U353 ( .A1(mult_b1_mult_15_n449), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n449), .ZN(mult_b1_mult_15_n445) );
  OAI22_X1 mult_b1_mult_15_U352 ( .A1(mult_b1_mult_15_n446), .A2(
        mult_b1_mult_15_n447), .B1(mult_b1_mult_15_n448), .B2(
        mult_b1_mult_15_n449), .ZN(mult_b1_mult_15_n442) );
  AOI222_X1 mult_b1_mult_15_U351 ( .A1(mult_b1_mult_15_n5), .A2(
        mult_b1_mult_15_n27), .B1(mult_b1_mult_15_n421), .B2(
        mult_b1_mult_15_n5), .C1(mult_b1_mult_15_n421), .C2(
        mult_b1_mult_15_n27), .ZN(mult_b1_mult_15_n444) );
  OAI22_X1 mult_b1_mult_15_U350 ( .A1(mult_b1_mult_15_n444), .A2(
        mult_b1_mult_15_n445), .B1(mult_b1_mult_15_n421), .B2(
        mult_b1_mult_15_n444), .ZN(mult_b1_mult_15_n443) );
  AOI21_X1 mult_b1_mult_15_U349 ( .B1(mult_b1_mult_15_n420), .B2(
        mult_b1_mult_15_n442), .A(mult_b1_mult_15_n443), .ZN(mult_b1_R_23_) );
  INV_X1 mult_b1_mult_15_U348 ( .A(reg_out[3]), .ZN(mult_b1_mult_15_n415) );
  XOR2_X2 mult_b1_mult_15_U347 ( .A(reg_out[10]), .B(mult_b1_mult_15_n418), 
        .Z(mult_b1_mult_15_n448) );
  XOR2_X2 mult_b1_mult_15_U346 ( .A(reg_out[8]), .B(mult_b1_mult_15_n417), .Z(
        mult_b1_mult_15_n458) );
  XOR2_X2 mult_b1_mult_15_U345 ( .A(reg_out[6]), .B(mult_b1_mult_15_n416), .Z(
        mult_b1_mult_15_n467) );
  XOR2_X2 mult_b1_mult_15_U344 ( .A(reg_out[4]), .B(mult_b1_mult_15_n415), .Z(
        mult_b1_mult_15_n454) );
  INV_X1 mult_b1_mult_15_U343 ( .A(b1[1]), .ZN(mult_b1_mult_15_n440) );
  INV_X1 mult_b1_mult_15_U342 ( .A(reg_out[11]), .ZN(mult_b1_mult_15_n419) );
  INV_X1 mult_b1_mult_15_U341 ( .A(reg_out[9]), .ZN(mult_b1_mult_15_n418) );
  INV_X1 mult_b1_mult_15_U340 ( .A(reg_out[7]), .ZN(mult_b1_mult_15_n417) );
  INV_X1 mult_b1_mult_15_U339 ( .A(reg_out[5]), .ZN(mult_b1_mult_15_n416) );
  INV_X1 mult_b1_mult_15_U338 ( .A(b1[0]), .ZN(mult_b1_mult_15_n441) );
  INV_X1 mult_b1_mult_15_U337 ( .A(reg_out[0]), .ZN(mult_b1_mult_15_n439) );
  INV_X1 mult_b1_mult_15_U336 ( .A(mult_b1_mult_15_n513), .ZN(
        mult_b1_mult_15_n427) );
  INV_X1 mult_b1_mult_15_U335 ( .A(mult_b1_mult_15_n522), .ZN(
        mult_b1_mult_15_n423) );
  INV_X1 mult_b1_mult_15_U334 ( .A(mult_b1_mult_15_n502), .ZN(
        mult_b1_mult_15_n431) );
  INV_X1 mult_b1_mult_15_U333 ( .A(mult_b1_mult_15_n31), .ZN(
        mult_b1_mult_15_n422) );
  INV_X1 mult_b1_mult_15_U332 ( .A(mult_b1_mult_15_n41), .ZN(
        mult_b1_mult_15_n426) );
  INV_X1 mult_b1_mult_15_U331 ( .A(mult_b1_mult_15_n532), .ZN(
        mult_b1_mult_15_n436) );
  INV_X1 mult_b1_mult_15_U330 ( .A(mult_b1_mult_15_n527), .ZN(
        mult_b1_mult_15_n433) );
  INV_X1 mult_b1_mult_15_U329 ( .A(mult_b1_mult_15_n493), .ZN(
        mult_b1_mult_15_n435) );
  INV_X1 mult_b1_mult_15_U328 ( .A(mult_b1_mult_15_n73), .ZN(
        mult_b1_mult_15_n434) );
  INV_X1 mult_b1_mult_15_U327 ( .A(mult_b1_mult_15_n482), .ZN(
        mult_b1_mult_15_n438) );
  BUF_X1 mult_b1_mult_15_U326 ( .A(n5), .Z(mult_b1_mult_15_n414) );
  INV_X1 mult_b1_mult_15_U325 ( .A(mult_b1_mult_15_n530), .ZN(
        mult_b1_mult_15_n437) );
  INV_X1 mult_b1_mult_15_U324 ( .A(mult_b1_mult_15_n526), .ZN(
        mult_b1_mult_15_n432) );
  INV_X1 mult_b1_mult_15_U323 ( .A(mult_b1_mult_15_n445), .ZN(
        mult_b1_mult_15_n420) );
  INV_X1 mult_b1_mult_15_U322 ( .A(mult_b1_mult_15_n442), .ZN(
        mult_b1_mult_15_n421) );
  INV_X1 mult_b1_mult_15_U321 ( .A(mult_b1_mult_15_n112), .ZN(
        mult_b1_mult_15_n424) );
  INV_X1 mult_b1_mult_15_U320 ( .A(mult_b1_mult_15_n117), .ZN(
        mult_b1_mult_15_n425) );
  INV_X1 mult_b1_mult_15_U319 ( .A(mult_b1_mult_15_n55), .ZN(
        mult_b1_mult_15_n430) );
  INV_X1 mult_b1_mult_15_U318 ( .A(mult_b1_mult_15_n124), .ZN(
        mult_b1_mult_15_n428) );
  INV_X1 mult_b1_mult_15_U317 ( .A(mult_b1_mult_15_n127), .ZN(
        mult_b1_mult_15_n429) );
  HA_X1 mult_b1_mult_15_U81 ( .A(mult_b1_mult_15_n217), .B(
        mult_b1_mult_15_n228), .CO(mult_b1_mult_15_n133), .S(
        mult_b1_mult_15_n134) );
  FA_X1 mult_b1_mult_15_U80 ( .A(mult_b1_mult_15_n227), .B(
        mult_b1_mult_15_n206), .CI(mult_b1_mult_15_n216), .CO(
        mult_b1_mult_15_n131), .S(mult_b1_mult_15_n132) );
  HA_X1 mult_b1_mult_15_U79 ( .A(mult_b1_mult_15_n156), .B(
        mult_b1_mult_15_n205), .CO(mult_b1_mult_15_n129), .S(
        mult_b1_mult_15_n130) );
  FA_X1 mult_b1_mult_15_U78 ( .A(mult_b1_mult_15_n215), .B(
        mult_b1_mult_15_n226), .CI(mult_b1_mult_15_n130), .CO(
        mult_b1_mult_15_n127), .S(mult_b1_mult_15_n128) );
  FA_X1 mult_b1_mult_15_U77 ( .A(mult_b1_mult_15_n225), .B(
        mult_b1_mult_15_n194), .CI(mult_b1_mult_15_n214), .CO(
        mult_b1_mult_15_n125), .S(mult_b1_mult_15_n126) );
  FA_X1 mult_b1_mult_15_U76 ( .A(mult_b1_mult_15_n129), .B(
        mult_b1_mult_15_n204), .CI(mult_b1_mult_15_n126), .CO(
        mult_b1_mult_15_n123), .S(mult_b1_mult_15_n124) );
  HA_X1 mult_b1_mult_15_U75 ( .A(mult_b1_mult_15_n155), .B(
        mult_b1_mult_15_n193), .CO(mult_b1_mult_15_n121), .S(
        mult_b1_mult_15_n122) );
  FA_X1 mult_b1_mult_15_U74 ( .A(mult_b1_mult_15_n203), .B(
        mult_b1_mult_15_n224), .CI(mult_b1_mult_15_n213), .CO(
        mult_b1_mult_15_n119), .S(mult_b1_mult_15_n120) );
  FA_X1 mult_b1_mult_15_U73 ( .A(mult_b1_mult_15_n125), .B(
        mult_b1_mult_15_n122), .CI(mult_b1_mult_15_n120), .CO(
        mult_b1_mult_15_n117), .S(mult_b1_mult_15_n118) );
  FA_X1 mult_b1_mult_15_U72 ( .A(mult_b1_mult_15_n202), .B(
        mult_b1_mult_15_n182), .CI(mult_b1_mult_15_n223), .CO(
        mult_b1_mult_15_n115), .S(mult_b1_mult_15_n116) );
  FA_X1 mult_b1_mult_15_U71 ( .A(mult_b1_mult_15_n192), .B(
        mult_b1_mult_15_n212), .CI(mult_b1_mult_15_n121), .CO(
        mult_b1_mult_15_n113), .S(mult_b1_mult_15_n114) );
  FA_X1 mult_b1_mult_15_U70 ( .A(mult_b1_mult_15_n116), .B(
        mult_b1_mult_15_n119), .CI(mult_b1_mult_15_n114), .CO(
        mult_b1_mult_15_n111), .S(mult_b1_mult_15_n112) );
  HA_X1 mult_b1_mult_15_U69 ( .A(mult_b1_mult_15_n154), .B(
        mult_b1_mult_15_n181), .CO(mult_b1_mult_15_n109), .S(
        mult_b1_mult_15_n110) );
  FA_X1 mult_b1_mult_15_U68 ( .A(mult_b1_mult_15_n191), .B(
        mult_b1_mult_15_n201), .CI(mult_b1_mult_15_n211), .CO(
        mult_b1_mult_15_n107), .S(mult_b1_mult_15_n108) );
  FA_X1 mult_b1_mult_15_U67 ( .A(mult_b1_mult_15_n110), .B(
        mult_b1_mult_15_n222), .CI(mult_b1_mult_15_n115), .CO(
        mult_b1_mult_15_n105), .S(mult_b1_mult_15_n106) );
  FA_X1 mult_b1_mult_15_U66 ( .A(mult_b1_mult_15_n108), .B(
        mult_b1_mult_15_n113), .CI(mult_b1_mult_15_n106), .CO(
        mult_b1_mult_15_n103), .S(mult_b1_mult_15_n104) );
  FA_X1 mult_b1_mult_15_U65 ( .A(mult_b1_mult_15_n190), .B(
        mult_b1_mult_15_n170), .CI(mult_b1_mult_15_n221), .CO(
        mult_b1_mult_15_n101), .S(mult_b1_mult_15_n102) );
  FA_X1 mult_b1_mult_15_U64 ( .A(mult_b1_mult_15_n180), .B(
        mult_b1_mult_15_n210), .CI(mult_b1_mult_15_n200), .CO(
        mult_b1_mult_15_n99), .S(mult_b1_mult_15_n100) );
  FA_X1 mult_b1_mult_15_U63 ( .A(mult_b1_mult_15_n107), .B(
        mult_b1_mult_15_n109), .CI(mult_b1_mult_15_n102), .CO(
        mult_b1_mult_15_n97), .S(mult_b1_mult_15_n98) );
  FA_X1 mult_b1_mult_15_U62 ( .A(mult_b1_mult_15_n105), .B(
        mult_b1_mult_15_n100), .CI(mult_b1_mult_15_n98), .CO(
        mult_b1_mult_15_n95), .S(mult_b1_mult_15_n96) );
  HA_X1 mult_b1_mult_15_U61 ( .A(mult_b1_mult_15_n153), .B(
        mult_b1_mult_15_n169), .CO(mult_b1_mult_15_n93), .S(
        mult_b1_mult_15_n94) );
  FA_X1 mult_b1_mult_15_U60 ( .A(mult_b1_mult_15_n179), .B(
        mult_b1_mult_15_n199), .CI(mult_b1_mult_15_n220), .CO(
        mult_b1_mult_15_n91), .S(mult_b1_mult_15_n92) );
  FA_X1 mult_b1_mult_15_U59 ( .A(mult_b1_mult_15_n189), .B(
        mult_b1_mult_15_n209), .CI(mult_b1_mult_15_n94), .CO(
        mult_b1_mult_15_n89), .S(mult_b1_mult_15_n90) );
  FA_X1 mult_b1_mult_15_U58 ( .A(mult_b1_mult_15_n99), .B(mult_b1_mult_15_n101), .CI(mult_b1_mult_15_n92), .CO(mult_b1_mult_15_n87), .S(mult_b1_mult_15_n88)
         );
  FA_X1 mult_b1_mult_15_U57 ( .A(mult_b1_mult_15_n97), .B(mult_b1_mult_15_n90), 
        .CI(mult_b1_mult_15_n88), .CO(mult_b1_mult_15_n85), .S(
        mult_b1_mult_15_n86) );
  FA_X1 mult_b1_mult_15_U54 ( .A(mult_b1_mult_15_n208), .B(
        mult_b1_mult_15_n188), .CI(mult_b1_mult_15_n438), .CO(
        mult_b1_mult_15_n81), .S(mult_b1_mult_15_n82) );
  FA_X1 mult_b1_mult_15_U53 ( .A(mult_b1_mult_15_n93), .B(mult_b1_mult_15_n168), .CI(mult_b1_mult_15_n84), .CO(mult_b1_mult_15_n79), .S(mult_b1_mult_15_n80)
         );
  FA_X1 mult_b1_mult_15_U52 ( .A(mult_b1_mult_15_n82), .B(mult_b1_mult_15_n91), 
        .CI(mult_b1_mult_15_n89), .CO(mult_b1_mult_15_n77), .S(
        mult_b1_mult_15_n78) );
  FA_X1 mult_b1_mult_15_U51 ( .A(mult_b1_mult_15_n87), .B(mult_b1_mult_15_n80), 
        .CI(mult_b1_mult_15_n78), .CO(mult_b1_mult_15_n75), .S(
        mult_b1_mult_15_n76) );
  FA_X1 mult_b1_mult_15_U49 ( .A(mult_b1_mult_15_n197), .B(
        mult_b1_mult_15_n177), .CI(mult_b1_mult_15_n167), .CO(
        mult_b1_mult_15_n71), .S(mult_b1_mult_15_n72) );
  FA_X1 mult_b1_mult_15_U48 ( .A(mult_b1_mult_15_n434), .B(
        mult_b1_mult_15_n187), .CI(mult_b1_mult_15_n83), .CO(
        mult_b1_mult_15_n69), .S(mult_b1_mult_15_n70) );
  FA_X1 mult_b1_mult_15_U47 ( .A(mult_b1_mult_15_n72), .B(mult_b1_mult_15_n81), 
        .CI(mult_b1_mult_15_n79), .CO(mult_b1_mult_15_n67), .S(
        mult_b1_mult_15_n68) );
  FA_X1 mult_b1_mult_15_U46 ( .A(mult_b1_mult_15_n77), .B(mult_b1_mult_15_n70), 
        .CI(mult_b1_mult_15_n68), .CO(mult_b1_mult_15_n65), .S(
        mult_b1_mult_15_n66) );
  FA_X1 mult_b1_mult_15_U45 ( .A(mult_b1_mult_15_n196), .B(
        mult_b1_mult_15_n166), .CI(mult_b1_mult_15_n435), .CO(
        mult_b1_mult_15_n63), .S(mult_b1_mult_15_n64) );
  FA_X1 mult_b1_mult_15_U44 ( .A(mult_b1_mult_15_n73), .B(mult_b1_mult_15_n186), .CI(mult_b1_mult_15_n176), .CO(mult_b1_mult_15_n61), .S(mult_b1_mult_15_n62)
         );
  FA_X1 mult_b1_mult_15_U43 ( .A(mult_b1_mult_15_n69), .B(mult_b1_mult_15_n71), 
        .CI(mult_b1_mult_15_n62), .CO(mult_b1_mult_15_n59), .S(
        mult_b1_mult_15_n60) );
  FA_X1 mult_b1_mult_15_U42 ( .A(mult_b1_mult_15_n67), .B(mult_b1_mult_15_n64), 
        .CI(mult_b1_mult_15_n60), .CO(mult_b1_mult_15_n57), .S(
        mult_b1_mult_15_n58) );
  FA_X1 mult_b1_mult_15_U40 ( .A(mult_b1_mult_15_n165), .B(
        mult_b1_mult_15_n175), .CI(mult_b1_mult_15_n185), .CO(
        mult_b1_mult_15_n53), .S(mult_b1_mult_15_n54) );
  FA_X1 mult_b1_mult_15_U39 ( .A(mult_b1_mult_15_n63), .B(mult_b1_mult_15_n430), .CI(mult_b1_mult_15_n61), .CO(mult_b1_mult_15_n51), .S(mult_b1_mult_15_n52)
         );
  FA_X1 mult_b1_mult_15_U38 ( .A(mult_b1_mult_15_n52), .B(mult_b1_mult_15_n54), 
        .CI(mult_b1_mult_15_n59), .CO(mult_b1_mult_15_n49), .S(
        mult_b1_mult_15_n50) );
  FA_X1 mult_b1_mult_15_U37 ( .A(mult_b1_mult_15_n174), .B(
        mult_b1_mult_15_n164), .CI(mult_b1_mult_15_n431), .CO(
        mult_b1_mult_15_n47), .S(mult_b1_mult_15_n48) );
  FA_X1 mult_b1_mult_15_U36 ( .A(mult_b1_mult_15_n55), .B(mult_b1_mult_15_n184), .CI(mult_b1_mult_15_n53), .CO(mult_b1_mult_15_n45), .S(mult_b1_mult_15_n46)
         );
  FA_X1 mult_b1_mult_15_U35 ( .A(mult_b1_mult_15_n51), .B(mult_b1_mult_15_n48), 
        .CI(mult_b1_mult_15_n46), .CO(mult_b1_mult_15_n43), .S(
        mult_b1_mult_15_n44) );
  FA_X1 mult_b1_mult_15_U33 ( .A(mult_b1_mult_15_n163), .B(
        mult_b1_mult_15_n173), .CI(mult_b1_mult_15_n426), .CO(
        mult_b1_mult_15_n39), .S(mult_b1_mult_15_n40) );
  FA_X1 mult_b1_mult_15_U32 ( .A(mult_b1_mult_15_n40), .B(mult_b1_mult_15_n47), 
        .CI(mult_b1_mult_15_n45), .CO(mult_b1_mult_15_n37), .S(
        mult_b1_mult_15_n38) );
  FA_X1 mult_b1_mult_15_U31 ( .A(mult_b1_mult_15_n172), .B(mult_b1_mult_15_n41), .CI(mult_b1_mult_15_n427), .CO(mult_b1_mult_15_n35), .S(mult_b1_mult_15_n36)
         );
  FA_X1 mult_b1_mult_15_U30 ( .A(mult_b1_mult_15_n39), .B(mult_b1_mult_15_n162), .CI(mult_b1_mult_15_n36), .CO(mult_b1_mult_15_n33), .S(mult_b1_mult_15_n34)
         );
  FA_X1 mult_b1_mult_15_U28 ( .A(mult_b1_mult_15_n422), .B(
        mult_b1_mult_15_n161), .CI(mult_b1_mult_15_n35), .CO(
        mult_b1_mult_15_n29), .S(mult_b1_mult_15_n30) );
  FA_X1 mult_b1_mult_15_U27 ( .A(mult_b1_mult_15_n160), .B(mult_b1_mult_15_n31), .CI(mult_b1_mult_15_n423), .CO(mult_b1_mult_15_n27), .S(mult_b1_mult_15_n28)
         );
  FA_X1 mult_b1_mult_15_U17 ( .A(mult_b1_mult_15_n104), .B(
        mult_b1_mult_15_n111), .CI(mult_b1_mult_15_n17), .CO(
        mult_b1_mult_15_n16), .S(prod_b1_2N[9]) );
  FA_X1 mult_b1_mult_15_U16 ( .A(mult_b1_mult_15_n96), .B(mult_b1_mult_15_n103), .CI(mult_b1_mult_15_n16), .CO(mult_b1_mult_15_n15), .S(prod_b1_2N[10]) );
  FA_X1 mult_b1_mult_15_U15 ( .A(mult_b1_mult_15_n86), .B(mult_b1_mult_15_n95), 
        .CI(mult_b1_mult_15_n15), .CO(mult_b1_mult_15_n14), .S(prod_b1_2N[11])
         );
  FA_X1 mult_b1_mult_15_U14 ( .A(mult_b1_mult_15_n76), .B(mult_b1_mult_15_n85), 
        .CI(mult_b1_mult_15_n14), .CO(mult_b1_mult_15_n13), .S(prod_b1_2N[12])
         );
  FA_X1 mult_b1_mult_15_U13 ( .A(mult_b1_mult_15_n66), .B(mult_b1_mult_15_n75), 
        .CI(mult_b1_mult_15_n13), .CO(mult_b1_mult_15_n12), .S(prod_b1_2N[13])
         );
  FA_X1 mult_b1_mult_15_U12 ( .A(mult_b1_mult_15_n58), .B(mult_b1_mult_15_n65), 
        .CI(mult_b1_mult_15_n12), .CO(mult_b1_mult_15_n11), .S(prod_b1_2N[14])
         );
  FA_X1 mult_b1_mult_15_U11 ( .A(mult_b1_mult_15_n50), .B(mult_b1_mult_15_n57), 
        .CI(mult_b1_mult_15_n11), .CO(mult_b1_mult_15_n10), .S(prod_b1_2N[15])
         );
  FA_X1 mult_b1_mult_15_U10 ( .A(mult_b1_mult_15_n44), .B(mult_b1_mult_15_n49), 
        .CI(mult_b1_mult_15_n10), .CO(mult_b1_mult_15_n9), .S(prod_b1_2N[16])
         );
  FA_X1 mult_b1_mult_15_U9 ( .A(mult_b1_mult_15_n38), .B(mult_b1_mult_15_n43), 
        .CI(mult_b1_mult_15_n9), .CO(mult_b1_mult_15_n8), .S(prod_b1_2N[17])
         );
  FA_X1 mult_b1_mult_15_U8 ( .A(mult_b1_mult_15_n34), .B(mult_b1_mult_15_n37), 
        .CI(mult_b1_mult_15_n8), .CO(mult_b1_mult_15_n7), .S(prod_b1_2N[18])
         );
  FA_X1 mult_b1_mult_15_U7 ( .A(mult_b1_mult_15_n30), .B(mult_b1_mult_15_n33), 
        .CI(mult_b1_mult_15_n7), .CO(mult_b1_mult_15_n6), .S(prod_b1_2N[19])
         );
  FA_X1 mult_b1_mult_15_U6 ( .A(mult_b1_mult_15_n29), .B(mult_b1_mult_15_n28), 
        .CI(mult_b1_mult_15_n6), .CO(mult_b1_mult_15_n5), .S(prod_b1_2N[20])
         );
  XOR2_X1 add_b0_add_16_U51 ( .A(prod_b1_2N[9]), .B(prod_b0_2N[9]), .Z(
        sum_b0[0]) );
  NAND3_X1 add_b0_add_16_U50 ( .A1(add_b0_add_16_n34), .A2(add_b0_add_16_n33), 
        .A3(add_b0_add_16_n35), .ZN(add_b0_add_16_carry[11]) );
  NAND2_X1 add_b0_add_16_U49 ( .A1(prod_b0_2N[19]), .A2(prod_b1_2N[19]), .ZN(
        add_b0_add_16_n35) );
  NAND2_X1 add_b0_add_16_U48 ( .A1(add_b0_add_16_carry[10]), .A2(
        prod_b1_2N[19]), .ZN(add_b0_add_16_n34) );
  NAND2_X1 add_b0_add_16_U47 ( .A1(add_b0_add_16_n12), .A2(prod_b0_2N[19]), 
        .ZN(add_b0_add_16_n33) );
  XOR2_X1 add_b0_add_16_U46 ( .A(add_b0_add_16_n13), .B(add_b0_add_16_n32), 
        .Z(sum_b0[10]) );
  XOR2_X1 add_b0_add_16_U45 ( .A(prod_b0_2N[19]), .B(prod_b1_2N[19]), .Z(
        add_b0_add_16_n32) );
  NAND3_X1 add_b0_add_16_U44 ( .A1(add_b0_add_16_n29), .A2(add_b0_add_16_n30), 
        .A3(add_b0_add_16_n31), .ZN(add_b0_add_16_carry[3]) );
  NAND2_X1 add_b0_add_16_U43 ( .A1(prod_b0_2N[11]), .A2(add_b0_add_16_carry[2]), .ZN(add_b0_add_16_n31) );
  NAND2_X1 add_b0_add_16_U42 ( .A1(prod_b1_2N[11]), .A2(add_b0_add_16_carry[2]), .ZN(add_b0_add_16_n30) );
  NAND2_X1 add_b0_add_16_U41 ( .A1(prod_b1_2N[11]), .A2(prod_b0_2N[11]), .ZN(
        add_b0_add_16_n29) );
  XOR2_X1 add_b0_add_16_U40 ( .A(add_b0_add_16_n28), .B(add_b0_add_16_carry[2]), .Z(sum_b0[2]) );
  XOR2_X1 add_b0_add_16_U39 ( .A(prod_b1_2N[11]), .B(prod_b0_2N[11]), .Z(
        add_b0_add_16_n28) );
  NAND2_X1 add_b0_add_16_U38 ( .A1(prod_b1_2N[10]), .A2(add_b0_add_16_n1), 
        .ZN(add_b0_add_16_n27) );
  NAND2_X1 add_b0_add_16_U37 ( .A1(prod_b0_2N[10]), .A2(add_b0_add_16_n1), 
        .ZN(add_b0_add_16_n26) );
  NAND2_X1 add_b0_add_16_U36 ( .A1(prod_b0_2N[10]), .A2(prod_b1_2N[10]), .ZN(
        add_b0_add_16_n25) );
  XOR2_X1 add_b0_add_16_U35 ( .A(add_b0_add_16_n24), .B(add_b0_add_16_n1), .Z(
        sum_b0[1]) );
  XOR2_X1 add_b0_add_16_U34 ( .A(prod_b0_2N[10]), .B(prod_b1_2N[10]), .Z(
        add_b0_add_16_n24) );
  NAND3_X1 add_b0_add_16_U33 ( .A1(add_b0_add_16_n21), .A2(add_b0_add_16_n22), 
        .A3(add_b0_add_16_n23), .ZN(add_b0_add_16_carry[10]) );
  NAND2_X1 add_b0_add_16_U32 ( .A1(add_b0_add_16_carry[9]), .A2(prod_b1_2N[18]), .ZN(add_b0_add_16_n23) );
  NAND2_X1 add_b0_add_16_U31 ( .A1(prod_b0_2N[18]), .A2(add_b0_add_16_n14), 
        .ZN(add_b0_add_16_n22) );
  NAND2_X1 add_b0_add_16_U30 ( .A1(prod_b0_2N[18]), .A2(prod_b1_2N[18]), .ZN(
        add_b0_add_16_n21) );
  XOR2_X1 add_b0_add_16_U29 ( .A(add_b0_add_16_n20), .B(add_b0_add_16_n15), 
        .Z(sum_b0[9]) );
  XOR2_X1 add_b0_add_16_U28 ( .A(prod_b0_2N[18]), .B(prod_b1_2N[18]), .Z(
        add_b0_add_16_n20) );
  NAND3_X1 add_b0_add_16_U27 ( .A1(add_b0_add_16_n17), .A2(add_b0_add_16_n18), 
        .A3(add_b0_add_16_n19), .ZN(add_b0_add_16_carry[9]) );
  NAND2_X1 add_b0_add_16_U26 ( .A1(prod_b1_2N[17]), .A2(add_b0_add_16_carry[8]), .ZN(add_b0_add_16_n19) );
  NAND2_X1 add_b0_add_16_U25 ( .A1(prod_b0_2N[17]), .A2(add_b0_add_16_carry[8]), .ZN(add_b0_add_16_n18) );
  NAND2_X1 add_b0_add_16_U24 ( .A1(prod_b0_2N[17]), .A2(prod_b1_2N[17]), .ZN(
        add_b0_add_16_n17) );
  XOR2_X1 add_b0_add_16_U23 ( .A(add_b0_add_16_n16), .B(add_b0_add_16_carry[8]), .Z(sum_b0[8]) );
  XOR2_X1 add_b0_add_16_U22 ( .A(prod_b0_2N[17]), .B(prod_b1_2N[17]), .Z(
        add_b0_add_16_n16) );
  NAND3_X1 add_b0_add_16_U21 ( .A1(add_b0_add_16_n17), .A2(add_b0_add_16_n18), 
        .A3(add_b0_add_16_n19), .ZN(add_b0_add_16_n15) );
  NAND3_X1 add_b0_add_16_U20 ( .A1(add_b0_add_16_n17), .A2(add_b0_add_16_n18), 
        .A3(add_b0_add_16_n19), .ZN(add_b0_add_16_n14) );
  NAND3_X1 add_b0_add_16_U19 ( .A1(add_b0_add_16_n21), .A2(add_b0_add_16_n2), 
        .A3(add_b0_add_16_n23), .ZN(add_b0_add_16_n13) );
  NAND3_X1 add_b0_add_16_U18 ( .A1(add_b0_add_16_n21), .A2(add_b0_add_16_n22), 
        .A3(add_b0_add_16_n23), .ZN(add_b0_add_16_n12) );
  NAND3_X1 add_b0_add_16_U17 ( .A1(add_b0_add_16_n25), .A2(add_b0_add_16_n26), 
        .A3(add_b0_add_16_n27), .ZN(add_b0_add_16_carry[2]) );
  NAND3_X1 add_b0_add_16_U16 ( .A1(add_b0_add_16_n9), .A2(add_b0_add_16_n10), 
        .A3(add_b0_add_16_n11), .ZN(add_b0_add_16_carry[7]) );
  NAND2_X1 add_b0_add_16_U15 ( .A1(prod_b0_2N[15]), .A2(prod_b1_2N[15]), .ZN(
        add_b0_add_16_n11) );
  NAND2_X1 add_b0_add_16_U14 ( .A1(add_b0_add_16_carry[6]), .A2(prod_b1_2N[15]), .ZN(add_b0_add_16_n10) );
  NAND2_X1 add_b0_add_16_U13 ( .A1(add_b0_add_16_carry[6]), .A2(prod_b0_2N[15]), .ZN(add_b0_add_16_n9) );
  XOR2_X1 add_b0_add_16_U12 ( .A(add_b0_add_16_carry[6]), .B(add_b0_add_16_n8), 
        .Z(sum_b0[6]) );
  XOR2_X1 add_b0_add_16_U11 ( .A(prod_b0_2N[15]), .B(prod_b1_2N[15]), .Z(
        add_b0_add_16_n8) );
  NAND3_X1 add_b0_add_16_U10 ( .A1(add_b0_add_16_n6), .A2(add_b0_add_16_n5), 
        .A3(add_b0_add_16_n7), .ZN(add_b0_add_16_carry[5]) );
  NAND2_X1 add_b0_add_16_U9 ( .A1(prod_b0_2N[13]), .A2(prod_b1_2N[13]), .ZN(
        add_b0_add_16_n7) );
  NAND2_X1 add_b0_add_16_U8 ( .A1(add_b0_add_16_carry[4]), .A2(prod_b1_2N[13]), 
        .ZN(add_b0_add_16_n6) );
  NAND2_X1 add_b0_add_16_U7 ( .A1(add_b0_add_16_carry[4]), .A2(prod_b0_2N[13]), 
        .ZN(add_b0_add_16_n5) );
  XOR2_X1 add_b0_add_16_U6 ( .A(add_b0_add_16_carry[4]), .B(add_b0_add_16_n4), 
        .Z(sum_b0[4]) );
  XOR2_X1 add_b0_add_16_U5 ( .A(prod_b0_2N[13]), .B(prod_b1_2N[13]), .Z(
        add_b0_add_16_n4) );
  XNOR2_X1 add_b0_add_16_U4 ( .A(prod_b0_2N[20]), .B(prod_b1_2N[20]), .ZN(
        add_b0_add_16_n3) );
  XNOR2_X1 add_b0_add_16_U3 ( .A(add_b0_add_16_carry[11]), .B(add_b0_add_16_n3), .ZN(sat_out[9]) );
  CLKBUF_X1 add_b0_add_16_U2 ( .A(add_b0_add_16_n22), .Z(add_b0_add_16_n2) );
  AND2_X1 add_b0_add_16_U1 ( .A1(prod_b1_2N[9]), .A2(prod_b0_2N[9]), .ZN(
        add_b0_add_16_n1) );
  FA_X1 add_b0_add_16_U1_3 ( .A(prod_b0_2N[12]), .B(prod_b1_2N[12]), .CI(
        add_b0_add_16_carry[3]), .CO(add_b0_add_16_carry[4]), .S(sum_b0[3]) );
  FA_X1 add_b0_add_16_U1_5 ( .A(prod_b0_2N[14]), .B(prod_b1_2N[14]), .CI(
        add_b0_add_16_carry[5]), .CO(add_b0_add_16_carry[6]), .S(sum_b0[5]) );
  FA_X1 add_b0_add_16_U1_7 ( .A(prod_b0_2N[16]), .B(prod_b1_2N[16]), .CI(
        add_b0_add_16_carry[7]), .CO(add_b0_add_16_carry[8]), .S(sum_b0[7]) );
  XNOR2_X1 mult_a0_mult_15_U647 ( .A(mult_a0_mult_15_n520), .B(reg_out[10]), 
        .ZN(mult_a0_mult_15_n647) );
  NAND2_X1 mult_a0_mult_15_U646 ( .A1(mult_a0_mult_15_n544), .A2(
        mult_a0_mult_15_n647), .ZN(mult_a0_mult_15_n543) );
  OR3_X1 mult_a0_mult_15_U645 ( .A1(mult_a0_mult_15_n544), .A2(a1[0]), .A3(
        mult_a0_mult_15_n520), .ZN(mult_a0_mult_15_n646) );
  OAI21_X1 mult_a0_mult_15_U644 ( .B1(mult_a0_mult_15_n520), .B2(
        mult_a0_mult_15_n543), .A(mult_a0_mult_15_n646), .ZN(
        mult_a0_mult_15_n153) );
  XNOR2_X1 mult_a0_mult_15_U643 ( .A(mult_a0_mult_15_n518), .B(reg_out[8]), 
        .ZN(mult_a0_mult_15_n645) );
  NAND2_X1 mult_a0_mult_15_U642 ( .A1(mult_a0_mult_15_n554), .A2(
        mult_a0_mult_15_n645), .ZN(mult_a0_mult_15_n553) );
  OR3_X1 mult_a0_mult_15_U641 ( .A1(mult_a0_mult_15_n554), .A2(a1[0]), .A3(
        mult_a0_mult_15_n518), .ZN(mult_a0_mult_15_n644) );
  OAI21_X1 mult_a0_mult_15_U640 ( .B1(mult_a0_mult_15_n518), .B2(
        mult_a0_mult_15_n553), .A(mult_a0_mult_15_n644), .ZN(
        mult_a0_mult_15_n154) );
  XNOR2_X1 mult_a0_mult_15_U639 ( .A(mult_a0_mult_15_n516), .B(reg_out[6]), 
        .ZN(mult_a0_mult_15_n643) );
  NAND2_X1 mult_a0_mult_15_U638 ( .A1(mult_a0_mult_15_n563), .A2(
        mult_a0_mult_15_n643), .ZN(mult_a0_mult_15_n562) );
  OR3_X1 mult_a0_mult_15_U637 ( .A1(mult_a0_mult_15_n563), .A2(a1[0]), .A3(
        mult_a0_mult_15_n516), .ZN(mult_a0_mult_15_n642) );
  OAI21_X1 mult_a0_mult_15_U636 ( .B1(mult_a0_mult_15_n516), .B2(
        mult_a0_mult_15_n562), .A(mult_a0_mult_15_n642), .ZN(
        mult_a0_mult_15_n155) );
  XNOR2_X1 mult_a0_mult_15_U635 ( .A(mult_a0_mult_15_n514), .B(reg_out[4]), 
        .ZN(mult_a0_mult_15_n641) );
  NAND2_X1 mult_a0_mult_15_U634 ( .A1(mult_a0_mult_15_n550), .A2(
        mult_a0_mult_15_n641), .ZN(mult_a0_mult_15_n549) );
  OR3_X1 mult_a0_mult_15_U633 ( .A1(a1[0]), .A2(mult_a0_mult_15_n550), .A3(
        mult_a0_mult_15_n514), .ZN(mult_a0_mult_15_n640) );
  OAI21_X1 mult_a0_mult_15_U632 ( .B1(mult_a0_mult_15_n514), .B2(
        mult_a0_mult_15_n549), .A(mult_a0_mult_15_n640), .ZN(
        mult_a0_mult_15_n156) );
  XNOR2_X1 mult_a0_mult_15_U631 ( .A(a1[9]), .B(mult_a0_mult_15_n519), .ZN(
        mult_a0_mult_15_n639) );
  XNOR2_X1 mult_a0_mult_15_U630 ( .A(a1[9]), .B(mult_a0_mult_15_n519), .ZN(
        mult_a0_mult_15_n542) );
  OAI22_X1 mult_a0_mult_15_U629 ( .A1(mult_a0_mult_15_n639), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n542), .ZN(mult_a0_mult_15_n160) );
  XNOR2_X1 mult_a0_mult_15_U628 ( .A(a1[8]), .B(mult_a0_mult_15_n519), .ZN(
        mult_a0_mult_15_n638) );
  OAI22_X1 mult_a0_mult_15_U627 ( .A1(mult_a0_mult_15_n638), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n639), .ZN(mult_a0_mult_15_n161) );
  XNOR2_X1 mult_a0_mult_15_U626 ( .A(a1[7]), .B(mult_a0_mult_15_n519), .ZN(
        mult_a0_mult_15_n637) );
  OAI22_X1 mult_a0_mult_15_U625 ( .A1(mult_a0_mult_15_n637), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n638), .ZN(mult_a0_mult_15_n162) );
  XNOR2_X1 mult_a0_mult_15_U624 ( .A(a1[6]), .B(mult_a0_mult_15_n519), .ZN(
        mult_a0_mult_15_n636) );
  OAI22_X1 mult_a0_mult_15_U623 ( .A1(mult_a0_mult_15_n636), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n637), .ZN(mult_a0_mult_15_n163) );
  XNOR2_X1 mult_a0_mult_15_U622 ( .A(a1[5]), .B(mult_a0_mult_15_n519), .ZN(
        mult_a0_mult_15_n635) );
  OAI22_X1 mult_a0_mult_15_U621 ( .A1(mult_a0_mult_15_n635), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n636), .ZN(mult_a0_mult_15_n164) );
  XNOR2_X1 mult_a0_mult_15_U620 ( .A(a1[4]), .B(mult_a0_mult_15_n519), .ZN(
        mult_a0_mult_15_n634) );
  OAI22_X1 mult_a0_mult_15_U619 ( .A1(mult_a0_mult_15_n634), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n635), .ZN(mult_a0_mult_15_n165) );
  XNOR2_X1 mult_a0_mult_15_U618 ( .A(mult_a0_mult_15_n443), .B(
        mult_a0_mult_15_n519), .ZN(mult_a0_mult_15_n633) );
  OAI22_X1 mult_a0_mult_15_U617 ( .A1(mult_a0_mult_15_n633), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n634), .ZN(mult_a0_mult_15_n166) );
  XNOR2_X1 mult_a0_mult_15_U616 ( .A(mult_a0_mult_15_n430), .B(
        mult_a0_mult_15_n519), .ZN(mult_a0_mult_15_n632) );
  OAI22_X1 mult_a0_mult_15_U615 ( .A1(mult_a0_mult_15_n632), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n633), .ZN(mult_a0_mult_15_n167) );
  XNOR2_X1 mult_a0_mult_15_U614 ( .A(mult_a0_mult_15_n449), .B(
        mult_a0_mult_15_n519), .ZN(mult_a0_mult_15_n631) );
  OAI22_X1 mult_a0_mult_15_U613 ( .A1(mult_a0_mult_15_n631), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n632), .ZN(mult_a0_mult_15_n168) );
  XNOR2_X1 mult_a0_mult_15_U612 ( .A(mult_a0_mult_15_n519), .B(a1[0]), .ZN(
        mult_a0_mult_15_n630) );
  OAI22_X1 mult_a0_mult_15_U611 ( .A1(mult_a0_mult_15_n630), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n631), .ZN(mult_a0_mult_15_n169) );
  XOR2_X1 mult_a0_mult_15_U610 ( .A(reg_out[2]), .B(mult_a0_mult_15_n510), .Z(
        mult_a0_mult_15_n624) );
  NAND2_X1 mult_a0_mult_15_U609 ( .A1(mult_a0_mult_15_n510), .A2(
        mult_a0_mult_15_n536), .ZN(mult_a0_mult_15_n568) );
  XNOR2_X1 mult_a0_mult_15_U608 ( .A(a1[2]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n567) );
  OAI22_X1 mult_a0_mult_15_U607 ( .A1(mult_a0_mult_15_n449), .A2(
        mult_a0_mult_15_n568), .B1(mult_a0_mult_15_n499), .B2(
        mult_a0_mult_15_n536), .ZN(mult_a0_mult_15_n629) );
  NAND2_X1 mult_a0_mult_15_U606 ( .A1(mult_a0_mult_15_n624), .A2(
        mult_a0_mult_15_n629), .ZN(mult_a0_mult_15_n627) );
  XNOR2_X1 mult_a0_mult_15_U605 ( .A(mult_a0_mult_15_n512), .B(reg_out[2]), 
        .ZN(mult_a0_mult_15_n625) );
  NAND2_X1 mult_a0_mult_15_U604 ( .A1(mult_a0_mult_15_n534), .A2(
        mult_a0_mult_15_n625), .ZN(mult_a0_mult_15_n557) );
  NAND3_X1 mult_a0_mult_15_U603 ( .A1(mult_a0_mult_15_n624), .A2(
        mult_a0_mult_15_n537), .A3(mult_a0_mult_15_n511), .ZN(
        mult_a0_mult_15_n623) );
  OAI21_X1 mult_a0_mult_15_U602 ( .B1(mult_a0_mult_15_n512), .B2(
        mult_a0_mult_15_n557), .A(mult_a0_mult_15_n623), .ZN(
        mult_a0_mult_15_n622) );
  OAI222_X1 mult_a0_mult_15_U601 ( .A1(mult_a0_mult_15_n507), .A2(
        mult_a0_mult_15_n529), .B1(mult_a0_mult_15_n419), .B2(
        mult_a0_mult_15_n418), .C1(mult_a0_mult_15_n418), .C2(
        mult_a0_mult_15_n529), .ZN(mult_a0_mult_15_n620) );
  OAI222_X1 mult_a0_mult_15_U600 ( .A1(mult_a0_mult_15_n506), .A2(
        mult_a0_mult_15_n525), .B1(mult_a0_mult_15_n619), .B2(
        mult_a0_mult_15_n526), .C1(mult_a0_mult_15_n526), .C2(
        mult_a0_mult_15_n525), .ZN(mult_a0_mult_15_n17) );
  NOR2_X1 mult_a0_mult_15_U599 ( .A1(mult_a0_mult_15_n544), .A2(
        mult_a0_mult_15_n537), .ZN(mult_a0_mult_15_n170) );
  XNOR2_X1 mult_a0_mult_15_U598 ( .A(a1[9]), .B(mult_a0_mult_15_n517), .ZN(
        mult_a0_mult_15_n566) );
  OAI22_X1 mult_a0_mult_15_U597 ( .A1(mult_a0_mult_15_n566), .A2(
        mult_a0_mult_15_n554), .B1(mult_a0_mult_15_n553), .B2(
        mult_a0_mult_15_n566), .ZN(mult_a0_mult_15_n618) );
  XNOR2_X1 mult_a0_mult_15_U596 ( .A(a1[9]), .B(mult_a0_mult_15_n517), .ZN(
        mult_a0_mult_15_n617) );
  XNOR2_X1 mult_a0_mult_15_U595 ( .A(a1[9]), .B(mult_a0_mult_15_n517), .ZN(
        mult_a0_mult_15_n565) );
  OAI22_X1 mult_a0_mult_15_U594 ( .A1(mult_a0_mult_15_n617), .A2(
        mult_a0_mult_15_n553), .B1(mult_a0_mult_15_n554), .B2(
        mult_a0_mult_15_n565), .ZN(mult_a0_mult_15_n172) );
  XNOR2_X1 mult_a0_mult_15_U593 ( .A(a1[8]), .B(mult_a0_mult_15_n517), .ZN(
        mult_a0_mult_15_n616) );
  OAI22_X1 mult_a0_mult_15_U592 ( .A1(mult_a0_mult_15_n616), .A2(
        mult_a0_mult_15_n553), .B1(mult_a0_mult_15_n554), .B2(
        mult_a0_mult_15_n617), .ZN(mult_a0_mult_15_n173) );
  XNOR2_X1 mult_a0_mult_15_U591 ( .A(a1[7]), .B(mult_a0_mult_15_n517), .ZN(
        mult_a0_mult_15_n615) );
  OAI22_X1 mult_a0_mult_15_U590 ( .A1(mult_a0_mult_15_n615), .A2(
        mult_a0_mult_15_n553), .B1(mult_a0_mult_15_n554), .B2(
        mult_a0_mult_15_n616), .ZN(mult_a0_mult_15_n174) );
  XNOR2_X1 mult_a0_mult_15_U589 ( .A(a1[6]), .B(mult_a0_mult_15_n517), .ZN(
        mult_a0_mult_15_n614) );
  OAI22_X1 mult_a0_mult_15_U588 ( .A1(mult_a0_mult_15_n614), .A2(
        mult_a0_mult_15_n553), .B1(mult_a0_mult_15_n554), .B2(
        mult_a0_mult_15_n615), .ZN(mult_a0_mult_15_n175) );
  XNOR2_X1 mult_a0_mult_15_U587 ( .A(a1[5]), .B(mult_a0_mult_15_n517), .ZN(
        mult_a0_mult_15_n613) );
  OAI22_X1 mult_a0_mult_15_U586 ( .A1(mult_a0_mult_15_n613), .A2(
        mult_a0_mult_15_n553), .B1(mult_a0_mult_15_n554), .B2(
        mult_a0_mult_15_n614), .ZN(mult_a0_mult_15_n176) );
  XNOR2_X1 mult_a0_mult_15_U585 ( .A(a1[4]), .B(mult_a0_mult_15_n517), .ZN(
        mult_a0_mult_15_n555) );
  OAI22_X1 mult_a0_mult_15_U584 ( .A1(mult_a0_mult_15_n555), .A2(
        mult_a0_mult_15_n553), .B1(mult_a0_mult_15_n554), .B2(
        mult_a0_mult_15_n613), .ZN(mult_a0_mult_15_n177) );
  XNOR2_X1 mult_a0_mult_15_U583 ( .A(mult_a0_mult_15_n430), .B(
        mult_a0_mult_15_n517), .ZN(mult_a0_mult_15_n612) );
  XNOR2_X1 mult_a0_mult_15_U582 ( .A(mult_a0_mult_15_n443), .B(
        mult_a0_mult_15_n517), .ZN(mult_a0_mult_15_n552) );
  OAI22_X1 mult_a0_mult_15_U581 ( .A1(mult_a0_mult_15_n612), .A2(
        mult_a0_mult_15_n553), .B1(mult_a0_mult_15_n554), .B2(
        mult_a0_mult_15_n552), .ZN(mult_a0_mult_15_n179) );
  XNOR2_X1 mult_a0_mult_15_U580 ( .A(mult_a0_mult_15_n449), .B(
        mult_a0_mult_15_n517), .ZN(mult_a0_mult_15_n611) );
  OAI22_X1 mult_a0_mult_15_U579 ( .A1(mult_a0_mult_15_n611), .A2(
        mult_a0_mult_15_n553), .B1(mult_a0_mult_15_n554), .B2(
        mult_a0_mult_15_n612), .ZN(mult_a0_mult_15_n180) );
  XNOR2_X1 mult_a0_mult_15_U578 ( .A(mult_a0_mult_15_n517), .B(a1[0]), .ZN(
        mult_a0_mult_15_n610) );
  OAI22_X1 mult_a0_mult_15_U577 ( .A1(mult_a0_mult_15_n610), .A2(
        mult_a0_mult_15_n553), .B1(mult_a0_mult_15_n554), .B2(
        mult_a0_mult_15_n611), .ZN(mult_a0_mult_15_n181) );
  NOR2_X1 mult_a0_mult_15_U576 ( .A1(mult_a0_mult_15_n554), .A2(
        mult_a0_mult_15_n537), .ZN(mult_a0_mult_15_n182) );
  XNOR2_X1 mult_a0_mult_15_U575 ( .A(a1[9]), .B(mult_a0_mult_15_n515), .ZN(
        mult_a0_mult_15_n564) );
  OAI22_X1 mult_a0_mult_15_U574 ( .A1(mult_a0_mult_15_n564), .A2(
        mult_a0_mult_15_n563), .B1(mult_a0_mult_15_n562), .B2(
        mult_a0_mult_15_n564), .ZN(mult_a0_mult_15_n609) );
  XNOR2_X1 mult_a0_mult_15_U573 ( .A(a1[9]), .B(mult_a0_mult_15_n515), .ZN(
        mult_a0_mult_15_n608) );
  XNOR2_X1 mult_a0_mult_15_U572 ( .A(a1[9]), .B(mult_a0_mult_15_n515), .ZN(
        mult_a0_mult_15_n561) );
  OAI22_X1 mult_a0_mult_15_U571 ( .A1(mult_a0_mult_15_n608), .A2(
        mult_a0_mult_15_n562), .B1(mult_a0_mult_15_n563), .B2(
        mult_a0_mult_15_n561), .ZN(mult_a0_mult_15_n184) );
  XNOR2_X1 mult_a0_mult_15_U570 ( .A(a1[8]), .B(mult_a0_mult_15_n515), .ZN(
        mult_a0_mult_15_n607) );
  OAI22_X1 mult_a0_mult_15_U569 ( .A1(mult_a0_mult_15_n607), .A2(
        mult_a0_mult_15_n562), .B1(mult_a0_mult_15_n563), .B2(
        mult_a0_mult_15_n608), .ZN(mult_a0_mult_15_n185) );
  XNOR2_X1 mult_a0_mult_15_U568 ( .A(a1[7]), .B(mult_a0_mult_15_n515), .ZN(
        mult_a0_mult_15_n606) );
  OAI22_X1 mult_a0_mult_15_U567 ( .A1(mult_a0_mult_15_n606), .A2(
        mult_a0_mult_15_n562), .B1(mult_a0_mult_15_n563), .B2(
        mult_a0_mult_15_n607), .ZN(mult_a0_mult_15_n186) );
  XNOR2_X1 mult_a0_mult_15_U566 ( .A(a1[6]), .B(mult_a0_mult_15_n515), .ZN(
        mult_a0_mult_15_n605) );
  OAI22_X1 mult_a0_mult_15_U565 ( .A1(mult_a0_mult_15_n605), .A2(
        mult_a0_mult_15_n562), .B1(mult_a0_mult_15_n563), .B2(
        mult_a0_mult_15_n606), .ZN(mult_a0_mult_15_n187) );
  XNOR2_X1 mult_a0_mult_15_U564 ( .A(a1[5]), .B(mult_a0_mult_15_n515), .ZN(
        mult_a0_mult_15_n604) );
  OAI22_X1 mult_a0_mult_15_U563 ( .A1(mult_a0_mult_15_n604), .A2(
        mult_a0_mult_15_n562), .B1(mult_a0_mult_15_n563), .B2(
        mult_a0_mult_15_n605), .ZN(mult_a0_mult_15_n188) );
  XNOR2_X1 mult_a0_mult_15_U562 ( .A(a1[4]), .B(mult_a0_mult_15_n515), .ZN(
        mult_a0_mult_15_n603) );
  OAI22_X1 mult_a0_mult_15_U561 ( .A1(mult_a0_mult_15_n603), .A2(
        mult_a0_mult_15_n562), .B1(mult_a0_mult_15_n563), .B2(
        mult_a0_mult_15_n604), .ZN(mult_a0_mult_15_n189) );
  XNOR2_X1 mult_a0_mult_15_U560 ( .A(mult_a0_mult_15_n443), .B(
        mult_a0_mult_15_n515), .ZN(mult_a0_mult_15_n602) );
  OAI22_X1 mult_a0_mult_15_U559 ( .A1(mult_a0_mult_15_n602), .A2(
        mult_a0_mult_15_n562), .B1(mult_a0_mult_15_n563), .B2(
        mult_a0_mult_15_n603), .ZN(mult_a0_mult_15_n190) );
  XNOR2_X1 mult_a0_mult_15_U558 ( .A(mult_a0_mult_15_n430), .B(
        mult_a0_mult_15_n515), .ZN(mult_a0_mult_15_n601) );
  OAI22_X1 mult_a0_mult_15_U557 ( .A1(mult_a0_mult_15_n601), .A2(
        mult_a0_mult_15_n562), .B1(mult_a0_mult_15_n563), .B2(
        mult_a0_mult_15_n602), .ZN(mult_a0_mult_15_n191) );
  XNOR2_X1 mult_a0_mult_15_U556 ( .A(mult_a0_mult_15_n449), .B(
        mult_a0_mult_15_n515), .ZN(mult_a0_mult_15_n600) );
  OAI22_X1 mult_a0_mult_15_U555 ( .A1(mult_a0_mult_15_n600), .A2(
        mult_a0_mult_15_n562), .B1(mult_a0_mult_15_n563), .B2(
        mult_a0_mult_15_n601), .ZN(mult_a0_mult_15_n192) );
  XNOR2_X1 mult_a0_mult_15_U554 ( .A(mult_a0_mult_15_n515), .B(a1[0]), .ZN(
        mult_a0_mult_15_n599) );
  OAI22_X1 mult_a0_mult_15_U553 ( .A1(mult_a0_mult_15_n599), .A2(
        mult_a0_mult_15_n562), .B1(mult_a0_mult_15_n563), .B2(
        mult_a0_mult_15_n600), .ZN(mult_a0_mult_15_n193) );
  NOR2_X1 mult_a0_mult_15_U552 ( .A1(mult_a0_mult_15_n563), .A2(
        mult_a0_mult_15_n537), .ZN(mult_a0_mult_15_n194) );
  XNOR2_X1 mult_a0_mult_15_U551 ( .A(a1[9]), .B(mult_a0_mult_15_n513), .ZN(
        mult_a0_mult_15_n560) );
  OAI22_X1 mult_a0_mult_15_U550 ( .A1(mult_a0_mult_15_n560), .A2(
        mult_a0_mult_15_n550), .B1(mult_a0_mult_15_n549), .B2(
        mult_a0_mult_15_n560), .ZN(mult_a0_mult_15_n598) );
  XNOR2_X1 mult_a0_mult_15_U549 ( .A(a1[9]), .B(mult_a0_mult_15_n513), .ZN(
        mult_a0_mult_15_n597) );
  XNOR2_X1 mult_a0_mult_15_U548 ( .A(a1[9]), .B(mult_a0_mult_15_n513), .ZN(
        mult_a0_mult_15_n559) );
  OAI22_X1 mult_a0_mult_15_U547 ( .A1(mult_a0_mult_15_n597), .A2(
        mult_a0_mult_15_n549), .B1(mult_a0_mult_15_n550), .B2(
        mult_a0_mult_15_n559), .ZN(mult_a0_mult_15_n196) );
  XNOR2_X1 mult_a0_mult_15_U546 ( .A(a1[8]), .B(mult_a0_mult_15_n513), .ZN(
        mult_a0_mult_15_n551) );
  OAI22_X1 mult_a0_mult_15_U545 ( .A1(mult_a0_mult_15_n551), .A2(
        mult_a0_mult_15_n549), .B1(mult_a0_mult_15_n550), .B2(
        mult_a0_mult_15_n597), .ZN(mult_a0_mult_15_n197) );
  XNOR2_X1 mult_a0_mult_15_U544 ( .A(a1[6]), .B(mult_a0_mult_15_n513), .ZN(
        mult_a0_mult_15_n596) );
  XNOR2_X1 mult_a0_mult_15_U543 ( .A(a1[7]), .B(mult_a0_mult_15_n513), .ZN(
        mult_a0_mult_15_n548) );
  OAI22_X1 mult_a0_mult_15_U542 ( .A1(mult_a0_mult_15_n596), .A2(
        mult_a0_mult_15_n549), .B1(mult_a0_mult_15_n550), .B2(
        mult_a0_mult_15_n548), .ZN(mult_a0_mult_15_n199) );
  XNOR2_X1 mult_a0_mult_15_U541 ( .A(a1[5]), .B(mult_a0_mult_15_n513), .ZN(
        mult_a0_mult_15_n595) );
  OAI22_X1 mult_a0_mult_15_U540 ( .A1(mult_a0_mult_15_n595), .A2(
        mult_a0_mult_15_n549), .B1(mult_a0_mult_15_n550), .B2(
        mult_a0_mult_15_n596), .ZN(mult_a0_mult_15_n200) );
  XNOR2_X1 mult_a0_mult_15_U539 ( .A(a1[4]), .B(mult_a0_mult_15_n513), .ZN(
        mult_a0_mult_15_n594) );
  OAI22_X1 mult_a0_mult_15_U538 ( .A1(mult_a0_mult_15_n594), .A2(
        mult_a0_mult_15_n549), .B1(mult_a0_mult_15_n550), .B2(
        mult_a0_mult_15_n595), .ZN(mult_a0_mult_15_n201) );
  XNOR2_X1 mult_a0_mult_15_U537 ( .A(mult_a0_mult_15_n443), .B(
        mult_a0_mult_15_n513), .ZN(mult_a0_mult_15_n593) );
  OAI22_X1 mult_a0_mult_15_U536 ( .A1(mult_a0_mult_15_n593), .A2(
        mult_a0_mult_15_n549), .B1(mult_a0_mult_15_n550), .B2(
        mult_a0_mult_15_n594), .ZN(mult_a0_mult_15_n202) );
  XNOR2_X1 mult_a0_mult_15_U535 ( .A(mult_a0_mult_15_n430), .B(
        mult_a0_mult_15_n513), .ZN(mult_a0_mult_15_n592) );
  OAI22_X1 mult_a0_mult_15_U534 ( .A1(mult_a0_mult_15_n592), .A2(
        mult_a0_mult_15_n549), .B1(mult_a0_mult_15_n550), .B2(
        mult_a0_mult_15_n593), .ZN(mult_a0_mult_15_n203) );
  XNOR2_X1 mult_a0_mult_15_U533 ( .A(a1[1]), .B(mult_a0_mult_15_n513), .ZN(
        mult_a0_mult_15_n591) );
  OAI22_X1 mult_a0_mult_15_U532 ( .A1(mult_a0_mult_15_n451), .A2(
        mult_a0_mult_15_n549), .B1(mult_a0_mult_15_n550), .B2(
        mult_a0_mult_15_n592), .ZN(mult_a0_mult_15_n204) );
  XNOR2_X1 mult_a0_mult_15_U531 ( .A(mult_a0_mult_15_n513), .B(a1[0]), .ZN(
        mult_a0_mult_15_n590) );
  OAI22_X1 mult_a0_mult_15_U530 ( .A1(mult_a0_mult_15_n590), .A2(
        mult_a0_mult_15_n549), .B1(mult_a0_mult_15_n550), .B2(
        mult_a0_mult_15_n591), .ZN(mult_a0_mult_15_n205) );
  NOR2_X1 mult_a0_mult_15_U529 ( .A1(mult_a0_mult_15_n550), .A2(
        mult_a0_mult_15_n537), .ZN(mult_a0_mult_15_n206) );
  XOR2_X1 mult_a0_mult_15_U528 ( .A(a1[9]), .B(mult_a0_mult_15_n512), .Z(
        mult_a0_mult_15_n558) );
  OAI22_X1 mult_a0_mult_15_U527 ( .A1(mult_a0_mult_15_n558), .A2(
        mult_a0_mult_15_n534), .B1(mult_a0_mult_15_n557), .B2(
        mult_a0_mult_15_n558), .ZN(mult_a0_mult_15_n589) );
  XNOR2_X1 mult_a0_mult_15_U526 ( .A(a1[9]), .B(mult_a0_mult_15_n511), .ZN(
        mult_a0_mult_15_n588) );
  XNOR2_X1 mult_a0_mult_15_U525 ( .A(a1[9]), .B(mult_a0_mult_15_n511), .ZN(
        mult_a0_mult_15_n556) );
  OAI22_X1 mult_a0_mult_15_U524 ( .A1(mult_a0_mult_15_n588), .A2(
        mult_a0_mult_15_n557), .B1(mult_a0_mult_15_n534), .B2(
        mult_a0_mult_15_n556), .ZN(mult_a0_mult_15_n208) );
  XNOR2_X1 mult_a0_mult_15_U523 ( .A(a1[8]), .B(mult_a0_mult_15_n511), .ZN(
        mult_a0_mult_15_n587) );
  OAI22_X1 mult_a0_mult_15_U522 ( .A1(mult_a0_mult_15_n587), .A2(
        mult_a0_mult_15_n557), .B1(mult_a0_mult_15_n534), .B2(
        mult_a0_mult_15_n588), .ZN(mult_a0_mult_15_n209) );
  XNOR2_X1 mult_a0_mult_15_U521 ( .A(a1[7]), .B(mult_a0_mult_15_n511), .ZN(
        mult_a0_mult_15_n586) );
  OAI22_X1 mult_a0_mult_15_U520 ( .A1(mult_a0_mult_15_n586), .A2(
        mult_a0_mult_15_n557), .B1(mult_a0_mult_15_n534), .B2(
        mult_a0_mult_15_n587), .ZN(mult_a0_mult_15_n210) );
  XNOR2_X1 mult_a0_mult_15_U519 ( .A(a1[6]), .B(mult_a0_mult_15_n511), .ZN(
        mult_a0_mult_15_n585) );
  OAI22_X1 mult_a0_mult_15_U518 ( .A1(mult_a0_mult_15_n585), .A2(
        mult_a0_mult_15_n557), .B1(mult_a0_mult_15_n534), .B2(
        mult_a0_mult_15_n586), .ZN(mult_a0_mult_15_n211) );
  XNOR2_X1 mult_a0_mult_15_U517 ( .A(a1[5]), .B(mult_a0_mult_15_n511), .ZN(
        mult_a0_mult_15_n584) );
  OAI22_X1 mult_a0_mult_15_U516 ( .A1(mult_a0_mult_15_n584), .A2(
        mult_a0_mult_15_n557), .B1(mult_a0_mult_15_n534), .B2(
        mult_a0_mult_15_n585), .ZN(mult_a0_mult_15_n212) );
  XNOR2_X1 mult_a0_mult_15_U515 ( .A(a1[4]), .B(mult_a0_mult_15_n511), .ZN(
        mult_a0_mult_15_n583) );
  OAI22_X1 mult_a0_mult_15_U514 ( .A1(mult_a0_mult_15_n583), .A2(
        mult_a0_mult_15_n557), .B1(mult_a0_mult_15_n534), .B2(
        mult_a0_mult_15_n584), .ZN(mult_a0_mult_15_n213) );
  XNOR2_X1 mult_a0_mult_15_U513 ( .A(mult_a0_mult_15_n429), .B(
        mult_a0_mult_15_n511), .ZN(mult_a0_mult_15_n582) );
  OAI22_X1 mult_a0_mult_15_U512 ( .A1(mult_a0_mult_15_n582), .A2(
        mult_a0_mult_15_n557), .B1(mult_a0_mult_15_n534), .B2(
        mult_a0_mult_15_n583), .ZN(mult_a0_mult_15_n214) );
  XNOR2_X1 mult_a0_mult_15_U511 ( .A(a1[2]), .B(mult_a0_mult_15_n511), .ZN(
        mult_a0_mult_15_n581) );
  OAI22_X1 mult_a0_mult_15_U510 ( .A1(mult_a0_mult_15_n581), .A2(
        mult_a0_mult_15_n557), .B1(mult_a0_mult_15_n534), .B2(
        mult_a0_mult_15_n582), .ZN(mult_a0_mult_15_n215) );
  XNOR2_X1 mult_a0_mult_15_U509 ( .A(a1[1]), .B(mult_a0_mult_15_n511), .ZN(
        mult_a0_mult_15_n580) );
  OAI22_X1 mult_a0_mult_15_U508 ( .A1(mult_a0_mult_15_n509), .A2(
        mult_a0_mult_15_n557), .B1(mult_a0_mult_15_n534), .B2(
        mult_a0_mult_15_n581), .ZN(mult_a0_mult_15_n216) );
  XNOR2_X1 mult_a0_mult_15_U507 ( .A(mult_a0_mult_15_n511), .B(a1[0]), .ZN(
        mult_a0_mult_15_n579) );
  OAI22_X1 mult_a0_mult_15_U506 ( .A1(mult_a0_mult_15_n579), .A2(
        mult_a0_mult_15_n557), .B1(mult_a0_mult_15_n580), .B2(
        mult_a0_mult_15_n534), .ZN(mult_a0_mult_15_n217) );
  XNOR2_X1 mult_a0_mult_15_U505 ( .A(a1[9]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n577) );
  OAI22_X1 mult_a0_mult_15_U504 ( .A1(mult_a0_mult_15_n536), .A2(
        mult_a0_mult_15_n577), .B1(mult_a0_mult_15_n568), .B2(
        mult_a0_mult_15_n577), .ZN(mult_a0_mult_15_n578) );
  XNOR2_X1 mult_a0_mult_15_U503 ( .A(a1[9]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n576) );
  OAI22_X1 mult_a0_mult_15_U502 ( .A1(mult_a0_mult_15_n576), .A2(
        mult_a0_mult_15_n568), .B1(mult_a0_mult_15_n577), .B2(
        mult_a0_mult_15_n536), .ZN(mult_a0_mult_15_n220) );
  XNOR2_X1 mult_a0_mult_15_U501 ( .A(a1[9]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n575) );
  OAI22_X1 mult_a0_mult_15_U500 ( .A1(mult_a0_mult_15_n575), .A2(
        mult_a0_mult_15_n568), .B1(mult_a0_mult_15_n576), .B2(
        mult_a0_mult_15_n536), .ZN(mult_a0_mult_15_n221) );
  XNOR2_X1 mult_a0_mult_15_U499 ( .A(a1[8]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n574) );
  OAI22_X1 mult_a0_mult_15_U498 ( .A1(mult_a0_mult_15_n574), .A2(
        mult_a0_mult_15_n568), .B1(mult_a0_mult_15_n575), .B2(
        mult_a0_mult_15_n536), .ZN(mult_a0_mult_15_n222) );
  XNOR2_X1 mult_a0_mult_15_U497 ( .A(a1[7]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n573) );
  OAI22_X1 mult_a0_mult_15_U496 ( .A1(mult_a0_mult_15_n573), .A2(
        mult_a0_mult_15_n568), .B1(mult_a0_mult_15_n574), .B2(
        mult_a0_mult_15_n536), .ZN(mult_a0_mult_15_n223) );
  XNOR2_X1 mult_a0_mult_15_U495 ( .A(a1[6]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n572) );
  OAI22_X1 mult_a0_mult_15_U494 ( .A1(mult_a0_mult_15_n572), .A2(
        mult_a0_mult_15_n568), .B1(mult_a0_mult_15_n573), .B2(
        mult_a0_mult_15_n536), .ZN(mult_a0_mult_15_n224) );
  XNOR2_X1 mult_a0_mult_15_U493 ( .A(a1[5]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n571) );
  OAI22_X1 mult_a0_mult_15_U492 ( .A1(mult_a0_mult_15_n571), .A2(
        mult_a0_mult_15_n568), .B1(mult_a0_mult_15_n572), .B2(
        mult_a0_mult_15_n536), .ZN(mult_a0_mult_15_n225) );
  XNOR2_X1 mult_a0_mult_15_U491 ( .A(a1[4]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n570) );
  OAI22_X1 mult_a0_mult_15_U490 ( .A1(mult_a0_mult_15_n570), .A2(
        mult_a0_mult_15_n568), .B1(mult_a0_mult_15_n571), .B2(
        mult_a0_mult_15_n536), .ZN(mult_a0_mult_15_n226) );
  XNOR2_X1 mult_a0_mult_15_U489 ( .A(a1[3]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n569) );
  OAI22_X1 mult_a0_mult_15_U488 ( .A1(mult_a0_mult_15_n508), .A2(
        mult_a0_mult_15_n568), .B1(mult_a0_mult_15_n570), .B2(
        mult_a0_mult_15_n536), .ZN(mult_a0_mult_15_n227) );
  OAI22_X1 mult_a0_mult_15_U487 ( .A1(mult_a0_mult_15_n567), .A2(
        mult_a0_mult_15_n568), .B1(mult_a0_mult_15_n569), .B2(
        mult_a0_mult_15_n536), .ZN(mult_a0_mult_15_n228) );
  OAI22_X1 mult_a0_mult_15_U486 ( .A1(mult_a0_mult_15_n565), .A2(
        mult_a0_mult_15_n553), .B1(mult_a0_mult_15_n554), .B2(
        mult_a0_mult_15_n566), .ZN(mult_a0_mult_15_n31) );
  OAI22_X1 mult_a0_mult_15_U485 ( .A1(mult_a0_mult_15_n561), .A2(
        mult_a0_mult_15_n562), .B1(mult_a0_mult_15_n563), .B2(
        mult_a0_mult_15_n564), .ZN(mult_a0_mult_15_n41) );
  OAI22_X1 mult_a0_mult_15_U484 ( .A1(mult_a0_mult_15_n559), .A2(
        mult_a0_mult_15_n549), .B1(mult_a0_mult_15_n550), .B2(
        mult_a0_mult_15_n560), .ZN(mult_a0_mult_15_n55) );
  OAI22_X1 mult_a0_mult_15_U483 ( .A1(mult_a0_mult_15_n556), .A2(
        mult_a0_mult_15_n557), .B1(mult_a0_mult_15_n534), .B2(
        mult_a0_mult_15_n558), .ZN(mult_a0_mult_15_n73) );
  OAI22_X1 mult_a0_mult_15_U482 ( .A1(mult_a0_mult_15_n552), .A2(
        mult_a0_mult_15_n553), .B1(mult_a0_mult_15_n554), .B2(
        mult_a0_mult_15_n555), .ZN(mult_a0_mult_15_n546) );
  OAI22_X1 mult_a0_mult_15_U481 ( .A1(mult_a0_mult_15_n548), .A2(
        mult_a0_mult_15_n549), .B1(mult_a0_mult_15_n550), .B2(
        mult_a0_mult_15_n551), .ZN(mult_a0_mult_15_n547) );
  OR2_X1 mult_a0_mult_15_U480 ( .A1(mult_a0_mult_15_n546), .A2(
        mult_a0_mult_15_n547), .ZN(mult_a0_mult_15_n83) );
  XNOR2_X1 mult_a0_mult_15_U479 ( .A(mult_a0_mult_15_n546), .B(
        mult_a0_mult_15_n547), .ZN(mult_a0_mult_15_n84) );
  NOR2_X1 mult_a0_mult_15_U478 ( .A1(mult_a0_mult_15_n536), .A2(
        mult_a0_mult_15_n537), .ZN(mult_a0_R_0_) );
  XNOR2_X1 mult_a0_mult_15_U477 ( .A(a1[9]), .B(mult_a0_mult_15_n519), .ZN(
        mult_a0_mult_15_n545) );
  OAI22_X1 mult_a0_mult_15_U476 ( .A1(mult_a0_mult_15_n545), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n545), .ZN(mult_a0_mult_15_n541) );
  OAI22_X1 mult_a0_mult_15_U475 ( .A1(mult_a0_mult_15_n542), .A2(
        mult_a0_mult_15_n543), .B1(mult_a0_mult_15_n544), .B2(
        mult_a0_mult_15_n545), .ZN(mult_a0_mult_15_n538) );
  AOI222_X1 mult_a0_mult_15_U474 ( .A1(mult_a0_mult_15_n5), .A2(
        mult_a0_mult_15_n27), .B1(mult_a0_mult_15_n522), .B2(
        mult_a0_mult_15_n5), .C1(mult_a0_mult_15_n522), .C2(
        mult_a0_mult_15_n27), .ZN(mult_a0_mult_15_n540) );
  OAI22_X1 mult_a0_mult_15_U473 ( .A1(mult_a0_mult_15_n540), .A2(
        mult_a0_mult_15_n541), .B1(mult_a0_mult_15_n522), .B2(
        mult_a0_mult_15_n540), .ZN(mult_a0_mult_15_n539) );
  AOI21_X1 mult_a0_mult_15_U472 ( .B1(mult_a0_mult_15_n521), .B2(
        mult_a0_mult_15_n538), .A(mult_a0_mult_15_n539), .ZN(mult_a0_R_23_) );
  INV_X1 mult_a0_mult_15_U471 ( .A(reg_out[3]), .ZN(mult_a0_mult_15_n512) );
  XOR2_X2 mult_a0_mult_15_U470 ( .A(reg_out[10]), .B(mult_a0_mult_15_n518), 
        .Z(mult_a0_mult_15_n544) );
  XOR2_X2 mult_a0_mult_15_U469 ( .A(reg_out[8]), .B(mult_a0_mult_15_n516), .Z(
        mult_a0_mult_15_n554) );
  XOR2_X2 mult_a0_mult_15_U468 ( .A(reg_out[6]), .B(mult_a0_mult_15_n514), .Z(
        mult_a0_mult_15_n563) );
  XOR2_X2 mult_a0_mult_15_U467 ( .A(reg_out[4]), .B(mult_a0_mult_15_n512), .Z(
        mult_a0_mult_15_n550) );
  INV_X2 mult_a0_mult_15_U466 ( .A(mult_a0_mult_15_n512), .ZN(
        mult_a0_mult_15_n511) );
  INV_X1 mult_a0_mult_15_U465 ( .A(a1[0]), .ZN(mult_a0_mult_15_n537) );
  MUX2_X1 mult_a0_mult_15_U464 ( .A(mult_a0_mult_15_n628), .B(
        mult_a0_mult_15_n627), .S(a1[0]), .Z(mult_a0_mult_15_n626) );
  XNOR2_X1 mult_a0_mult_15_U463 ( .A(a1[1]), .B(mult_a0_mult_15_n511), .ZN(
        mult_a0_mult_15_n509) );
  XNOR2_X1 mult_a0_mult_15_U462 ( .A(a1[3]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n508) );
  OAI222_X1 mult_a0_mult_15_U461 ( .A1(mult_a0_mult_15_n626), .A2(
        mult_a0_mult_15_n504), .B1(mult_a0_mult_15_n626), .B2(
        mult_a0_mult_15_n505), .C1(mult_a0_mult_15_n504), .C2(
        mult_a0_mult_15_n505), .ZN(mult_a0_mult_15_n503) );
  INV_X1 mult_a0_mult_15_U460 ( .A(mult_a0_mult_15_n134), .ZN(
        mult_a0_mult_15_n504) );
  INV_X1 mult_a0_mult_15_U459 ( .A(reg_out[11]), .ZN(mult_a0_mult_15_n520) );
  INV_X1 mult_a0_mult_15_U458 ( .A(reg_out[9]), .ZN(mult_a0_mult_15_n518) );
  INV_X1 mult_a0_mult_15_U457 ( .A(mult_a0_mult_15_n618), .ZN(
        mult_a0_mult_15_n524) );
  INV_X1 mult_a0_mult_15_U456 ( .A(mult_a0_mult_15_n609), .ZN(
        mult_a0_mult_15_n528) );
  INV_X1 mult_a0_mult_15_U455 ( .A(mult_a0_mult_15_n598), .ZN(
        mult_a0_mult_15_n531) );
  INV_X1 mult_a0_mult_15_U454 ( .A(mult_a0_mult_15_n41), .ZN(
        mult_a0_mult_15_n527) );
  INV_X1 mult_a0_mult_15_U453 ( .A(mult_a0_mult_15_n589), .ZN(
        mult_a0_mult_15_n533) );
  INV_X1 mult_a0_mult_15_U452 ( .A(mult_a0_mult_15_n73), .ZN(
        mult_a0_mult_15_n532) );
  INV_X1 mult_a0_mult_15_U451 ( .A(mult_a0_mult_15_n31), .ZN(
        mult_a0_mult_15_n523) );
  INV_X1 mult_a0_mult_15_U450 ( .A(mult_a0_mult_15_n578), .ZN(
        mult_a0_mult_15_n535) );
  INV_X1 mult_a0_mult_15_U449 ( .A(mult_a0_mult_15_n622), .ZN(
        mult_a0_mult_15_n505) );
  INV_X1 mult_a0_mult_15_U448 ( .A(mult_a0_mult_15_n624), .ZN(
        mult_a0_mult_15_n534) );
  INV_X1 mult_a0_mult_15_U447 ( .A(mult_a0_mult_15_n520), .ZN(
        mult_a0_mult_15_n519) );
  INV_X1 mult_a0_mult_15_U446 ( .A(mult_a0_mult_15_n541), .ZN(
        mult_a0_mult_15_n521) );
  INV_X1 mult_a0_mult_15_U445 ( .A(mult_a0_mult_15_n538), .ZN(
        mult_a0_mult_15_n522) );
  INV_X1 mult_a0_mult_15_U444 ( .A(mult_a0_mult_15_n112), .ZN(
        mult_a0_mult_15_n525) );
  INV_X1 mult_a0_mult_15_U443 ( .A(mult_a0_mult_15_n117), .ZN(
        mult_a0_mult_15_n526) );
  INV_X1 mult_a0_mult_15_U442 ( .A(mult_a0_mult_15_n55), .ZN(
        mult_a0_mult_15_n530) );
  INV_X1 mult_a0_mult_15_U441 ( .A(mult_a0_mult_15_n124), .ZN(
        mult_a0_mult_15_n529) );
  NAND2_X1 mult_a0_mult_15_U440 ( .A1(mult_a0_mult_15_n133), .A2(
        mult_a0_mult_15_n132), .ZN(mult_a0_mult_15_n502) );
  NAND2_X1 mult_a0_mult_15_U439 ( .A1(mult_a0_mult_15_n503), .A2(
        mult_a0_mult_15_n133), .ZN(mult_a0_mult_15_n501) );
  NAND2_X1 mult_a0_mult_15_U438 ( .A1(mult_a0_mult_15_n503), .A2(
        mult_a0_mult_15_n132), .ZN(mult_a0_mult_15_n500) );
  BUF_X4 mult_a0_mult_15_U437 ( .A(n5), .Z(mult_a0_mult_15_n510) );
  XNOR2_X1 mult_a0_mult_15_U436 ( .A(a1[2]), .B(mult_a0_mult_15_n510), .ZN(
        mult_a0_mult_15_n499) );
  NAND2_X1 mult_a0_mult_15_U435 ( .A1(mult_a0_mult_15_n131), .A2(
        mult_a0_mult_15_n128), .ZN(mult_a0_mult_15_n498) );
  NAND2_X1 mult_a0_mult_15_U434 ( .A1(mult_a0_mult_15_n450), .A2(
        mult_a0_mult_15_n131), .ZN(mult_a0_mult_15_n497) );
  NAND2_X1 mult_a0_mult_15_U433 ( .A1(mult_a0_mult_15_n450), .A2(
        mult_a0_mult_15_n128), .ZN(mult_a0_mult_15_n496) );
  NAND3_X1 mult_a0_mult_15_U432 ( .A1(mult_a0_mult_15_n493), .A2(
        mult_a0_mult_15_n494), .A3(mult_a0_mult_15_n495), .ZN(
        mult_a0_mult_15_n5) );
  NAND2_X1 mult_a0_mult_15_U431 ( .A1(mult_a0_mult_15_n28), .A2(
        mult_a0_mult_15_n6), .ZN(mult_a0_mult_15_n495) );
  NAND2_X1 mult_a0_mult_15_U430 ( .A1(mult_a0_mult_15_n29), .A2(
        mult_a0_mult_15_n6), .ZN(mult_a0_mult_15_n494) );
  NAND2_X1 mult_a0_mult_15_U429 ( .A1(mult_a0_mult_15_n29), .A2(
        mult_a0_mult_15_n28), .ZN(mult_a0_mult_15_n493) );
  NAND3_X1 mult_a0_mult_15_U428 ( .A1(mult_a0_mult_15_n490), .A2(
        mult_a0_mult_15_n491), .A3(mult_a0_mult_15_n492), .ZN(
        mult_a0_mult_15_n6) );
  NAND2_X1 mult_a0_mult_15_U427 ( .A1(mult_a0_mult_15_n33), .A2(
        mult_a0_mult_15_n7), .ZN(mult_a0_mult_15_n492) );
  NAND2_X1 mult_a0_mult_15_U426 ( .A1(mult_a0_mult_15_n30), .A2(
        mult_a0_mult_15_n7), .ZN(mult_a0_mult_15_n491) );
  NAND2_X1 mult_a0_mult_15_U425 ( .A1(mult_a0_mult_15_n30), .A2(
        mult_a0_mult_15_n33), .ZN(mult_a0_mult_15_n490) );
  XOR2_X1 mult_a0_mult_15_U424 ( .A(mult_a0_mult_15_n489), .B(
        mult_a0_mult_15_n7), .Z(prod_a1_2N[19]) );
  XOR2_X1 mult_a0_mult_15_U423 ( .A(mult_a0_mult_15_n30), .B(
        mult_a0_mult_15_n33), .Z(mult_a0_mult_15_n489) );
  NAND3_X1 mult_a0_mult_15_U422 ( .A1(mult_a0_mult_15_n488), .A2(
        mult_a0_mult_15_n487), .A3(mult_a0_mult_15_n486), .ZN(
        mult_a0_mult_15_n11) );
  NAND2_X1 mult_a0_mult_15_U421 ( .A1(mult_a0_mult_15_n65), .A2(
        mult_a0_mult_15_n435), .ZN(mult_a0_mult_15_n488) );
  NAND2_X1 mult_a0_mult_15_U420 ( .A1(mult_a0_mult_15_n12), .A2(
        mult_a0_mult_15_n58), .ZN(mult_a0_mult_15_n487) );
  NAND2_X1 mult_a0_mult_15_U419 ( .A1(mult_a0_mult_15_n58), .A2(
        mult_a0_mult_15_n65), .ZN(mult_a0_mult_15_n486) );
  XOR2_X1 mult_a0_mult_15_U418 ( .A(mult_a0_mult_15_n485), .B(
        mult_a0_mult_15_n436), .Z(prod_a1_2N[14]) );
  XOR2_X1 mult_a0_mult_15_U417 ( .A(mult_a0_mult_15_n58), .B(
        mult_a0_mult_15_n65), .Z(mult_a0_mult_15_n485) );
  NAND3_X1 mult_a0_mult_15_U416 ( .A1(mult_a0_mult_15_n482), .A2(
        mult_a0_mult_15_n483), .A3(mult_a0_mult_15_n484), .ZN(
        mult_a0_mult_15_n12) );
  NAND2_X1 mult_a0_mult_15_U415 ( .A1(mult_a0_mult_15_n13), .A2(
        mult_a0_mult_15_n75), .ZN(mult_a0_mult_15_n484) );
  NAND2_X1 mult_a0_mult_15_U414 ( .A1(mult_a0_mult_15_n66), .A2(
        mult_a0_mult_15_n13), .ZN(mult_a0_mult_15_n483) );
  NAND2_X1 mult_a0_mult_15_U413 ( .A1(mult_a0_mult_15_n66), .A2(
        mult_a0_mult_15_n75), .ZN(mult_a0_mult_15_n482) );
  NAND3_X1 mult_a0_mult_15_U412 ( .A1(mult_a0_mult_15_n479), .A2(
        mult_a0_mult_15_n480), .A3(mult_a0_mult_15_n481), .ZN(
        mult_a0_mult_15_n13) );
  NAND2_X1 mult_a0_mult_15_U411 ( .A1(mult_a0_mult_15_n76), .A2(
        mult_a0_mult_15_n85), .ZN(mult_a0_mult_15_n481) );
  NAND2_X1 mult_a0_mult_15_U410 ( .A1(mult_a0_mult_15_n14), .A2(
        mult_a0_mult_15_n85), .ZN(mult_a0_mult_15_n480) );
  NAND2_X1 mult_a0_mult_15_U409 ( .A1(mult_a0_mult_15_n466), .A2(
        mult_a0_mult_15_n76), .ZN(mult_a0_mult_15_n479) );
  NAND3_X1 mult_a0_mult_15_U408 ( .A1(mult_a0_mult_15_n476), .A2(
        mult_a0_mult_15_n477), .A3(mult_a0_mult_15_n478), .ZN(
        mult_a0_mult_15_n15) );
  NAND2_X1 mult_a0_mult_15_U407 ( .A1(mult_a0_mult_15_n96), .A2(
        mult_a0_mult_15_n103), .ZN(mult_a0_mult_15_n478) );
  NAND2_X1 mult_a0_mult_15_U406 ( .A1(mult_a0_mult_15_n16), .A2(
        mult_a0_mult_15_n103), .ZN(mult_a0_mult_15_n477) );
  NAND2_X1 mult_a0_mult_15_U405 ( .A1(mult_a0_mult_15_n16), .A2(
        mult_a0_mult_15_n96), .ZN(mult_a0_mult_15_n476) );
  NAND3_X1 mult_a0_mult_15_U404 ( .A1(mult_a0_mult_15_n473), .A2(
        mult_a0_mult_15_n474), .A3(mult_a0_mult_15_n475), .ZN(
        mult_a0_mult_15_n14) );
  NAND2_X1 mult_a0_mult_15_U403 ( .A1(mult_a0_mult_15_n86), .A2(
        mult_a0_mult_15_n95), .ZN(mult_a0_mult_15_n475) );
  NAND2_X1 mult_a0_mult_15_U402 ( .A1(mult_a0_mult_15_n15), .A2(
        mult_a0_mult_15_n95), .ZN(mult_a0_mult_15_n474) );
  NAND2_X1 mult_a0_mult_15_U401 ( .A1(mult_a0_mult_15_n469), .A2(
        mult_a0_mult_15_n86), .ZN(mult_a0_mult_15_n473) );
  XOR2_X1 mult_a0_mult_15_U400 ( .A(mult_a0_mult_15_n470), .B(
        mult_a0_mult_15_n472), .Z(prod_a1_2N[11]) );
  XOR2_X1 mult_a0_mult_15_U399 ( .A(mult_a0_mult_15_n86), .B(
        mult_a0_mult_15_n95), .Z(mult_a0_mult_15_n472) );
  NAND3_X1 mult_a0_mult_15_U398 ( .A1(mult_a0_mult_15_n480), .A2(
        mult_a0_mult_15_n479), .A3(mult_a0_mult_15_n481), .ZN(
        mult_a0_mult_15_n471) );
  NAND3_X1 mult_a0_mult_15_U397 ( .A1(mult_a0_mult_15_n476), .A2(
        mult_a0_mult_15_n477), .A3(mult_a0_mult_15_n478), .ZN(
        mult_a0_mult_15_n470) );
  NAND3_X1 mult_a0_mult_15_U396 ( .A1(mult_a0_mult_15_n476), .A2(
        mult_a0_mult_15_n477), .A3(mult_a0_mult_15_n478), .ZN(
        mult_a0_mult_15_n469) );
  XNOR2_X1 mult_a0_mult_15_U395 ( .A(mult_a0_mult_15_n96), .B(
        mult_a0_mult_15_n103), .ZN(mult_a0_mult_15_n468) );
  XNOR2_X1 mult_a0_mult_15_U394 ( .A(mult_a0_mult_15_n438), .B(
        mult_a0_mult_15_n468), .ZN(prod_a1_2N[10]) );
  NAND3_X1 mult_a0_mult_15_U393 ( .A1(mult_a0_mult_15_n473), .A2(
        mult_a0_mult_15_n474), .A3(mult_a0_mult_15_n475), .ZN(
        mult_a0_mult_15_n467) );
  NAND3_X1 mult_a0_mult_15_U392 ( .A1(mult_a0_mult_15_n473), .A2(
        mult_a0_mult_15_n474), .A3(mult_a0_mult_15_n475), .ZN(
        mult_a0_mult_15_n466) );
  NAND3_X1 mult_a0_mult_15_U391 ( .A1(mult_a0_mult_15_n463), .A2(
        mult_a0_mult_15_n464), .A3(mult_a0_mult_15_n465), .ZN(
        mult_a0_mult_15_n8) );
  NAND2_X1 mult_a0_mult_15_U390 ( .A1(mult_a0_mult_15_n43), .A2(
        mult_a0_mult_15_n38), .ZN(mult_a0_mult_15_n465) );
  NAND2_X1 mult_a0_mult_15_U389 ( .A1(mult_a0_mult_15_n9), .A2(
        mult_a0_mult_15_n38), .ZN(mult_a0_mult_15_n464) );
  NAND2_X1 mult_a0_mult_15_U388 ( .A1(mult_a0_mult_15_n453), .A2(
        mult_a0_mult_15_n43), .ZN(mult_a0_mult_15_n463) );
  XOR2_X1 mult_a0_mult_15_U387 ( .A(mult_a0_mult_15_n453), .B(
        mult_a0_mult_15_n462), .Z(prod_a1_2N[17]) );
  XOR2_X1 mult_a0_mult_15_U386 ( .A(mult_a0_mult_15_n43), .B(
        mult_a0_mult_15_n38), .Z(mult_a0_mult_15_n462) );
  NAND3_X1 mult_a0_mult_15_U385 ( .A1(mult_a0_mult_15_n459), .A2(
        mult_a0_mult_15_n460), .A3(mult_a0_mult_15_n461), .ZN(
        mult_a0_mult_15_n10) );
  NAND2_X1 mult_a0_mult_15_U384 ( .A1(mult_a0_mult_15_n50), .A2(
        mult_a0_mult_15_n57), .ZN(mult_a0_mult_15_n461) );
  NAND2_X1 mult_a0_mult_15_U383 ( .A1(mult_a0_mult_15_n11), .A2(
        mult_a0_mult_15_n57), .ZN(mult_a0_mult_15_n460) );
  NAND2_X1 mult_a0_mult_15_U382 ( .A1(mult_a0_mult_15_n433), .A2(
        mult_a0_mult_15_n50), .ZN(mult_a0_mult_15_n459) );
  XOR2_X1 mult_a0_mult_15_U381 ( .A(mult_a0_mult_15_n434), .B(
        mult_a0_mult_15_n458), .Z(prod_a1_2N[15]) );
  XOR2_X1 mult_a0_mult_15_U380 ( .A(mult_a0_mult_15_n50), .B(
        mult_a0_mult_15_n57), .Z(mult_a0_mult_15_n458) );
  NAND3_X1 mult_a0_mult_15_U379 ( .A1(mult_a0_mult_15_n455), .A2(
        mult_a0_mult_15_n456), .A3(mult_a0_mult_15_n457), .ZN(
        mult_a0_mult_15_n9) );
  NAND2_X1 mult_a0_mult_15_U378 ( .A1(mult_a0_mult_15_n44), .A2(
        mult_a0_mult_15_n49), .ZN(mult_a0_mult_15_n457) );
  NAND2_X1 mult_a0_mult_15_U377 ( .A1(mult_a0_mult_15_n10), .A2(
        mult_a0_mult_15_n49), .ZN(mult_a0_mult_15_n456) );
  NAND2_X1 mult_a0_mult_15_U376 ( .A1(mult_a0_mult_15_n431), .A2(
        mult_a0_mult_15_n44), .ZN(mult_a0_mult_15_n455) );
  XOR2_X1 mult_a0_mult_15_U375 ( .A(mult_a0_mult_15_n432), .B(
        mult_a0_mult_15_n454), .Z(prod_a1_2N[16]) );
  XOR2_X1 mult_a0_mult_15_U374 ( .A(mult_a0_mult_15_n44), .B(
        mult_a0_mult_15_n49), .Z(mult_a0_mult_15_n454) );
  NAND3_X1 mult_a0_mult_15_U373 ( .A1(mult_a0_mult_15_n455), .A2(
        mult_a0_mult_15_n456), .A3(mult_a0_mult_15_n457), .ZN(
        mult_a0_mult_15_n453) );
  NAND3_X1 mult_a0_mult_15_U372 ( .A1(mult_a0_mult_15_n500), .A2(
        mult_a0_mult_15_n501), .A3(mult_a0_mult_15_n502), .ZN(
        mult_a0_mult_15_n452) );
  XNOR2_X1 mult_a0_mult_15_U371 ( .A(mult_a0_mult_15_n449), .B(
        mult_a0_mult_15_n513), .ZN(mult_a0_mult_15_n451) );
  NAND3_X1 mult_a0_mult_15_U370 ( .A1(mult_a0_mult_15_n500), .A2(
        mult_a0_mult_15_n501), .A3(mult_a0_mult_15_n502), .ZN(
        mult_a0_mult_15_n450) );
  INV_X1 mult_a0_mult_15_U369 ( .A(mult_a0_mult_15_n428), .ZN(
        mult_a0_mult_15_n449) );
  XNOR2_X1 mult_a0_mult_15_U368 ( .A(mult_a0_mult_15_n29), .B(
        mult_a0_mult_15_n28), .ZN(mult_a0_mult_15_n448) );
  XNOR2_X1 mult_a0_mult_15_U367 ( .A(mult_a0_mult_15_n448), .B(
        mult_a0_mult_15_n6), .ZN(prod_a1_2N[20]) );
  NAND2_X1 mult_a0_mult_15_U366 ( .A1(mult_a0_mult_15_n215), .A2(
        mult_a0_mult_15_n226), .ZN(mult_a0_mult_15_n447) );
  NAND2_X1 mult_a0_mult_15_U365 ( .A1(mult_a0_mult_15_n130), .A2(
        mult_a0_mult_15_n226), .ZN(mult_a0_mult_15_n446) );
  NAND2_X1 mult_a0_mult_15_U364 ( .A1(mult_a0_mult_15_n130), .A2(
        mult_a0_mult_15_n215), .ZN(mult_a0_mult_15_n445) );
  XOR2_X1 mult_a0_mult_15_U363 ( .A(mult_a0_mult_15_n130), .B(
        mult_a0_mult_15_n444), .Z(mult_a0_mult_15_n128) );
  XOR2_X1 mult_a0_mult_15_U362 ( .A(mult_a0_mult_15_n215), .B(
        mult_a0_mult_15_n226), .Z(mult_a0_mult_15_n444) );
  BUF_X2 mult_a0_mult_15_U361 ( .A(mult_a0_mult_15_n429), .Z(
        mult_a0_mult_15_n443) );
  NAND3_X1 mult_a0_mult_15_U360 ( .A1(mult_a0_mult_15_n441), .A2(
        mult_a0_mult_15_n440), .A3(mult_a0_mult_15_n442), .ZN(
        mult_a0_mult_15_n16) );
  NAND2_X1 mult_a0_mult_15_U359 ( .A1(mult_a0_mult_15_n104), .A2(
        mult_a0_mult_15_n111), .ZN(mult_a0_mult_15_n442) );
  NAND2_X1 mult_a0_mult_15_U358 ( .A1(mult_a0_mult_15_n17), .A2(
        mult_a0_mult_15_n111), .ZN(mult_a0_mult_15_n441) );
  NAND2_X1 mult_a0_mult_15_U357 ( .A1(mult_a0_mult_15_n17), .A2(
        mult_a0_mult_15_n104), .ZN(mult_a0_mult_15_n440) );
  XOR2_X1 mult_a0_mult_15_U356 ( .A(mult_a0_mult_15_n17), .B(
        mult_a0_mult_15_n439), .Z(prod_a1_2N[9]) );
  XOR2_X1 mult_a0_mult_15_U355 ( .A(mult_a0_mult_15_n104), .B(
        mult_a0_mult_15_n111), .Z(mult_a0_mult_15_n439) );
  NAND2_X1 mult_a0_mult_15_U354 ( .A1(mult_a0_mult_15_n629), .A2(
        mult_a0_mult_15_n417), .ZN(mult_a0_mult_15_n628) );
  NAND3_X1 mult_a0_mult_15_U353 ( .A1(mult_a0_mult_15_n440), .A2(
        mult_a0_mult_15_n441), .A3(mult_a0_mult_15_n442), .ZN(
        mult_a0_mult_15_n438) );
  XNOR2_X1 mult_a0_mult_15_U352 ( .A(mult_a0_mult_15_n76), .B(
        mult_a0_mult_15_n85), .ZN(mult_a0_mult_15_n437) );
  XNOR2_X1 mult_a0_mult_15_U351 ( .A(mult_a0_mult_15_n467), .B(
        mult_a0_mult_15_n437), .ZN(prod_a1_2N[12]) );
  NAND3_X1 mult_a0_mult_15_U350 ( .A1(mult_a0_mult_15_n482), .A2(
        mult_a0_mult_15_n483), .A3(mult_a0_mult_15_n484), .ZN(
        mult_a0_mult_15_n436) );
  NAND3_X1 mult_a0_mult_15_U349 ( .A1(mult_a0_mult_15_n482), .A2(
        mult_a0_mult_15_n483), .A3(mult_a0_mult_15_n484), .ZN(
        mult_a0_mult_15_n435) );
  NAND3_X1 mult_a0_mult_15_U348 ( .A1(mult_a0_mult_15_n488), .A2(
        mult_a0_mult_15_n487), .A3(mult_a0_mult_15_n486), .ZN(
        mult_a0_mult_15_n434) );
  NAND3_X1 mult_a0_mult_15_U347 ( .A1(mult_a0_mult_15_n488), .A2(
        mult_a0_mult_15_n487), .A3(mult_a0_mult_15_n486), .ZN(
        mult_a0_mult_15_n433) );
  NAND3_X1 mult_a0_mult_15_U346 ( .A1(mult_a0_mult_15_n459), .A2(
        mult_a0_mult_15_n460), .A3(mult_a0_mult_15_n461), .ZN(
        mult_a0_mult_15_n432) );
  NAND3_X1 mult_a0_mult_15_U345 ( .A1(mult_a0_mult_15_n459), .A2(
        mult_a0_mult_15_n460), .A3(mult_a0_mult_15_n461), .ZN(
        mult_a0_mult_15_n431) );
  BUF_X2 mult_a0_mult_15_U344 ( .A(a1[2]), .Z(mult_a0_mult_15_n430) );
  INV_X1 mult_a0_mult_15_U343 ( .A(a1[1]), .ZN(mult_a0_mult_15_n428) );
  AND2_X1 mult_a0_mult_15_U342 ( .A1(mult_a0_mult_15_n123), .A2(
        mult_a0_mult_15_n118), .ZN(mult_a0_mult_15_n427) );
  AND2_X1 mult_a0_mult_15_U341 ( .A1(mult_a0_mult_15_n620), .A2(
        mult_a0_mult_15_n123), .ZN(mult_a0_mult_15_n426) );
  AND2_X1 mult_a0_mult_15_U340 ( .A1(mult_a0_mult_15_n620), .A2(
        mult_a0_mult_15_n118), .ZN(mult_a0_mult_15_n425) );
  NOR3_X1 mult_a0_mult_15_U339 ( .A1(mult_a0_mult_15_n425), .A2(
        mult_a0_mult_15_n426), .A3(mult_a0_mult_15_n427), .ZN(
        mult_a0_mult_15_n619) );
  AND3_X1 mult_a0_mult_15_U338 ( .A1(mult_a0_mult_15_n422), .A2(
        mult_a0_mult_15_n423), .A3(mult_a0_mult_15_n424), .ZN(
        mult_a0_mult_15_n507) );
  NAND2_X1 mult_a0_mult_15_U337 ( .A1(mult_a0_mult_15_n128), .A2(
        mult_a0_mult_15_n131), .ZN(mult_a0_mult_15_n424) );
  NAND2_X1 mult_a0_mult_15_U336 ( .A1(mult_a0_mult_15_n452), .A2(
        mult_a0_mult_15_n131), .ZN(mult_a0_mult_15_n423) );
  NAND2_X1 mult_a0_mult_15_U335 ( .A1(mult_a0_mult_15_n450), .A2(
        mult_a0_mult_15_n128), .ZN(mult_a0_mult_15_n422) );
  XNOR2_X1 mult_a0_mult_15_U334 ( .A(mult_a0_mult_15_n66), .B(
        mult_a0_mult_15_n75), .ZN(mult_a0_mult_15_n421) );
  XNOR2_X1 mult_a0_mult_15_U333 ( .A(mult_a0_mult_15_n421), .B(
        mult_a0_mult_15_n471), .ZN(prod_a1_2N[13]) );
  OAI222_X1 mult_a0_mult_15_U332 ( .A1(mult_a0_mult_15_n507), .A2(
        mult_a0_mult_15_n529), .B1(mult_a0_mult_15_n621), .B2(
        mult_a0_mult_15_n418), .C1(mult_a0_mult_15_n418), .C2(
        mult_a0_mult_15_n529), .ZN(mult_a0_mult_15_n420) );
  BUF_X2 mult_a0_mult_15_U331 ( .A(a1[3]), .Z(mult_a0_mult_15_n429) );
  AND3_X1 mult_a0_mult_15_U330 ( .A1(mult_a0_mult_15_n496), .A2(
        mult_a0_mult_15_n497), .A3(mult_a0_mult_15_n498), .ZN(
        mult_a0_mult_15_n621) );
  AND3_X1 mult_a0_mult_15_U329 ( .A1(mult_a0_mult_15_n496), .A2(
        mult_a0_mult_15_n497), .A3(mult_a0_mult_15_n498), .ZN(
        mult_a0_mult_15_n419) );
  AND3_X1 mult_a0_mult_15_U328 ( .A1(mult_a0_mult_15_n445), .A2(
        mult_a0_mult_15_n446), .A3(mult_a0_mult_15_n447), .ZN(
        mult_a0_mult_15_n418) );
  AND2_X1 mult_a0_mult_15_U327 ( .A1(mult_a0_mult_15_n428), .A2(
        mult_a0_mult_15_n510), .ZN(mult_a0_mult_15_n417) );
  AND3_X1 mult_a0_mult_15_U326 ( .A1(mult_a0_mult_15_n414), .A2(
        mult_a0_mult_15_n415), .A3(mult_a0_mult_15_n416), .ZN(
        mult_a0_mult_15_n506) );
  NAND2_X1 mult_a0_mult_15_U325 ( .A1(mult_a0_mult_15_n123), .A2(
        mult_a0_mult_15_n118), .ZN(mult_a0_mult_15_n416) );
  NAND2_X1 mult_a0_mult_15_U324 ( .A1(mult_a0_mult_15_n420), .A2(
        mult_a0_mult_15_n123), .ZN(mult_a0_mult_15_n415) );
  NAND2_X1 mult_a0_mult_15_U323 ( .A1(mult_a0_mult_15_n420), .A2(
        mult_a0_mult_15_n118), .ZN(mult_a0_mult_15_n414) );
  INV_X1 mult_a0_mult_15_U322 ( .A(reg_out[0]), .ZN(mult_a0_mult_15_n536) );
  INV_X1 mult_a0_mult_15_U321 ( .A(mult_a0_mult_15_n518), .ZN(
        mult_a0_mult_15_n517) );
  INV_X1 mult_a0_mult_15_U320 ( .A(reg_out[7]), .ZN(mult_a0_mult_15_n516) );
  INV_X1 mult_a0_mult_15_U319 ( .A(mult_a0_mult_15_n516), .ZN(
        mult_a0_mult_15_n515) );
  INV_X1 mult_a0_mult_15_U318 ( .A(reg_out[5]), .ZN(mult_a0_mult_15_n514) );
  INV_X1 mult_a0_mult_15_U317 ( .A(mult_a0_mult_15_n514), .ZN(
        mult_a0_mult_15_n513) );
  HA_X1 mult_a0_mult_15_U81 ( .A(mult_a0_mult_15_n217), .B(
        mult_a0_mult_15_n228), .CO(mult_a0_mult_15_n133), .S(
        mult_a0_mult_15_n134) );
  FA_X1 mult_a0_mult_15_U80 ( .A(mult_a0_mult_15_n227), .B(
        mult_a0_mult_15_n206), .CI(mult_a0_mult_15_n216), .CO(
        mult_a0_mult_15_n131), .S(mult_a0_mult_15_n132) );
  HA_X1 mult_a0_mult_15_U79 ( .A(mult_a0_mult_15_n205), .B(
        mult_a0_mult_15_n156), .CO(mult_a0_mult_15_n129), .S(
        mult_a0_mult_15_n130) );
  FA_X1 mult_a0_mult_15_U77 ( .A(mult_a0_mult_15_n225), .B(
        mult_a0_mult_15_n194), .CI(mult_a0_mult_15_n214), .CO(
        mult_a0_mult_15_n125), .S(mult_a0_mult_15_n126) );
  FA_X1 mult_a0_mult_15_U76 ( .A(mult_a0_mult_15_n129), .B(
        mult_a0_mult_15_n204), .CI(mult_a0_mult_15_n126), .CO(
        mult_a0_mult_15_n123), .S(mult_a0_mult_15_n124) );
  HA_X1 mult_a0_mult_15_U75 ( .A(mult_a0_mult_15_n155), .B(
        mult_a0_mult_15_n193), .CO(mult_a0_mult_15_n121), .S(
        mult_a0_mult_15_n122) );
  FA_X1 mult_a0_mult_15_U74 ( .A(mult_a0_mult_15_n203), .B(
        mult_a0_mult_15_n224), .CI(mult_a0_mult_15_n213), .CO(
        mult_a0_mult_15_n119), .S(mult_a0_mult_15_n120) );
  FA_X1 mult_a0_mult_15_U73 ( .A(mult_a0_mult_15_n125), .B(
        mult_a0_mult_15_n122), .CI(mult_a0_mult_15_n120), .CO(
        mult_a0_mult_15_n117), .S(mult_a0_mult_15_n118) );
  FA_X1 mult_a0_mult_15_U72 ( .A(mult_a0_mult_15_n202), .B(
        mult_a0_mult_15_n182), .CI(mult_a0_mult_15_n223), .CO(
        mult_a0_mult_15_n115), .S(mult_a0_mult_15_n116) );
  FA_X1 mult_a0_mult_15_U71 ( .A(mult_a0_mult_15_n192), .B(
        mult_a0_mult_15_n212), .CI(mult_a0_mult_15_n121), .CO(
        mult_a0_mult_15_n113), .S(mult_a0_mult_15_n114) );
  FA_X1 mult_a0_mult_15_U70 ( .A(mult_a0_mult_15_n116), .B(
        mult_a0_mult_15_n119), .CI(mult_a0_mult_15_n114), .CO(
        mult_a0_mult_15_n111), .S(mult_a0_mult_15_n112) );
  HA_X1 mult_a0_mult_15_U69 ( .A(mult_a0_mult_15_n154), .B(
        mult_a0_mult_15_n181), .CO(mult_a0_mult_15_n109), .S(
        mult_a0_mult_15_n110) );
  FA_X1 mult_a0_mult_15_U68 ( .A(mult_a0_mult_15_n191), .B(
        mult_a0_mult_15_n201), .CI(mult_a0_mult_15_n211), .CO(
        mult_a0_mult_15_n107), .S(mult_a0_mult_15_n108) );
  FA_X1 mult_a0_mult_15_U67 ( .A(mult_a0_mult_15_n110), .B(
        mult_a0_mult_15_n222), .CI(mult_a0_mult_15_n115), .CO(
        mult_a0_mult_15_n105), .S(mult_a0_mult_15_n106) );
  FA_X1 mult_a0_mult_15_U66 ( .A(mult_a0_mult_15_n108), .B(
        mult_a0_mult_15_n113), .CI(mult_a0_mult_15_n106), .CO(
        mult_a0_mult_15_n103), .S(mult_a0_mult_15_n104) );
  FA_X1 mult_a0_mult_15_U65 ( .A(mult_a0_mult_15_n190), .B(
        mult_a0_mult_15_n170), .CI(mult_a0_mult_15_n221), .CO(
        mult_a0_mult_15_n101), .S(mult_a0_mult_15_n102) );
  FA_X1 mult_a0_mult_15_U64 ( .A(mult_a0_mult_15_n180), .B(
        mult_a0_mult_15_n210), .CI(mult_a0_mult_15_n200), .CO(
        mult_a0_mult_15_n99), .S(mult_a0_mult_15_n100) );
  FA_X1 mult_a0_mult_15_U63 ( .A(mult_a0_mult_15_n107), .B(
        mult_a0_mult_15_n109), .CI(mult_a0_mult_15_n102), .CO(
        mult_a0_mult_15_n97), .S(mult_a0_mult_15_n98) );
  FA_X1 mult_a0_mult_15_U62 ( .A(mult_a0_mult_15_n105), .B(
        mult_a0_mult_15_n100), .CI(mult_a0_mult_15_n98), .CO(
        mult_a0_mult_15_n95), .S(mult_a0_mult_15_n96) );
  HA_X1 mult_a0_mult_15_U61 ( .A(mult_a0_mult_15_n153), .B(
        mult_a0_mult_15_n169), .CO(mult_a0_mult_15_n93), .S(
        mult_a0_mult_15_n94) );
  FA_X1 mult_a0_mult_15_U60 ( .A(mult_a0_mult_15_n179), .B(
        mult_a0_mult_15_n199), .CI(mult_a0_mult_15_n220), .CO(
        mult_a0_mult_15_n91), .S(mult_a0_mult_15_n92) );
  FA_X1 mult_a0_mult_15_U59 ( .A(mult_a0_mult_15_n189), .B(
        mult_a0_mult_15_n209), .CI(mult_a0_mult_15_n94), .CO(
        mult_a0_mult_15_n89), .S(mult_a0_mult_15_n90) );
  FA_X1 mult_a0_mult_15_U58 ( .A(mult_a0_mult_15_n99), .B(mult_a0_mult_15_n101), .CI(mult_a0_mult_15_n92), .CO(mult_a0_mult_15_n87), .S(mult_a0_mult_15_n88)
         );
  FA_X1 mult_a0_mult_15_U57 ( .A(mult_a0_mult_15_n97), .B(mult_a0_mult_15_n90), 
        .CI(mult_a0_mult_15_n88), .CO(mult_a0_mult_15_n85), .S(
        mult_a0_mult_15_n86) );
  FA_X1 mult_a0_mult_15_U54 ( .A(mult_a0_mult_15_n208), .B(
        mult_a0_mult_15_n188), .CI(mult_a0_mult_15_n535), .CO(
        mult_a0_mult_15_n81), .S(mult_a0_mult_15_n82) );
  FA_X1 mult_a0_mult_15_U53 ( .A(mult_a0_mult_15_n93), .B(mult_a0_mult_15_n168), .CI(mult_a0_mult_15_n84), .CO(mult_a0_mult_15_n79), .S(mult_a0_mult_15_n80)
         );
  FA_X1 mult_a0_mult_15_U52 ( .A(mult_a0_mult_15_n82), .B(mult_a0_mult_15_n91), 
        .CI(mult_a0_mult_15_n89), .CO(mult_a0_mult_15_n77), .S(
        mult_a0_mult_15_n78) );
  FA_X1 mult_a0_mult_15_U51 ( .A(mult_a0_mult_15_n87), .B(mult_a0_mult_15_n80), 
        .CI(mult_a0_mult_15_n78), .CO(mult_a0_mult_15_n75), .S(
        mult_a0_mult_15_n76) );
  FA_X1 mult_a0_mult_15_U49 ( .A(mult_a0_mult_15_n197), .B(
        mult_a0_mult_15_n177), .CI(mult_a0_mult_15_n167), .CO(
        mult_a0_mult_15_n71), .S(mult_a0_mult_15_n72) );
  FA_X1 mult_a0_mult_15_U48 ( .A(mult_a0_mult_15_n532), .B(
        mult_a0_mult_15_n187), .CI(mult_a0_mult_15_n83), .CO(
        mult_a0_mult_15_n69), .S(mult_a0_mult_15_n70) );
  FA_X1 mult_a0_mult_15_U47 ( .A(mult_a0_mult_15_n72), .B(mult_a0_mult_15_n81), 
        .CI(mult_a0_mult_15_n79), .CO(mult_a0_mult_15_n67), .S(
        mult_a0_mult_15_n68) );
  FA_X1 mult_a0_mult_15_U46 ( .A(mult_a0_mult_15_n77), .B(mult_a0_mult_15_n70), 
        .CI(mult_a0_mult_15_n68), .CO(mult_a0_mult_15_n65), .S(
        mult_a0_mult_15_n66) );
  FA_X1 mult_a0_mult_15_U45 ( .A(mult_a0_mult_15_n196), .B(
        mult_a0_mult_15_n166), .CI(mult_a0_mult_15_n533), .CO(
        mult_a0_mult_15_n63), .S(mult_a0_mult_15_n64) );
  FA_X1 mult_a0_mult_15_U44 ( .A(mult_a0_mult_15_n73), .B(mult_a0_mult_15_n186), .CI(mult_a0_mult_15_n176), .CO(mult_a0_mult_15_n61), .S(mult_a0_mult_15_n62)
         );
  FA_X1 mult_a0_mult_15_U43 ( .A(mult_a0_mult_15_n69), .B(mult_a0_mult_15_n71), 
        .CI(mult_a0_mult_15_n62), .CO(mult_a0_mult_15_n59), .S(
        mult_a0_mult_15_n60) );
  FA_X1 mult_a0_mult_15_U42 ( .A(mult_a0_mult_15_n67), .B(mult_a0_mult_15_n64), 
        .CI(mult_a0_mult_15_n60), .CO(mult_a0_mult_15_n57), .S(
        mult_a0_mult_15_n58) );
  FA_X1 mult_a0_mult_15_U40 ( .A(mult_a0_mult_15_n165), .B(
        mult_a0_mult_15_n175), .CI(mult_a0_mult_15_n185), .CO(
        mult_a0_mult_15_n53), .S(mult_a0_mult_15_n54) );
  FA_X1 mult_a0_mult_15_U39 ( .A(mult_a0_mult_15_n63), .B(mult_a0_mult_15_n530), .CI(mult_a0_mult_15_n61), .CO(mult_a0_mult_15_n51), .S(mult_a0_mult_15_n52)
         );
  FA_X1 mult_a0_mult_15_U38 ( .A(mult_a0_mult_15_n52), .B(mult_a0_mult_15_n54), 
        .CI(mult_a0_mult_15_n59), .CO(mult_a0_mult_15_n49), .S(
        mult_a0_mult_15_n50) );
  FA_X1 mult_a0_mult_15_U37 ( .A(mult_a0_mult_15_n174), .B(
        mult_a0_mult_15_n164), .CI(mult_a0_mult_15_n531), .CO(
        mult_a0_mult_15_n47), .S(mult_a0_mult_15_n48) );
  FA_X1 mult_a0_mult_15_U36 ( .A(mult_a0_mult_15_n55), .B(mult_a0_mult_15_n184), .CI(mult_a0_mult_15_n53), .CO(mult_a0_mult_15_n45), .S(mult_a0_mult_15_n46)
         );
  FA_X1 mult_a0_mult_15_U35 ( .A(mult_a0_mult_15_n51), .B(mult_a0_mult_15_n48), 
        .CI(mult_a0_mult_15_n46), .CO(mult_a0_mult_15_n43), .S(
        mult_a0_mult_15_n44) );
  FA_X1 mult_a0_mult_15_U33 ( .A(mult_a0_mult_15_n163), .B(
        mult_a0_mult_15_n173), .CI(mult_a0_mult_15_n527), .CO(
        mult_a0_mult_15_n39), .S(mult_a0_mult_15_n40) );
  FA_X1 mult_a0_mult_15_U32 ( .A(mult_a0_mult_15_n40), .B(mult_a0_mult_15_n47), 
        .CI(mult_a0_mult_15_n45), .CO(mult_a0_mult_15_n37), .S(
        mult_a0_mult_15_n38) );
  FA_X1 mult_a0_mult_15_U31 ( .A(mult_a0_mult_15_n172), .B(mult_a0_mult_15_n41), .CI(mult_a0_mult_15_n528), .CO(mult_a0_mult_15_n35), .S(mult_a0_mult_15_n36)
         );
  FA_X1 mult_a0_mult_15_U30 ( .A(mult_a0_mult_15_n39), .B(mult_a0_mult_15_n162), .CI(mult_a0_mult_15_n36), .CO(mult_a0_mult_15_n33), .S(mult_a0_mult_15_n34)
         );
  FA_X1 mult_a0_mult_15_U28 ( .A(mult_a0_mult_15_n523), .B(
        mult_a0_mult_15_n161), .CI(mult_a0_mult_15_n35), .CO(
        mult_a0_mult_15_n29), .S(mult_a0_mult_15_n30) );
  FA_X1 mult_a0_mult_15_U27 ( .A(mult_a0_mult_15_n160), .B(mult_a0_mult_15_n31), .CI(mult_a0_mult_15_n524), .CO(mult_a0_mult_15_n27), .S(mult_a0_mult_15_n28)
         );
  FA_X1 mult_a0_mult_15_U8 ( .A(mult_a0_mult_15_n34), .B(mult_a0_mult_15_n37), 
        .CI(mult_a0_mult_15_n8), .CO(mult_a0_mult_15_n7), .S(prod_a1_2N[18])
         );
  CLKBUF_X3 add_a0_U2 ( .A(add_a0_n4), .Z(sum_a0[11]) );
  XOR2_X1 add_a0_add_16_U46 ( .A(prod_a1_2N[9]), .B(DIN_samp[0]), .Z(sum_a0[0]) );
  XOR2_X1 add_a0_add_16_U45 ( .A(add_a0_add_16_carry[11]), .B(
        add_a0_add_16_n31), .Z(add_a0_n4) );
  NAND3_X1 add_a0_add_16_U44 ( .A1(add_a0_add_16_n28), .A2(add_a0_add_16_n29), 
        .A3(add_a0_add_16_n30), .ZN(add_a0_add_16_carry[5]) );
  NAND2_X1 add_a0_add_16_U43 ( .A1(prod_a1_2N[13]), .A2(DIN_samp[4]), .ZN(
        add_a0_add_16_n30) );
  NAND2_X1 add_a0_add_16_U42 ( .A1(add_a0_add_16_carry[4]), .A2(DIN_samp[4]), 
        .ZN(add_a0_add_16_n29) );
  NAND2_X1 add_a0_add_16_U41 ( .A1(add_a0_add_16_carry[4]), .A2(prod_a1_2N[13]), .ZN(add_a0_add_16_n28) );
  XOR2_X1 add_a0_add_16_U40 ( .A(add_a0_add_16_n26), .B(add_a0_add_16_n27), 
        .Z(sum_a0[4]) );
  XOR2_X1 add_a0_add_16_U39 ( .A(prod_a1_2N[13]), .B(DIN_samp[4]), .Z(
        add_a0_add_16_n27) );
  CLKBUF_X1 add_a0_add_16_U38 ( .A(add_a0_add_16_carry[4]), .Z(
        add_a0_add_16_n26) );
  NAND3_X1 add_a0_add_16_U37 ( .A1(add_a0_add_16_n23), .A2(add_a0_add_16_n24), 
        .A3(add_a0_add_16_n25), .ZN(add_a0_add_16_carry[3]) );
  NAND2_X1 add_a0_add_16_U36 ( .A1(prod_a1_2N[11]), .A2(DIN_samp[2]), .ZN(
        add_a0_add_16_n25) );
  NAND2_X1 add_a0_add_16_U35 ( .A1(add_a0_add_16_carry[2]), .A2(DIN_samp[2]), 
        .ZN(add_a0_add_16_n24) );
  NAND2_X1 add_a0_add_16_U34 ( .A1(add_a0_add_16_carry[2]), .A2(prod_a1_2N[11]), .ZN(add_a0_add_16_n23) );
  XOR2_X1 add_a0_add_16_U33 ( .A(add_a0_add_16_carry[2]), .B(add_a0_add_16_n22), .Z(sum_a0[2]) );
  XOR2_X1 add_a0_add_16_U32 ( .A(prod_a1_2N[11]), .B(DIN_samp[2]), .Z(
        add_a0_add_16_n22) );
  NAND3_X1 add_a0_add_16_U31 ( .A1(add_a0_add_16_n20), .A2(add_a0_add_16_n21), 
        .A3(add_a0_add_16_n19), .ZN(add_a0_add_16_carry[7]) );
  NAND2_X1 add_a0_add_16_U30 ( .A1(add_a0_add_16_n6), .A2(DIN_samp[6]), .ZN(
        add_a0_add_16_n21) );
  NAND2_X1 add_a0_add_16_U29 ( .A1(prod_a1_2N[15]), .A2(add_a0_add_16_carry[6]), .ZN(add_a0_add_16_n20) );
  NAND2_X1 add_a0_add_16_U28 ( .A1(prod_a1_2N[15]), .A2(DIN_samp[6]), .ZN(
        add_a0_add_16_n19) );
  XOR2_X1 add_a0_add_16_U27 ( .A(add_a0_add_16_n18), .B(add_a0_add_16_n7), .Z(
        sum_a0[6]) );
  XOR2_X1 add_a0_add_16_U26 ( .A(prod_a1_2N[15]), .B(DIN_samp[6]), .Z(
        add_a0_add_16_n18) );
  NAND2_X1 add_a0_add_16_U25 ( .A1(prod_a1_2N[14]), .A2(add_a0_add_16_n12), 
        .ZN(add_a0_add_16_n17) );
  NAND2_X1 add_a0_add_16_U24 ( .A1(DIN_samp[5]), .A2(add_a0_add_16_carry[5]), 
        .ZN(add_a0_add_16_n16) );
  NAND2_X1 add_a0_add_16_U23 ( .A1(DIN_samp[5]), .A2(prod_a1_2N[14]), .ZN(
        add_a0_add_16_n15) );
  XOR2_X1 add_a0_add_16_U22 ( .A(add_a0_add_16_n14), .B(add_a0_add_16_carry[5]), .Z(sum_a0[5]) );
  XOR2_X1 add_a0_add_16_U21 ( .A(DIN_samp[5]), .B(prod_a1_2N[14]), .Z(
        add_a0_add_16_n14) );
  XNOR2_X1 add_a0_add_16_U20 ( .A(prod_a1_2N[20]), .B(add_a0_add_16_n13), .ZN(
        add_a0_add_16_n31) );
  NAND3_X1 add_a0_add_16_U19 ( .A1(add_a0_add_16_n29), .A2(add_a0_add_16_n28), 
        .A3(add_a0_add_16_n30), .ZN(add_a0_add_16_n12) );
  NAND3_X1 add_a0_add_16_U18 ( .A1(add_a0_add_16_n9), .A2(add_a0_add_16_n10), 
        .A3(add_a0_add_16_n11), .ZN(add_a0_add_16_carry[9]) );
  NAND2_X1 add_a0_add_16_U17 ( .A1(prod_a1_2N[17]), .A2(DIN_samp[8]), .ZN(
        add_a0_add_16_n11) );
  NAND2_X1 add_a0_add_16_U16 ( .A1(add_a0_add_16_carry[8]), .A2(DIN_samp[8]), 
        .ZN(add_a0_add_16_n10) );
  NAND2_X1 add_a0_add_16_U15 ( .A1(add_a0_add_16_carry[8]), .A2(prod_a1_2N[17]), .ZN(add_a0_add_16_n9) );
  XOR2_X1 add_a0_add_16_U14 ( .A(add_a0_add_16_carry[8]), .B(add_a0_add_16_n8), 
        .Z(sum_a0[8]) );
  NAND3_X1 add_a0_add_16_U13 ( .A1(add_a0_add_16_n16), .A2(add_a0_add_16_n17), 
        .A3(add_a0_add_16_n15), .ZN(add_a0_add_16_carry[6]) );
  NAND3_X1 add_a0_add_16_U12 ( .A1(add_a0_add_16_n16), .A2(add_a0_add_16_n17), 
        .A3(add_a0_add_16_n15), .ZN(add_a0_add_16_n7) );
  NAND3_X1 add_a0_add_16_U11 ( .A1(add_a0_add_16_n16), .A2(add_a0_add_16_n17), 
        .A3(add_a0_add_16_n15), .ZN(add_a0_add_16_n6) );
  NAND3_X1 add_a0_add_16_U10 ( .A1(add_a0_add_16_n3), .A2(add_a0_add_16_n4), 
        .A3(add_a0_add_16_n5), .ZN(add_a0_add_16_carry[2]) );
  NAND2_X1 add_a0_add_16_U9 ( .A1(add_a0_add_16_n32), .A2(DIN_samp[1]), .ZN(
        add_a0_add_16_n5) );
  NAND2_X1 add_a0_add_16_U8 ( .A1(prod_a1_2N[10]), .A2(DIN_samp[1]), .ZN(
        add_a0_add_16_n4) );
  NAND2_X1 add_a0_add_16_U7 ( .A1(prod_a1_2N[10]), .A2(add_a0_add_16_n32), 
        .ZN(add_a0_add_16_n3) );
  XOR2_X2 add_a0_add_16_U6 ( .A(prod_a1_2N[10]), .B(add_a0_add_16_n2), .Z(
        sum_a0[1]) );
  XOR2_X1 add_a0_add_16_U5 ( .A(add_a0_add_16_n32), .B(DIN_samp[1]), .Z(
        add_a0_add_16_n2) );
  XNOR2_X1 add_a0_add_16_U4 ( .A(prod_a1_2N[17]), .B(add_a0_add_16_n1), .ZN(
        add_a0_add_16_n8) );
  INV_X1 add_a0_add_16_U3 ( .A(DIN_samp[11]), .ZN(add_a0_add_16_n13) );
  INV_X1 add_a0_add_16_U2 ( .A(DIN_samp[8]), .ZN(add_a0_add_16_n1) );
  AND2_X1 add_a0_add_16_U1 ( .A1(prod_a1_2N[9]), .A2(DIN_samp[0]), .ZN(
        add_a0_add_16_n32) );
  FA_X1 add_a0_add_16_U1_3 ( .A(prod_a1_2N[12]), .B(DIN_samp[3]), .CI(
        add_a0_add_16_carry[3]), .CO(add_a0_add_16_carry[4]), .S(sum_a0[3]) );
  FA_X1 add_a0_add_16_U1_7 ( .A(prod_a1_2N[16]), .B(DIN_samp[7]), .CI(
        add_a0_add_16_carry[7]), .CO(add_a0_add_16_carry[8]), .S(sum_a0[7]) );
  FA_X1 add_a0_add_16_U1_9 ( .A(prod_a1_2N[18]), .B(DIN_samp[9]), .CI(
        add_a0_add_16_carry[9]), .CO(add_a0_add_16_carry[10]), .S(sum_a0[9])
         );
  FA_X1 add_a0_add_16_U1_10 ( .A(DIN_samp[10]), .B(prod_a1_2N[19]), .CI(
        add_a0_add_16_carry[10]), .CO(add_a0_add_16_carry[11]), .S(sum_a0[10])
         );
  INV_X1 count_U17 ( .A(1'b1), .ZN(count_n4) );
  INV_X1 count_U16 ( .A(1'b0), .ZN(count_n5) );
  INV_X1 count_U15 ( .A(count_n16), .ZN(count_tc) );
  INV_X1 count_U14 ( .A(count_n13), .ZN(count_n3) );
  OAI22_X1 count_U13 ( .A1(count_n4), .A2(count_n5), .B1(count_cnt_1_), .B2(
        1'b1), .ZN(count_n12) );
  AOI22_X1 count_U12 ( .A1(count_n3), .A2(count_n12), .B1(count_cnt_1_), .B2(
        count_n13), .ZN(count_n11) );
  NOR2_X1 count_U11 ( .A1(n6), .A2(count_n11), .ZN(count_n19) );
  XNOR2_X1 count_U10 ( .A(1'b1), .B(count_cnt_0_), .ZN(count_n17) );
  XNOR2_X1 count_U9 ( .A(1'b0), .B(count_cnt_1_), .ZN(count_n18) );
  NAND2_X1 count_U8 ( .A1(count_n17), .A2(count_n18), .ZN(count_n16) );
  NAND2_X1 count_U7 ( .A1(count_cnt_0_), .A2(VIN_samp), .ZN(count_n13) );
  AOI21_X1 count_U6 ( .B1(count_n16), .B2(VIN_samp), .A(n6), .ZN(count_n14) );
  INV_X1 count_U5 ( .A(count_n14), .ZN(count_n2) );
  OR2_X1 count_U4 ( .A1(n6), .A2(count_cnt_0_), .ZN(count_n15) );
  OAI22_X1 count_U3 ( .A1(count_n8), .A2(count_n2), .B1(count_n14), .B2(
        count_n15), .ZN(count_n20) );
  DFF_X1 count_cnt_reg_1_ ( .D(count_n19), .CK(CLK), .Q(count_cnt_1_) );
  DFF_X1 count_cnt_reg_0_ ( .D(count_n20), .CK(CLK), .Q(count_cnt_0_), .QN(
        count_n8) );
  AOI22_X1 DOUT_reg_U24 ( .A1(sat_out[0]), .A2(DOUT_reg_n12), .B1(DOUT[0]), 
        .B2(DOUT_reg_n13), .ZN(DOUT_reg_n11) );
  AOI22_X1 DOUT_reg_U23 ( .A1(sat_out[1]), .A2(DOUT_reg_n12), .B1(DOUT[1]), 
        .B2(DOUT_reg_n13), .ZN(DOUT_reg_n14) );
  AOI22_X1 DOUT_reg_U22 ( .A1(sat_out[2]), .A2(DOUT_reg_n12), .B1(DOUT[2]), 
        .B2(DOUT_reg_n13), .ZN(DOUT_reg_n15) );
  INV_X1 DOUT_reg_U21 ( .A(DOUT_reg_n15), .ZN(DOUT_reg_n8) );
  AOI22_X1 DOUT_reg_U20 ( .A1(sat_out[3]), .A2(DOUT_reg_n12), .B1(DOUT[3]), 
        .B2(DOUT_reg_n13), .ZN(DOUT_reg_n16) );
  AOI22_X1 DOUT_reg_U19 ( .A1(sat_out[4]), .A2(DOUT_reg_n12), .B1(DOUT[4]), 
        .B2(DOUT_reg_n13), .ZN(DOUT_reg_n17) );
  INV_X1 DOUT_reg_U18 ( .A(DOUT_reg_n17), .ZN(DOUT_reg_n6) );
  AOI22_X1 DOUT_reg_U17 ( .A1(sat_out[5]), .A2(DOUT_reg_n12), .B1(DOUT[5]), 
        .B2(DOUT_reg_n13), .ZN(DOUT_reg_n18) );
  AOI22_X1 DOUT_reg_U16 ( .A1(sat_out[6]), .A2(DOUT_reg_n12), .B1(DOUT[6]), 
        .B2(DOUT_reg_n13), .ZN(DOUT_reg_n19) );
  INV_X1 DOUT_reg_U15 ( .A(DOUT_reg_n19), .ZN(DOUT_reg_n4) );
  AOI22_X1 DOUT_reg_U14 ( .A1(sat_out[7]), .A2(DOUT_reg_n12), .B1(DOUT[7]), 
        .B2(DOUT_reg_n13), .ZN(DOUT_reg_n20) );
  INV_X1 DOUT_reg_U13 ( .A(DOUT_reg_n20), .ZN(DOUT_reg_n3) );
  AOI22_X1 DOUT_reg_U12 ( .A1(sat_out[8]), .A2(DOUT_reg_n12), .B1(DOUT[8]), 
        .B2(DOUT_reg_n13), .ZN(DOUT_reg_n21) );
  INV_X1 DOUT_reg_U11 ( .A(DOUT_reg_n21), .ZN(DOUT_reg_n2) );
  INV_X1 DOUT_reg_U10 ( .A(DOUT_reg_n11), .ZN(DOUT_reg_n10) );
  INV_X1 DOUT_reg_U9 ( .A(DOUT_reg_n14), .ZN(DOUT_reg_n9) );
  INV_X1 DOUT_reg_U8 ( .A(DOUT_reg_n16), .ZN(DOUT_reg_n7) );
  INV_X1 DOUT_reg_U7 ( .A(DOUT_reg_n18), .ZN(DOUT_reg_n5) );
  AOI22_X1 DOUT_reg_U6 ( .A1(sat_out[9]), .A2(DOUT_reg_n12), .B1(DOUT[9]), 
        .B2(DOUT_reg_n13), .ZN(DOUT_reg_n22) );
  NOR2_X1 DOUT_reg_U5 ( .A1(VIN_samp), .A2(n6), .ZN(DOUT_reg_n13) );
  INV_X1 DOUT_reg_U4 ( .A(DOUT_reg_n22), .ZN(DOUT_reg_n1) );
  NOR2_X1 DOUT_reg_U3 ( .A1(DOUT_reg_n13), .A2(n6), .ZN(DOUT_reg_n12) );
  DFF_X1 DOUT_reg_Q_reg_0_ ( .D(DOUT_reg_n10), .CK(CLK), .Q(DOUT[0]) );
  DFF_X1 DOUT_reg_Q_reg_1_ ( .D(DOUT_reg_n9), .CK(CLK), .Q(DOUT[1]) );
  DFF_X1 DOUT_reg_Q_reg_2_ ( .D(DOUT_reg_n8), .CK(CLK), .Q(DOUT[2]) );
  DFF_X1 DOUT_reg_Q_reg_3_ ( .D(DOUT_reg_n7), .CK(CLK), .Q(DOUT[3]) );
  DFF_X1 DOUT_reg_Q_reg_4_ ( .D(DOUT_reg_n6), .CK(CLK), .Q(DOUT[4]) );
  DFF_X1 DOUT_reg_Q_reg_5_ ( .D(DOUT_reg_n5), .CK(CLK), .Q(DOUT[5]) );
  DFF_X1 DOUT_reg_Q_reg_6_ ( .D(DOUT_reg_n4), .CK(CLK), .Q(DOUT[6]) );
  DFF_X1 DOUT_reg_Q_reg_7_ ( .D(DOUT_reg_n3), .CK(CLK), .Q(DOUT[7]) );
  DFF_X1 DOUT_reg_Q_reg_8_ ( .D(DOUT_reg_n2), .CK(CLK), .Q(DOUT[8]) );
  DFF_X1 DOUT_reg_Q_reg_9_ ( .D(DOUT_reg_n1), .CK(CLK), .Q(DOUT[9]) );
  INV_X1 VOUT_reg_U4 ( .A(n6), .ZN(VOUT_reg_n2) );
  OAI21_X1 VOUT_reg_U2 ( .B1(VOUT_reg_n6), .B2(1'b1), .A(VOUT_reg_n7), .ZN(
        VOUT_reg_n5) );
  NAND3_X1 VOUT_reg_U3 ( .A1(count_tc), .A2(VOUT_reg_n2), .A3(1'b1), .ZN(
        VOUT_reg_n7) );
  DFF_X1 VOUT_reg_Q_reg ( .D(VOUT_reg_n5), .CK(CLK), .Q(VOUT), .QN(VOUT_reg_n6) );
  INV_X1 saturation_U27 ( .A(sat_out[9]), .ZN(saturation_n5) );
  OAI21_X1 saturation_U26 ( .B1(saturation_n2), .B2(saturation_n18), .A(
        saturation_n14), .ZN(sat_out[0]) );
  OAI21_X1 saturation_U25 ( .B1(saturation_n2), .B2(saturation_n17), .A(
        saturation_n14), .ZN(sat_out[1]) );
  OAI21_X1 saturation_U23 ( .B1(saturation_n2), .B2(saturation_n16), .A(
        saturation_n14), .ZN(sat_out[2]) );
  OAI21_X1 saturation_U22 ( .B1(saturation_n2), .B2(saturation_n13), .A(
        saturation_n14), .ZN(sat_out[3]) );
  OAI21_X1 saturation_U21 ( .B1(saturation_n2), .B2(saturation_n12), .A(
        saturation_n1), .ZN(sat_out[4]) );
  OAI21_X1 saturation_U20 ( .B1(saturation_n2), .B2(saturation_n11), .A(
        saturation_n1), .ZN(sat_out[5]) );
  OAI21_X1 saturation_U19 ( .B1(saturation_n2), .B2(saturation_n10), .A(
        saturation_n1), .ZN(sat_out[6]) );
  OAI21_X1 saturation_U18 ( .B1(saturation_n2), .B2(saturation_n9), .A(
        saturation_n1), .ZN(sat_out[7]) );
  OAI21_X1 saturation_U17 ( .B1(saturation_n2), .B2(saturation_n8), .A(
        saturation_n14), .ZN(sat_out[8]) );
  CLKBUF_X1 saturation_U16 ( .A(saturation_n5), .Z(saturation_n3) );
  INV_X1 saturation_U15 ( .A(saturation_n15), .ZN(saturation_n4) );
  INV_X1 saturation_U14 ( .A(sum_b0[8]), .ZN(saturation_n8) );
  INV_X1 saturation_U13 ( .A(sum_b0[7]), .ZN(saturation_n9) );
  INV_X1 saturation_U12 ( .A(sum_b0[6]), .ZN(saturation_n10) );
  INV_X1 saturation_U11 ( .A(sum_b0[5]), .ZN(saturation_n11) );
  INV_X1 saturation_U10 ( .A(sum_b0[4]), .ZN(saturation_n12) );
  INV_X1 saturation_U9 ( .A(sum_b0[3]), .ZN(saturation_n13) );
  INV_X1 saturation_U8 ( .A(sum_b0[2]), .ZN(saturation_n16) );
  INV_X1 saturation_U7 ( .A(sum_b0[1]), .ZN(saturation_n17) );
  INV_X1 saturation_U6 ( .A(sum_b0[0]), .ZN(saturation_n18) );
  INV_X1 saturation_U5 ( .A(sum_b0[10]), .ZN(saturation_n6) );
  INV_X1 saturation_U4 ( .A(sum_b0[9]), .ZN(saturation_n7) );
  NAND2_X1 saturation_U3 ( .A1(saturation_n4), .A2(saturation_n3), .ZN(
        saturation_n14) );
  NAND2_X1 saturation_U2 ( .A1(saturation_n4), .A2(saturation_n3), .ZN(
        saturation_n1) );
  BUF_X2 saturation_U1 ( .A(saturation_n4), .Z(saturation_n2) );
  OAI33_X1 saturation_U24 ( .A1(saturation_n5), .A2(saturation_n6), .A3(
        saturation_n7), .B1(sat_out[9]), .B2(sum_b0[9]), .B3(sum_b0[10]), .ZN(
        saturation_n15) );
endmodule


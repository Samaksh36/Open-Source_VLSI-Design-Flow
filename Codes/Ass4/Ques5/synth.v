/* Generated by Yosys 0.11+10 (git sha1 4871d8f19, clang 6.0.0-1ubuntu2 -fPIC -Os) */

(* cells_not_processed =  1  *)
(* src = "Ques5.v:1.1-13.10" *)
module Ques5(A, B, C, Sum, Carry);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  (* src = "Ques5.v:2.13-2.14" *)
  input A;
  (* src = "Ques5.v:3.13-3.14" *)
  input B;
  (* src = "Ques5.v:4.13-4.14" *)
  input C;
  (* src = "Ques5.v:6.13-6.18" *)
  output Carry;
  (* src = "Ques5.v:5.13-5.16" *)
  output Sum;
  INV_X1 _10_ (
    .I(C),
    .ZN(_06_)
  );
  INV_X1 _11_ (
    .I(A),
    .ZN(_07_)
  );
  INV_X1 _12_ (
    .I(B),
    .ZN(_08_)
  );
  NAND2_X1 _13_ (
    .A1(A),
    .A2(B),
    .ZN(_09_)
  );
  NAND2_X1 _14_ (
    .A1(_07_),
    .A2(_08_),
    .ZN(_00_)
  );
  NAND2_X1 _15_ (
    .A1(_09_),
    .A2(_00_),
    .ZN(_01_)
  );
  INV_X1 _16_ (
    .I(_01_),
    .ZN(_02_)
  );
  NAND2_X1 _17_ (
    .A1(C),
    .A2(_02_),
    .ZN(_03_)
  );
  NAND2_X1 _18_ (
    .A1(_06_),
    .A2(_01_),
    .ZN(_04_)
  );
  NAND2_X1 _19_ (
    .A1(_03_),
    .A2(_04_),
    .ZN(_05_)
  );
  INV_X1 _20_ (
    .I(_05_),
    .ZN(Sum)
  );
  NAND2_X1 _21_ (
    .A1(_09_),
    .A2(_03_),
    .ZN(Carry)
  );
endmodule
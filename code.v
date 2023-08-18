//main code
module code(a0, a1, a2, a3, b0, b1, b2, b3, c0, c1, c2, c3);
  input [15:0] a0, a1, a2, a3;
  input [15:0] b0, b1, b2, b3;
  output [31:0] c0, c1, c2, c3;
  wire [15:0] o0, o1, o2, o3, o4, o5, o6, o7;
  wire [15:0] p0, p1, p2, p3;
  wire [31:0] q0, q1, q2, q3;
  wire [31:0] r0, r1, r2, r3;
  wire [31:0] s0, s1, s2, s3;
  wire [31:0] t0, t1, t2, t3;

  H4 m1(a0, a1, a2, a3, o0, o1, o2, o3);
  H4 m2(b0, b1, b2, b3, p0, p1, p2, p3);


  D4 m3(o0, o1, o2, o3, p0, p1, p2, p3, q0, q1, q2, q3);

  H4_32 n1(q0, q1, q2, q3, r0, r1, r2, r3);
  rs m4(r0, r1, r2, r3, t0, t1, t2, t3);

  b4 n2(a0, a1, a2, a3, b0, b1, b2, b3, s0, s1, s2, s3);

  assign c0 = s0 - a0;
  assign c1 = t1 - s1;
  assign c2 = t2 - s2;
  assign c3 = t3 - s3;
endmodule

// Block H4
module H4(a0, a1, a2, a3, b0, b1, b2, b3);
  input [15:0] a0, a1, a2, a3;
  output [15:0] b0, b1, b2, b3;
  assign b0 = a0 + a1 + a2 + a3;
  assign b1 = a0 - a1 + a2 - a3;
  assign b2 = a0 + a1 - a2 - a3;
  assign b3 = a0 - a1 - a2 + a3;
endmodule

//BLock D4
module D4(a0, a1, a2, a3, b0, b1, b2, b3, c0, c1, c2, c3);
  input [15:0] a0, a1, a2, a3, b0, b1, b2, b3;
  output [31:0] c0, c1, c2, c3;
  assign c0 = a0*b0;
  assign c1 = a1*b1;
  assign c2 = a2*b2;
  assign c3 = a3*b3;
endmodule

// Block H4, but 32 bit
module H4_32(a0, a1, a2, a3, b0, b1, b2, b3);
  input [31:0] a0, a1, a2, a3;
  output [31:0] b0, b1, b2, b3;
  assign b0 = a0 + a1 + a2 + a3;
  assign b1 = a0 - a1 + a2 - a3;
  assign b2 = a0 + a1 - a2 - a3;
  assign b3 = a0 - a1 - a2 + a3;
endmodule

// BLock rs (right shift)
module rs(a0, a1, a2, a3, b0, b1, b2, b3);
  input [31:0] a0, a1, a2, a3;
  output [31:0] b0, b1, b2, b3;
  assign b0 = a0 >> 2;
  assign b1 = a1 >> 2;
  assign b2 = a2 >> 2;
  assign b3 = a3 >> 2;
endmodule

// Block b4
module b4(a0, a1, a2, a3, b0, b1, b2, b3, c0, c1, c2, c3);
  input [31:0] a0, a1, a2, a3, b0, b1, b2, b3;
  output [31:0] c0, c1, c2, c3;
  wire [31:0] w0, w1, w2, w3;
  assign w0 = b0*a0;
  assign w1 = b2*a3;
  assign w2 = b3*a1;
  assign w3 = b1*a2;
  assign c0 = w0 << 1; // Left Shift#1
  assign c1 = w1 << 1; // Left Shift#1
  assign c2 = w2 << 1; // Left Shift#3
  assign c3 = w3 << 1; // Left Shift#4
endmodule


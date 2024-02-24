`timescale 1ns / 1ps
module fir_code #(parameter Ai_width = 3,parameter Bi_width = 3 )(
Ai00,Ai01,
Ai02,Ai10,
Ai11,Ai12,
Ai20,Ai21,
Ai22,Bi00,
Bi01,Bi02,
Bi10,Bi11,
Bi12,Bi20,
Bi21,Bi22,
fil_out
);
input signed [Ai_width-1:0] Ai00,
Ai01,
Ai02,
Ai10,
Ai11,
Ai12,
Ai20,
Ai21,
Ai22;
input signed [Bi_width-1:0] Bi00,
Bi01,
Bi02,
Bi10,
Bi11,
Bi12,
Bi20,
Bi21,
Bi22;
output signed [(Ai_width+Bi_width)-1:0] fil_out;
assign fil_out = Ai00*Bi00+
Ai01*Bi01+
Ai02*Bi02+
Ai10*Bi10+
Ai11*Bi11+
Ai12*Bi12+
Ai20*Bi20+
Ai21*Bi21+
Ai22*Bi22;

endmodule


//Top-level module.
module cdss (
  input signed [3:0] A, B,
  input op,
  output signed [3:0] S,
  output Overflow,
  output [15:0] D,
  output signed [3:0] T);

  wire AgtB;
  
  //Instanciating the modules.
  addern adsub(op, A[3:0], B[3:0], S[3:0], Overflow);
  compare comp(A[3:0], B[3:0], AgtB);
  shifter troca(A[3:0], B[3:0], AgtB, T[3:0]);
  dec4to16 dcd(S[3:0], D[15:0]);
  
endmodule

//Comparator module.
module compare(A, B, AgtB);
  input signed [3:0] A, B;
  output AgtB;

  assign AgtB = A > B;
  
endmodule

//Shifter module.
module shifter (A, B, AgtB, Y);
  input signed [3:0] A, B;
  input AgtB;
  output reg signed [3:0] Y;
  always @(A, B, AgtB)
      if (AgtB)
			Y = A >>> 1;
		else
			Y = B <<< 2;
endmodule

//Full-ader module.
module fulladder (Cin, A, B, S, Cout);
  input Cin, A, B;
  output S, Cout;
  
  assign S = A ^ B ^ Cin;
  assign Cout = (A & B) | (Cin & A) | (Cin & B);
endmodule

//Adder/Subtractor module.
module addern (op, A, B, S, Overflow); 
  parameter n = 4;  
  input op;
  input signed [n-1:0] A, B;
  output signed [n-1:0] S;
  output Overflow;
  wire [n:0] C;
  wire [4:0] St;
  
  assign St = {n{op}}^B; 
  
  genvar i;
  assign C[0] = op;
  generate
    for (i=0; i<= n-1; i =  i+1)
      begin:addbit
        fulladder stage (C[i], A[i], St[i], S[i], C[i+1]);
      end
  endgenerate
  assign Overflow = C[n]^C[n-1];
endmodule


//4x16 Decoder module.
module dec4to16 (S, D);
  input [3:0] S;
  output [15:0] D;
  
  assign D = 1 << S;
endmodule
      
      

  
  
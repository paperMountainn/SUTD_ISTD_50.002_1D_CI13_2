/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module full_adder_1 (
    input s_check,
    input cout_check,
    input x,
    input y,
    input cin,
    output reg s,
    output reg cout,
    output reg checker
  );
  
  
  
  reg and1;
  reg and2;
  reg and3;
  reg xor_connector;
  reg cout_connector;
  reg s_connector;
  
  always @* begin
    xor_connector = x ^ y;
    s_connector = xor_connector ^ cin;
    and1 = x & y;
    and2 = x & cin;
    and3 = y & cin;
    cout_connector = and1 | and2 | and3;
    cout = cout_connector;
    s = s_connector;
    if (cout_connector == cout_check && s_connector == s_check) begin
      checker = 1'h1;
    end else begin
      checker = 1'h0;
    end
  end
endmodule

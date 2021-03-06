/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    input [2:0] button1,
    input [2:0] button2,
    output reg [7:0] p1_display,
    output reg [7:0] p2_display,
    output reg [0:0] p1_display_sel,
    output reg [0:0] p2_display_sel,
    output reg [6:0] a_display,
    output reg [0:0] a_display_sel,
    output reg [6:0] b_display,
    output reg [0:0] b_display_sel,
    output reg [6:0] c_display,
    output reg [0:0] c_display_sel,
    output reg [6:0] d_display,
    output reg [0:0] d_display_sel,
    output reg [4:0] hp1,
    output reg [4:0] hp2,
    output reg [3:0] opled1,
    output reg [3:0] opled2,
    output reg [0:0] opled3
  );
  
  
  
  integer health1;
  
  integer health2;
  
  integer ans_input1;
  
  integer ans_input2;
  
  integer correct1;
  
  integer correct2;
  
  integer a;
  
  integer b;
  
  integer c;
  
  integer d;
  
  integer correct_answer;
  
  reg [5:0] button_press;
  
  reg rst;
  
  reg [2:0] buttonsignal;
  
  reg up1;
  reg down1;
  reg submit1;
  reg up2;
  reg down2;
  reg submit2;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  reg [31:0] M_seed_d, M_seed_q = 1'h0;
  reg [15:0] M_inp_a_d, M_inp_a_q = 1'h0;
  reg [15:0] M_inp_b_d, M_inp_b_q = 1'h0;
  reg [26:0] M_counter_d, M_counter_q = 1'h0;
  reg M_next_state_d, M_next_state_q = 1'h0;
  wire [(2'h3+0)-1:0] M_ed0_out;
  reg [(2'h3+0)-1:0] M_ed0_in;
  
  genvar GEN_ed00;
  generate
  for (GEN_ed00=0;GEN_ed00<2'h3;GEN_ed00=GEN_ed00+1) begin: ed0_gen_0
    edge_detector_2 ed0 (
      .clk(clk),
      .in(M_ed0_in[GEN_ed00*(1)+(1)-1-:(1)]),
      .out(M_ed0_out[GEN_ed00*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [(2'h3+0)-1:0] M_bc0_out;
  reg [(2'h3+0)-1:0] M_bc0_in;
  
  genvar GEN_bc00;
  generate
  for (GEN_bc00=0;GEN_bc00<2'h3;GEN_bc00=GEN_bc00+1) begin: bc0_gen_0
    button_conditioner_3 bc0 (
      .clk(clk),
      .in(M_bc0_in[GEN_bc00*(1)+(1)-1-:(1)]),
      .out(M_bc0_out[GEN_bc00*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [(2'h3+0)-1:0] M_ed1_out;
  reg [(2'h3+0)-1:0] M_ed1_in;
  
  genvar GEN_ed10;
  generate
  for (GEN_ed10=0;GEN_ed10<2'h3;GEN_ed10=GEN_ed10+1) begin: ed1_gen_0
    edge_detector_2 ed1 (
      .clk(clk),
      .in(M_ed1_in[GEN_ed10*(1)+(1)-1-:(1)]),
      .out(M_ed1_out[GEN_ed10*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [(2'h3+0)-1:0] M_bc1_out;
  reg [(2'h3+0)-1:0] M_bc1_in;
  
  genvar GEN_bc10;
  generate
  for (GEN_bc10=0;GEN_bc10<2'h3;GEN_bc10=GEN_bc10+1) begin: bc1_gen_0
    button_conditioner_3 bc1 (
      .clk(clk),
      .in(M_bc1_in[GEN_bc10*(1)+(1)-1-:(1)]),
      .out(M_bc1_out[GEN_bc10*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [1-1:0] M_externalfsm_lightshit;
  reg [3-1:0] M_externalfsm_buttonsignal;
  externalfsm_4 externalfsm (
    .clk(clk),
    .rst(rst),
    .buttonsignal(M_externalfsm_buttonsignal),
    .lightshit(M_externalfsm_lightshit)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_5 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [7-1:0] M_seg2_seg;
  wire [4-1:0] M_seg2_sel;
  reg [16-1:0] M_seg2_values;
  multi_seven_seg_5 seg2 (
    .clk(clk),
    .rst(rst),
    .values(M_seg2_values),
    .seg(M_seg2_seg),
    .sel(M_seg2_sel)
  );
  wire [7-1:0] M_sega_seg;
  wire [4-1:0] M_sega_sel;
  reg [16-1:0] M_sega_values;
  multi_seven_seg_5 sega (
    .clk(clk),
    .rst(rst),
    .values(M_sega_values),
    .seg(M_sega_seg),
    .sel(M_sega_sel)
  );
  wire [7-1:0] M_segb_seg;
  wire [4-1:0] M_segb_sel;
  reg [16-1:0] M_segb_values;
  multi_seven_seg_5 segb (
    .clk(clk),
    .rst(rst),
    .values(M_segb_values),
    .seg(M_segb_seg),
    .sel(M_segb_sel)
  );
  wire [7-1:0] M_segc_seg;
  wire [4-1:0] M_segc_sel;
  reg [16-1:0] M_segc_values;
  multi_seven_seg_5 segc (
    .clk(clk),
    .rst(rst),
    .values(M_segc_values),
    .seg(M_segc_seg),
    .sel(M_segc_sel)
  );
  wire [7-1:0] M_segd_seg;
  wire [4-1:0] M_segd_sel;
  reg [16-1:0] M_segd_values;
  multi_seven_seg_5 segd (
    .clk(clk),
    .rst(rst),
    .values(M_segd_values),
    .seg(M_segd_seg),
    .sel(M_segd_sel)
  );
  reg [0:0] M_leddff_d, M_leddff_q = 1'h0;
  
  always @* begin
    M_leddff_d = M_leddff_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    p1_display = ~M_seg_seg;
    p2_display = ~M_seg2_seg;
    a_display = ~M_sega_seg;
    b_display = ~M_segb_seg;
    c_display = ~M_segc_seg;
    d_display = ~M_segd_seg;
    p1_display_sel = 4'he;
    p2_display_sel = 4'he;
    a_display_sel = 4'he;
    b_display_sel = 4'he;
    c_display_sel = 4'he;
    d_display_sel = 4'he;
    M_bc0_in = button1;
    M_ed0_in = M_bc0_out;
    M_externalfsm_buttonsignal = M_ed0_out;
    M_bc1_in = button2;
    M_ed1_in = M_bc1_out;
    buttonsignal = 1'h0;
    hp1[0+0-:1] = M_leddff_q;
    M_leddff_d = M_externalfsm_lightshit;
    opled1[0+0-:1] = 1'h1;
    opled1[1+0-:1] = 1'h1;
    opled1[2+0-:1] = 1'h1;
    opled1[3+0-:1] = 1'h1;
    opled2[0+0-:1] = 1'h1;
    opled2[1+0-:1] = 1'h1;
    opled2[2+0-:1] = 1'h1;
    opled2[3+0-:1] = 1'h1;
    opled3[0+0-:1] = 1'h1;
    hp1[4+0-:1] = 1'h0;
    hp1[3+0-:1] = 1'h0;
    hp1[2+0-:1] = 1'h0;
    hp1[1+0-:1] = 1'h0;
    hp1[0+0-:1] = 1'h0;
    hp2[4+0-:1] = 1'h0;
    hp2[3+0-:1] = 1'h0;
    hp2[2+0-:1] = 1'h0;
    hp2[1+0-:1] = 1'h0;
    hp2[0+0-:1] = 1'h0;
    health1 = 3'h5;
    health2 = 3'h5;
    M_seg_values = 16'h7770;
    M_seg2_values = 16'h7770;
    M_sega_values = 16'h7770;
    M_segb_values = 16'h7770;
    M_segc_values = 16'h7770;
    M_segd_values = 16'h7770;
    a = 1'h0;
    b = 1'h0;
    ans_input1 = 1'h0;
    ans_input2 = 1'h0;
    correct1 = 1'h0;
    correct2 = 1'h0;
    if (M_ed0_out == 1'h1) begin
      buttonsignal = 1'h1;
    end
    M_externalfsm_buttonsignal = buttonsignal;
  end
  
  always @(posedge clk) begin
    M_seed_q <= M_seed_d;
    M_inp_a_q <= M_inp_a_d;
    M_inp_b_q <= M_inp_b_d;
    M_counter_q <= M_counter_d;
    M_next_state_q <= M_next_state_d;
    
    if (rst == 1'b1) begin
      M_leddff_q <= 1'h0;
    end else begin
      M_leddff_q <= M_leddff_d;
    end
  end
  
endmodule

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
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [23:0] io_dip,
    input [4:0] io_button
  );
  
  
  
  reg rst;
  reg [15:0] a;
  reg [15:0] b;
  reg [5:0] alufn;
  
  wire [16-1:0] M_alu_out;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_1 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [32-1:0] M_seg_values;
  multi_seven_seg_3 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  
  wire [1-1:0] M_slowclock_value;
  counter_4 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  
  
  localparam STATE0_state = 2'd0;
  localparam STATEA_state = 2'd1;
  localparam STATEB_state = 2'd2;
  localparam STATEOUT_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = STATE0_state;
  
  always @* begin
    M_state_d = M_state_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    M_seg_values = 32'h00000000;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    usb_tx = usb_rx;
    io_led[16+0+5-:6] = io_dip[16+0+5-:6];
    a = 1'h0;
    b = 1'h0;
    alufn = 1'h0;
    M_alu_a = a;
    M_alu_b = b;
    M_alu_alufn = alufn;
    
    case (M_state_q)
      STATE0_state: begin
        M_seg_values = 32'h17171717;
        if (io_button[0+0-:1] == 1'h1) begin
          M_state_d = STATEA_state;
        end
      end
      STATEA_state: begin
        M_seg_values = 32'h26262601;
        io_led[8+0+7-:8] = io_dip[8+7-:8];
        io_led[0+0+7-:8] = io_dip[0+7-:8];
        a = {io_dip[8+0+7-:8], io_dip[0+0+7-:8]};
        if (io_button[2+0-:1] == 1'h1) begin
          M_state_d = STATEB_state;
        end else begin
          if (io_button[4+0-:1] == 1'h1) begin
            M_state_d = STATE0_state;
          end
        end
      end
      STATEB_state: begin
        M_seg_values = 32'h26262602;
        io_led[8+0+7-:8] = io_dip[8+7-:8];
        io_led[0+0+7-:8] = io_dip[0+7-:8];
        b = {io_dip[8+0+7-:8], io_dip[0+0+7-:8]};
        M_alu_alufn = io_dip[16+0+5-:6];
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = STATEOUT_state;
        end else begin
          if (io_button[4+0-:1] == 1'h1) begin
            M_state_d = STATE0_state;
          end
        end
      end
      STATEOUT_state: begin
        M_alu_alufn = io_dip[16+0+5-:6];
        M_alu_a = a;
        M_alu_b = b;
        M_seg_values = 32'h26161514;
        io_led[8+7-:8] = M_alu_out[8+7-:8];
        io_led[0+7-:8] = M_alu_out[0+7-:8];
        if (io_button[3+0-:1] == 1'h1) begin
          M_state_d = STATE0_state;
        end
      end
    endcase
  end
  
  always @(posedge M_slowclock_value) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule

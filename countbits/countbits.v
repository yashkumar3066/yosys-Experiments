// http://noasic.com/blog/move-those-conditions-out-of-those-loops/

module countbits (clk, data, ones);
//  parameter DATA_WIDTH  = 4;
  parameter DATA_WIDTH  = 32;
  input     clk; 
  input  [DATA_WIDTH - 1:0]     data; 
  output [$clog2(DATA_WIDTH):0] ones; 
  reg    [$clog2(DATA_WIDTH):0] ones;
  reg    [$clog2(DATA_WIDTH):0] v_count; 
  integer   i;

  always @(posedge clk)
  begin : COUNT_BITS
    v_count = 0; 
    for (i = 0; i <= DATA_WIDTH-1; i = i + 1)
    begin
      if (data[i] == 1'b1)
      begin
        v_count = v_count + 1;
      end 
    end
    ones <= v_count;  
  end 
endmodule

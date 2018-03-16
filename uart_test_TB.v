module uart_test_TB; 
reg reset;
reg clk;
reg [7:0] Tx;  //Dato de envio
reg send;
reg rdx;

uart_test  uut(
.clk(clk),
.reset(reset),
.uart_rxd(rdx)
);
	
	
initial begin 
	clk <= 0;
	rdx <= 1;
	reset=1;
	#10; reset=0;
	
end
	
always #1 clk <= ~clk;

reg [4:0] cont1 = 0; 

always begin
	#864;
	//if(cont1 <= 47) begin
	//	rdx <= ~rdx;
	//	cont1 <= cont1 + 1;
	//end

	rdx <= ~rdx;
end
	 

initial begin//: TEST_CASE
  $dumpfile("uart_test_TB.vcd");
  $dumpvars(-1, uut);
  #80000 $finish;



end

endmodule


module uart_test(
	input   reset,
	input   clk,
	input   uart_rxd,
	output  uart_txd,
	output[7:0]  rx_led
);

wire busy;
wire avail;
reg wr;
 
wire [7:0] rx; 
reg [7:0]  tx_data; 
wire [7:0] tx_data2;

assign tx_data2 =tx_data;
uart periferico(   
	.reset(reset),
	.clk(clk),
	.tx_data(tx_data2),
	.rx_data(rx_led),
	.uart_rxd(uart_rxd),
	.uart_txd(uart_txd),
	.tx_wr(wr),   
	.tx_busy(busy)
);

/*
always @(posedge clk) begin
	rx_led = rx;
end
*/
endmodule

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

reg flag;
reg leer;
 
wire [7:0] rx; 
reg [7:0]  tx_data; 
wire [7:0] tx_data2;
wire rx_busy;

assign tx_data2 =tx_data;
uart periferico(   
	.reset(reset),
	.clk(clk),
	.tx_data(tx_data2),
	.rx_data(rx_led),
	.uart_rxd(uart_rxd),
	.uart_txd(uart_txd),
	.rx_busy(rx_busy),
	.tx_wr(wr),   
	.tx_busy(busy)
);


always @(posedge clk) begin
	if(rx_busy == 1 & flag == 0)begin
		flag = 1;
		leer = 0;
	end else if(rx_busy == 0 & flag == 1) begin
		flag = 0;
		leer = 1;
	end else if(rx_busy == 1 & flag == 1) begin
		flag = 1;
		leer = 0;
	end else begin
		flag = 0;
		leer = 0;
	end
end
endmodule

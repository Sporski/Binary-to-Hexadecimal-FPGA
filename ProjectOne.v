`timescale 1ns / 1ps 
/*CSE 490 Project One
	-Chris Sporski
*/
module project1(led, clk, btn, cathodes, anodes, switch);

	input clk;
	input [3:0] switch;
	input [3:0] btn;
	output [6:0] cathodes;
	output [3:0] led;
	output [3:0] anodes;
	reg [6:0] cathodes;
	reg [6:0] c1 = 7'b 1111111;
	reg [6:0] c2 = 7'b 1111111;
	reg [6:0] c3 = 7'b 1111111;
	reg [6:0] c4 = 7'b 1111111;
	reg [3:0] anodes;
	reg [3:0] dig;
	reg [3:0] led;
	reg slow_clock;
	integer count;

	always @(posedge clk)
		begin
			create_slow_clock(clk, slow_clock);
		end

	always @(posedge slow_clock)
		begin
			assign led = switch;
				case (anodes)
					4'b 0111: anodes=4'b 1110;
					4'b 1011: anodes=4'b 0111;
					4'b 1101: anodes=4'b 1011;
					4'b 1110: anodes=4'b 1101;
					4'b 1111: anodes=4'b 1110;
					default: anodes= 1111;
				endcase
				
				case (btn)
					4'b 0001:c1=calc_cathode_value(dig);
					4'b 0010:c2=calc_cathode_value(dig);
					4'b 0100:c3=calc_cathode_value(dig);
					4'b 1000:c4=calc_cathode_value(dig);
				endcase
				
				case(anodes)
					4'b 0111: cathodes = c1;
					4'b 1011: cathodes = c2;
					4'b 1101: cathodes = c3;
					4'b 1110: cathodes = c4;
				endcase

				case (switch)	
					4'b 0000: dig=0;
					4'b 0001: dig=1;
					4'b 0010: dig=2;
					4'b 0011: dig=3;
					4'b 0100: dig=4;
					4'b 0101: dig=5;
					4'b 0110: dig=6;
					4'b 0111: dig=7;
					4'b 1000: dig=8;
					4'b 1001: dig=9;
					4'b 1010: dig=10;
					4'b 1011: dig=11;
					4'b 1100: dig=12;
					4'b 1101: dig=13;
					4'b 1110: dig=14;
					4'b 1111: dig=15;
				endcase
				//cathodes=calc_cathode_value(dig);
			end
			
			
			
			function [6:0] calc_cathode_value;
				input [3:0] dig;
				begin
					case (dig)
						0: calc_cathode_value = 7'b 1000000;
						1: calc_cathode_value = 7'b 1111001;
						2: calc_cathode_value = 7'b 0100100;
						3: calc_cathode_value = 7'b 0110000;
						4: calc_cathode_value = 7'b 0011001;
						5: calc_cathode_value = 7'b 0010010;
						6: calc_cathode_value = 7'b 0000010;
						7: calc_cathode_value = 7'b 1111000;
						8: calc_cathode_value = 7'b 0000000;
						9: calc_cathode_value = 7'b 0011000;
						10: calc_cathode_value = 7'b 0001000;
						11: calc_cathode_value = 7'b 0000011;
						12: calc_cathode_value = 7'b 1000110;
						13: calc_cathode_value = 7'b 0100001;
						14: calc_cathode_value = 7'b 0000110;
						15: calc_cathode_value = 7'b 0001110;
						default : calc_cathode_value = 7'b 1111111;
					endcase
				end
			endfunction
 
task create_slow_clock;
	input clock;
	inout slow_clock;
	integer count;
 
		begin
			if (count > 100000)
			begin
				count=0;
				slow_clock = ~slow_clock;
			end
			count = count+1;
		end

	endtask
endmodule 

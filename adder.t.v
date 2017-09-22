// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout;

    // behavioralFullAdder adder (sum, carryout, a, b, carryin);
    structuralFullAdder adder (sum, carryout, a, b, carryin); 
    // Swap above lines to test both modules

    initial begin
	    $display("a|b|Cin|Cout sum|Expected");            // Prints header for truth table
	    a=0;b=0;carryin=0; #1                                 // Set A and B, wait for update (#1)
	    $display("%b|%b| %b |  %b  %b  |  0  0", a,b,carryin,carryout,sum);
	    a=0;b=0;carryin=1; #1                                 // Set A and B, wait for new update
	    $display("%b|%b| %b |  %b  %b  |  0  1", a,b,carryin,carryout,sum);
	    a=0;b=1;carryin=0; #1
	    $display("%b|%b| %b |  %b  %b  |  0  1", a,b,carryin,carryout,sum);
	    a=0;b=1;carryin=1; #1                                 // Set A and B, wait for update (#1)
	    $display("%b|%b| %b |  %b  %b  |  1  0", a,b,carryin,carryout,sum);
	    a=1;b=0;carryin=0; #1                                 // Set A and B, wait for new update
	    $display("%b|%b| %b |  %b  %b  |  0  1", a,b,carryin,carryout,sum);
	    a=1;b=0;carryin=1; #1
	    $display("%b|%b| %b |  %b  %b  |  1  0", a,b,carryin,carryout,sum);
	    a=1;b=1;carryin=0; #1                                 // Set A and B, wait for update (#1)
	    $display("%b|%b| %b |  %b  %b  |  1  0", a,b,carryin,carryout,sum);
	    a=1;b=1;carryin=1; #1                                 // Set A and B, wait for new update
	    $display("%b|%b| %b |  %b  %b  |  1  1", a,b,carryin,carryout,sum);
    end
endmodule

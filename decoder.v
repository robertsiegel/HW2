// Decoder circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);

	wire address0;
	wire address1;

	`NOT invA0(invA0, address0);
	`NOT invA1(invA1, address1);
	`AND out0Code(out0Code, invA0, invA1);
	`AND out1Code(out1Code, address0, invA1);
	`AND out2Code(out2Code, invA0, address1);
	`AND out3Code(out3Code, address0, address1);

	`AND enabledAnd0(out0, enable, out0Code);
	`AND enabledAnd1(out1, enable, out1Code);
	`AND enabledAnd2(out2, enable, out2Code);
	`AND enabledAnd3(out3, enable, out3Code);

endmodule


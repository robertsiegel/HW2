// Decoder circuit

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

	not invA0(invA0, address0);
	not invA1(invA1, address1);
	and out0Code(out0Code, invA0, invA1);
	and out1Code(out1Code, address0, invA1);
	and out2Code(out2Code, invA0, address1);
	and out3Code(out3Code, address0, address1);

	and enabledAnd0(out0, enable, out0Code);
	and enabledAnd1(out1, enable, out1Code);
	and enabledAnd2(out2, enable, out2Code);
	and enabledAnd3(out3, enable, out3Code);

endmodule


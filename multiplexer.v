// Multiplexer circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    `NOT invA0(invA0, address0);
    `NOT invA1(invA1, address1);

    `AND and0(in0Selected, invA0, invA1); // in0 is selected with address 00
    `AND and0True(out0, in0Selected, in0); // in0 is 1 and selected

    `AND and1(in1Selected, address0, invA1); // in1 is selected with address 01
    `AND and1True(out1, in1Selected, in1); // in1 is 1 and selected

    `AND and2(in2Selected, invA0, address1); // in2 is selected with address 10
    `AND and2True(out2, in2Selected, in2); // in2 is 1 and selected

    `AND and3(in3Selected, address0, address1); // in3 is selected with address 11
    `AND and3True(out3, in3Selected, in3); // in3 is 1 and selected

    `OR orOut(out, out0, out1, out2, out3); // if the in that is selected is 1, this returns 1

endmodule


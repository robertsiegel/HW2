// Adder circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);

  wire a;
  wire b;
  wire carryin;
  
  `AND andgateAB(AandB, a, b); // And gate of A*B
  `XOR xorgateAB(AxorB, a, b); // Xor gate of A and B
  `XOR xorgate2(sum, AxorB, carryin); //Xor gate of AxorB and carryin
  `AND andgate2(AxorBandC, AxorB, carryin);
  `OR orgate(carryout, AandB, AxorBandC);

endmodule

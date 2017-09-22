// Adder circuit

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

  wire A;
  wire B;
  wire carryin;
  
  and andgateAB(AandB, a, b); // And gate of A*B
  xor xorgateAB(AxorB, a, b); // Xor gate of A and B
  xor xorgate2(sum, AxorB, carryin); //Xor gate of AxorB and carryin
  and andgate2(AxorBandC, AxorB, carryin);
  or orgate(carryout, AandB, AxorBandC);

endmodule

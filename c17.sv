module c17 (
    input logic N1, N2, N3, N6, N7,
    output logic N22, N23,
    input logic [5:0] opcode
);

    // Declare intermediate logic variables
    logic N10, N11, N16, N19, N1f, N2f, N3f, N6f, N7f, N22f, N23f, N8, N9, N14, N15, N20, N21;
    logic NAND2_1, NAND2_2, NAND2_3, NAND2_4, NAND2_5, NAND2_6;

    // Fault Sim
    assign N1f = (opcode == 6'b11) ? 1'b1 :
                (opcode == 6'b10) ? 1'b0 : N1;
    assign N2f = (opcode == 6'b101) ? 1'b1 :
                (opcode == 6'b100) ? 1'b0 : N2;
    assign N3f = (opcode == 6'b111) ? 1'b1 :
                (opcode == 6'b110) ? 1'b0 : N3;
    assign N6f = (opcode == 6'b1101) ? 1'b1 :
                (opcode == 6'b1100) ? 1'b0 : N6;
    assign N7f = (opcode == 6'b1111) ? 1'b1 :
                (opcode == 6'b1110) ? 1'b0 : N7;
    assign N8  = (opcode == 6'b10001) ? 1'b1 :
                (opcode == 6'b10000) ? 1'b0 : N3;
     assign N9  = (opcode == 6'b10011) ? 1'b1 :
                (opcode == 6'b10010) ? 1'b0 : N3;
    assign N10 = (opcode == 6'b10101) ? 1'b1 :
                 (opcode == 6'b10100) ? 1'b0 : NAND2_1;
    assign N11 = (opcode == 6'b10111) ? 1'b1 :
                 (opcode == 6'b10110) ? 1'b0 : NAND2_2;
    assign N14 = (opcode == 6'b11101) ? 1'b1 :
                 (opcode == 6'b11100) ? 1'b0 : NAND2_2;
    assign N15 = (opcode == 6'b11111) ? 1'b1 :
                 (opcode == 6'b11110) ? 1'b0 : NAND2_2;
    assign N16 = (opcode == 6'b100001) ? 1'b1 :
                 (opcode == 6'b100000) ? 1'b0 : NAND2_3;
    assign N19 = (opcode == 6'b100111) ? 1'b1 :
                 (opcode == 6'b100110) ? 1'b0 : NAND2_4;
    assign N20 = (opcode == 6'b101001) ? 1'b1 :
                  (opcode == 6'b101000) ? 1'b0 : NAND2_3;
    assign N21 = (opcode == 6'b101011) ? 1'b1 :
                  (opcode == 6'b101010) ? 1'b0 : NAND2_3;
    assign N22f = (opcode == 6'b101101) ? 1'b1 :
                  (opcode == 6'b101100) ? 1'b0 : NAND2_5;
    assign N23f = (opcode == 6'b101111) ? 1'b1 :
                  (opcode == 6'b101110) ? 1'b0 : NAND2_6;

    // NAND gate logic
    assign NAND2_1 = ~(N1f & N8);
    assign NAND2_2 = ~(N9 & N6f);
    assign NAND2_3 = ~(N2f & N14);
    assign NAND2_4 = ~(N15 & N7f);
    assign NAND2_5 = ~(N10 & N20);
    assign NAND2_6 = ~(N21 & N19);

    // Assign outputs
    assign N22 = N22f;
    assign N23 = N23f;

endmodule


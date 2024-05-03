module tb_c17;
    logic [4:0] input_data;  
    logic N1, N2, N3, N6, N7;
    logic N22, N23;
    logic [5:0] opcode;
    
    c17 dut (
        .N1(N1),
        .N2(N2),
        .N3(N3),
        .N6(N6),
        .N7(N7),
        .N22(N22),
        .N23(N23),
        .opcode(opcode)
    );
    
    logic [5:0] opcodes[22] = '{6'b11, 6'b10001, 6'b10011, 6'b111, 6'b110, 6'b1101, 6'b101, 6'b1111, 6'b10101, 6'b101001, 6'b100001,  6'b100000, 6'b100111, 6'b101011, 
				6'b101101, 6'b101100, 6'b101111, 6'b101110, 6'b10111, 6'b10110, 6'b11101, 6'b11111};
    logic non_faulty_N22 [32];	
    logic non_faulty_N23 [32];
    
    initial begin
        
        automatic int file_out;
        file_out = $fopen("fault_equivalence.txt", "w");
	$fwrite(file_out, "FAULT EQUIVALENCE\n");
        $fwrite(file_out, "GOLDEN VALUES\n");
	$fwrite(file_out, "N1  N2  N3  N6  N7  N22  N23\n");
        opcode = 6'b0; // No fault opcode
        for (int i = 0; i < 32; i = i + 1) begin
            input_data = i;
            N1 = input_data[0];
            N2 = input_data[1];
            N3 = input_data[2];
            N6 = input_data[3];
            N7 = input_data[4];

            
            #10;

            
             non_faulty_N22[i] = '{N22};
             non_faulty_N23[i] = '{N23};

            
            $fwrite(file_out, "%b   %b   %b   %b   %b   %b    %b\n", N1, N2, N3, N6, N7, N22, N23);
            
          
        end
	

        
        foreach (opcodes[a]) begin
            opcode = opcodes[a];
            $fwrite(file_out, "opcode: %b\n", opcode);
	    $fwrite(file_out, "N1  N2  N3  N6  N7  N22  N23\n");                 
            for (int i = 0; i < 32; i = i + 1) begin
                input_data = i;
                N1 = input_data[0];
                N2 = input_data[1];
                N3 = input_data[2];
                N6 = input_data[3];
                N7 = input_data[4];
                                
             
                if ((N22 != non_faulty_N22[i]) || (N23 != non_faulty_N23[i])) begin
                    		    
                    $fwrite(file_out, "%b   %b   %b   %b   %b   %b    %b\n", N1, N2, N3, N6, N7, N22, N23);
                                                               
            end
            #10;

        end                           
    end
	$fwrite(file_out, "\n");  
end
endmodule

module top(
    input clk,
    input in1,
    input in2,
    output out
);
// CLKINVX1
// NAND2X1
// SDFFX1

    wire clk_inv; // clk inv
    CLKINVX1 INV1(
        .A(clk),
        .Y(clk_inv)
    );
    
    // FF1 ports
    wire F1_Q_NAND_A1, INV_2_F1_C; 
    
    CLKINVX1 INV2(
        .A(clk_inv),
        .Y(INV_2_F1_C)
    );    
    
    SDFFX1 FF1(
        .CK(INV_2_F1_C),
        .D(in1),
        .Q(F1_Q_NAND_A1)
    );
    
    // FF2
    wire F2_D, INV_4_F2, F2_INV;
    CLKINVX1 INV3(
        .A(in2),
        .Y(F2_D)
    );
    
    CLKINVX1 INV4(
        .A(clk_inv),
        .Y(INV_4_F2)
    );
    
    SDFFX1 FF2(
        .CK(INV_4_F2),
        .D(F2_D),
        .Q(F2_INV)
    );
    
    // NAND
    wire NAND1_INV, NAND_Y_F3;
    CLKINVX1 INV5(
        .A(F2_INV),
        .Y(NAND1_INV)
    );
    
    NAND2X1 NAND1(
        .A(F1_Q_NAND_A1),
        .B(NAND1_INV),
        .Y(NAND_Y_F3)
    );

    // INV Chain
    wire clk_inv_chain_1, clk_inv_chain_2, clk_inv_chain_3;
    CLKINVX1 INV6(
        .A(clk_inv),
        .Y(clk_inv_chain_1)
    );
        
    CLKINVX1 INV7(
        .A(clk_inv_chain_1),
        .Y(clk_inv_chain_2)
    );
    
    CLKINVX1 INV8(
        .A(clk_inv_chain_2),
        .Y(clk_inv_chain_3)
    );
    
    // FF3
    SDFFX1 FF3(
        .CK(clk_inv_chain_3),
        .D(NAND_Y_F3),
        .Q(out)
    );
endmodule
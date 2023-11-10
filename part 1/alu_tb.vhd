----------------------------------------------------------------------------------
-- Filename : display_controller.vhdl
-- Author : Antonio Alejandro Andara Lara
-- Date : 31-Oct-2023
-- Design Name: alu_tb
-- Project Name: ECE 410 lab 3 2023
-- Description : testbench for the ALU of the simple CPU design
-- Additional Comments:
-- Copyright : University of Alberta, 2023
-- License : CC0 1.0 Universal
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY alu_tb IS
END alu_tb;

ARCHITECTURE sim OF alu_tb IS
    SIGNAL alu_sel     : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
    SIGNAL input_a     : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL input_b     : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL bits_rotate : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
    SIGNAL alu_out     : STD_LOGIC_VECTOR(7 DOWNTO 0);

    

BEGIN
-- **************************************************************
-- test all the ALU operations
    uut: ENTITY WORK.alu(Dataflow)
        PORT MAP( alu_sel     => alu_sel
                , input_a     => input_a
                , input_b     => input_b
                , bits_rotate => bits_rotate
                , alu_out     => alu_out
                );

    stim_proc: PROCESS
    BEGIN
        -- Test ALU operations:
        bits_rotate <= "10";

        alu_sel <= "000";
        input_a <= "01100100";
        input_b <= "00110011";
        WAIT FOR 20 ns;
        ASSERT (alu_out = "01100100")
        REPORT "000 wrong";

        alu_sel <= "001";
        input_a <= "01100100";
        input_b <= "00110011";
        WAIT FOR 20 ns;
        ASSERT (alu_out = "00100000")
        REPORT "001 wrong";
        
        alu_sel <= "010";
        input_a <= "01100100";
        input_b <= "00110011";
        bits_rotate <= "10";
        WAIT FOR 20 ns;
        ASSERT (alu_out = "10010001")
        REPORT "010 wrong";
        
        alu_sel <= "011";
        input_a <= "01100100";
        input_b <= "00110011";
        bits_rotate <= "10";
        WAIT FOR 20 ns;
        ASSERT (alu_out = "00011001")
        REPORT "011 wrong";

        alu_sel <= "100";
        input_a <= "00001111";
        input_b <= "00000010";
        WAIT FOR 20 ns;
        ASSERT (alu_out = "00010001")
        REPORT "100 wrong";

        alu_sel <= "101";
        input_a <= "00010001";
        input_b <= "00000010";
        WAIT FOR 20 ns;
        ASSERT (alu_out = "00001111")
        REPORT "101 wrong";
        
        alu_sel <= "110";
        input_a <= "00001111";
        input_b <= "00110011";
        WAIT FOR 20 ns;
        ASSERT (alu_out = "00010000")
        REPORT "110 wrong";
        
        alu_sel <= "111";
        input_a <= "00010000";
        input_b <= "00110011";
        WAIT FOR 20 ns;
        ASSERT (alu_out = "00001111")
        REPORT "111 wrong";

        WAIT;
    END PROCESS stim_proc;

END sim;

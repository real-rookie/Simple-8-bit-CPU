----------------------------------------------------------------------------------
-- Company: Department of Electrical and Computer Engineering, University of Alberta
-- Engineer: Shyama Gandhi and Bruce Cockburn
-- Create Date: 10/29/2020 07:18:24 PM
-- Design Name: DATAPATH FOR THE CPU
-- Module Name: cpu - structural(datapath)
-- Description: CPU_PART 1 OF LAB 3 - ECE 410 (2021)
-- Revision:
-- Revision 0.01 - File Created
-- Revision 1.01 - File Modified by Raju Machupalli (October 31, 2021)
-- Revision 2.01 - File Modified by Shyama Gandhi (November 2, 2021)
-- Revision 3.01 - File Modified by Antonio Andara (October 31, 2023)
-- Additional Comments:
--*********************************************************************************
-- datapath module that maps all the components used... 
-----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_misc.ALL;
USE ieee.numeric_std.ALL;

ENTITY datapath IS
    PORT( clock          : IN STD_LOGIC
        ; reset          : IN STD_LOGIC
        ; mux_sel        : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
        ; immediate_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
        ; user_input     : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
        ; acc_write      : IN STD_LOGIC
        ; rf_address     : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
        ; rf_write       : IN STD_LOGIC 
        ; alu_sel        : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
        ; bits_rotate    : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
        ; output_enable  : IN STD_LOGIC
        ; zero_flag      : OUT STD_LOGIC
        ; positive_flag  : OUT STD_LOGIC
        ; datapath_out   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
END datapath;

ARCHITECTURE Structural OF datapath IS
---------------------------------------------------------------------------
-- declare any necessary signals if any
---------------------------------------------------------------------------
BEGIN

    multiplexer: -- instantiate entity

    accumulator: -- instantiate entity

    register_file: -- instantiate entity

    alu: -- instantiate entity

    tri_state_buffer: -- instantiate entity

    -- add logic for calculating the zero_flag and positive_flag values
    -- positive_flag <= ;
    -- zero_flag     <= ;

END Structural;

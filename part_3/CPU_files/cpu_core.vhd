----------------------------------------------------------------------------------
-- Company: Department of Electrical and Computer Engineering, University of Alberta
-- Engineer: Shyama Gandhi and Bruce Cockburn
-- Create Date: 10/29/2020 07:18:24 PM
-- Design Name: CONTROLLER AND DATAPATH FOR THE CPU
-- Module Name: cpu - structural
-- Description: CPU LAB 3 - ECE 410 (2021)
-- Revision:
-- Revision 0.01 - File Created
-- Revision 1.01 - File Modified by Raju Machupalli (October 31, 2021)
-- Revision 2.01 - File Modified by Shyama Gandhi (November 2, 2021)
-- Revision 3.01 - File Modified by Antonio Andara (October 31, 2023)
-- *******************************************************************************
-- Additional Comments:
-- The CPU core integrates the datapath and the controller FSM
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY cpu_core IS
---------------------------------------------------------------------------
-- finish the port declaration with the appropriate types
    PORT( clock         : IN 
        ; reset         : IN 
        ; enter         : IN 
        ; user_input    : IN 
        ; CPU_output    : OUT
        ; PC_output     : OUT
        ; OPCODE_output : OUT
        ; done          : OUT
        );
---------------------------------------------------------------------------
END cpu_core;

ARCHITECTURE Structural OF cpu_core IS
---------------------------------------------------------------------------
-- declare any necessary signals if any
---------------------------------------------------------------------------
BEGIN

    -- CPU clock divider, used to slow the processing of instructions
    -- allowing for manual testing. for simulation use freq_out <= 62_500_00
    core_div : ENTITY WORK.clock_divider(Behavioral)
        GENERIC MAP (freq_out => 4)
        PORT MAP( clock => clock
                , clock_div => clock_div
                );

    controller : -- instantiate controller entity

    datapath : -- instantiate datapath entity

END Structural;

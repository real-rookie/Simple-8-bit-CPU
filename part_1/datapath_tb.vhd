----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/06/2023 06:35:51 PM
-- Design Name: 
-- Module Name: datapath_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datapath_tb is
--  Port ( );
end datapath_tb;

architecture Behavioral of datapath_tb is
    signal clock          : STD_LOGIC;
    signal reset          : STD_LOGIC := '0';
    signal mux_sel        : STD_LOGIC_VECTOR(1 DOWNTO 0) := "10";
    signal immediate_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";
    signal user_input     : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal acc_write      : STD_LOGIC := '1';
    signal rf_address     : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
    signal rf_write       : STD_LOGIC := '1';
    signal alu_sel        : STD_LOGIC_VECTOR(2 DOWNTO 0) := "100";
    signal bits_rotate    : STD_LOGIC_VECTOR(1 DOWNTO 0);
    signal output_enable  : STD_LOGIC := '1';
    signal zero_flag      : STD_LOGIC;
    signal positive_flag  : STD_LOGIC;
    signal datapath_out   : STD_LOGIC_VECTOR(7 DOWNTO 0);
    CONSTANT clock_period : TIME := 8 ns;
begin

    clock_process : PROCESS
    BEGIN
        clock <= '0';
        WAIT FOR clock_period/2;
        clock <= '1';
        WAIT FOR clock_period/2;
    END PROCESS;

    datapath : ENTITY WORK.datapath(Structural)
        port map(
            clock               => clock,
            reset               => reset,
            mux_sel             => mux_sel,
            immediate_data      => immediate_data,
            user_input          => user_input,
            acc_write           => acc_write,
            rf_address          => rf_address,
            rf_write            => rf_write,
            alu_sel             => alu_sel,
            bits_rotate         => bits_rotate,
            output_enable       => output_enable,
            zero_flag           => zero_flag,
            positive_flag       => positive_flag,
            datapath_out        => datapath_out
        );

    stim_proc : PROCESS
    BEGIN        
        WAIT FOR 16 ns;
        mux_sel <= "00";
        rf_write <= '0';
        wait FOR 16 ns;
        ASSERT (datapath_out = "00000010")
        REPORT "wrong connection"
        SEVERITY ERROR;

        WAIT;
    END PROCESS;
end Behavioral;

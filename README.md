# Description
This repo implements a simple CPU on the Zybo Z7 board that is capable of executing any user programs written in the defined 15 instructions.
## CPU
The CPU consists of a datapath and a controller. The datapath processes the data in the way specified by the controller whereas the controller decodes the CPU instruction code and tells the datapath how to handle data.
### Datapath
The datapath consists of five parts - a 4\:1 Mux, an 8-bit Accumulator\(ACC\), a Register File\(RF\), an Arithmetic Logic Unit\(ALU\), and a Tri-State Buffer.
- 4\:1 Mux\:Outputs either the ALU output, the RF output, the immediate data field of the instruction\(IMM\), or the user input entered on the keypad. Its output is also used to determine the values of the positive\_flag and zero_flag.
- 8-bit Accumulator\(ACC\)\: An 8-bit register that stores either input, output or any intermediate result. Only when acc\_write is set and there is a clock rising edge can a value be written to ACC.
- Register File\(RF\)\: Consists of eight 8-bit registers. Only when rf\_write is set and there is a clock rising edge can a value be written to the register specified by rf\_address.
- Arithmetic Logic Unit\(ALU\)\: Operates on the data in ACC or in both ACC and RF. Supported operations include Data Passing, Bitwise AND, Rotate Left, Rotate Right, ADD, SUB, INC, and DEC.
- Tri-State Buffer\: Displays the content of ACC on the Seven-Segment-Display when output\_enable is set.
### Controller
The controller processes any instruction in three stages - Fetch, Decode, and Control.
- In the fetch stage, the instruction pointed by the program counter\(PC\) is fetched to the instruction register\(IR\). PC advances to the next instruction.
- In the decode stage, the opcode of the instruction is decoded to determine the corresponding control stage that runs next. In the meantime, the other fields of this instruction are pre-processed, so that even if the instruction requires register reading, the control stage can still finish within one clock cycle, which guarantees that each instruction can be executed within three clock cycles.
- In the control stage, the values of the control signals of the components that compose the datapath are assigned depending on what instruction is being executed. For any components that are not being used for the running instruction, zeros are assigned to their control signals.

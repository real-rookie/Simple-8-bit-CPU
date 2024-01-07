# Description
This repo implements a simple CPU on the Zybo Z7 board that is capable of executing any user programs written with the 15 supported instructions\(a sample program is given below\).
## CPU Architecture
The CPU consists of a datapath and a controller. The datapath processes the data in the way specified by the controller whereas the controller decodes the CPU instruction code and tells the datapath how to handle data.
### Datapath
The datapath consists of five parts - a 4\:1 Mux, an 8-bit Accumulator\(ACC\), a Register File\(RF\), an Arithmetic Logic Unit\(ALU\), and a Tri-State Buffer.
- 4\:1 Mux\:Outputs either the ALU output, the RF output, the immediate data field of the instruction\(IMM\), or the user input entered on the keypad. Its output is also used to determine the values of the positive\_flag and zero_flag.
- 8-bit Accumulator\(ACC\)\: An 8-bit register that stores either input, output or any intermediate result. Only when acc\_write is set and there is a clock rising edge can a value be written to ACC.
- Register File\(RF\)\: Consists of eight 8-bit registers. Only when rf\_write is set and there is a clock rising edge can a value be written to the register specified by rf\_address.
- Arithmetic Logic Unit\(ALU\)\: Operates on the data in ACC or in both ACC and RF. Supported operations include Data Passing, Bitwise AND, Rotate Left, Rotate Right, ADD, SUB, INC, and DEC.
- Tri-State Buffer\: Displays the content of ACC on the Seven-Segment-Display when output\_enable is set.
![image](https://github.com/real-rookie/Simple-8-bit-CPU/assets/90580132/fc5bb864-ddf1-49bd-b221-f55b71dc4e8a)

### Controller
The controller processes any instruction in three stages - Fetch, Decode, and Control.
- In the fetch stage, the instruction pointed by the program counter\(PC\) is fetched to the instruction register\(IR\). PC advances to the next instruction.
- In the decode stage, the opcode of the instruction is decoded to determine the corresponding control stage that runs next. In the meantime, the other fields of this instruction are pre-processed, so that even if the instruction requires register reading, the control stage can still finish within one clock cycle, which guarantees that each instruction can be executed within three clock cycles.
- In the control stage, the values of the control signals of the components that compose the datapath are assigned depending on what instruction is being executed. For any components that are not being used for the running instruction, zeros are assigned to their control signals.
![image](https://github.com/real-rookie/Simple-8-bit-CPU/assets/90580132/fe835fe3-afeb-4532-93fb-d5e52ab8426e)

## Supported Instructions
![image](https://github.com/real-rookie/Simple-8-bit-CPU/assets/90580132/eb2838f8-ab02-4b50-8b4b-34ef0fe9f391)

## Simple Program Written with the Instructions
This program calculates the largest number that can be composed using the number of 1's in the user input.\
For example, when the user input is 161=0xA1=0b10100001, the output will be 224=0xE0=0b11100000. Because there are three 1's in the input, to get the largest number that can be composed using three 1's, we can place all the 1's on the left side, i.e., MSB side.
![ECE 410 lab 3 report](https://github.com/real-rookie/Simple-8-bit-CPU/assets/90580132/87118653-c003-4002-8327-d0ed6e305e78)

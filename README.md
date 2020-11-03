# VerilogProject: 4 Combinational Circuits in one project(Comparator, Shifter, Adder/Subtractor, Decoder)
This project is a ***Comparator, Shifter, Adder and Decoder.*** It was built using the SystemVerilog HDL(Hardware Description Language)for a project from my university(Universidade Federal de São Carlos - UFSCar). 

***PLEASE READ THE INSTRUCTIONS SECTION IN ORDER TO UNDERSTAND HOW THE CODE WORKS***

## Instructions
• Inputs:


– A (4 signed bits)


– B (4 signed bits)


– Op (1 bit / 0 = add / 1 = subtract)


• Outputs:

– S (sum/subtraction between A and B with 4 signed bits)


– Overflow (1 bit / only for sum/subtraction)


– D (16 bits / value of the sum(S) decodified)


– T (4 signed bits), in which:


∗ If A > B: T = A >> 1


∗ Else: T = B << 2

## Colaborators
-Carlos Fontaneli: https://github.com/CarlosFontaneli

-Thiago Diaz: https://github.com/thiagodiazv

## Observations
In this repository I decided to only include the design file(design.sv),so I didn't include the test bench and the values files. The reason of this decision is that these files were provided to me by my teacher, so, since I didn't make these files, I can't include them. But, the test bench was based on a readmemh function to read the values of input and output from the values.tv file and compare with the inputs and outputs from the design.sv file.

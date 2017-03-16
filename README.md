# Binary-to-Hexadecimal-FPGA

This contains only the .v file necessary for the execution of the converter.

Actual mapping and other necessary files have been left out.

Text based image of how it would work.

Lights--->      1100       0000     <--7 Segment display

Switches->      uudd       ····     <--Buttons

For this example, lights are set to on, on, off, off
Switches are set to up, up, down, down

So if you were given a 16-digit binary number you would first enter the first 4 digits with the switches, then press the button under the first 7 segment display, then adjust the switches for the next 4 and press the 2nd button, and so on for the 3rd and 4th.

Therefore, until press a button you can flip the switches as many times as you'd like but the only thing that will change is the light above the switch.

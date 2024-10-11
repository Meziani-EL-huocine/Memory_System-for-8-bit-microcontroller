# Memory System for 8-bit Microcontroller

## Overview
This project focuses on the design of a memory system for an 8-bit microcontroller, implementing essential components like data memory, program memory, and output ports. The project is modular, with each component represented by a separate repository for easy development and reuse.

The memory system is divided into four repositories:

- **[Data Memory](https://github.com/Meziani-EL-huocine/Memory_System-for-8-bit-microcontroller/tree/main/data_memory)**
- **[Program Memory](https://github.com/Meziani-EL-huocine/Memory_System-for-8-bit-microcontroller/tree/main/program_memory)**
- **[Output Ports](https://github.com/Meziani-EL-huocine/Memory_System-for-8-bit-microcontroller/tree/main/output_ports)**
- **[Top-Level Memory System](https://github.com/Meziani-EL-huocine/Memory_System-for-8-bit-microcontroller/tree/main/top_level_memory)**

This project is designed to be flexible, allowing for modifications and expansions. It is suitable for educational purposes, helping students and engineers better understand memory system design in microcontrollers.

## Features
- **Data Memory**: Stores the data used during program execution.
- **Program Memory**: Holds the instructions of the program being executed.
- **Output Ports**: Handles communication between the microcontroller and external devices.
- **Top-Level Memory System**: Integrates all the components and manages data flow between them.

## Project Structure
The memory system is organized into the following repositories:

### 1. Data Memory
The data memory stores values used by the microcontroller during its operations.
**[Data Memory Repository](https://github.com/Meziani-EL-huocine/Memory_System-for-8-bit-microcontroller/tree/main/data_memory)**

### 2. Program Memory
The program memory contains the instructions for the microcontroller to execute.
**[Program Memory Repository](https://github.com/Meziani-EL-huocine/Memory_System-for-8-bit-microcontroller/tree/main/program_memory)**

### 3. Output Ports
Output ports allow the microcontroller to communicate with external devices.
**[Output Ports Repository](https://github.com/Meziani-EL-huocine/Memory_System-for-8-bit-microcontroller/tree/main/output_ports)**

### 4. Top-Level Memory System
The top-level design integrates data memory, program memory, and output ports, ensuring the smooth operation of the entire system.
**[Top-Level Memory System Repository](https://github.com/Meziani-EL-huocine/Memory_System-for-8-bit-microcontroller/tree/main/top_level_memory)**

 ## How to Run

Use your preferred VHDL simulation tool to run the testbenches for each module. Make sure all dependencies are properly linked when testing the top-level memory system.

## Future Enhancements

- Adding support for advanced memory addressing modes.
- Integrating cache or memory management units (MMUs).
- Expanding the system to support external memory devices.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


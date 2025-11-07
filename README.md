# Zetta-8

Zetta-8 is a simple fantasy console/virtual machine written in the Zig programming language.

## Requirements

- [Zig](https://ziglang.org/) (0.11.0 or later)
- [Raylib](https://www.raylib.com/)

## Building and Running

To build the project, run the following command:

```sh
zig build
```

To build and run the project:

```sh
zig build run
```

## Project Structure

```
.
├── build.zig               # The build script for the project
├── build.zig.zon
├── src
│   ├── asmref.zig          # Zetta-8 assembly opcodes
│   ├── cpu.zig             # CPU struct and instruction processing logic
│   ├── gpu.zig             # Graphics drawing functions using Raylib
│   └── main.zig            # Main application loop, initialization of CPU and GPU
└── .zig-cache
```

- **`src/main.zig`**: Contains the main application loop, initializes the CPU and the graphics interface.
- **`src/cpu.zig`**: Defines the CPU of the Zetta-8 virtual machine, its registers, and instruction set.
- **`src/gpu.zig`**: Includes functions that use Raylib to draw the video memory (VRAM) to the screen.
- **`src/asmref.zig`**: Holds references to the assembly instructions used by the CPU.
- **`build.zig`**: The script that defines how to build the project and its dependencies (Raylib).
# 16-BIT RISC Processor ⚙️

**Short description**

This repository contains a 16-bit RISC-style processor implemented in VHDL with a pipelined datapath and basic instruction set. The design includes instruction memory, data memory, register file, ALU, pipeline registers (stages), and a testbench for simulation.

---

## Key features 

- 16-bit datapath and registers
- Pipelined architecture (multiple pipeline registers across stages)
- Basic instruction set with arithmetic, logic, memory, and branch/jump instructions
- VHDL implementation with modular components
- Testbench (`testbench.vhdl`) that instantiates the top-level `pipeline_main` module and provides a clock

---

## Files and modules 

- `Pipeline_main.vhdl` - Top-level processor module (ports: `clk : in std_logic`, `Instruction : out std_logic_vector(19 downto 0)`).
- `testbench.vhdl` - Simple testbench that drives the clock and captures the `Instruction` output.
- `Reg_File.vhdl` - Register file (general purpose registers, PC handling).
- `ALU.vhdl` - Arithmetic and logic unit used by the datapath.
- `Adder_16.vhdl` - 16-bit adder used by the pipeline.
- `Shift_adder.vhdl`, `shifter_oneBit.vhdl` - Shift and shift-add support.
- `data_memory.vhdl` - Data memory used by load/store instructions.
- `memory_Instruction.vhdl` - Instruction memory module.
- `pipeLine1_Reg.vhdl`, `pipeLine2_Reg.vhdl`, `pipeLine3_Reg.vhdl`, `pipeLine4_Reg.vhdl`, `pipeLine5_Reg.vhdl` - Pipeline registers/stages.
- `Sign_extender_6.vhdl`, `Sign_extender_9.vhdl`, `Zero_extender_6.vhdl`, `Zero_extender_9.vhdl` - Immediate extension utilities.
- `subtractor_1.vhdl`, `czregister.vhdl` - Small utility components.

> Note: The `testbench.vhdl` clocks the `pipeline_main` instance at a 40,000 ps period and stops after 800,000 ps by design.

---


## Quick notes & tips 

- The top-level module is `pipeline_main`; `testbench.vhdl` instantiates it and exposes a 20-bit `Instruction` output for inspection.
- Instruction encoding and opcode constants are defined in `Pipeline_main.vhdl` — check that file when adding new instructions.
- To change or add instructions, update `memory_Instruction.vhdl` (instruction memory) and adapt control logic in `Pipeline_main.vhdl`.
- If you want, I can add a `Makefile` or GitHub Actions workflow to run GHDL automatically on push.

---

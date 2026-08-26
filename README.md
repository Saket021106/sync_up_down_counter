# Synchronous Up/Down Counter

A 3-bit synchronous up/down counter implemented in SystemVerilog using JK flip-flops. The design allows switching between counting up and counting down based on a mode control input.

## Repository Contents

* **design.sv**: Contains the structural RTL implementation of the 3-bit synchronous up/down counter and the underlying JK flip-flop module.
* **testbench.sv**: The testbench used to verify the functionality of the counter.
* **waveform_result.pdf**: Simulation waveform results demonstrating the up and down counting behavior.

## Design Details

The counter is designed structurally by chaining three JK flip-flops. It uses a mode selector to determine the counting direction.

### Ports
* **clk** (Input): Clock signal (triggered on the negative edge).
* **M** (Input): Mode control signal. Determines whether the counter increments or decrements.
* **Q** (Output): 3-bit register holding the current count value (`Q[2:0]`).

### Modules
1. **sync_up_down_counter**: The top-level module containing the combinational logic for the gated inputs and a generate block to instantiate the JK flip-flop chain.
2. **jk_ff**: A standard JK flip-flop triggered on the negative edge of the clock.

## Usage

To simulate this design, you can use any standard Verilog/SystemVerilog simulator (such as ModelSim, Vivado, or EDA Playground).

1. Compile `design.sv` and `testbench.sv`.
2. Run the simulation and observe the `Q` output transitioning based on the `M` input.
3. Review the generated waveforms (or compare against the provided `waveform_result.pdf`) to verify synchronous counting behavior.

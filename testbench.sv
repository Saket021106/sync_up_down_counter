`timescale 1ps/1ps

module tb_sync_up_down_counter;

    reg clk;
    reg M;
    wire [2:0] Q;

    sync_up_down_counter dut (
        .clk(clk),
        .M(M),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_sync_up_down_counter);

        $display("---------------Sync Up Down Counter---------------");
        
        $monitor("Time = %3d, Dec = %2d, Bin = %b", $time, Q, Q);

        M = 0;
        #90;

        M = 1;
        #90;

        $finish;

    end

endmodule

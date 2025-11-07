const std = @import("std");
const machine = @import("cpu.zig");
const graphics = @import("gpu.zig");
const asmref = @import("asmref.zig");

pub fn main() !void {
    graphics.init();

    var cpu = machine.CPU{};
    var ram: [1024]u8 = [_]u8{0} ** 1024;
    cpu.MP = &ram;

    var i: usize = 0;
    for ("==TEST==") |c| {
        cpu.TXT[i] = c;
        i += 1;
    }

    var vram: [128][128]u8 = undefined;
    for (&vram) |*row| {
        row.* = [_]u8{0} ** 128;
    }
    cpu.VMP = &vram;

    const code = [_]u8{
        asmref.PUT, 'B',  asmref.OUT,
        asmref.PUT, 'O',  asmref.OUT,
        asmref.PUT, 'O',  asmref.OUT,
        asmref.PUT, 'T',  asmref.OUT,
        asmref.PUT, '\n', asmref.OUT,
        asmref.COL, 2,    asmref.FLH, 0x05, 0x05,
        asmref.COL, 1,    asmref.FLH, 0x06, 0x05,
        asmref.COL, 2,    asmref.FLH, 0x07, 0x05,
        asmref.COL, 1,    asmref.FLH, 0x08, 0x05,
        asmref.COL, 2,    asmref.FLH, 0x09, 0x05,
        asmref.COL, 1,    asmref.FLH, 0x0A, 0x05,
        asmref.COL, 2,    asmref.FLH, 0x0B, 0x05,
        asmref.COL, 1,    asmref.FLH, 0x0C, 0x05,
        asmref.COL, 2,    asmref.FLH, 0x0D, 0x05,

        asmref.COL, 2,    asmref.FLH, 0x05, 0x06,
        asmref.COL, 1,    asmref.FLH, 0x06, 0x06,
        asmref.COL, 2,    asmref.FLH, 0x07, 0x06,
        asmref.COL, 1,    asmref.FLH, 0x08, 0x06,
        asmref.COL, 2,    asmref.FLH, 0x09, 0x06,
        asmref.COL, 1,    asmref.FLH, 0x0A, 0x06,
        asmref.COL, 2,    asmref.FLH, 0x0B, 0x06,
        asmref.COL, 1,    asmref.FLH, 0x0C, 0x06,
        asmref.COL, 2,    asmref.FLH, 0x0D, 0x06,

        asmref.COL, 2,    asmref.FLH, 0x05, 0x07,
        asmref.COL, 1,    asmref.FLH, 0x06, 0x07,
        asmref.COL, 2,    asmref.FLH, 0x07, 0x07,
        asmref.COL, 1,    asmref.FLH, 0x08, 0x07,
        asmref.COL, 2,    asmref.FLH, 0x09, 0x07,
        asmref.COL, 1,    asmref.FLH, 0x0A, 0x07,
        asmref.COL, 2,    asmref.FLH, 0x0B, 0x07,
        asmref.COL, 1,    asmref.FLH, 0x0C, 0x07,
        asmref.COL, 2,    asmref.FLH, 0x0D, 0x07,

        asmref.COL, 2,    asmref.FLH, 0x05, 0x08,
        asmref.COL, 1,    asmref.FLH, 0x06, 0x08,
        asmref.COL, 2,    asmref.FLH, 0x07, 0x08,
        asmref.COL, 1,    asmref.FLH, 0x08, 0x08,
        asmref.COL, 2,    asmref.FLH, 0x09, 0x08,
        asmref.COL, 1,    asmref.FLH, 0x0A, 0x08,
        asmref.COL, 2,    asmref.FLH, 0x0B, 0x08,
        asmref.COL, 1,    asmref.FLH, 0x0C, 0x08,
        asmref.COL, 2,    asmref.FLH, 0x0D, 0x08,

        asmref.COL, 2,    asmref.FLH, 0x05, 0x09,
        asmref.COL, 1,    asmref.FLH, 0x06, 0x09,
        asmref.COL, 2,    asmref.FLH, 0x07, 0x09,
        asmref.COL, 1,    asmref.FLH, 0x08, 0x09,
        asmref.COL, 2,    asmref.FLH, 0x09, 0x09,
        asmref.COL, 1,    asmref.FLH, 0x0A, 0x09,
        asmref.COL, 2,    asmref.FLH, 0x0B, 0x09,
        asmref.COL, 1,    asmref.FLH, 0x0C, 0x09,
        asmref.COL, 2,    asmref.FLH, 0x0D, 0x09,

        asmref.COL, 2,    asmref.FLH, 0x05, 0x0A,
        asmref.COL, 1,    asmref.FLH, 0x06, 0x0A,
        asmref.COL, 2,    asmref.FLH, 0x07, 0x0A,
        asmref.COL, 1,    asmref.FLH, 0x08, 0x0A,
        asmref.COL, 2,    asmref.FLH, 0x09, 0x0A,
        asmref.COL, 1,    asmref.FLH, 0x0A, 0x0A,
        asmref.COL, 2,    asmref.FLH, 0x0B, 0x0A,
        asmref.COL, 1,    asmref.FLH, 0x0C, 0x0A,
        asmref.COL, 2,    asmref.FLH, 0x0D, 0x0A,

        asmref.COL, 2,    asmref.FLH, 0x05, 0x0B,
        asmref.COL, 1,    asmref.FLH, 0x06, 0x0B,
        asmref.COL, 2,    asmref.FLH, 0x07, 0x0B,
        asmref.COL, 1,    asmref.FLH, 0x08, 0x0B,
        asmref.COL, 2,    asmref.FLH, 0x09, 0x0B,
        asmref.COL, 1,    asmref.FLH, 0x0A, 0x0B,
        asmref.COL, 2,    asmref.FLH, 0x0B, 0x0B,
        asmref.COL, 1,    asmref.FLH, 0x0C, 0x0B,
        asmref.COL, 2,    asmref.FLH, 0x0D, 0x0B,

        asmref.COL, 2,    asmref.FLH, 0x05, 0x0C,
        asmref.COL, 1,    asmref.FLH, 0x06, 0x0C,
        asmref.COL, 2,    asmref.FLH, 0x07, 0x0C,
        asmref.COL, 1,    asmref.FLH, 0x08, 0x0C,
        asmref.COL, 2,    asmref.FLH, 0x09, 0x0C,
        asmref.COL, 1,    asmref.FLH, 0x0A, 0x0C,
        asmref.COL, 2,    asmref.FLH, 0x0B, 0x0C,
        asmref.COL, 1,    asmref.FLH, 0x0C, 0x0C,
        asmref.COL, 2,    asmref.FLH, 0x0D, 0x0C,

        asmref.COL, 2,    asmref.FLH, 0x05, 0x0D,
        asmref.COL, 1,    asmref.FLH, 0x06, 0x0D,
        asmref.COL, 2,    asmref.FLH, 0x07, 0x0D,
        asmref.COL, 1,    asmref.FLH, 0x08, 0x0D,
        asmref.COL, 2,    asmref.FLH, 0x09, 0x0D,
        asmref.COL, 1,    asmref.FLH, 0x0A, 0x0D,
        asmref.COL, 2,    asmref.FLH, 0x0B, 0x0D,
        asmref.COL, 1,    asmref.FLH, 0x0C, 0x0D,
        asmref.COL, 2,    asmref.FLH, 0x0D, 0x0D,

        asmref.JMP, 15,
    };

    var idx: usize = 0;
    for (code) |op| {
        ram[idx] = op;
        idx += 1;
    }

    while (true) {
        try cpu.execute();
        graphics.checkclose();
        graphics.draw(vram);
    }
}

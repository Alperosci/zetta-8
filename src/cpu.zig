const std = @import("std");

pub const CPU = struct {
    MP: *[1024]u8 = undefined,
    VMP: *[128][128]u8 = undefined,
    PC: u16 = 0,

    C: u8 = 0,
    A: u8 = 0,
    P: u8 = 0,
    S: u8 = 0,
    TXT: [20]u8 = [_]u8{0} ** 20,

    pub fn execute(self: *CPU) !void {
        const opcode = self.MP.*[self.PC];
        switch (opcode) {
            0x01 => {
                std.debug.print("{s}\n", .{self.TXT});
                self.PC = self.PC +% 1;
            },

            0x02 => {
                self.PC = self.PC +% 1;
                self.A = self.MP.*[self.PC];
                self.PC = self.PC +% 1;
            },

            0x03 => {
                const ary: [1]u8 = [1]u8{self.A};
                try std.fs.File.stdout().writeAll(&ary);
                self.PC = self.PC +% 1;
            },

            0x04 => {
                self.C = self.C +% 1;
                self.PC = self.PC +% 1;
            },

            0x05 => {
                self.PC = @as(u16, self.MP.*[self.PC + 1]);
            },

            0x06 => {
                self.PC = self.PC +% 1;
                self.P = self.MP.*[self.PC];
                self.PC = self.PC +% 1;
            },

            0x07 => {
                self.PC = self.PC +% 1;
                const x = self.MP.*[self.PC];
                self.PC = self.PC +% 1;
                const y = self.MP.*[self.PC];
                self.VMP.*[y][x] = self.P;
                self.PC = self.PC +% 1;
            },

            0x08 => {
                self.PC = self.PC +% 1;
                self.S = self.MP.*[self.PC];
                self.PC = self.PC +% 1;
            },

            0x09 => {
                self.PC = self.PC -% self.S;
            },

            0x00 => {
                self.PC = self.PC +% 1;
            },

            0xff => {
                std.debug.print("SYSTEM HALT - 0x{X}\n", .{self.PC});
                std.process.exit(0);
            },

            else => {
                std.debug.print("UNKNOWN OPCODE - 0x{X}\n", .{opcode});
                self.PC = self.PC +% 1;
            },
        }
    }
};

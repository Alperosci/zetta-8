const std = @import("std");
const raylib = @cImport({
    @cInclude("raylib.h");
});

pub fn init() void {
    raylib.SetTraceLogLevel(raylib.LOG_NONE);
    raylib.InitWindow(896, 896, "Zetta-8");
    //raylib.SetTargetFPS(60);
}

pub fn draw(vram: [128][128]u8) void {
    raylib.BeginDrawing();

    var x: i32 = 0;
    var y: i32 = 0;
    for (vram) |row| {
        x = 0;
        for (row) |px| {
            switch (px) {
                0 => raylib.DrawRectangle(x * 7, y * 7, 7, 7, raylib.BLACK),
                1 => raylib.DrawRectangle(x * 7, y * 7, 7, 7, raylib.WHITE),
                2 => raylib.DrawRectangle(x * 7, y * 7, 7, 7, raylib.GREEN),
                else => raylib.DrawRectangle(x * 7, y * 7, 7, 7, raylib.BLACK),
            }
            x += 1;
        }
        y += 1;
    }

    raylib.EndDrawing();
}

pub fn checkclose() void {
    if (raylib.WindowShouldClose()) {
        std.process.exit(0);
    }
}

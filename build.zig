const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{.preferred_optimize_mode = .ReleaseFast});
    const exe = b.addExecutable(.{
        .name = "zetta8",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = b.graph.host,
            .optimize = optimize,
        }),
    });

    exe.linkSystemLibrary("raylib");
    exe.linkSystemLibrary("m");
    exe.linkLibC();

    b.installArtifact(exe);

    const runexe = b.addRunArtifact(exe);
    const runstep = b.step("run", "run app");
    runstep.dependOn(&runexe.step);
}

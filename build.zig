const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    //const optimize = b.standardOptimizeOption(.{});
    const exe = b.addExecutable(.{
        .name = "zetta8",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            //.optimize = optimize,
        }),
    });

    exe.root_module.addIncludePath(.{ .cwd_relative = "/usr/local/include/" });
    exe.root_module.addLibraryPath(.{ .cwd_relative = "/usr/local/bin/" });

    exe.linkSystemLibrary("raylib");
    exe.linkSystemLibrary("m");

    b.installArtifact(exe);

    const runexe = b.addRunArtifact(exe);
    const runstep = b.step("run", "run app");
    runstep.dependOn(&runexe.step);
}

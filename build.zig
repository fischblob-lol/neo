//! first build 
const std = @import("std");

pub fn build(b: *std.Build) void {
    const utils = b.createModule(.{
        .root_source_file = b.path("src/utils/utils.zig"),
    });

    const exe = b.addExecutable(.{
        .name = "neo",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = b.graph.host,
            // .strip = true,
            .optimize = .Debug,
        }),
    });

    exe.root_module.addImport("utils", utils);
    b.installArtifact(exe);
}
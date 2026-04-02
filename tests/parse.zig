//! just some testing, im new to zig, and ill prob make my own parser at the end
const std = @import("std");
const print = std.debug.print;
const allocator = std.heap.smp_allocator;

const package = struct {
    name: []const u8,
    version: []const u8,
    url: []const u8,
};

pub fn main() !void {
    const filehandle = try std.fs.cwd().openFile("test.json", .{});
    defer filehandle.close();

    const file = try filehandle.readToEndAlloc(allocator, 2026);
    defer allocator.free(file);

    const parsed = try std.json.parseFromSlice(package, allocator, file, .{ .allocate = .alloc_always });
    defer parsed.deinit();

    const pkg = parsed.value;
    print("name: {s}, version: {s}, url: {s}\n", .{ pkg.name, pkg.version, pkg.url });
}
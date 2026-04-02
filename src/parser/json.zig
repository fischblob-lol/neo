//! not final, just a json parser as a fallback
const std = @import("std");
const print = std.debug.print;

const packagelayout = struct {
    name: []const u8,
    version: []const u8,
    url: []const u8
};

// parses a file in the current cwd, its a debugging function to see if my shits straight
pub fn parser(allocator: std.mem.Allocator, inputfile: [:0]u8) !void {
    const file = try std.fs.cwd().openFile(inputfile, .{});
    defer file.close();

    const filecontents = try file.readToEndAlloc(allocator, 1024);
    defer allocator.free(filecontents);

    const parsed = try std.json.parseFromSlice(packagelayout, allocator, filecontents, .{ .allocate = .alloc_always}); // literally the most simple json parse
    defer parsed.deinit();

    print("name: {s}, version: {s}, url: {s}\n", .{parsed.value.name, parsed.value.version, parsed.value.url});
}

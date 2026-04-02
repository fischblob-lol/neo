const std = @import("std");
const utils = @import("utils/utils.zig");
const print = std.debug.print;

var gpa = std.heap.GeneralPurposeAllocator(.{
    .safety = true,
    .verbose_log = true,
    .thread_safe = true,
}){};

const allocator = gpa.allocator(); // swap this out to smp if you need speed (when we release) std.heap.smp_allocator

pub fn main() !void {
    defer _ = gpa.deinit(); // add catch with error statement later for debugging instead of shusing gpa.deinit
    
    const args = try utils.arghandler(allocator);
    defer std.process.argsFree(allocator, args); // paid

    for (args[1..]) |arg| {
        print("arg: {s}\n", .{arg});
    }

    const cmd = args[1];
    
    if (std.mem.eql(u8, cmd, "--help") or std.mem.eql(u8, cmd, "help")) {
        utils.helpmenu();
        return;
    }
}
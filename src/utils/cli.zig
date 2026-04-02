const std = @import("std");
const print = std.debug.print;

const errorhandle = error {
    notenoughargs,
};

pub fn arghandler(allocator: std.mem.Allocator) ![][:0]u8 {
    
    const args = try std.process.argsAlloc(allocator);

    errdefer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        print("usage: neo <arg>, for more info do 'neo help'\n", .{});
        return errorhandle.notenoughargs;
    }

    return args;
}

pub fn helpmenu() void { // fancy help menu
    print(
        \\usage: neo <arg> [package]
        \\
        \\commands:
        \\  install      install something
        \\  help      show this message yayy
        \\  do        do something (debugging)
        \\
    , .{});
}
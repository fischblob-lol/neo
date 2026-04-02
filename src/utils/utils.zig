//! basically the file which defines everything (.h file but for zig) so i can use it in the zig build system without using b.createModule 5000 times
const cli = @import("cli.zig");
const json = @import("../parser/json.zig");

// deadass using this as a .h file :sob: 
pub const arghandler = cli.arghandler;
// it will contain more things from other files eventually
pub const helpmenu = cli.helpmenu;

pub const installhandler = cli.installhandler;

pub const parsetest = json.parser;
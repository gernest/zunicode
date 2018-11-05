const std = @import("std");
const mem = std.mem;

pub fn compare(a: []const u8, b: []const u8) isize {
    return switch (mem.compare(u8, a, b)) {
        mem.Compare.GreaterThan => 1,
        mem.Compare.Equal => 0,
        mem.Compare.LessThan => -1,
        else => unreachable,
    };
}

pub fn equal(a: []const u8, b: []const u8) bool {
    return mem.eql(u8, a, b);
}

pub fn index(a: []const u8, b: u8) ?usize {
    return mem.indexOf(u8, a, b);
}

pub fn indexByte(a: []const u8, b: u8) ?usize {
    return mem.indexOfScalar(u8, a, b);
}

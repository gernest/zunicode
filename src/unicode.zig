const std = @import("std");
const warn = std.warn;
const tables = @import("tables.zig");
const unicode = std.unicode;
const to_lower_ranges = tables.to_lower_ranges[0..];
const to_lower_singlets = tables.to_lower_singlets[0..];

fn binarySearch(c: u32, a: []const isize, len: usize, stride: usize) ?usize {
    var n = len;
    var t: usize = 0;
    while (n > 1) {
        var m = @divFloor(n, 2);
        var p = t + stride;
        if (@intCast(isize, c) >= a[p]) {
            t = p;
            n = n - m;
        } else {
            n = m;
        }
    }
    if (n != 0 and @intCast(isize, c) >= a[t]) {
        return t;
    }
    return null;
}

pub fn toLower(c: u32) u32 {
    if (binarySearch(c, to_lower_ranges, @divExact(to_lower_ranges.len, 3), 3)) |p| {
        if (p >= 0 and @intCast(isize, c) >= to_lower_ranges[p] and @intCast(isize, c) <= to_lower_ranges[p + 1]) {
            return c + @intCast(u32, to_lower_ranges[p + 2]) - 500;
        }
    }
    if (binarySearch(c, to_lower_singlets, @divExact(to_lower_singlets.len, 2), 2)) |p| {
        if (p >= 0 and @intCast(isize, c) == to_lower_singlets[p]) {
            return c + @intCast(u32, to_lower_singlets[p + 2]) - 500;
        }
    }
    return c;
}

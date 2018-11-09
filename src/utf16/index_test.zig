const unicode = @import("../index.zig");
const utf16 = @import("index.zig");
const t = @import("../util/index.zig");
const std = @import("std");
const mem = std.mem;

test "constants" {
    if (utf16.max_rune != unicode.base.max_rune) {
        try t.terror("utf16.max_rune is wrong");
    }
}

const encodeTest = struct.{
    in: []const i32,
    out: []const u16,
};

const encode_tests = []encodeTest.{
    encodeTest.{ .in = []i32.{ 1, 2, 3, 4 }, .out = []u16.{ 1, 2, 3, 4 } },
    encodeTest.{
        .in = []i32.{ 0xffff, 0x10000, 0x10001, 0x12345, 0x10ffff },
        .out = []u16.{ 0xffff, 0xd800, 0xdc00, 0xd800, 0xdc01, 0xd808, 0xdf45, 0xdbff, 0xdfff },
    },
    encodeTest.{
        .in = []i32.{ 'a', 'b', 0xd7ff, 0xd800, 0xdfff, 0xe000, 0x110000, -1 },
        .out = []u16.{ 'a', 'b', 0xd7ff, 0xfffd, 0xfffd, 0xe000, 0xfffd, 0xfffd },
    },
};

test "encode" {
    var a = std.debug.global_allocator;
    for (encode_tests) |ts, i| {
        if (utf16.encode(a, ts.in)) |v| {
            const value = v;
            if (!mem.eql(u16, ts.out, value)) {
                try t.terrorf("mismatch encoding at {}\n", i);
            }
            a.free(v);
        } else |err| {}
    }
}

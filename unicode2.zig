test "toLower" {
    var a: [4]u8 = undefined;
    const low = toLower('Q');
    const n = try unicode.utf8Encode(low, a[0..]);
    std.debug.warn("value {}\n", a[0..@intCast(usize, n)]);
}

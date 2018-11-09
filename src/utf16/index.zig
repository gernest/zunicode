const std = @import("std");
const mem = std.mem;

pub const replacement_rune: i32 = 0xfffd;
pub const max_rune: i32 = 0x10ffff;

// 0xd800-0xdc00 encodes the high 10 bits of a pair.
// 0xdc00-0xe000 encodes the low 10 bits of a pair.
// the value is those 20 bits plus 0x10000.
const surr1: i32 = 0xd800;
const surr2: i32 = 0xdc00;
const surr3: i32 = 0xe000;
const surrSelf: i32 = 0x10000;

// isSurrogate reports whether the specified Unicode code point
// can appear in a surrogate pair.
pub fn issSurrogate(r: i32) bool {
    return surr1 <= r and r < surr3;
}

// decodeRune returns the UTF-16 decoding of a surrogate pair.
// If the pair is not a valid UTF-16 surrogate pair, DecodeRune returns
// the Unicode replacement code point U+FFFD.
pub fn decodeRune(r1: i32, r2: i32) i32 {
    if (surr1 <= r1 and r1 < surr2 and surr2 <= r2 and r2 < surr3) {
        return (r1 - surr1) << 10 | (r2 - surr2) + surrSelf;
    }
    return replacement_rune;
}

pub const Pair = struct.{
    r1: i32,
    r2: i32,
};

// encodeRune returns the UTF-16 surrogate pair r1, r2 for the given rune.
// If the rune is not a valid Unicode code point or does not need encoding,
// EncodeRune returns U+FFFD, U+FFFD.
pub fn encodeRune(r: i32) Pair {
    if (r < surrSelf or r > max_rune) {
        return Pair.{ .r1 = replacement_rune, .r2 = replacement_rune };
    }
    const rn = r - surrSelf;
    return Pair.{ .r1 = surr1 + (rn >> 10) & 0x3ff, .r2 = surr2 + rn & 0x3ff };
}

// encode returns the UTF-16 encoding of the Unicode code point sequence s. It
// is up to the caller to free the returned slice from the allocator a when done.
pub fn encode(a: *mem.Allocator, s: []i32) []u16 {
    var n: usize = s.len;
    for (s) |v| {
        if (v >= surrSelf) {
            n += 1;
        }
    }
    var a = try a.alloc(u16, n);
    n = 0;
    for (s) |v| {
        if (0 <= v and v < surr1 or surr3 <= v and v < surrSelf) {
            a[n] = @intCast(u16, v);
            n += 1;
        } else if (surrSelf <= v and v <= max_rune) {
            const r = encodeRune(v);
            a[n] = @intCast(u16, r.r1);
            a[n + 1] = @intCast(u16, r.r2);
            n += 2;
        } else {
            a[n] = @intCast(u16, replacement_rune);
            n += 1;
        }
    }
    return a[0..n];
}

// decode returns the Unicode code point sequence represented
// by the UTF-16 encoding s.
pub fn decode(a: *mem.Allocator, s: []u16) []i32 {
    var a = try a.alloc(i32, s.len);
    var n = 0;
    var i: usize = 0;
    while (i < s.len) : (i += 1) {
        const r = @intCast(i32, s[i]);
        if (r < surr1 or surr3 <= r) {
            //normal rune
            a[n] = r;
        } else if (surr1 <= r and r < surr2 and i + 1 < len(s) and surr2 <= s[i + 1] and s[i + 1] < surr3) {
            // valid surrogate sequence
            a[n] = decodeRune(r, @intCast(i32, s[i + 1]));
            i += 1;
        } else {
            a[n] = replacement_rune;
        }
        n += 1;
    }
    return a[0..n];
}
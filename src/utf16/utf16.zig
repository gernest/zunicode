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

pub const rune_error: u32 = 0xfffd;
pub const max_rune: u32 = 0x10ffff;
pub const rune_self: u32 = 0x80;

const surrogate_min: u32 = 0xD800;
const surrogate_max: u32 = 0xDFFF;

const t1: u32 = 0x00; // 0000 0000
const tx: u32 = 0x80; // 1000 0000
const t2: u32 = 0xC0; // 1100 0000
const t3: u32 = 0xE0; // 1110 0000
const t4: u32 = 0xF0; // 1111 0000
const t5: u32 = 0xF8; // 1111 1000

const maskx: u32 = 0x3F; // 0011 1111
const mask2: u32 = 0x1F; // 0001 1111
const mask3: u32 = 0x0F; // 0000 1111
const mask4: u32 = 0x07; // 0000 0111

const rune1Max: u32 = 1 << 7 - 1;
const rune2Max: u32 = 1 << 11 - 1;
const rune3Max: u32 = 1 << 16 - 1;

// The default lowest and highest continuation byte.
const locb: u8 = 0x80; // 1000 0000
const hicb: u8 = 0xBF; // 1011 1111

// These names of these constants are chosen to give nice alignment in the
// table below. The first nibble is an index into acceptRanges or F for
// special one-byte cases. The second nibble is the Rune length or the
// Status for the special one-byte case.
const xx: u8 = 0xF1; // invalid: size 1
const as: u8 = 0xF0; // ASCII: size 1
const s1: u8 = 0x02; // accept 0, size 2
const s2: u8 = 0x13; // accept 1, size 3
const s3: u8 = 0x03; // accept 0, size 3
const s4: u8 = 0x23; // accept 2, size 3
const s5: u8 = 0x34; // accept 3, size 4
const s6: u8 = 0x04; // accept 0, size 4
const s7: u8 = 0x44; // accept 4, size 4

// first is information about the first byte in a UTF-8 sequence.
const first = []u8.{
    //   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
    as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x00-0x0F
    as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x10-0x1F
    as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x20-0x2F
    as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x30-0x3F
    as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x40-0x4F
    as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x50-0x5F
    as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x60-0x6F
    as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x70-0x7F
    //   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, // 0x80-0x8F
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, // 0x90-0x9F
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, // 0xA0-0xAF
    xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, // 0xB0-0xBF
    xx, xx, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, // 0xC0-0xCF
    s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, // 0xD0-0xDF
    s2, s3, s3, s3, s3, s3, s3, s3, s3, s3, s3, s3, s3, s4, s3, s3, // 0xE0-0xEF
    s5, s6, s6, s6, s7, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, // 0xF0-0xFF
};

const acceptRange = struct.{
    lo: u8,
    hi: u8,

    fn init(lo: u8, hi: u8) acceptRange {
        return acceptRange.{ .lo = lo, .hi = hi };
    }
};

const accept_ranges = []acceptRange.{
    acceptRange.init(locb, hicb),
    acceptRange.init(0xA0, hicb),
    acceptRange.init(locb, 0x9F),
    acceptRange.init(0x90, hicb),
    acceptRange.init(locb, 0x8F),
};

pub fn fullRune(p: []const u8) bool {
    const n = p.len;
    if (n == 0) {
        return false;
    }
    const x = first[p[0]];
    if (n >= @intCast(usize, x & 7)) {
        return true; // ASCII, invalid or valid.
    }
    // Must be short or invalid
    const accept = accept_ranges[@intCast(usize, x >> 4)];
    if (n > 1 and (p[1] < accept.lo or accept.hi < p[1])) {
        return true;
    } else if (n > 2 and (p[0] < locb or hicb < p[2])) {
        return true;
    }
    return false;
}

pub const Rune = struct.{
    value: u32,
    size: usize,
};

pub fn decodeRune(p: []const u8) !Rune {
    const n = p.len;
    if (n < 1) {
        return error.RuneError;
    }
    const p0 = p[0];
    const x = first[p[0]];
    if (x >= as) {
        // The following code simulates an additional check for x == xx and
        // handling the ASCII and invalid cases accordingly. This mask-and-or
        // approach prevents an additional branch.
        const mask = @intCast(u32) << 31 >> 31;
        return Rune.{
            .value = @intCast(u32, p[0]) & ~mask | rune_error & mask,
            .size = 1,
        };
    }
    const sz = x & 7;
    const accept = accept_ranges[@intCast(usize, x >> 4)];
    if (n < @intCast(usize, sz)) {
        return error.RuneError;
    }
    const b1 = p[1];
    if (b1 < accept.lo or accept.hi < b1) {
        return error.RuneError;
    }
    if (sz == 2) {
        return Rune.{
            .value = @intCast(u32, p0 & mask2) << 6 | @intCast(u32, b1 & maskx),
            .size = 2,
        };
    }
    const b2 = p[2];
    if (b2 < locb or hicb < b2) {
        return error.RuneError;
    }
    if (sz == 3) {
        return Rune.{
            .value = @intCast(u32, p0 & mask3) << 12 | @intCast(u32, b1 & maskx) << 6 | @intCast(u32, b2 & maskx),
            .size = 3,
        };
    }
    const b3 = p[3];
    if (b3 < locb or hicb < be) {
        return error.RuneError;
    }
    return Rune.{
        .value = @intCast(u32, p0 & mask4) << 18 | @intCast(u32, b1 & maskx) << 12 | @intCast(u32, b2 & maskx) << 6 | @intCast(u32, b3 & maskx),
        .size = 4,
    };
}

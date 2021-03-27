// Translated from the Go unicode package.

// Version is the Unicode edition from which the tables are derived.
pub const Version = "13.0.0";
pub const max_rune: i32 = 0x10ffff;
pub const replacement_char: i32 = 0xfffd;
pub const max_ascii: i32 = 0x7f;
pub const max_latin1: i32 = 0xff;
pub const linear_max: usize = 18;

/// If the Delta field of a CaseRange is upper_lower, it means
/// this CaseRange represents a sequence of the form (say)
/// Upper Lower Upper Lower.
pub const upper_lower: i32 = @intCast(i32, max_rune) + 1;

/// Categories is the set of Unicode category tables.
pub const Categories = [_]*RangeTable{
    &C,
    &Cc,
    &Cf,
    &Co,
    &Cs,
    &L,
    &Ll,
    &Lm,
    &Lo,
    &Lt,
    &Lu,
    &M,
    &Mc,
    &Me,
    &Mn,
    &N,
    &Nd,
    &Nl,
    &No,
    &P,
    &Pc,
    &Pd,
    &Pe,
    &Pf,
    &Pi,
    &Po,
    &Ps,
    &S,
    &Sc,
    &Sk,
    &Sm,
    &So,
    &Z,
    &Zl,
    &Zp,
    &Zs,
};

pub const RangeTable = struct {
    r16: []const Range16 = &[0]Range16{},
    r32: []const Range32 = &[0]Range32{},
    latin_offset: usize = 0,
};

pub const Range16 = struct {
    lo: u16,
    hi: u16,
    stride: u16,

    pub fn init(lo: u16, hi: u16, stride: u16) Range16 {
        return Range16{ .lo = lo, .hi = hi, .stride = stride };
    }
};

pub const Range32 = struct {
    lo: u32,
    hi: u32,
    stride: u32,

    pub fn init(lo: u32, hi: u32, stride: u32) Range32 {
        return Range32{ .lo = lo, .hi = hi, .stride = stride };
    }
};

pub const C = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(x0000, 0x001f, 1),
        Range16.init(0x007f, 0x009f, 1),
        Range16.init(0x00ad, 0x0600, 1363),
        Range16.init(0x0601, 0x0605, 1),
        Range16.init(0x061c, 0x06dd, 193),
        Range16.init(0x070f, 0x08e2, 467),
        Range16.init(0x180e, 0x200b, 2045),
        Range16.init(0x200c, 0x200f, 1),
        Range16.init(0x202a, 0x202e, 1),
        Range16.init(0x2060, 0x2064, 1),
        Range16.init(0x2066, 0x206f, 1),
        Range16.init(0xd800, 0xf8ff, 1),
        Range16.init(0xfeff, 0xfff9, 250),
        Range16.init(0xfffa, 0xfffb, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x110bd, 0x110cd, 16),
        Range32.init(0x13430, 0x13438, 1),
        Range32.init(0x1bca0, 0x1bca3, 1),
        Range32.init(0x1d173, 0x1d17a, 1),
        Range32.init(0xe0001, 0xe0020, 31),
        Range32.init(0xe0021, 0xe007f, 1),
        Range32.init(0xf0000, 0xffffd, 1),
        Range32.init(0x100000, 0x10fffd, 1),
    },
    .latin_offset = 2,
};

pub const Cc = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0000, 0x001f, 1),
        Range16.init(0x007f, 0x009f, 1),
    },
    .latin_offset = 2,
};

pub const Cf = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x00ad, 0x0600, 1363),
        Range16.init(0x0601, 0x0605, 1),
        Range16.init(0x061c, 0x06dd, 193),
        Range16.init(0x070f, 0x08e2, 467),
        Range16.init(x180e, 0x200b, 2045),
        Range16.init(0x200c, 0x200f, 1),
        Range16.init(0x202a, 0x202e, 1),
        Range16.init(0x2060, 0x2064, 1),
        Range16.init(0x2066, 0x206f, 1),
        Range16.init(0xfeff, 0xfff9, 250),
        Range16.init(0xfffa, 0xfffb, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x110bd, 0x110cd, 16),
        Range32.init(0x13430, 0x13438, 1),
        Range32.init(0x1bca0, 0x1bca3, 1),
        Range32.init(0x1d173, 0x1d17a, 1),
        Range32.init(0xe0001, 0xe0020, 31),
        Range32.init(0xe0021, 0xe007f, 1),
    },
};

pub const Co = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xe000, 0xf8ff, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0xf0000, 0xffffd, 1),
        Range32.init(0x100000, 0x10fffd, 1),
    },
};

pub const Cs = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xd800, 0xdfff, 1),
    },
};

pub const L = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0041, 0x005a, 1),
        Range16.init(0x0061, 0x007a, 1),
        Range16.init(0x00aa, 0x00b5, 11),
        Range16.init(0x00ba, 0x00c0, 6),
        Range16.init(0x00c1, 0x00d6, 1),
        Range16.init(0x00d8, 0x00f6, 1),
        Range16.init(0x00f8, 0x02c1, 1),
        Range16.init(0x02c6, 0x02d1, 1),
        Range16.init(0x02e0, 0x02e4, 1),
        Range16.init(0x02ec, 0x02ee, 2),
        Range16.init(0x0370, 0x0374, 1),
        Range16.init(0x0376, 0x0377, 1),
        Range16.init(0x037a, 0x037d, 1),
        Range16.init(0x037f, 0x0386, 7),
        Range16.init(0x0388, 0x038a, 1),
        Range16.init(0x038c, 0x038e, 2),
        Range16.init(0x038f, 0x03a1, 1),
        Range16.init(0x03a3, 0x03f5, 1),
        Range16.init(0x03f7, 0x0481, 1),
        Range16.init(0x048a, 0x052f, 1),
        Range16.init(0x0531, 0x0556, 1),
        Range16.init(0x0559, 0x0560, 7),
        Range16.init(0x0561, 0x0588, 1),
        Range16.init(0x05d0, 0x05ea, 1),
        Range16.init(0x05ef, 0x05f2, 1),
        Range16.init(0x0620, 0x064a, 1),
        Range16.init(0x066e, 0x066f, 1),
        Range16.init(0x0671, 0x06d3, 1),
        Range16.init(0x06d5, 0x06e5, 16),
        Range16.init(0x06e6, 0x06ee, 8),
        Range16.init(0x06ef, 0x06fa, 11),
        Range16.init(0x06fb, 0x06fc, 1),
        Range16.init(0x06ff, 0x0710, 17),
        Range16.init(0x0712, 0x072f, 1),
        Range16.init(0x074d, 0x07a5, 1),
        Range16.init(0x07b1, 0x07ca, 25),
        Range16.init(0x07cb, 0x07ea, 1),
        Range16.init(0x07f4, 0x07f5, 1),
        Range16.init(0x07fa, 0x0800, 6),
        Range16.init(0x0801, 0x0815, 1),
        Range16.init(0x081a, 0x0824, 10),
        Range16.init(0x0828, 0x0840, 24),
        Range16.init(0x0841, 0x0858, 1),
        Range16.init(0x0860, 0x086a, 1),
        Range16.init(0x08a0, 0x08b4, 1),
        Range16.init(0x08b6, 0x08c7, 1),
        Range16.init(0x0904, 0x0939, 1),
        Range16.init(0x093d, 0x0950, 19),
        Range16.init(0x0958, 0x0961, 1),
        Range16.init(0x0971, 0x0980, 1),
        Range16.init(0x0985, 0x098c, 1),
        Range16.init(0x098f, 0x0990, 1),
        Range16.init(0x0993, 0x09a8, 1),
        Range16.init(0x09aa, 0x09b0, 1),
        Range16.init(0x09b2, 0x09b6, 4),
        Range16.init(0x09b7, 0x09b9, 1),
        Range16.init(0x09bd, 0x09ce, 17),
        Range16.init(0x09dc, 0x09dd, 1),
        Range16.init(0x09df, 0x09e1, 1),
        Range16.init(0x09f0, 0x09f1, 1),
        Range16.init(0x09fc, 0x0a05, 9),
        Range16.init(0x0a06, 0x0a0a, 1),
        Range16.init(0x0a0f, 0x0a10, 1),
        Range16.init(0x0a13, 0x0a28, 1),
        Range16.init(0x0a2a, 0x0a30, 1),
        Range16.init(0x0a32, 0x0a33, 1),
        Range16.init(0x0a35, 0x0a36, 1),
        Range16.init(0x0a38, 0x0a39, 1),
        Range16.init(0x0a59, 0x0a5c, 1),
        Range16.init(0x0a5e, 0x0a72, 20),
        Range16.init(0x0a73, 0x0a74, 1),
        Range16.init(0x0a85, 0x0a8d, 1),
        Range16.init(0x0a8f, 0x0a91, 1),
        Range16.init(0x0a93, 0x0aa8, 1),
        Range16.init(0x0aaa, 0x0ab0, 1),
        Range16.init(0x0ab2, 0x0ab3, 1),
        Range16.init(0x0ab5, 0x0ab9, 1),
        Range16.init(0x0abd, 0x0ad0, 19),
        Range16.init(0x0ae0, 0x0ae1, 1),
        Range16.init(0x0af9, 0x0b05, 12),
        Range16.init(0x0b06, 0x0b0c, 1),
        Range16.init(0x0b0f, 0x0b10, 1),
        Range16.init(0x0b13, 0x0b28, 1),
        Range16.init(0x0b2a, 0x0b30, 1),
        Range16.init(0x0b32, 0x0b33, 1),
        Range16.init(0x0b35, 0x0b39, 1),
        Range16.init(0x0b3d, 0x0b5c, 31),
        Range16.init(0x0b5d, 0x0b5f, 2),
        Range16.init(0x0b60, 0x0b61, 1),
        Range16.init(0x0b71, 0x0b83, 18),
        Range16.init(0x0b85, 0x0b8a, 1),
        Range16.init(0x0b8e, 0x0b90, 1),
        Range16.init(0x0b92, 0x0b95, 1),
        Range16.init(0x0b99, 0x0b9a, 1),
        Range16.init(0x0b9c, 0x0b9e, 2),
        Range16.init(0x0b9f, 0x0ba3, 4),
        Range16.init(0x0ba4, 0x0ba8, 4),
        Range16.init(0x0ba9, 0x0baa, 1),
        Range16.init(0x0bae, 0x0bb9, 1),
        Range16.init(0x0bd0, 0x0c05, 53),
        Range16.init(0x0c06, 0x0c0c, 1),
        Range16.init(0x0c0e, 0x0c10, 1),
        Range16.init(0x0c12, 0x0c28, 1),
        Range16.init(0x0c2a, 0x0c39, 1),
        Range16.init(0x0c3d, 0x0c58, 27),
        Range16.init(0x0c59, 0x0c5a, 1),
        Range16.init(0x0c60, 0x0c61, 1),
        Range16.init(0x0c80, 0x0c85, 5),
        Range16.init(0x0c86, 0x0c8c, 1),
        Range16.init(0x0c8e, 0x0c90, 1),
        Range16.init(0x0c92, 0x0ca8, 1),
        Range16.init(0x0caa, 0x0cb3, 1),
        Range16.init(0x0cb5, 0x0cb9, 1),
        Range16.init(0x0cbd, 0x0cde, 33),
        Range16.init(0x0ce0, 0x0ce1, 1),
        Range16.init(0x0cf1, 0x0cf2, 1),
        Range16.init(0x0d04, 0x0d0c, 1),
        Range16.init(0x0d0e, 0x0d10, 1),
        Range16.init(0x0d12, 0x0d3a, 1),
        Range16.init(0x0d3d, 0x0d4e, 17),
        Range16.init(0x0d54, 0x0d56, 1),
        Range16.init(0x0d5f, 0x0d61, 1),
        Range16.init(0x0d7a, 0x0d7f, 1),
        Range16.init(0x0d85, 0x0d96, 1),
        Range16.init(0x0d9a, 0x0db1, 1),
        Range16.init(0x0db3, 0x0dbb, 1),
        Range16.init(0x0dbd, 0x0dc0, 3),
        Range16.init(0x0dc1, 0x0dc6, 1),
        Range16.init(0x0e01, 0x0e30, 1),
        Range16.init(0x0e32, 0x0e33, 1),
        Range16.init(0x0e40, 0x0e46, 1),
        Range16.init(0x0e81, 0x0e82, 1),
        Range16.init(0x0e84, 0x0e86, 2),
        Range16.init(0x0e87, 0x0e8a, 1),
        Range16.init(0x0e8c, 0x0ea3, 1),
        Range16.init(0x0ea5, 0x0ea7, 2),
        Range16.init(0x0ea8, 0x0eb0, 1),
        Range16.init(0x0eb2, 0x0eb3, 1),
        Range16.init(0x0ebd, 0x0ec0, 3),
        Range16.init(0x0ec1, 0x0ec4, 1),
        Range16.init(0x0ec6, 0x0edc, 22),
        Range16.init(0x0edd, 0x0edf, 1),
        Range16.init(0x0f00, 0x0f40, 64),
        Range16.init(0x0f41, 0x0f47, 1),
        Range16.init(0x0f49, 0x0f6c, 1),
        Range16.init(0x0f88, 0x0f8c, 1),
        Range16.init(0x1000, 0x102a, 1),
        Range16.init(0x103f, 0x1050, 17),
        Range16.init(0x1051, 0x1055, 1),
        Range16.init(0x105a, 0x105d, 1),
        Range16.init(0x1061, 0x1065, 4),
        Range16.init(0x1066, 0x106e, 8),
        Range16.init(0x106f, 0x1070, 1),
        Range16.init(0x1075, 0x1081, 1),
        Range16.init(0x108e, 0x10a0, 18),
        Range16.init(0x10a1, 0x10c5, 1),
        Range16.init(0x10c7, 0x10cd, 6),
        Range16.init(0x10d0, 0x10fa, 1),
        Range16.init(0x10fc, 0x1248, 1),
        Range16.init(0x124a, 0x124d, 1),
        Range16.init(0x1250, 0x1256, 1),
        Range16.init(0x1258, 0x125a, 2),
        Range16.init(0x125b, 0x125d, 1),
        Range16.init(0x1260, 0x1288, 1),
        Range16.init(0x128a, 0x128d, 1),
        Range16.init(0x1290, 0x12b0, 1),
        Range16.init(0x12b2, 0x12b5, 1),
        Range16.init(0x12b8, 0x12be, 1),
        Range16.init(0x12c0, 0x12c2, 2),
        Range16.init(0x12c3, 0x12c5, 1),
        Range16.init(0x12c8, 0x12d6, 1),
        Range16.init(0x12d8, 0x1310, 1),
        Range16.init(0x1312, 0x1315, 1),
        Range16.init(0x1318, 0x135a, 1),
        Range16.init(0x1380, 0x138f, 1),
        Range16.init(0x13a0, 0x13f5, 1),
        Range16.init(0x13f8, 0x13fd, 1),
        Range16.init(0x1401, 0x166c, 1),
        Range16.init(0x166f, 0x167f, 1),
        Range16.init(0x1681, 0x169a, 1),
        Range16.init(0x16a0, 0x16ea, 1),
        Range16.init(0x16f1, 0x16f8, 1),
        Range16.init(0x1700, 0x170c, 1),
        Range16.init(0x170e, 0x1711, 1),
        Range16.init(0x1720, 0x1731, 1),
        Range16.init(0x1740, 0x1751, 1),
        Range16.init(0x1760, 0x176c, 1),
        Range16.init(0x176e, 0x1770, 1),
        Range16.init(0x1780, 0x17b3, 1),
        Range16.init(0x17d7, 0x17dc, 5),
        Range16.init(0x1820, 0x1878, 1),
        Range16.init(0x1880, 0x1884, 1),
        Range16.init(0x1887, 0x18a8, 1),
        Range16.init(0x18aa, 0x18b0, 6),
        Range16.init(0x18b1, 0x18f5, 1),
        Range16.init(0x1900, 0x191e, 1),
        Range16.init(0x1950, 0x196d, 1),
        Range16.init(0x1970, 0x1974, 1),
        Range16.init(0x1980, 0x19ab, 1),
        Range16.init(0x19b0, 0x19c9, 1),
        Range16.init(0x1a00, 0x1a16, 1),
        Range16.init(0x1a20, 0x1a54, 1),
        Range16.init(0x1aa7, 0x1b05, 94),
        Range16.init(0x1b06, 0x1b33, 1),
        Range16.init(0x1b45, 0x1b4b, 1),
        Range16.init(0x1b83, 0x1ba0, 1),
        Range16.init(0x1bae, 0x1baf, 1),
        Range16.init(0x1bba, 0x1be5, 1),
        Range16.init(0x1c00, 0x1c23, 1),
        Range16.init(0x1c4d, 0x1c4f, 1),
        Range16.init(0x1c5a, 0x1c7d, 1),
        Range16.init(0x1c80, 0x1c88, 1),
        Range16.init(0x1c90, 0x1cba, 1),
        Range16.init(0x1cbd, 0x1cbf, 1),
        Range16.init(0x1ce9, 0x1cec, 1),
        Range16.init(0x1cee, 0x1cf3, 1),
        Range16.init(0x1cf5, 0x1cf6, 1),
        Range16.init(0x1cfa, 0x1d00, 6),
        Range16.init(0x1d01, 0x1dbf, 1),
        Range16.init(0x1e00, 0x1f15, 1),
        Range16.init(0x1f18, 0x1f1d, 1),
        Range16.init(0x1f20, 0x1f45, 1),
        Range16.init(0x1f48, 0x1f4d, 1),
        Range16.init(0x1f50, 0x1f57, 1),
        Range16.init(0x1f59, 0x1f5f, 2),
        Range16.init(0x1f60, 0x1f7d, 1),
        Range16.init(0x1f80, 0x1fb4, 1),
        Range16.init(0x1fb6, 0x1fbc, 1),
        Range16.init(0x1fbe, 0x1fc2, 4),
        Range16.init(0x1fc3, 0x1fc4, 1),
        Range16.init(0x1fc6, 0x1fcc, 1),
        Range16.init(0x1fd0, 0x1fd3, 1),
        Range16.init(0x1fd6, 0x1fdb, 1),
        Range16.init(0x1fe0, 0x1fec, 1),
        Range16.init(0x1ff2, 0x1ff4, 1),
        Range16.init(0x1ff6, 0x1ffc, 1),
        Range16.init(0x2071, 0x207f, 14),
        Range16.init(0x2090, 0x209c, 1),
        Range16.init(0x2102, 0x2107, 5),
        Range16.init(0x210a, 0x2113, 1),
        Range16.init(0x2115, 0x2119, 4),
        Range16.init(0x211a, 0x211d, 1),
        Range16.init(0x2124, 0x212a, 2),
        Range16.init(0x212b, 0x212d, 1),
        Range16.init(0x212f, 0x2139, 1),
        Range16.init(0x213c, 0x213f, 1),
        Range16.init(0x2145, 0x2149, 1),
        Range16.init(0x214e, 0x2183, 53),
        Range16.init(0x2184, 0x2c00, 2684),
        Range16.init(0x2c01, 0x2c2e, 1),
        Range16.init(0x2c30, 0x2c5e, 1),
        Range16.init(0x2c60, 0x2ce4, 1),
        Range16.init(0x2ceb, 0x2cee, 1),
        Range16.init(0x2cf2, 0x2cf3, 1),
        Range16.init(0x2d00, 0x2d25, 1),
        Range16.init(0x2d27, 0x2d2d, 6),
        Range16.init(0x2d30, 0x2d67, 1),
        Range16.init(0x2d6f, 0x2d80, 17),
        Range16.init(0x2d81, 0x2d96, 1),
        Range16.init(0x2da0, 0x2da6, 1),
        Range16.init(0x2da8, 0x2dae, 1),
        Range16.init(0x2db0, 0x2db6, 1),
        Range16.init(0x2db8, 0x2dbe, 1),
        Range16.init(0x2dc0, 0x2dc6, 1),
        Range16.init(0x2dc8, 0x2dce, 1),
        Range16.init(0x2dd0, 0x2dd6, 1),
        Range16.init(0x2dd8, 0x2dde, 1),
        Range16.init(0x2e2f, 0x3005, 470),
        Range16.init(0x3006, 0x3031, 43),
        Range16.init(0x3032, 0x3035, 1),
        Range16.init(0x303b, 0x303c, 1),
        Range16.init(0x3041, 0x3096, 1),
        Range16.init(0x309d, 0x309f, 1),
        Range16.init(0x30a1, 0x30fa, 1),
        Range16.init(0x30fc, 0x30ff, 1),
        Range16.init(0x3105, 0x312f, 1),
        Range16.init(0x3131, 0x318e, 1),
        Range16.init(0x31a0, 0x31bf, 1),
        Range16.init(0x31f0, 0x31ff, 1),
        Range16.init(0x3400, 0x4dbf, 1),
        Range16.init(0x4e00, 0x9ffc, 1),
        Range16.init(0xa000, 0xa48c, 1),
        Range16.init(0xa4d0, 0xa4fd, 1),
        Range16.init(0xa500, 0xa60c, 1),
        Range16.init(0xa610, 0xa61f, 1),
        Range16.init(0xa62a, 0xa62b, 1),
        Range16.init(0xa640, 0xa66e, 1),
        Range16.init(0xa67f, 0xa69d, 1),
        Range16.init(0xa6a0, 0xa6e5, 1),
        Range16.init(0xa717, 0xa71f, 1),
        Range16.init(0xa722, 0xa788, 1),
        Range16.init(0xa78b, 0xa7bf, 1),
        Range16.init(0xa7c2, 0xa7ca, 1),
        Range16.init(0xa7f5, 0xa801, 1),
        Range16.init(0xa803, 0xa805, 1),
        Range16.init(0xa807, 0xa80a, 1),
        Range16.init(0xa80c, 0xa822, 1),
        Range16.init(0xa840, 0xa873, 1),
        Range16.init(0xa882, 0xa8b3, 1),
        Range16.init(0xa8f2, 0xa8f7, 1),
        Range16.init(0xa8fb, 0xa8fd, 2),
        Range16.init(0xa8fe, 0xa90a, 12),
        Range16.init(0xa90b, 0xa925, 1),
        Range16.init(0xa930, 0xa946, 1),
        Range16.init(0xa960, 0xa97c, 1),
        Range16.init(0xa984, 0xa9b2, 1),
        Range16.init(0xa9cf, 0xa9e0, 17),
        Range16.init(0xa9e1, 0xa9e4, 1),
        Range16.init(0xa9e6, 0xa9ef, 1),
        Range16.init(0xa9fa, 0xa9fe, 1),
        Range16.init(0xaa00, 0xaa28, 1),
        Range16.init(0xaa40, 0xaa42, 1),
        Range16.init(0xaa44, 0xaa4b, 1),
        Range16.init(0xaa60, 0xaa76, 1),
        Range16.init(0xaa7a, 0xaa7e, 4),
        Range16.init(0xaa7f, 0xaaaf, 1),
        Range16.init(0xaab1, 0xaab5, 4),
        Range16.init(0xaab6, 0xaab9, 3),
        Range16.init(0xaaba, 0xaabd, 1),
        Range16.init(0xaac0, 0xaac2, 2),
        Range16.init(0xaadb, 0xaadd, 1),
        Range16.init(0xaae0, 0xaaea, 1),
        Range16.init(0xaaf2, 0xaaf4, 1),
        Range16.init(0xab01, 0xab06, 1),
        Range16.init(0xab09, 0xab0e, 1),
        Range16.init(0xab11, 0xab16, 1),
        Range16.init(0xab20, 0xab26, 1),
        Range16.init(0xab28, 0xab2e, 1),
        Range16.init(0xab30, 0xab5a, 1),
        Range16.init(0xab5c, 0xab69, 1),
        Range16.init(0xab70, 0xabe2, 1),
        Range16.init(0xac00, 0xd7a3, 1),
        Range16.init(0xd7b0, 0xd7c6, 1),
        Range16.init(0xd7cb, 0xd7fb, 1),
        Range16.init(0xf900, 0xfa6d, 1),
        Range16.init(0xfa70, 0xfad9, 1),
        Range16.init(0xfb00, 0xfb06, 1),
        Range16.init(0xfb13, 0xfb17, 1),
        Range16.init(0xfb1d, 0xfb1f, 2),
        Range16.init(0xfb20, 0xfb28, 1),
        Range16.init(0xfb2a, 0xfb36, 1),
        Range16.init(0xfb38, 0xfb3c, 1),
        Range16.init(0xfb3e, 0xfb40, 2),
        Range16.init(0xfb41, 0xfb43, 2),
        Range16.init(0xfb44, 0xfb46, 2),
        Range16.init(0xfb47, 0xfbb1, 1),
        Range16.init(0xfbd3, 0xfd3d, 1),
        Range16.init(0xfd50, 0xfd8f, 1),
        Range16.init(0xfd92, 0xfdc7, 1),
        Range16.init(0xfdf0, 0xfdfb, 1),
        Range16.init(0xfe70, 0xfe74, 1),
        Range16.init(0xfe76, 0xfefc, 1),
        Range16.init(0xff21, 0xff3a, 1),
        Range16.init(0xff41, 0xff5a, 1),
        Range16.init(0xff66, 0xffbe, 1),
        Range16.init(0xffc2, 0xffc7, 1),
        Range16.init(0xffca, 0xffcf, 1),
        Range16.init(0xffd2, 0xffd7, 1),
        Range16.init(0xffda, 0xffdc, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10000, 0x1000b, 1),
        Range32.init(0x1000d, 0x10026, 1),
        Range32.init(0x10028, 0x1003a, 1),
        Range32.init(0x1003c, 0x1003d, 1),
        Range32.init(0x1003f, 0x1004d, 1),
        Range32.init(0x10050, 0x1005d, 1),
        Range32.init(0x10080, 0x100fa, 1),
        Range32.init(0x10280, 0x1029c, 1),
        Range32.init(0x102a0, 0x102d0, 1),
        Range32.init(0x10300, 0x1031f, 1),
        Range32.init(0x1032d, 0x10340, 1),
        Range32.init(0x10342, 0x10349, 1),
        Range32.init(0x10350, 0x10375, 1),
        Range32.init(0x10380, 0x1039d, 1),
        Range32.init(0x103a0, 0x103c3, 1),
        Range32.init(0x103c8, 0x103cf, 1),
        Range32.init(0x10400, 0x1049d, 1),
        Range32.init(0x104b0, 0x104d3, 1),
        Range32.init(0x104d8, 0x104fb, 1),
        Range32.init(0x10500, 0x10527, 1),
        Range32.init(0x10530, 0x10563, 1),
        Range32.init(0x10600, 0x10736, 1),
        Range32.init(0x10740, 0x10755, 1),
        Range32.init(0x10760, 0x10767, 1),
        Range32.init(0x10800, 0x10805, 1),
        Range32.init(0x10808, 0x1080a, 2),
        Range32.init(0x1080b, 0x10835, 1),
        Range32.init(0x10837, 0x10838, 1),
        Range32.init(0x1083c, 0x1083f, 3),
        Range32.init(0x10840, 0x10855, 1),
        Range32.init(0x10860, 0x10876, 1),
        Range32.init(0x10880, 0x1089e, 1),
        Range32.init(0x108e0, 0x108f2, 1),
        Range32.init(0x108f4, 0x108f5, 1),
        Range32.init(0x10900, 0x10915, 1),
        Range32.init(0x10920, 0x10939, 1),
        Range32.init(0x10980, 0x109b7, 1),
        Range32.init(0x109be, 0x109bf, 1),
        Range32.init(0x10a00, 0x10a10, 16),
        Range32.init(0x10a11, 0x10a13, 1),
        Range32.init(0x10a15, 0x10a17, 1),
        Range32.init(0x10a19, 0x10a35, 1),
        Range32.init(0x10a60, 0x10a7c, 1),
        Range32.init(0x10a80, 0x10a9c, 1),
        Range32.init(0x10ac0, 0x10ac7, 1),
        Range32.init(0x10ac9, 0x10ae4, 1),
        Range32.init(0x10b00, 0x10b35, 1),
        Range32.init(0x10b40, 0x10b55, 1),
        Range32.init(0x10b60, 0x10b72, 1),
        Range32.init(0x10b80, 0x10b91, 1),
        Range32.init(0x10c00, 0x10c48, 1),
        Range32.init(0x10c80, 0x10cb2, 1),
        Range32.init(0x10cc0, 0x10cf2, 1),
        Range32.init(0x10d00, 0x10d23, 1),
        Range32.init(0x10e80, 0x10ea9, 1),
        Range32.init(0x10eb0, 0x10eb1, 1),
        Range32.init(0x10f00, 0x10f1c, 1),
        Range32.init(0x10f27, 0x10f30, 9),
        Range32.init(0x10f31, 0x10f45, 1),
        Range32.init(0x10fb0, 0x10fc4, 1),
        Range32.init(0x10fe0, 0x10ff6, 1),
        Range32.init(0x11003, 0x11037, 1),
        Range32.init(0x11083, 0x110af, 1),
        Range32.init(0x110d0, 0x110e8, 1),
        Range32.init(0x11103, 0x11126, 1),
        Range32.init(0x11144, 0x11147, 3),
        Range32.init(0x11150, 0x11172, 1),
        Range32.init(0x11176, 0x11183, 13),
        Range32.init(0x11184, 0x111b2, 1),
        Range32.init(0x111c1, 0x111c4, 1),
        Range32.init(0x111da, 0x111dc, 2),
        Range32.init(0x11200, 0x11211, 1),
        Range32.init(0x11213, 0x1122b, 1),
        Range32.init(0x11280, 0x11286, 1),
        Range32.init(0x11288, 0x1128a, 2),
        Range32.init(0x1128b, 0x1128d, 1),
        Range32.init(0x1128f, 0x1129d, 1),
        Range32.init(0x1129f, 0x112a8, 1),
        Range32.init(0x112b0, 0x112de, 1),
        Range32.init(0x11305, 0x1130c, 1),
        Range32.init(0x1130f, 0x11310, 1),
        Range32.init(0x11313, 0x11328, 1),
        Range32.init(0x1132a, 0x11330, 1),
        Range32.init(0x11332, 0x11333, 1),
        Range32.init(0x11335, 0x11339, 1),
        Range32.init(0x1133d, 0x11350, 19),
        Range32.init(0x1135d, 0x11361, 1),
        Range32.init(0x11400, 0x11434, 1),
        Range32.init(0x11447, 0x1144a, 1),
        Range32.init(0x1145f, 0x11461, 1),
        Range32.init(0x11480, 0x114af, 1),
        Range32.init(0x114c4, 0x114c5, 1),
        Range32.init(0x114c7, 0x11580, 185),
        Range32.init(0x11581, 0x115ae, 1),
        Range32.init(0x115d8, 0x115db, 1),
        Range32.init(0x11600, 0x1162f, 1),
        Range32.init(0x11644, 0x11680, 60),
        Range32.init(0x11681, 0x116aa, 1),
        Range32.init(0x116b8, 0x11700, 72),
        Range32.init(0x11701, 0x1171a, 1),
        Range32.init(0x11800, 0x1182b, 1),
        Range32.init(0x118a0, 0x118df, 1),
        Range32.init(0x118ff, 0x11906, 1),
        Range32.init(0x11909, 0x1190c, 3),
        Range32.init(0x1190d, 0x11913, 1),
        Range32.init(0x11915, 0x11916, 1),
        Range32.init(0x11918, 0x1192f, 1),
        Range32.init(0x1193f, 0x11941, 2),
        Range32.init(0x119a0, 0x119a7, 1),
        Range32.init(0x119aa, 0x119d0, 1),
        Range32.init(0x119e1, 0x119e3, 2),
        Range32.init(0x11a00, 0x11a0b, 11),
        Range32.init(0x11a0c, 0x11a32, 1),
        Range32.init(0x11a3a, 0x11a50, 22),
        Range32.init(0x11a5c, 0x11a89, 1),
        Range32.init(0x11a9d, 0x11ac0, 35),
        Range32.init(0x11ac1, 0x11af8, 1),
        Range32.init(0x11c00, 0x11c08, 1),
        Range32.init(0x11c0a, 0x11c2e, 1),
        Range32.init(0x11c40, 0x11c72, 50),
        Range32.init(0x11c73, 0x11c8f, 1),
        Range32.init(0x11d00, 0x11d06, 1),
        Range32.init(0x11d08, 0x11d09, 1),
        Range32.init(0x11d0b, 0x11d30, 1),
        Range32.init(0x11d46, 0x11d60, 26),
        Range32.init(0x11d61, 0x11d65, 1),
        Range32.init(0x11d67, 0x11d68, 1),
        Range32.init(0x11d6a, 0x11d89, 1),
        Range32.init(0x11d98, 0x11ee0, 328),
        Range32.init(0x11ee1, 0x11ef2, 1),
        Range32.init(0x11fb0, 0x12000, 80),
        Range32.init(0x12001, 0x12399, 1),
        Range32.init(0x12480, 0x12543, 1),
        Range32.init(0x13000, 0x1342e, 1),
        Range32.init(0x14400, 0x14646, 1),
        Range32.init(0x16800, 0x16a38, 1),
        Range32.init(0x16a40, 0x16a5e, 1),
        Range32.init(0x16ad0, 0x16aed, 1),
        Range32.init(0x16b00, 0x16b2f, 1),
        Range32.init(0x16b40, 0x16b43, 1),
        Range32.init(0x16b63, 0x16b77, 1),
        Range32.init(0x16b7d, 0x16b8f, 1),
        Range32.init(0x16e40, 0x16e7f, 1),
        Range32.init(0x16f00, 0x16f4a, 1),
        Range32.init(0x16f50, 0x16f93, 67),
        Range32.init(0x16f94, 0x16f9f, 1),
        Range32.init(0x16fe0, 0x16fe1, 1),
        Range32.init(0x16fe3, 0x17000, 29),
        Range32.init(0x17001, 0x187f7, 1),
        Range32.init(0x18800, 0x18cd5, 1),
        Range32.init(0x18d00, 0x18d08, 1),
        Range32.init(0x1b000, 0x1b11e, 1),
        Range32.init(0x1b150, 0x1b152, 1),
        Range32.init(0x1b164, 0x1b167, 1),
        Range32.init(0x1b170, 0x1b2fb, 1),
        Range32.init(0x1bc00, 0x1bc6a, 1),
        Range32.init(0x1bc70, 0x1bc7c, 1),
        Range32.init(0x1bc80, 0x1bc88, 1),
        Range32.init(0x1bc90, 0x1bc99, 1),
        Range32.init(0x1d400, 0x1d454, 1),
        Range32.init(0x1d456, 0x1d49c, 1),
        Range32.init(0x1d49e, 0x1d49f, 1),
        Range32.init(0x1d4a2, 0x1d4a5, 3),
        Range32.init(0x1d4a6, 0x1d4a9, 3),
        Range32.init(0x1d4aa, 0x1d4ac, 1),
        Range32.init(0x1d4ae, 0x1d4b9, 1),
        Range32.init(0x1d4bb, 0x1d4bd, 2),
        Range32.init(0x1d4be, 0x1d4c3, 1),
        Range32.init(0x1d4c5, 0x1d505, 1),
        Range32.init(0x1d507, 0x1d50a, 1),
        Range32.init(0x1d50d, 0x1d514, 1),
        Range32.init(0x1d516, 0x1d51c, 1),
        Range32.init(0x1d51e, 0x1d539, 1),
        Range32.init(0x1d53b, 0x1d53e, 1),
        Range32.init(0x1d540, 0x1d544, 1),
        Range32.init(0x1d546, 0x1d54a, 4),
        Range32.init(0x1d54b, 0x1d550, 1),
        Range32.init(0x1d552, 0x1d6a5, 1),
        Range32.init(0x1d6a8, 0x1d6c0, 1),
        Range32.init(0x1d6c2, 0x1d6da, 1),
        Range32.init(0x1d6dc, 0x1d6fa, 1),
        Range32.init(0x1d6fc, 0x1d714, 1),
        Range32.init(0x1d716, 0x1d734, 1),
        Range32.init(0x1d736, 0x1d74e, 1),
        Range32.init(0x1d750, 0x1d76e, 1),
        Range32.init(0x1d770, 0x1d788, 1),
        Range32.init(0x1d78a, 0x1d7a8, 1),
        Range32.init(0x1d7aa, 0x1d7c2, 1),
        Range32.init(0x1d7c4, 0x1d7cb, 1),
        Range32.init(0x1e100, 0x1e12c, 1),
        Range32.init(0x1e137, 0x1e13d, 1),
        Range32.init(0x1e14e, 0x1e2c0, 370),
        Range32.init(0x1e2c1, 0x1e2eb, 1),
        Range32.init(0x1e800, 0x1e8c4, 1),
        Range32.init(0x1e900, 0x1e943, 1),
        Range32.init(0x1e94b, 0x1ee00, 1205),
        Range32.init(0x1ee01, 0x1ee03, 1),
        Range32.init(0x1ee05, 0x1ee1f, 1),
        Range32.init(0x1ee21, 0x1ee22, 1),
        Range32.init(0x1ee24, 0x1ee27, 3),
        Range32.init(0x1ee29, 0x1ee32, 1),
        Range32.init(0x1ee34, 0x1ee37, 1),
        Range32.init(0x1ee39, 0x1ee3b, 2),
        Range32.init(0x1ee42, 0x1ee47, 5),
        Range32.init(0x1ee49, 0x1ee4d, 2),
        Range32.init(0x1ee4e, 0x1ee4f, 1),
        Range32.init(0x1ee51, 0x1ee52, 1),
        Range32.init(0x1ee54, 0x1ee57, 3),
        Range32.init(0x1ee59, 0x1ee61, 2),
        Range32.init(0x1ee62, 0x1ee64, 2),
        Range32.init(0x1ee67, 0x1ee6a, 1),
        Range32.init(0x1ee6c, 0x1ee72, 1),
        Range32.init(0x1ee74, 0x1ee77, 1),
        Range32.init(0x1ee79, 0x1ee7c, 1),
        Range32.init(0x1ee7e, 0x1ee80, 2),
        Range32.init(0x1ee81, 0x1ee89, 1),
        Range32.init(0x1ee8b, 0x1ee9b, 1),
        Range32.init(0x1eea1, 0x1eea3, 1),
        Range32.init(0x1eea5, 0x1eea9, 1),
        Range32.init(0x1eeab, 0x1eebb, 1),
        Range32.init(0x20000, 0x2a6dd, 1),
        Range32.init(0x2a700, 0x2b734, 1),
        Range32.init(0x2b740, 0x2b81d, 1),
        Range32.init(0x2b820, 0x2cea1, 1),
        Range32.init(0x2ceb0, 0x2ebe0, 1),
        Range32.init(0x2f800, 0x2fa1d, 1),
        Range32.init(0x30000, 0x3134a, 1),
    },
    .latin_offset = 6,
};

pub const Ll = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0061, 0x007a, 1),
        Range16.init(0x00b5, 0x00df, 42),
        Range16.init(0x00e0, 0x00f6, 1),
        Range16.init(0x00f8, 0x00ff, 1),
        Range16.init(0x0101, 0x0137, 2),
        Range16.init(0x0138, 0x0148, 2),
        Range16.init(0x0149, 0x0177, 2),
        Range16.init(0x017a, 0x017e, 2),
        Range16.init(0x017f, 0x0180, 1),
        Range16.init(0x0183, 0x0185, 2),
        Range16.init(0x0188, 0x018c, 4),
        Range16.init(0x018d, 0x0192, 5),
        Range16.init(0x0195, 0x0199, 4),
        Range16.init(0x019a, 0x019b, 1),
        Range16.init(0x019e, 0x01a1, 3),
        Range16.init(0x01a3, 0x01a5, 2),
        Range16.init(0x01a8, 0x01aa, 2),
        Range16.init(0x01ab, 0x01ad, 2),
        Range16.init(0x01b0, 0x01b4, 4),
        Range16.init(0x01b6, 0x01b9, 3),
        Range16.init(0x01ba, 0x01bd, 3),
        Range16.init(0x01be, 0x01bf, 1),
        Range16.init(0x01c6, 0x01cc, 3),
        Range16.init(0x01ce, 0x01dc, 2),
        Range16.init(0x01dd, 0x01ef, 2),
        Range16.init(0x01f0, 0x01f3, 3),
        Range16.init(0x01f5, 0x01f9, 4),
        Range16.init(0x01fb, 0x0233, 2),
        Range16.init(0x0234, 0x0239, 1),
        Range16.init(0x023c, 0x023f, 3),
        Range16.init(0x0240, 0x0242, 2),
        Range16.init(0x0247, 0x024f, 2),
        Range16.init(0x0250, 0x0293, 1),
        Range16.init(0x0295, 0x02af, 1),
        Range16.init(0x0371, 0x0373, 2),
        Range16.init(0x0377, 0x037b, 4),
        Range16.init(0x037c, 0x037d, 1),
        Range16.init(0x0390, 0x03ac, 28),
        Range16.init(0x03ad, 0x03ce, 1),
        Range16.init(0x03d0, 0x03d1, 1),
        Range16.init(0x03d5, 0x03d7, 1),
        Range16.init(0x03d9, 0x03ef, 2),
        Range16.init(0x03f0, 0x03f3, 1),
        Range16.init(0x03f5, 0x03fb, 3),
        Range16.init(0x03fc, 0x0430, 52),
        Range16.init(0x0431, 0x045f, 1),
        Range16.init(0x0461, 0x0481, 2),
        Range16.init(0x048b, 0x04bf, 2),
        Range16.init(0x04c2, 0x04ce, 2),
        Range16.init(0x04cf, 0x052f, 2),
        Range16.init(0x0560, 0x0588, 1),
        Range16.init(0x10d0, 0x10fa, 1),
        Range16.init(0x10fd, 0x10ff, 1),
        Range16.init(0x13f8, 0x13fd, 1),
        Range16.init(0x1c80, 0x1c88, 1),
        Range16.init(0x1d00, 0x1d2b, 1),
        Range16.init(0x1d6b, 0x1d77, 1),
        Range16.init(0x1d79, 0x1d9a, 1),
        Range16.init(0x1e01, 0x1e95, 2),
        Range16.init(0x1e96, 0x1e9d, 1),
        Range16.init(0x1e9f, 0x1eff, 2),
        Range16.init(0x1f00, 0x1f07, 1),
        Range16.init(0x1f10, 0x1f15, 1),
        Range16.init(0x1f20, 0x1f27, 1),
        Range16.init(0x1f30, 0x1f37, 1),
        Range16.init(0x1f40, 0x1f45, 1),
        Range16.init(0x1f50, 0x1f57, 1),
        Range16.init(0x1f60, 0x1f67, 1),
        Range16.init(0x1f70, 0x1f7d, 1),
        Range16.init(0x1f80, 0x1f87, 1),
        Range16.init(0x1f90, 0x1f97, 1),
        Range16.init(0x1fa0, 0x1fa7, 1),
        Range16.init(0x1fb0, 0x1fb4, 1),
        Range16.init(0x1fb6, 0x1fb7, 1),
        Range16.init(0x1fbe, 0x1fc2, 4),
        Range16.init(0x1fc3, 0x1fc4, 1),
        Range16.init(0x1fc6, 0x1fc7, 1),
        Range16.init(0x1fd0, 0x1fd3, 1),
        Range16.init(0x1fd6, 0x1fd7, 1),
        Range16.init(0x1fe0, 0x1fe7, 1),
        Range16.init(0x1ff2, 0x1ff4, 1),
        Range16.init(0x1ff6, 0x1ff7, 1),
        Range16.init(0x210a, 0x210e, 4),
        Range16.init(0x210f, 0x2113, 4),
        Range16.init(0x212f, 0x2139, 5),
        Range16.init(0x213c, 0x213d, 1),
        Range16.init(0x2146, 0x2149, 1),
        Range16.init(0x214e, 0x2184, 54),
        Range16.init(0x2c30, 0x2c5e, 1),
        Range16.init(0x2c61, 0x2c65, 4),
        Range16.init(0x2c66, 0x2c6c, 2),
        Range16.init(0x2c71, 0x2c73, 2),
        Range16.init(0x2c74, 0x2c76, 2),
        Range16.init(0x2c77, 0x2c7b, 1),
        Range16.init(0x2c81, 0x2ce3, 2),
        Range16.init(0x2ce4, 0x2cec, 8),
        Range16.init(0x2cee, 0x2cf3, 5),
        Range16.init(0x2d00, 0x2d25, 1),
        Range16.init(0x2d27, 0x2d2d, 6),
        Range16.init(0xa641, 0xa66d, 2),
        Range16.init(0xa681, 0xa69b, 2),
        Range16.init(0xa723, 0xa72f, 2),
        Range16.init(0xa730, 0xa731, 1),
        Range16.init(0xa733, 0xa771, 2),
        Range16.init(0xa772, 0xa778, 1),
        Range16.init(0xa77a, 0xa77c, 2),
        Range16.init(0xa77f, 0xa787, 2),
        Range16.init(0xa78c, 0xa78e, 2),
        Range16.init(0xa791, 0xa793, 2),
        Range16.init(0xa794, 0xa795, 1),
        Range16.init(0xa797, 0xa7a9, 2),
        Range16.init(0xa7af, 0xa7b5, 6),
        Range16.init(0xa7b7, 0xa7bf, 2),
        Range16.init(0xa7c3, 0xa7c8, 5),
        Range16.init(0xa7ca, 0xa7f6, 44),
        Range16.init(0xa7fa, 0xab30, 822),
        Range16.init(0xab31, 0xab5a, 1),
        Range16.init(0xab60, 0xab68, 1),
        Range16.init(0xab70, 0xabbf, 1),
        Range16.init(0xfb00, 0xfb06, 1),
        Range16.init(0xfb13, 0xfb17, 1),
        Range16.init(0xff41, 0xff5a, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10428, 0x1044f, 1),
        Range32.init(0x104d8, 0x104fb, 1),
        Range32.init(0x10cc0, 0x10cf2, 1),
        Range32.init(0x118c0, 0x118df, 1),
        Range32.init(0x16e60, 0x16e7f, 1),
        Range32.init(0x1d41a, 0x1d433, 1),
        Range32.init(0x1d44e, 0x1d454, 1),
        Range32.init(0x1d456, 0x1d467, 1),
        Range32.init(0x1d482, 0x1d49b, 1),
        Range32.init(0x1d4b6, 0x1d4b9, 1),
        Range32.init(0x1d4bb, 0x1d4bd, 2),
        Range32.init(0x1d4be, 0x1d4c3, 1),
        Range32.init(0x1d4c5, 0x1d4cf, 1),
        Range32.init(0x1d4ea, 0x1d503, 1),
        Range32.init(0x1d51e, 0x1d537, 1),
        Range32.init(0x1d552, 0x1d56b, 1),
        Range32.init(0x1d586, 0x1d59f, 1),
        Range32.init(0x1d5ba, 0x1d5d3, 1),
        Range32.init(0x1d5ee, 0x1d607, 1),
        Range32.init(0x1d622, 0x1d63b, 1),
        Range32.init(0x1d656, 0x1d66f, 1),
        Range32.init(0x1d68a, 0x1d6a5, 1),
        Range32.init(0x1d6c2, 0x1d6da, 1),
        Range32.init(0x1d6dc, 0x1d6e1, 1),
        Range32.init(0x1d6fc, 0x1d714, 1),
        Range32.init(0x1d716, 0x1d71b, 1),
        Range32.init(0x1d736, 0x1d74e, 1),
        Range32.init(0x1d750, 0x1d755, 1),
        Range32.init(0x1d770, 0x1d788, 1),
        Range32.init(0x1d78a, 0x1d78f, 1),
        Range32.init(0x1d7aa, 0x1d7c2, 1),
        Range32.init(0x1d7c4, 0x1d7c9, 1),
        Range32.init(0x1d7cb, 0x1e922, 4439),
        Range32.init(0x1e923, 0x1e943, 1),
    },
    .latin_offset = 4,
};

pub const Lm = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x02b0, 0x02c1, 1),
        Range16.init(0x02c6, 0x02d1, 1),
        Range16.init(0x02e0, 0x02e4, 1),
        Range16.init(0x02ec, 0x02ee, 2),
        Range16.init(0x0374, 0x037a, 6),
        Range16.init(0x0559, 0x0640, 231),
        Range16.init(0x06e5, 0x06e6, 1),
        Range16.init(0x07f4, 0x07f5, 1),
        Range16.init(0x07fa, 0x081a, 32),
        Range16.init(0x0824, 0x0828, 4),
        Range16.init(0x0971, 0x0e46, 1237),
        Range16.init(0x0ec6, 0x10fc, 566),
        Range16.init(0x17d7, 0x1843, 108),
        Range16.init(0x1aa7, 0x1c78, 465),
        Range16.init(0x1c79, 0x1c7d, 1),
        Range16.init(0x1d2c, 0x1d6a, 1),
        Range16.init(0x1d78, 0x1d9b, 35),
        Range16.init(0x1d9c, 0x1dbf, 1),
        Range16.init(0x2071, 0x207f, 14),
        Range16.init(0x2090, 0x209c, 1),
        Range16.init(0x2c7c, 0x2c7d, 1),
        Range16.init(0x2d6f, 0x2e2f, 192),
        Range16.init(0x3005, 0x3031, 44),
        Range16.init(0x3032, 0x3035, 1),
        Range16.init(0x303b, 0x309d, 98),
        Range16.init(0x309e, 0x30fc, 94),
        Range16.init(0x30fd, 0x30fe, 1),
        Range16.init(0xa015, 0xa4f8, 1251),
        Range16.init(0xa4f9, 0xa4fd, 1),
        Range16.init(0xa60c, 0xa67f, 115),
        Range16.init(0xa69c, 0xa69d, 1),
        Range16.init(0xa717, 0xa71f, 1),
        Range16.init(0xa770, 0xa788, 24),
        Range16.init(0xa7f8, 0xa7f9, 1),
        Range16.init(0xa9cf, 0xa9e6, 23),
        Range16.init(0xaa70, 0xaadd, 109),
        Range16.init(0xaaf3, 0xaaf4, 1),
        Range16.init(0xab5c, 0xab5f, 1),
        Range16.init(0xab69, 0xff70, 21511),
        Range16.init(0xff9e, 0xff9f, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(x16b40, 0x16b43, 1),
        Range32.init(0x16f93, 0x16f9f, 1),
        Range32.init(0x16fe0, 0x16fe1, 1),
        Range32.init(0x16fe3, 0x1e137, 29012),
        Range32.init(0x1e138, 0x1e13d, 1),
        Range32.init(0x1e94b, 0x1e94b, 1),
    },
};

pub const Lo = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(x00aa, 0x00ba, 16),
        Range16.init(0x01bb, 0x01c0, 5),
        Range16.init(0x01c1, 0x01c3, 1),
        Range16.init(0x0294, 0x05d0, 828),
        Range16.init(0x05d1, 0x05ea, 1),
        Range16.init(0x05ef, 0x05f2, 1),
        Range16.init(0x0620, 0x063f, 1),
        Range16.init(0x0641, 0x064a, 1),
        Range16.init(0x066e, 0x066f, 1),
        Range16.init(0x0671, 0x06d3, 1),
        Range16.init(0x06d5, 0x06ee, 25),
        Range16.init(0x06ef, 0x06fa, 11),
        Range16.init(0x06fb, 0x06fc, 1),
        Range16.init(0x06ff, 0x0710, 17),
        Range16.init(0x0712, 0x072f, 1),
        Range16.init(0x074d, 0x07a5, 1),
        Range16.init(0x07b1, 0x07ca, 25),
        Range16.init(0x07cb, 0x07ea, 1),
        Range16.init(0x0800, 0x0815, 1),
        Range16.init(0x0840, 0x0858, 1),
        Range16.init(0x0860, 0x086a, 1),
        Range16.init(0x08a0, 0x08b4, 1),
        Range16.init(0x08b6, 0x08c7, 1),
        Range16.init(0x0904, 0x0939, 1),
        Range16.init(0x093d, 0x0950, 19),
        Range16.init(0x0958, 0x0961, 1),
        Range16.init(0x0972, 0x0980, 1),
        Range16.init(0x0985, 0x098c, 1),
        Range16.init(0x098f, 0x0990, 1),
        Range16.init(0x0993, 0x09a8, 1),
        Range16.init(0x09aa, 0x09b0, 1),
        Range16.init(0x09b2, 0x09b6, 4),
        Range16.init(0x09b7, 0x09b9, 1),
        Range16.init(0x09bd, 0x09ce, 17),
        Range16.init(0x09dc, 0x09dd, 1),
        Range16.init(0x09df, 0x09e1, 1),
        Range16.init(0x09f0, 0x09f1, 1),
        Range16.init(0x09fc, 0x0a05, 9),
        Range16.init(0x0a06, 0x0a0a, 1),
        Range16.init(0x0a0f, 0x0a10, 1),
        Range16.init(0x0a13, 0x0a28, 1),
        Range16.init(0x0a2a, 0x0a30, 1),
        Range16.init(0x0a32, 0x0a33, 1),
        Range16.init(0x0a35, 0x0a36, 1),
        Range16.init(0x0a38, 0x0a39, 1),
        Range16.init(0x0a59, 0x0a5c, 1),
        Range16.init(0x0a5e, 0x0a72, 20),
        Range16.init(0x0a73, 0x0a74, 1),
        Range16.init(0x0a85, 0x0a8d, 1),
        Range16.init(0x0a8f, 0x0a91, 1),
        Range16.init(0x0a93, 0x0aa8, 1),
        Range16.init(0x0aaa, 0x0ab0, 1),
        Range16.init(0x0ab2, 0x0ab3, 1),
        Range16.init(0x0ab5, 0x0ab9, 1),
        Range16.init(0x0abd, 0x0ad0, 19),
        Range16.init(0x0ae0, 0x0ae1, 1),
        Range16.init(0x0af9, 0x0b05, 12),
        Range16.init(0x0b06, 0x0b0c, 1),
        Range16.init(0x0b0f, 0x0b10, 1),
        Range16.init(0x0b13, 0x0b28, 1),
        Range16.init(0x0b2a, 0x0b30, 1),
        Range16.init(0x0b32, 0x0b33, 1),
        Range16.init(0x0b35, 0x0b39, 1),
        Range16.init(0x0b3d, 0x0b5c, 31),
        Range16.init(0x0b5d, 0x0b5f, 2),
        Range16.init(0x0b60, 0x0b61, 1),
        Range16.init(0x0b71, 0x0b83, 18),
        Range16.init(0x0b85, 0x0b8a, 1),
        Range16.init(0x0b8e, 0x0b90, 1),
        Range16.init(0x0b92, 0x0b95, 1),
        Range16.init(0x0b99, 0x0b9a, 1),
        Range16.init(0x0b9c, 0x0b9e, 2),
        Range16.init(0x0b9f, 0x0ba3, 4),
        Range16.init(0x0ba4, 0x0ba8, 4),
        Range16.init(0x0ba9, 0x0baa, 1),
        Range16.init(0x0bae, 0x0bb9, 1),
        Range16.init(0x0bd0, 0x0c05, 53),
        Range16.init(0x0c06, 0x0c0c, 1),
        Range16.init(0x0c0e, 0x0c10, 1),
        Range16.init(0x0c12, 0x0c28, 1),
        Range16.init(0x0c2a, 0x0c39, 1),
        Range16.init(0x0c3d, 0x0c58, 27),
        Range16.init(0x0c59, 0x0c5a, 1),
        Range16.init(0x0c60, 0x0c61, 1),
        Range16.init(0x0c80, 0x0c85, 5),
        Range16.init(0x0c86, 0x0c8c, 1),
        Range16.init(0x0c8e, 0x0c90, 1),
        Range16.init(0x0c92, 0x0ca8, 1),
        Range16.init(0x0caa, 0x0cb3, 1),
        Range16.init(0x0cb5, 0x0cb9, 1),
        Range16.init(0x0cbd, 0x0cde, 33),
        Range16.init(0x0ce0, 0x0ce1, 1),
        Range16.init(0x0cf1, 0x0cf2, 1),
        Range16.init(0x0d04, 0x0d0c, 1),
        Range16.init(0x0d0e, 0x0d10, 1),
        Range16.init(0x0d12, 0x0d3a, 1),
        Range16.init(0x0d3d, 0x0d4e, 17),
        Range16.init(0x0d54, 0x0d56, 1),
        Range16.init(0x0d5f, 0x0d61, 1),
        Range16.init(0x0d7a, 0x0d7f, 1),
        Range16.init(0x0d85, 0x0d96, 1),
        Range16.init(0x0d9a, 0x0db1, 1),
        Range16.init(0x0db3, 0x0dbb, 1),
        Range16.init(0x0dbd, 0x0dc0, 3),
        Range16.init(0x0dc1, 0x0dc6, 1),
        Range16.init(0x0e01, 0x0e30, 1),
        Range16.init(0x0e32, 0x0e33, 1),
        Range16.init(0x0e40, 0x0e45, 1),
        Range16.init(0x0e81, 0x0e82, 1),
        Range16.init(0x0e84, 0x0e86, 2),
        Range16.init(0x0e87, 0x0e8a, 1),
        Range16.init(0x0e8c, 0x0ea3, 1),
        Range16.init(0x0ea5, 0x0ea7, 2),
        Range16.init(0x0ea8, 0x0eb0, 1),
        Range16.init(0x0eb2, 0x0eb3, 1),
        Range16.init(0x0ebd, 0x0ec0, 3),
        Range16.init(0x0ec1, 0x0ec4, 1),
        Range16.init(0x0edc, 0x0edf, 1),
        Range16.init(0x0f00, 0x0f40, 64),
        Range16.init(0x0f41, 0x0f47, 1),
        Range16.init(0x0f49, 0x0f6c, 1),
        Range16.init(0x0f88, 0x0f8c, 1),
        Range16.init(0x1000, 0x102a, 1),
        Range16.init(0x103f, 0x1050, 17),
        Range16.init(0x1051, 0x1055, 1),
        Range16.init(0x105a, 0x105d, 1),
        Range16.init(0x1061, 0x1065, 4),
        Range16.init(0x1066, 0x106e, 8),
        Range16.init(0x106f, 0x1070, 1),
        Range16.init(0x1075, 0x1081, 1),
        Range16.init(0x108e, 0x1100, 114),
        Range16.init(0x1101, 0x1248, 1),
        Range16.init(0x124a, 0x124d, 1),
        Range16.init(0x1250, 0x1256, 1),
        Range16.init(0x1258, 0x125a, 2),
        Range16.init(0x125b, 0x125d, 1),
        Range16.init(0x1260, 0x1288, 1),
        Range16.init(0x128a, 0x128d, 1),
        Range16.init(0x1290, 0x12b0, 1),
        Range16.init(0x12b2, 0x12b5, 1),
        Range16.init(0x12b8, 0x12be, 1),
        Range16.init(0x12c0, 0x12c2, 2),
        Range16.init(0x12c3, 0x12c5, 1),
        Range16.init(0x12c8, 0x12d6, 1),
        Range16.init(0x12d8, 0x1310, 1),
        Range16.init(0x1312, 0x1315, 1),
        Range16.init(0x1318, 0x135a, 1),
        Range16.init(0x1380, 0x138f, 1),
        Range16.init(0x1401, 0x166c, 1),
        Range16.init(0x166f, 0x167f, 1),
        Range16.init(0x1681, 0x169a, 1),
        Range16.init(0x16a0, 0x16ea, 1),
        Range16.init(0x16f1, 0x16f8, 1),
        Range16.init(0x1700, 0x170c, 1),
        Range16.init(0x170e, 0x1711, 1),
        Range16.init(0x1720, 0x1731, 1),
        Range16.init(0x1740, 0x1751, 1),
        Range16.init(0x1760, 0x176c, 1),
        Range16.init(0x176e, 0x1770, 1),
        Range16.init(0x1780, 0x17b3, 1),
        Range16.init(0x17dc, 0x1820, 68),
        Range16.init(0x1821, 0x1842, 1),
        Range16.init(0x1844, 0x1878, 1),
        Range16.init(0x1880, 0x1884, 1),
        Range16.init(0x1887, 0x18a8, 1),
        Range16.init(0x18aa, 0x18b0, 6),
        Range16.init(0x18b1, 0x18f5, 1),
        Range16.init(0x1900, 0x191e, 1),
        Range16.init(0x1950, 0x196d, 1),
        Range16.init(0x1970, 0x1974, 1),
        Range16.init(0x1980, 0x19ab, 1),
        Range16.init(0x19b0, 0x19c9, 1),
        Range16.init(0x1a00, 0x1a16, 1),
        Range16.init(0x1a20, 0x1a54, 1),
        Range16.init(0x1b05, 0x1b33, 1),
        Range16.init(0x1b45, 0x1b4b, 1),
        Range16.init(0x1b83, 0x1ba0, 1),
        Range16.init(0x1bae, 0x1baf, 1),
        Range16.init(0x1bba, 0x1be5, 1),
        Range16.init(0x1c00, 0x1c23, 1),
        Range16.init(0x1c4d, 0x1c4f, 1),
        Range16.init(0x1c5a, 0x1c77, 1),
        Range16.init(0x1ce9, 0x1cec, 1),
        Range16.init(0x1cee, 0x1cf3, 1),
        Range16.init(0x1cf5, 0x1cf6, 1),
        Range16.init(0x1cfa, 0x2135, 1083),
        Range16.init(0x2136, 0x2138, 1),
        Range16.init(0x2d30, 0x2d67, 1),
        Range16.init(0x2d80, 0x2d96, 1),
        Range16.init(0x2da0, 0x2da6, 1),
        Range16.init(0x2da8, 0x2dae, 1),
        Range16.init(0x2db0, 0x2db6, 1),
        Range16.init(0x2db8, 0x2dbe, 1),
        Range16.init(0x2dc0, 0x2dc6, 1),
        Range16.init(0x2dc8, 0x2dce, 1),
        Range16.init(0x2dd0, 0x2dd6, 1),
        Range16.init(0x2dd8, 0x2dde, 1),
        Range16.init(0x3006, 0x303c, 54),
        Range16.init(0x3041, 0x3096, 1),
        Range16.init(0x309f, 0x30a1, 2),
        Range16.init(0x30a2, 0x30fa, 1),
        Range16.init(0x30ff, 0x3105, 6),
        Range16.init(0x3106, 0x312f, 1),
        Range16.init(0x3131, 0x318e, 1),
        Range16.init(0x31a0, 0x31bf, 1),
        Range16.init(0x31f0, 0x31ff, 1),
        Range16.init(0x3400, 0x4dbf, 1),
        Range16.init(0x4e00, 0x9ffc, 1),
        Range16.init(0xa000, 0xa014, 1),
        Range16.init(0xa016, 0xa48c, 1),
        Range16.init(0xa4d0, 0xa4f7, 1),
        Range16.init(0xa500, 0xa60b, 1),
        Range16.init(0xa610, 0xa61f, 1),
        Range16.init(0xa62a, 0xa62b, 1),
        Range16.init(0xa66e, 0xa6a0, 50),
        Range16.init(0xa6a1, 0xa6e5, 1),
        Range16.init(0xa78f, 0xa7f7, 104),
        Range16.init(0xa7fb, 0xa801, 1),
        Range16.init(0xa803, 0xa805, 1),
        Range16.init(0xa807, 0xa80a, 1),
        Range16.init(0xa80c, 0xa822, 1),
        Range16.init(0xa840, 0xa873, 1),
        Range16.init(0xa882, 0xa8b3, 1),
        Range16.init(0xa8f2, 0xa8f7, 1),
        Range16.init(0xa8fb, 0xa8fd, 2),
        Range16.init(0xa8fe, 0xa90a, 12),
        Range16.init(0xa90b, 0xa925, 1),
        Range16.init(0xa930, 0xa946, 1),
        Range16.init(0xa960, 0xa97c, 1),
        Range16.init(0xa984, 0xa9b2, 1),
        Range16.init(0xa9e0, 0xa9e4, 1),
        Range16.init(0xa9e7, 0xa9ef, 1),
        Range16.init(0xa9fa, 0xa9fe, 1),
        Range16.init(0xaa00, 0xaa28, 1),
        Range16.init(0xaa40, 0xaa42, 1),
        Range16.init(0xaa44, 0xaa4b, 1),
        Range16.init(0xaa60, 0xaa6f, 1),
        Range16.init(0xaa71, 0xaa76, 1),
        Range16.init(0xaa7a, 0xaa7e, 4),
        Range16.init(0xaa7f, 0xaaaf, 1),
        Range16.init(0xaab1, 0xaab5, 4),
        Range16.init(0xaab6, 0xaab9, 3),
        Range16.init(0xaaba, 0xaabd, 1),
        Range16.init(0xaac0, 0xaac2, 2),
        Range16.init(0xaadb, 0xaadc, 1),
        Range16.init(0xaae0, 0xaaea, 1),
        Range16.init(0xaaf2, 0xab01, 15),
        Range16.init(0xab02, 0xab06, 1),
        Range16.init(0xab09, 0xab0e, 1),
        Range16.init(0xab11, 0xab16, 1),
        Range16.init(0xab20, 0xab26, 1),
        Range16.init(0xab28, 0xab2e, 1),
        Range16.init(0xabc0, 0xabe2, 1),
        Range16.init(0xac00, 0xd7a3, 1),
        Range16.init(0xd7b0, 0xd7c6, 1),
        Range16.init(0xd7cb, 0xd7fb, 1),
        Range16.init(0xf900, 0xfa6d, 1),
        Range16.init(0xfa70, 0xfad9, 1),
        Range16.init(0xfb1d, 0xfb1f, 2),
        Range16.init(0xfb20, 0xfb28, 1),
        Range16.init(0xfb2a, 0xfb36, 1),
        Range16.init(0xfb38, 0xfb3c, 1),
        Range16.init(0xfb3e, 0xfb40, 2),
        Range16.init(0xfb41, 0xfb43, 2),
        Range16.init(0xfb44, 0xfb46, 2),
        Range16.init(0xfb47, 0xfbb1, 1),
        Range16.init(0xfbd3, 0xfd3d, 1),
        Range16.init(0xfd50, 0xfd8f, 1),
        Range16.init(0xfd92, 0xfdc7, 1),
        Range16.init(0xfdf0, 0xfdfb, 1),
        Range16.init(0xfe70, 0xfe74, 1),
        Range16.init(0xfe76, 0xfefc, 1),
        Range16.init(0xff66, 0xff6f, 1),
        Range16.init(0xff71, 0xff9d, 1),
        Range16.init(0xffa0, 0xffbe, 1),
        Range16.init(0xffc2, 0xffc7, 1),
        Range16.init(0xffca, 0xffcf, 1),
        Range16.init(0xffd2, 0xffd7, 1),
        Range16.init(0xffda, 0xffdc, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(x10000, 0x1000b, 1),
        Range32.init(0x1000d, 0x10026, 1),
        Range32.init(0x10028, 0x1003a, 1),
        Range32.init(0x1003c, 0x1003d, 1),
        Range32.init(0x1003f, 0x1004d, 1),
        Range32.init(0x10050, 0x1005d, 1),
        Range32.init(0x10080, 0x100fa, 1),
        Range32.init(0x10280, 0x1029c, 1),
        Range32.init(0x102a0, 0x102d0, 1),
        Range32.init(0x10300, 0x1031f, 1),
        Range32.init(0x1032d, 0x10340, 1),
        Range32.init(0x10342, 0x10349, 1),
        Range32.init(0x10350, 0x10375, 1),
        Range32.init(0x10380, 0x1039d, 1),
        Range32.init(0x103a0, 0x103c3, 1),
        Range32.init(0x103c8, 0x103cf, 1),
        Range32.init(0x10450, 0x1049d, 1),
        Range32.init(0x10500, 0x10527, 1),
        Range32.init(0x10530, 0x10563, 1),
        Range32.init(0x10600, 0x10736, 1),
        Range32.init(0x10740, 0x10755, 1),
        Range32.init(0x10760, 0x10767, 1),
        Range32.init(0x10800, 0x10805, 1),
        Range32.init(0x10808, 0x1080a, 2),
        Range32.init(0x1080b, 0x10835, 1),
        Range32.init(0x10837, 0x10838, 1),
        Range32.init(0x1083c, 0x1083f, 3),
        Range32.init(0x10840, 0x10855, 1),
        Range32.init(0x10860, 0x10876, 1),
        Range32.init(0x10880, 0x1089e, 1),
        Range32.init(0x108e0, 0x108f2, 1),
        Range32.init(0x108f4, 0x108f5, 1),
        Range32.init(0x10900, 0x10915, 1),
        Range32.init(0x10920, 0x10939, 1),
        Range32.init(0x10980, 0x109b7, 1),
        Range32.init(0x109be, 0x109bf, 1),
        Range32.init(0x10a00, 0x10a10, 16),
        Range32.init(0x10a11, 0x10a13, 1),
        Range32.init(0x10a15, 0x10a17, 1),
        Range32.init(0x10a19, 0x10a35, 1),
        Range32.init(0x10a60, 0x10a7c, 1),
        Range32.init(0x10a80, 0x10a9c, 1),
        Range32.init(0x10ac0, 0x10ac7, 1),
        Range32.init(0x10ac9, 0x10ae4, 1),
        Range32.init(0x10b00, 0x10b35, 1),
        Range32.init(0x10b40, 0x10b55, 1),
        Range32.init(0x10b60, 0x10b72, 1),
        Range32.init(0x10b80, 0x10b91, 1),
        Range32.init(0x10c00, 0x10c48, 1),
        Range32.init(0x10d00, 0x10d23, 1),
        Range32.init(0x10e80, 0x10ea9, 1),
        Range32.init(0x10eb0, 0x10eb1, 1),
        Range32.init(0x10f00, 0x10f1c, 1),
        Range32.init(0x10f27, 0x10f30, 9),
        Range32.init(0x10f31, 0x10f45, 1),
        Range32.init(0x10fb0, 0x10fc4, 1),
        Range32.init(0x10fe0, 0x10ff6, 1),
        Range32.init(0x11003, 0x11037, 1),
        Range32.init(0x11083, 0x110af, 1),
        Range32.init(0x110d0, 0x110e8, 1),
        Range32.init(0x11103, 0x11126, 1),
        Range32.init(0x11144, 0x11147, 3),
        Range32.init(0x11150, 0x11172, 1),
        Range32.init(0x11176, 0x11183, 13),
        Range32.init(0x11184, 0x111b2, 1),
        Range32.init(0x111c1, 0x111c4, 1),
        Range32.init(0x111da, 0x111dc, 2),
        Range32.init(0x11200, 0x11211, 1),
        Range32.init(0x11213, 0x1122b, 1),
        Range32.init(0x11280, 0x11286, 1),
        Range32.init(0x11288, 0x1128a, 2),
        Range32.init(0x1128b, 0x1128d, 1),
        Range32.init(0x1128f, 0x1129d, 1),
        Range32.init(0x1129f, 0x112a8, 1),
        Range32.init(0x112b0, 0x112de, 1),
        Range32.init(0x11305, 0x1130c, 1),
        Range32.init(0x1130f, 0x11310, 1),
        Range32.init(0x11313, 0x11328, 1),
        Range32.init(0x1132a, 0x11330, 1),
        Range32.init(0x11332, 0x11333, 1),
        Range32.init(0x11335, 0x11339, 1),
        Range32.init(0x1133d, 0x11350, 19),
        Range32.init(0x1135d, 0x11361, 1),
        Range32.init(0x11400, 0x11434, 1),
        Range32.init(0x11447, 0x1144a, 1),
        Range32.init(0x1145f, 0x11461, 1),
        Range32.init(0x11480, 0x114af, 1),
        Range32.init(0x114c4, 0x114c5, 1),
        Range32.init(0x114c7, 0x11580, 185),
        Range32.init(0x11581, 0x115ae, 1),
        Range32.init(0x115d8, 0x115db, 1),
        Range32.init(0x11600, 0x1162f, 1),
        Range32.init(0x11644, 0x11680, 60),
        Range32.init(0x11681, 0x116aa, 1),
        Range32.init(0x116b8, 0x11700, 72),
        Range32.init(0x11701, 0x1171a, 1),
        Range32.init(0x11800, 0x1182b, 1),
        Range32.init(0x118ff, 0x11906, 1),
        Range32.init(0x11909, 0x1190c, 3),
        Range32.init(0x1190d, 0x11913, 1),
        Range32.init(0x11915, 0x11916, 1),
        Range32.init(0x11918, 0x1192f, 1),
        Range32.init(0x1193f, 0x11941, 2),
        Range32.init(0x119a0, 0x119a7, 1),
        Range32.init(0x119aa, 0x119d0, 1),
        Range32.init(0x119e1, 0x119e3, 2),
        Range32.init(0x11a00, 0x11a0b, 11),
        Range32.init(0x11a0c, 0x11a32, 1),
        Range32.init(0x11a3a, 0x11a50, 22),
        Range32.init(0x11a5c, 0x11a89, 1),
        Range32.init(0x11a9d, 0x11ac0, 35),
        Range32.init(0x11ac1, 0x11af8, 1),
        Range32.init(0x11c00, 0x11c08, 1),
        Range32.init(0x11c0a, 0x11c2e, 1),
        Range32.init(0x11c40, 0x11c72, 50),
        Range32.init(0x11c73, 0x11c8f, 1),
        Range32.init(0x11d00, 0x11d06, 1),
        Range32.init(0x11d08, 0x11d09, 1),
        Range32.init(0x11d0b, 0x11d30, 1),
        Range32.init(0x11d46, 0x11d60, 26),
        Range32.init(0x11d61, 0x11d65, 1),
        Range32.init(0x11d67, 0x11d68, 1),
        Range32.init(0x11d6a, 0x11d89, 1),
        Range32.init(0x11d98, 0x11ee0, 328),
        Range32.init(0x11ee1, 0x11ef2, 1),
        Range32.init(0x11fb0, 0x12000, 80),
        Range32.init(0x12001, 0x12399, 1),
        Range32.init(0x12480, 0x12543, 1),
        Range32.init(0x13000, 0x1342e, 1),
        Range32.init(0x14400, 0x14646, 1),
        Range32.init(0x16800, 0x16a38, 1),
        Range32.init(0x16a40, 0x16a5e, 1),
        Range32.init(0x16ad0, 0x16aed, 1),
        Range32.init(0x16b00, 0x16b2f, 1),
        Range32.init(0x16b63, 0x16b77, 1),
        Range32.init(0x16b7d, 0x16b8f, 1),
        Range32.init(0x16f00, 0x16f4a, 1),
        Range32.init(0x16f50, 0x17000, 176),
        Range32.init(0x17001, 0x187f7, 1),
        Range32.init(0x18800, 0x18cd5, 1),
        Range32.init(0x18d00, 0x18d08, 1),
        Range32.init(0x1b000, 0x1b11e, 1),
        Range32.init(0x1b150, 0x1b152, 1),
        Range32.init(0x1b164, 0x1b167, 1),
        Range32.init(0x1b170, 0x1b2fb, 1),
        Range32.init(0x1bc00, 0x1bc6a, 1),
        Range32.init(0x1bc70, 0x1bc7c, 1),
        Range32.init(0x1bc80, 0x1bc88, 1),
        Range32.init(0x1bc90, 0x1bc99, 1),
        Range32.init(0x1e100, 0x1e12c, 1),
        Range32.init(0x1e14e, 0x1e2c0, 370),
        Range32.init(0x1e2c1, 0x1e2eb, 1),
        Range32.init(0x1e800, 0x1e8c4, 1),
        Range32.init(0x1ee00, 0x1ee03, 1),
        Range32.init(0x1ee05, 0x1ee1f, 1),
        Range32.init(0x1ee21, 0x1ee22, 1),
        Range32.init(0x1ee24, 0x1ee27, 3),
        Range32.init(0x1ee29, 0x1ee32, 1),
        Range32.init(0x1ee34, 0x1ee37, 1),
        Range32.init(0x1ee39, 0x1ee3b, 2),
        Range32.init(0x1ee42, 0x1ee47, 5),
        Range32.init(0x1ee49, 0x1ee4d, 2),
        Range32.init(0x1ee4e, 0x1ee4f, 1),
        Range32.init(0x1ee51, 0x1ee52, 1),
        Range32.init(0x1ee54, 0x1ee57, 3),
        Range32.init(0x1ee59, 0x1ee61, 2),
        Range32.init(0x1ee62, 0x1ee64, 2),
        Range32.init(0x1ee67, 0x1ee6a, 1),
        Range32.init(0x1ee6c, 0x1ee72, 1),
        Range32.init(0x1ee74, 0x1ee77, 1),
        Range32.init(0x1ee79, 0x1ee7c, 1),
        Range32.init(0x1ee7e, 0x1ee80, 2),
        Range32.init(0x1ee81, 0x1ee89, 1),
        Range32.init(0x1ee8b, 0x1ee9b, 1),
        Range32.init(0x1eea1, 0x1eea3, 1),
        Range32.init(x1eea5, 0x1eea9, 1),
        Range32.init(0x1eeab, 0x1eebb, 1),
        Range32.init(0x20000, 0x2a6dd, 1),
        Range32.init(0x2a700, 0x2b734, 1),
        Range32.init(0x2b740, 0x2b81d, 1),
        Range32.init(0x2b820, 0x2cea1, 1),
        Range32.init(0x2ceb0, 0x2ebe0, 1),
        Range32.init(0x2f800, 0x2fa1d, 1),
        Range32.init(0x30000, 0x3134a, 1),
    },
    .latin_offset = 1,
};

pub const Lt = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x01c5, 0x01cb, 3),
        Range16.init(0x01f2, 0x1f88, 7574),
        Range16.init(0x1f89, 0x1f8f, 1),
        Range16.init(0x1f98, 0x1f9f, 1),
        Range16.init(0x1fa8, 0x1faf, 1),
        Range16.init(0x1fbc, 0x1fcc, 16),
        Range16.init(0x1ffc, 0x1ffc, 1),
    },
};

pub const Lu = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0041, 0x005a, 1),
        Range16.init(0x00c0, 0x00d6, 1),
        Range16.init(0x00d8, 0x00de, 1),
        Range16.init(0x0100, 0x0136, 2),
        Range16.init(0x0139, 0x0147, 2),
        Range16.init(0x014a, 0x0178, 2),
        Range16.init(0x0179, 0x017d, 2),
        Range16.init(0x0181, 0x0182, 1),
        Range16.init(0x0184, 0x0186, 2),
        Range16.init(0x0187, 0x0189, 2),
        Range16.init(0x018a, 0x018b, 1),
        Range16.init(0x018e, 0x0191, 1),
        Range16.init(0x0193, 0x0194, 1),
        Range16.init(0x0196, 0x0198, 1),
        Range16.init(0x019c, 0x019d, 1),
        Range16.init(0x019f, 0x01a0, 1),
        Range16.init(0x01a2, 0x01a6, 2),
        Range16.init(0x01a7, 0x01a9, 2),
        Range16.init(0x01ac, 0x01ae, 2),
        Range16.init(0x01af, 0x01b1, 2),
        Range16.init(0x01b2, 0x01b3, 1),
        Range16.init(0x01b5, 0x01b7, 2),
        Range16.init(0x01b8, 0x01bc, 4),
        Range16.init(0x01c4, 0x01cd, 3),
        Range16.init(0x01cf, 0x01db, 2),
        Range16.init(0x01de, 0x01ee, 2),
        Range16.init(0x01f1, 0x01f4, 3),
        Range16.init(0x01f6, 0x01f8, 1),
        Range16.init(0x01fa, 0x0232, 2),
        Range16.init(0x023a, 0x023b, 1),
        Range16.init(0x023d, 0x023e, 1),
        Range16.init(0x0241, 0x0243, 2),
        Range16.init(0x0244, 0x0246, 1),
        Range16.init(0x0248, 0x024e, 2),
        Range16.init(0x0370, 0x0372, 2),
        Range16.init(0x0376, 0x037f, 9),
        Range16.init(0x0386, 0x0388, 2),
        Range16.init(0x0389, 0x038a, 1),
        Range16.init(0x038c, 0x038e, 2),
        Range16.init(0x038f, 0x0391, 2),
        Range16.init(0x0392, 0x03a1, 1),
        Range16.init(0x03a3, 0x03ab, 1),
        Range16.init(0x03cf, 0x03d2, 3),
        Range16.init(0x03d3, 0x03d4, 1),
        Range16.init(0x03d8, 0x03ee, 2),
        Range16.init(0x03f4, 0x03f7, 3),
        Range16.init(0x03f9, 0x03fa, 1),
        Range16.init(0x03fd, 0x042f, 1),
        Range16.init(0x0460, 0x0480, 2),
        Range16.init(0x048a, 0x04c0, 2),
        Range16.init(0x04c1, 0x04cd, 2),
        Range16.init(0x04d0, 0x052e, 2),
        Range16.init(0x0531, 0x0556, 1),
        Range16.init(0x10a0, 0x10c5, 1),
        Range16.init(0x10c7, 0x10cd, 6),
        Range16.init(0x13a0, 0x13f5, 1),
        Range16.init(0x1c90, 0x1cba, 1),
        Range16.init(0x1cbd, 0x1cbf, 1),
        Range16.init(0x1e00, 0x1e94, 2),
        Range16.init(0x1e9e, 0x1efe, 2),
        Range16.init(0x1f08, 0x1f0f, 1),
        Range16.init(0x1f18, 0x1f1d, 1),
        Range16.init(0x1f28, 0x1f2f, 1),
        Range16.init(0x1f38, 0x1f3f, 1),
        Range16.init(0x1f48, 0x1f4d, 1),
        Range16.init(0x1f59, 0x1f5f, 2),
        Range16.init(0x1f68, 0x1f6f, 1),
        Range16.init(0x1fb8, 0x1fbb, 1),
        Range16.init(0x1fc8, 0x1fcb, 1),
        Range16.init(0x1fd8, 0x1fdb, 1),
        Range16.init(0x1fe8, 0x1fec, 1),
        Range16.init(0x1ff8, 0x1ffb, 1),
        Range16.init(0x2102, 0x2107, 5),
        Range16.init(0x210b, 0x210d, 1),
        Range16.init(0x2110, 0x2112, 1),
        Range16.init(0x2115, 0x2119, 4),
        Range16.init(0x211a, 0x211d, 1),
        Range16.init(0x2124, 0x212a, 2),
        Range16.init(0x212b, 0x212d, 1),
        Range16.init(0x2130, 0x2133, 1),
        Range16.init(0x213e, 0x213f, 1),
        Range16.init(0x2145, 0x2183, 62),
        Range16.init(0x2c00, 0x2c2e, 1),
        Range16.init(0x2c60, 0x2c62, 2),
        Range16.init(0x2c63, 0x2c64, 1),
        Range16.init(0x2c67, 0x2c6d, 2),
        Range16.init(0x2c6e, 0x2c70, 1),
        Range16.init(0x2c72, 0x2c75, 3),
        Range16.init(0x2c7e, 0x2c80, 1),
        Range16.init(0x2c82, 0x2ce2, 2),
        Range16.init(0x2ceb, 0x2ced, 2),
        Range16.init(0x2cf2, 0xa640, 31054),
        Range16.init(0xa642, 0xa66c, 2),
        Range16.init(0xa680, 0xa69a, 2),
        Range16.init(0xa722, 0xa72e, 2),
        Range16.init(0xa732, 0xa76e, 2),
        Range16.init(0xa779, 0xa77d, 2),
        Range16.init(0xa77e, 0xa786, 2),
        Range16.init(0xa78b, 0xa78d, 2),
        Range16.init(0xa790, 0xa792, 2),
        Range16.init(0xa796, 0xa7aa, 2),
        Range16.init(0xa7ab, 0xa7ae, 1),
        Range16.init(0xa7b0, 0xa7b4, 1),
        Range16.init(0xa7b6, 0xa7be, 2),
        Range16.init(0xa7c2, 0xa7c4, 2),
        Range16.init(0xa7c5, 0xa7c7, 1),
        Range16.init(0xa7c9, 0xa7f5, 44),
        Range16.init(0xff21, 0xff3a, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10400, 0x10427, 1),
        Range32.init(0x104b0, 0x104d3, 1),
        Range32.init(0x10c80, 0x10cb2, 1),
        Range32.init(0x118a0, 0x118bf, 1),
        Range32.init(0x16e40, 0x16e5f, 1),
        Range32.init(0x1d400, 0x1d419, 1),
        Range32.init(0x1d434, 0x1d44d, 1),
        Range32.init(0x1d468, 0x1d481, 1),
        Range32.init(0x1d49c, 0x1d49e, 2),
        Range32.init(0x1d49f, 0x1d4a5, 3),
        Range32.init(0x1d4a6, 0x1d4a9, 3),
        Range32.init(0x1d4aa, 0x1d4ac, 1),
        Range32.init(0x1d4ae, 0x1d4b5, 1),
        Range32.init(0x1d4d0, 0x1d4e9, 1),
        Range32.init(0x1d504, 0x1d505, 1),
        Range32.init(0x1d507, 0x1d50a, 1),
        Range32.init(0x1d50d, 0x1d514, 1),
        Range32.init(0x1d516, 0x1d51c, 1),
        Range32.init(0x1d538, 0x1d539, 1),
        Range32.init(0x1d53b, 0x1d53e, 1),
        Range32.init(0x1d540, 0x1d544, 1),
        Range32.init(0x1d546, 0x1d54a, 4),
        Range32.init(0x1d54b, 0x1d550, 1),
        Range32.init(0x1d56c, 0x1d585, 1),
        Range32.init(0x1d5a0, 0x1d5b9, 1),
        Range32.init(0x1d5d4, 0x1d5ed, 1),
        Range32.init(0x1d608, 0x1d621, 1),
        Range32.init(0x1d63c, 0x1d655, 1),
        Range32.init(0x1d670, 0x1d689, 1),
        Range32.init(0x1d6a8, 0x1d6c0, 1),
        Range32.init(0x1d6e2, 0x1d6fa, 1),
        Range32.init(0x1d71c, 0x1d734, 1),
        Range32.init(0x1d756, 0x1d76e, 1),
        Range32.init(0x1d790, 0x1d7a8, 1),
        Range32.init(0x1d7ca, 0x1e900, 4406),
        Range32.init(0x1e901, 0x1e921, 1),
    },
    .latin_offset = 3,
};

pub const M = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0300, 0x036f, 1),
        Range16.init(0x0483, 0x0489, 1),
        Range16.init(0x0591, 0x05bd, 1),
        Range16.init(0x05bf, 0x05c1, 2),
        Range16.init(0x05c2, 0x05c4, 2),
        Range16.init(0x05c5, 0x05c7, 2),
        Range16.init(0x0610, 0x061a, 1),
        Range16.init(0x064b, 0x065f, 1),
        Range16.init(0x0670, 0x06d6, 102),
        Range16.init(0x06d7, 0x06dc, 1),
        Range16.init(0x06df, 0x06e4, 1),
        Range16.init(0x06e7, 0x06e8, 1),
        Range16.init(0x06ea, 0x06ed, 1),
        Range16.init(0x0711, 0x0730, 31),
        Range16.init(0x0731, 0x074a, 1),
        Range16.init(0x07a6, 0x07b0, 1),
        Range16.init(0x07eb, 0x07f3, 1),
        Range16.init(0x07fd, 0x0816, 25),
        Range16.init(0x0817, 0x0819, 1),
        Range16.init(0x081b, 0x0823, 1),
        Range16.init(0x0825, 0x0827, 1),
        Range16.init(0x0829, 0x082d, 1),
        Range16.init(0x0859, 0x085b, 1),
        Range16.init(0x08d3, 0x08e1, 1),
        Range16.init(0x08e3, 0x0903, 1),
        Range16.init(0x093a, 0x093c, 1),
        Range16.init(0x093e, 0x094f, 1),
        Range16.init(0x0951, 0x0957, 1),
        Range16.init(0x0962, 0x0963, 1),
        Range16.init(0x0981, 0x0983, 1),
        Range16.init(0x09bc, 0x09be, 2),
        Range16.init(0x09bf, 0x09c4, 1),
        Range16.init(0x09c7, 0x09c8, 1),
        Range16.init(0x09cb, 0x09cd, 1),
        Range16.init(0x09d7, 0x09e2, 11),
        Range16.init(0x09e3, 0x09fe, 27),
        Range16.init(0x0a01, 0x0a03, 1),
        Range16.init(0x0a3c, 0x0a3e, 2),
        Range16.init(0x0a3f, 0x0a42, 1),
        Range16.init(0x0a47, 0x0a48, 1),
        Range16.init(0x0a4b, 0x0a4d, 1),
        Range16.init(0x0a51, 0x0a70, 31),
        Range16.init(0x0a71, 0x0a75, 4),
        Range16.init(0x0a81, 0x0a83, 1),
        Range16.init(0x0abc, 0x0abe, 2),
        Range16.init(0x0abf, 0x0ac5, 1),
        Range16.init(0x0ac7, 0x0ac9, 1),
        Range16.init(0x0acb, 0x0acd, 1),
        Range16.init(0x0ae2, 0x0ae3, 1),
        Range16.init(0x0afa, 0x0aff, 1),
        Range16.init(0x0b01, 0x0b03, 1),
        Range16.init(0x0b3c, 0x0b3e, 2),
        Range16.init(0x0b3f, 0x0b44, 1),
        Range16.init(0x0b47, 0x0b48, 1),
        Range16.init(0x0b4b, 0x0b4d, 1),
        Range16.init(0x0b55, 0x0b57, 1),
        Range16.init(0x0b62, 0x0b63, 1),
        Range16.init(0x0b82, 0x0bbe, 60),
        Range16.init(0x0bbf, 0x0bc2, 1),
        Range16.init(0x0bc6, 0x0bc8, 1),
        Range16.init(0x0bca, 0x0bcd, 1),
        Range16.init(0x0bd7, 0x0c00, 41),
        Range16.init(0x0c01, 0x0c04, 1),
        Range16.init(0x0c3e, 0x0c44, 1),
        Range16.init(0x0c46, 0x0c48, 1),
        Range16.init(0x0c4a, 0x0c4d, 1),
        Range16.init(0x0c55, 0x0c56, 1),
        Range16.init(0x0c62, 0x0c63, 1),
        Range16.init(0x0c81, 0x0c83, 1),
        Range16.init(0x0cbc, 0x0cbe, 2),
        Range16.init(0x0cbf, 0x0cc4, 1),
        Range16.init(0x0cc6, 0x0cc8, 1),
        Range16.init(0x0cca, 0x0ccd, 1),
        Range16.init(0x0cd5, 0x0cd6, 1),
        Range16.init(0x0ce2, 0x0ce3, 1),
        Range16.init(0x0d00, 0x0d03, 1),
        Range16.init(0x0d3b, 0x0d3c, 1),
        Range16.init(0x0d3e, 0x0d44, 1),
        Range16.init(0x0d46, 0x0d48, 1),
        Range16.init(0x0d4a, 0x0d4d, 1),
        Range16.init(0x0d57, 0x0d62, 11),
        Range16.init(0x0d63, 0x0d81, 30),
        Range16.init(0x0d82, 0x0d83, 1),
        Range16.init(0x0dca, 0x0dcf, 5),
        Range16.init(0x0dd0, 0x0dd4, 1),
        Range16.init(0x0dd6, 0x0dd8, 2),
        Range16.init(0x0dd9, 0x0ddf, 1),
        Range16.init(0x0df2, 0x0df3, 1),
        Range16.init(0x0e31, 0x0e34, 3),
        Range16.init(0x0e35, 0x0e3a, 1),
        Range16.init(0x0e47, 0x0e4e, 1),
        Range16.init(0x0eb1, 0x0eb4, 3),
        Range16.init(0x0eb5, 0x0ebc, 1),
        Range16.init(0x0ec8, 0x0ecd, 1),
        Range16.init(0x0f18, 0x0f19, 1),
        Range16.init(0x0f35, 0x0f39, 2),
        Range16.init(0x0f3e, 0x0f3f, 1),
        Range16.init(0x0f71, 0x0f84, 1),
        Range16.init(0x0f86, 0x0f87, 1),
        Range16.init(0x0f8d, 0x0f97, 1),
        Range16.init(0x0f99, 0x0fbc, 1),
        Range16.init(0x0fc6, 0x102b, 101),
        Range16.init(0x102c, 0x103e, 1),
        Range16.init(0x1056, 0x1059, 1),
        Range16.init(0x105e, 0x1060, 1),
        Range16.init(0x1062, 0x1064, 1),
        Range16.init(0x1067, 0x106d, 1),
        Range16.init(0x1071, 0x1074, 1),
        Range16.init(0x1082, 0x108d, 1),
        Range16.init(0x108f, 0x109a, 11),
        Range16.init(0x109b, 0x109d, 1),
        Range16.init(0x135d, 0x135f, 1),
        Range16.init(0x1712, 0x1714, 1),
        Range16.init(0x1732, 0x1734, 1),
        Range16.init(0x1752, 0x1753, 1),
        Range16.init(0x1772, 0x1773, 1),
        Range16.init(0x17b4, 0x17d3, 1),
        Range16.init(0x17dd, 0x180b, 46),
        Range16.init(0x180c, 0x180d, 1),
        Range16.init(0x1885, 0x1886, 1),
        Range16.init(0x18a9, 0x1920, 119),
        Range16.init(0x1921, 0x192b, 1),
        Range16.init(0x1930, 0x193b, 1),
        Range16.init(0x1a17, 0x1a1b, 1),
        Range16.init(0x1a55, 0x1a5e, 1),
        Range16.init(0x1a60, 0x1a7c, 1),
        Range16.init(0x1a7f, 0x1ab0, 49),
        Range16.init(0x1ab1, 0x1ac0, 1),
        Range16.init(0x1b00, 0x1b04, 1),
        Range16.init(0x1b34, 0x1b44, 1),
        Range16.init(0x1b6b, 0x1b73, 1),
        Range16.init(0x1b80, 0x1b82, 1),
        Range16.init(0x1ba1, 0x1bad, 1),
        Range16.init(0x1be6, 0x1bf3, 1),
        Range16.init(0x1c24, 0x1c37, 1),
        Range16.init(0x1cd0, 0x1cd2, 1),
        Range16.init(0x1cd4, 0x1ce8, 1),
        Range16.init(0x1ced, 0x1cf4, 7),
        Range16.init(0x1cf7, 0x1cf9, 1),
        Range16.init(0x1dc0, 0x1df9, 1),
        Range16.init(0x1dfb, 0x1dff, 1),
        Range16.init(0x20d0, 0x20f0, 1),
        Range16.init(0x2cef, 0x2cf1, 1),
        Range16.init(0x2d7f, 0x2de0, 97),
        Range16.init(0x2de1, 0x2dff, 1),
        Range16.init(0x302a, 0x302f, 1),
        Range16.init(0x3099, 0x309a, 1),
        Range16.init(0xa66f, 0xa672, 1),
        Range16.init(0xa674, 0xa67d, 1),
        Range16.init(0xa69e, 0xa69f, 1),
        Range16.init(0xa6f0, 0xa6f1, 1),
        Range16.init(0xa802, 0xa806, 4),
        Range16.init(0xa80b, 0xa823, 24),
        Range16.init(0xa824, 0xa827, 1),
        Range16.init(0xa82c, 0xa880, 84),
        Range16.init(0xa881, 0xa8b4, 51),
        Range16.init(0xa8b5, 0xa8c5, 1),
        Range16.init(0xa8e0, 0xa8f1, 1),
        Range16.init(0xa8ff, 0xa926, 39),
        Range16.init(0xa927, 0xa92d, 1),
        Range16.init(0xa947, 0xa953, 1),
        Range16.init(0xa980, 0xa983, 1),
        Range16.init(0xa9b3, 0xa9c0, 1),
        Range16.init(0xa9e5, 0xaa29, 68),
        Range16.init(0xaa2a, 0xaa36, 1),
        Range16.init(0xaa43, 0xaa4c, 9),
        Range16.init(0xaa4d, 0xaa7b, 46),
        Range16.init(0xaa7c, 0xaa7d, 1),
        Range16.init(0xaab0, 0xaab2, 2),
        Range16.init(0xaab3, 0xaab4, 1),
        Range16.init(0xaab7, 0xaab8, 1),
        Range16.init(0xaabe, 0xaabf, 1),
        Range16.init(0xaac1, 0xaaeb, 42),
        Range16.init(0xaaec, 0xaaef, 1),
        Range16.init(0xaaf5, 0xaaf6, 1),
        Range16.init(0xabe3, 0xabea, 1),
        Range16.init(0xabec, 0xabed, 1),
        Range16.init(0xfb1e, 0xfe00, 738),
        Range16.init(0xfe01, 0xfe0f, 1),
        Range16.init(0xfe20, 0xfe2f, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x101fd, 0x102e0, 227),
        Range32.init(0x10376, 0x1037a, 1),
        Range32.init(0x10a01, 0x10a03, 1),
        Range32.init(0x10a05, 0x10a06, 1),
        Range32.init(0x10a0c, 0x10a0f, 1),
        Range32.init(0x10a38, 0x10a3a, 1),
        Range32.init(0x10a3f, 0x10ae5, 166),
        Range32.init(0x10ae6, 0x10d24, 574),
        Range32.init(0x10d25, 0x10d27, 1),
        Range32.init(0x10eab, 0x10eac, 1),
        Range32.init(0x10f46, 0x10f50, 1),
        Range32.init(0x11000, 0x11002, 1),
        Range32.init(0x11038, 0x11046, 1),
        Range32.init(0x1107f, 0x11082, 1),
        Range32.init(0x110b0, 0x110ba, 1),
        Range32.init(0x11100, 0x11102, 1),
        Range32.init(0x11127, 0x11134, 1),
        Range32.init(0x11145, 0x11146, 1),
        Range32.init(0x11173, 0x11180, 13),
        Range32.init(0x11181, 0x11182, 1),
        Range32.init(0x111b3, 0x111c0, 1),
        Range32.init(0x111c9, 0x111cc, 1),
        Range32.init(0x111ce, 0x111cf, 1),
        Range32.init(0x1122c, 0x11237, 1),
        Range32.init(0x1123e, 0x112df, 161),
        Range32.init(0x112e0, 0x112ea, 1),
        Range32.init(0x11300, 0x11303, 1),
        Range32.init(0x1133b, 0x1133c, 1),
        Range32.init(0x1133e, 0x11344, 1),
        Range32.init(0x11347, 0x11348, 1),
        Range32.init(0x1134b, 0x1134d, 1),
        Range32.init(0x11357, 0x11362, 11),
        Range32.init(0x11363, 0x11366, 3),
        Range32.init(0x11367, 0x1136c, 1),
        Range32.init(0x11370, 0x11374, 1),
        Range32.init(0x11435, 0x11446, 1),
        Range32.init(0x1145e, 0x114b0, 82),
        Range32.init(0x114b1, 0x114c3, 1),
        Range32.init(0x115af, 0x115b5, 1),
        Range32.init(0x115b8, 0x115c0, 1),
        Range32.init(0x115dc, 0x115dd, 1),
        Range32.init(0x11630, 0x11640, 1),
        Range32.init(0x116ab, 0x116b7, 1),
        Range32.init(0x1171d, 0x1172b, 1),
        Range32.init(0x1182c, 0x1183a, 1),
        Range32.init(0x11930, 0x11935, 1),
        Range32.init(0x11937, 0x11938, 1),
        Range32.init(0x1193b, 0x1193e, 1),
        Range32.init(0x11940, 0x11942, 2),
        Range32.init(0x11943, 0x119d1, 142),
        Range32.init(0x119d2, 0x119d7, 1),
        Range32.init(0x119da, 0x119e0, 1),
        Range32.init(0x119e4, 0x11a01, 29),
        Range32.init(0x11a02, 0x11a0a, 1),
        Range32.init(0x11a33, 0x11a39, 1),
        Range32.init(0x11a3b, 0x11a3e, 1),
        Range32.init(0x11a47, 0x11a51, 10),
        Range32.init(0x11a52, 0x11a5b, 1),
        Range32.init(0x11a8a, 0x11a99, 1),
        Range32.init(0x11c2f, 0x11c36, 1),
        Range32.init(0x11c38, 0x11c3f, 1),
        Range32.init(0x11c92, 0x11ca7, 1),
        Range32.init(0x11ca9, 0x11cb6, 1),
        Range32.init(0x11d31, 0x11d36, 1),
        Range32.init(0x11d3a, 0x11d3c, 2),
        Range32.init(0x11d3d, 0x11d3f, 2),
        Range32.init(0x11d40, 0x11d45, 1),
        Range32.init(0x11d47, 0x11d8a, 67),
        Range32.init(0x11d8b, 0x11d8e, 1),
        Range32.init(0x11d90, 0x11d91, 1),
        Range32.init(0x11d93, 0x11d97, 1),
        Range32.init(0x11ef3, 0x11ef6, 1),
        Range32.init(0x16af0, 0x16af4, 1),
        Range32.init(0x16b30, 0x16b36, 1),
        Range32.init(0x16f4f, 0x16f51, 2),
        Range32.init(0x16f52, 0x16f87, 1),
        Range32.init(0x16f8f, 0x16f92, 1),
        Range32.init(0x16fe4, 0x16ff0, 12),
        Range32.init(0x16ff1, 0x1bc9d, 19628),
        Range32.init(0x1bc9e, 0x1d165, 5319),
        Range32.init(0x1d166, 0x1d169, 1),
        Range32.init(0x1d16d, 0x1d172, 1),
        Range32.init(0x1d17b, 0x1d182, 1),
        Range32.init(0x1d185, 0x1d18b, 1),
        Range32.init(0x1d1aa, 0x1d1ad, 1),
        Range32.init(0x1d242, 0x1d244, 1),
        Range32.init(0x1da00, 0x1da36, 1),
        Range32.init(0x1da3b, 0x1da6c, 1),
        Range32.init(0x1da75, 0x1da84, 15),
        Range32.init(0x1da9b, 0x1da9f, 1),
        Range32.init(0x1daa1, 0x1daaf, 1),
        Range32.init(0x1e000, 0x1e006, 1),
        Range32.init(0x1e008, 0x1e018, 1),
        Range32.init(0x1e01b, 0x1e021, 1),
        Range32.init(0x1e023, 0x1e024, 1),
        Range32.init(0x1e026, 0x1e02a, 1),
        Range32.init(0x1e130, 0x1e136, 1),
        Range32.init(0x1e2ec, 0x1e2ef, 1),
        Range32.init(0x1e8d0, 0x1e8d6, 1),
        Range32.init(0x1e944, 0x1e94a, 1),
        Range32.init(0xe0100, 0xe01ef, 1),
    },
};

pub const Mc = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0903, 0x093b, 56),
        Range16.init(0x093e, 0x0940, 1),
        Range16.init(0x0949, 0x094c, 1),
        Range16.init(0x094e, 0x094f, 1),
        Range16.init(0x0982, 0x0983, 1),
        Range16.init(0x09be, 0x09c0, 1),
        Range16.init(0x09c7, 0x09c8, 1),
        Range16.init(0x09cb, 0x09cc, 1),
        Range16.init(0x09d7, 0x0a03, 44),
        Range16.init(0x0a3e, 0x0a40, 1),
        Range16.init(0x0a83, 0x0abe, 59),
        Range16.init(0x0abf, 0x0ac0, 1),
        Range16.init(0x0ac9, 0x0acb, 2),
        Range16.init(0x0acc, 0x0b02, 54),
        Range16.init(0x0b03, 0x0b3e, 59),
        Range16.init(0x0b40, 0x0b47, 7),
        Range16.init(0x0b48, 0x0b4b, 3),
        Range16.init(0x0b4c, 0x0b57, 11),
        Range16.init(0x0bbe, 0x0bbf, 1),
        Range16.init(0x0bc1, 0x0bc2, 1),
        Range16.init(0x0bc6, 0x0bc8, 1),
        Range16.init(0x0bca, 0x0bcc, 1),
        Range16.init(0x0bd7, 0x0c01, 42),
        Range16.init(0x0c02, 0x0c03, 1),
        Range16.init(0x0c41, 0x0c44, 1),
        Range16.init(0x0c82, 0x0c83, 1),
        Range16.init(0x0cbe, 0x0cc0, 2),
        Range16.init(0x0cc1, 0x0cc4, 1),
        Range16.init(0x0cc7, 0x0cc8, 1),
        Range16.init(0x0cca, 0x0ccb, 1),
        Range16.init(0x0cd5, 0x0cd6, 1),
        Range16.init(0x0d02, 0x0d03, 1),
        Range16.init(0x0d3e, 0x0d40, 1),
        Range16.init(0x0d46, 0x0d48, 1),
        Range16.init(0x0d4a, 0x0d4c, 1),
        Range16.init(0x0d57, 0x0d82, 43),
        Range16.init(0x0d83, 0x0dcf, 76),
        Range16.init(0x0dd0, 0x0dd1, 1),
        Range16.init(0x0dd8, 0x0ddf, 1),
        Range16.init(0x0df2, 0x0df3, 1),
        Range16.init(0x0f3e, 0x0f3f, 1),
        Range16.init(0x0f7f, 0x102b, 172),
        Range16.init(0x102c, 0x1031, 5),
        Range16.init(0x1038, 0x103b, 3),
        Range16.init(0x103c, 0x1056, 26),
        Range16.init(0x1057, 0x1062, 11),
        Range16.init(0x1063, 0x1064, 1),
        Range16.init(0x1067, 0x106d, 1),
        Range16.init(0x1083, 0x1084, 1),
        Range16.init(0x1087, 0x108c, 1),
        Range16.init(0x108f, 0x109a, 11),
        Range16.init(0x109b, 0x109c, 1),
        Range16.init(0x17b6, 0x17be, 8),
        Range16.init(0x17bf, 0x17c5, 1),
        Range16.init(0x17c7, 0x17c8, 1),
        Range16.init(0x1923, 0x1926, 1),
        Range16.init(0x1929, 0x192b, 1),
        Range16.init(0x1930, 0x1931, 1),
        Range16.init(0x1933, 0x1938, 1),
        Range16.init(0x1a19, 0x1a1a, 1),
        Range16.init(0x1a55, 0x1a57, 2),
        Range16.init(0x1a61, 0x1a63, 2),
        Range16.init(0x1a64, 0x1a6d, 9),
        Range16.init(0x1a6e, 0x1a72, 1),
        Range16.init(0x1b04, 0x1b35, 49),
        Range16.init(0x1b3b, 0x1b3d, 2),
        Range16.init(0x1b3e, 0x1b41, 1),
        Range16.init(0x1b43, 0x1b44, 1),
        Range16.init(0x1b82, 0x1ba1, 31),
        Range16.init(0x1ba6, 0x1ba7, 1),
        Range16.init(0x1baa, 0x1be7, 61),
        Range16.init(0x1bea, 0x1bec, 1),
        Range16.init(0x1bee, 0x1bf2, 4),
        Range16.init(0x1bf3, 0x1c24, 49),
        Range16.init(0x1c25, 0x1c2b, 1),
        Range16.init(0x1c34, 0x1c35, 1),
        Range16.init(0x1ce1, 0x1cf7, 22),
        Range16.init(0x302e, 0x302f, 1),
        Range16.init(0xa823, 0xa824, 1),
        Range16.init(0xa827, 0xa880, 89),
        Range16.init(0xa881, 0xa8b4, 51),
        Range16.init(0xa8b5, 0xa8c3, 1),
        Range16.init(0xa952, 0xa953, 1),
        Range16.init(0xa983, 0xa9b4, 49),
        Range16.init(0xa9b5, 0xa9ba, 5),
        Range16.init(0xa9bb, 0xa9be, 3),
        Range16.init(0xa9bf, 0xa9c0, 1),
        Range16.init(0xaa2f, 0xaa30, 1),
        Range16.init(0xaa33, 0xaa34, 1),
        Range16.init(0xaa4d, 0xaa7b, 46),
        Range16.init(0xaa7d, 0xaaeb, 110),
        Range16.init(0xaaee, 0xaaef, 1),
        Range16.init(0xaaf5, 0xabe3, 238),
        Range16.init(0xabe4, 0xabe6, 2),
        Range16.init(0xabe7, 0xabe9, 2),
        Range16.init(0xabea, 0xabec, 2),
    },
    .r32 = &[_]Range32{
        Range32.init(0x11000, 0x11002, 2),
        Range32.init(0x11082, 0x110b0, 46),
        Range32.init(0x110b1, 0x110b2, 1),
        Range32.init(0x110b7, 0x110b8, 1),
        Range32.init(0x1112c, 0x11145, 25),
        Range32.init(0x11146, 0x11182, 60),
        Range32.init(0x111b3, 0x111b5, 1),
        Range32.init(0x111bf, 0x111c0, 1),
        Range32.init(0x111ce, 0x1122c, 94),
        Range32.init(0x1122d, 0x1122e, 1),
        Range32.init(0x11232, 0x11233, 1),
        Range32.init(0x11235, 0x112e0, 171),
        Range32.init(0x112e1, 0x112e2, 1),
        Range32.init(0x11302, 0x11303, 1),
        Range32.init(0x1133e, 0x1133f, 1),
        Range32.init(0x11341, 0x11344, 1),
        Range32.init(0x11347, 0x11348, 1),
        Range32.init(0x1134b, 0x1134d, 1),
        Range32.init(0x11357, 0x11362, 11),
        Range32.init(0x11363, 0x11435, 210),
        Range32.init(0x11436, 0x11437, 1),
        Range32.init(0x11440, 0x11441, 1),
        Range32.init(0x11445, 0x114b0, 107),
        Range32.init(0x114b1, 0x114b2, 1),
        Range32.init(0x114b9, 0x114bb, 2),
        Range32.init(0x114bc, 0x114be, 1),
        Range32.init(0x114c1, 0x115af, 238),
        Range32.init(0x115b0, 0x115b1, 1),
        Range32.init(0x115b8, 0x115bb, 1),
        Range32.init(0x115be, 0x11630, 114),
        Range32.init(0x11631, 0x11632, 1),
        Range32.init(0x1163b, 0x1163c, 1),
        Range32.init(0x1163e, 0x116ac, 110),
        Range32.init(0x116ae, 0x116af, 1),
        Range32.init(0x116b6, 0x11720, 106),
        Range32.init(0x11721, 0x11726, 5),
        Range32.init(0x1182c, 0x1182e, 1),
        Range32.init(0x11838, 0x11930, 248),
        Range32.init(0x11931, 0x11935, 1),
        Range32.init(0x11937, 0x11938, 1),
        Range32.init(0x1193d, 0x11940, 3),
        Range32.init(0x11942, 0x119d1, 143),
        Range32.init(0x119d2, 0x119d3, 1),
        Range32.init(0x119dc, 0x119df, 1),
        Range32.init(0x119e4, 0x11a39, 85),
        Range32.init(0x11a57, 0x11a58, 1),
        Range32.init(0x11a97, 0x11c2f, 408),
        Range32.init(0x11c3e, 0x11ca9, 107),
        Range32.init(0x11cb1, 0x11cb4, 3),
        Range32.init(0x11d8a, 0x11d8e, 1),
        Range32.init(0x11d93, 0x11d94, 1),
        Range32.init(0x11d96, 0x11ef5, 351),
        Range32.init(0x11ef6, 0x16f51, 20571),
        Range32.init(0x16f52, 0x16f87, 1),
        Range32.init(0x16ff0, 0x16ff1, 1),
        Range32.init(0x1d165, 0x1d166, 1),
        Range32.init(0x1d16d, 0x1d172, 1),
    },
};

pub const Me = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0488, 0x0489, 1),
        Range16.init(0x1abe, 0x20dd, 1567),
        Range16.init(0x20de, 0x20e0, 1),
        Range16.init(0x20e2, 0x20e4, 1),
        Range16.init(0xa670, 0xa672, 1),
    },
};

pub const Mn = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(x0300, 0x036f, 1),
        Range16.init(0x0483, 0x0487, 1),
        Range16.init(0x0591, 0x05bd, 1),
        Range16.init(0x05bf, 0x05c1, 2),
        Range16.init(0x05c2, 0x05c4, 2),
        Range16.init(0x05c5, 0x05c7, 2),
        Range16.init(0x0610, 0x061a, 1),
        Range16.init(0x064b, 0x065f, 1),
        Range16.init(0x0670, 0x06d6, 102),
        Range16.init(0x06d7, 0x06dc, 1),
        Range16.init(0x06df, 0x06e4, 1),
        Range16.init(0x06e7, 0x06e8, 1),
        Range16.init(0x06ea, 0x06ed, 1),
        Range16.init(0x0711, 0x0730, 31),
        Range16.init(0x0731, 0x074a, 1),
        Range16.init(0x07a6, 0x07b0, 1),
        Range16.init(0x07eb, 0x07f3, 1),
        Range16.init(0x07fd, 0x0816, 25),
        Range16.init(0x0817, 0x0819, 1),
        Range16.init(0x081b, 0x0823, 1),
        Range16.init(0x0825, 0x0827, 1),
        Range16.init(0x0829, 0x082d, 1),
        Range16.init(0x0859, 0x085b, 1),
        Range16.init(0x08d3, 0x08e1, 1),
        Range16.init(0x08e3, 0x0902, 1),
        Range16.init(0x093a, 0x093c, 2),
        Range16.init(0x0941, 0x0948, 1),
        Range16.init(0x094d, 0x0951, 4),
        Range16.init(0x0952, 0x0957, 1),
        Range16.init(0x0962, 0x0963, 1),
        Range16.init(0x0981, 0x09bc, 59),
        Range16.init(0x09c1, 0x09c4, 1),
        Range16.init(0x09cd, 0x09e2, 21),
        Range16.init(0x09e3, 0x09fe, 27),
        Range16.init(0x0a01, 0x0a02, 1),
        Range16.init(0x0a3c, 0x0a41, 5),
        Range16.init(0x0a42, 0x0a47, 5),
        Range16.init(0x0a48, 0x0a4b, 3),
        Range16.init(0x0a4c, 0x0a4d, 1),
        Range16.init(0x0a51, 0x0a70, 31),
        Range16.init(0x0a71, 0x0a75, 4),
        Range16.init(0x0a81, 0x0a82, 1),
        Range16.init(0x0abc, 0x0ac1, 5),
        Range16.init(0x0ac2, 0x0ac5, 1),
        Range16.init(0x0ac7, 0x0ac8, 1),
        Range16.init(0x0acd, 0x0ae2, 21),
        Range16.init(0x0ae3, 0x0afa, 23),
        Range16.init(0x0afb, 0x0aff, 1),
        Range16.init(0x0b01, 0x0b3c, 59),
        Range16.init(0x0b3f, 0x0b41, 2),
        Range16.init(0x0b42, 0x0b44, 1),
        Range16.init(0x0b4d, 0x0b55, 8),
        Range16.init(0x0b56, 0x0b62, 12),
        Range16.init(0x0b63, 0x0b82, 31),
        Range16.init(0x0bc0, 0x0bcd, 13),
        Range16.init(0x0c00, 0x0c04, 4),
        Range16.init(0x0c3e, 0x0c40, 1),
        Range16.init(0x0c46, 0x0c48, 1),
        Range16.init(0x0c4a, 0x0c4d, 1),
        Range16.init(0x0c55, 0x0c56, 1),
        Range16.init(0x0c62, 0x0c63, 1),
        Range16.init(0x0c81, 0x0cbc, 59),
        Range16.init(0x0cbf, 0x0cc6, 7),
        Range16.init(0x0ccc, 0x0ccd, 1),
        Range16.init(0x0ce2, 0x0ce3, 1),
        Range16.init(0x0d00, 0x0d01, 1),
        Range16.init(0x0d3b, 0x0d3c, 1),
        Range16.init(0x0d41, 0x0d44, 1),
        Range16.init(0x0d4d, 0x0d62, 21),
        Range16.init(0x0d63, 0x0d81, 30),
        Range16.init(0x0dca, 0x0dd2, 8),
        Range16.init(0x0dd3, 0x0dd4, 1),
        Range16.init(0x0dd6, 0x0e31, 91),
        Range16.init(0x0e34, 0x0e3a, 1),
        Range16.init(0x0e47, 0x0e4e, 1),
        Range16.init(0x0eb1, 0x0eb4, 3),
        Range16.init(0x0eb5, 0x0ebc, 1),
        Range16.init(0x0ec8, 0x0ecd, 1),
        Range16.init(0x0f18, 0x0f19, 1),
        Range16.init(0x0f35, 0x0f39, 2),
        Range16.init(0x0f71, 0x0f7e, 1),
        Range16.init(0x0f80, 0x0f84, 1),
        Range16.init(0x0f86, 0x0f87, 1),
        Range16.init(0x0f8d, 0x0f97, 1),
        Range16.init(0x0f99, 0x0fbc, 1),
        Range16.init(0x0fc6, 0x102d, 103),
        Range16.init(0x102e, 0x1030, 1),
        Range16.init(0x1032, 0x1037, 1),
        Range16.init(0x1039, 0x103a, 1),
        Range16.init(0x103d, 0x103e, 1),
        Range16.init(0x1058, 0x1059, 1),
        Range16.init(0x105e, 0x1060, 1),
        Range16.init(0x1071, 0x1074, 1),
        Range16.init(0x1082, 0x1085, 3),
        Range16.init(0x1086, 0x108d, 7),
        Range16.init(0x109d, 0x135d, 704),
        Range16.init(0x135e, 0x135f, 1),
        Range16.init(0x1712, 0x1714, 1),
        Range16.init(0x1732, 0x1734, 1),
        Range16.init(0x1752, 0x1753, 1),
        Range16.init(0x1772, 0x1773, 1),
        Range16.init(0x17b4, 0x17b5, 1),
        Range16.init(0x17b7, 0x17bd, 1),
        Range16.init(0x17c6, 0x17c9, 3),
        Range16.init(0x17ca, 0x17d3, 1),
        Range16.init(0x17dd, 0x180b, 46),
        Range16.init(0x180c, 0x180d, 1),
        Range16.init(0x1885, 0x1886, 1),
        Range16.init(0x18a9, 0x1920, 119),
        Range16.init(0x1921, 0x1922, 1),
        Range16.init(0x1927, 0x1928, 1),
        Range16.init(0x1932, 0x1939, 7),
        Range16.init(0x193a, 0x193b, 1),
        Range16.init(0x1a17, 0x1a18, 1),
        Range16.init(0x1a1b, 0x1a56, 59),
        Range16.init(0x1a58, 0x1a5e, 1),
        Range16.init(0x1a60, 0x1a62, 2),
        Range16.init(0x1a65, 0x1a6c, 1),
        Range16.init(0x1a73, 0x1a7c, 1),
        Range16.init(0x1a7f, 0x1ab0, 49),
        Range16.init(0x1ab1, 0x1abd, 1),
        Range16.init(0x1abf, 0x1ac0, 1),
        Range16.init(0x1b00, 0x1b03, 1),
        Range16.init(0x1b34, 0x1b36, 2),
        Range16.init(0x1b37, 0x1b3a, 1),
        Range16.init(0x1b3c, 0x1b42, 6),
        Range16.init(0x1b6b, 0x1b73, 1),
        Range16.init(0x1b80, 0x1b81, 1),
        Range16.init(0x1ba2, 0x1ba5, 1),
        Range16.init(0x1ba8, 0x1ba9, 1),
        Range16.init(0x1bab, 0x1bad, 1),
        Range16.init(0x1be6, 0x1be8, 2),
        Range16.init(0x1be9, 0x1bed, 4),
        Range16.init(0x1bef, 0x1bf1, 1),
        Range16.init(0x1c2c, 0x1c33, 1),
        Range16.init(0x1c36, 0x1c37, 1),
        Range16.init(0x1cd0, 0x1cd2, 1),
        Range16.init(0x1cd4, 0x1ce0, 1),
        Range16.init(0x1ce2, 0x1ce8, 1),
        Range16.init(0x1ced, 0x1cf4, 7),
        Range16.init(0x1cf8, 0x1cf9, 1),
        Range16.init(0x1dc0, 0x1df9, 1),
        Range16.init(0x1dfb, 0x1dff, 1),
        Range16.init(0x20d0, 0x20dc, 1),
        Range16.init(0x20e1, 0x20e5, 4),
        Range16.init(0x20e6, 0x20f0, 1),
        Range16.init(0x2cef, 0x2cf1, 1),
        Range16.init(0x2d7f, 0x2de0, 97),
        Range16.init(0x2de1, 0x2dff, 1),
        Range16.init(0x302a, 0x302d, 1),
        Range16.init(0x3099, 0x309a, 1),
        Range16.init(0xa66f, 0xa674, 5),
        Range16.init(0xa675, 0xa67d, 1),
        Range16.init(0xa69e, 0xa69f, 1),
        Range16.init(0xa6f0, 0xa6f1, 1),
        Range16.init(0xa802, 0xa806, 4),
        Range16.init(0xa80b, 0xa825, 26),
        Range16.init(0xa826, 0xa82c, 6),
        Range16.init(0xa8c4, 0xa8c5, 1),
        Range16.init(0xa8e0, 0xa8f1, 1),
        Range16.init(0xa8ff, 0xa926, 39),
        Range16.init(0xa927, 0xa92d, 1),
        Range16.init(0xa947, 0xa951, 1),
        Range16.init(0xa980, 0xa982, 1),
        Range16.init(0xa9b3, 0xa9b6, 3),
        Range16.init(0xa9b7, 0xa9b9, 1),
        Range16.init(0xa9bc, 0xa9bd, 1),
        Range16.init(0xa9e5, 0xaa29, 68),
        Range16.init(0xaa2a, 0xaa2e, 1),
        Range16.init(0xaa31, 0xaa32, 1),
        Range16.init(0xaa35, 0xaa36, 1),
        Range16.init(0xaa43, 0xaa4c, 9),
        Range16.init(0xaa7c, 0xaab0, 52),
        Range16.init(0xaab2, 0xaab4, 1),
        Range16.init(0xaab7, 0xaab8, 1),
        Range16.init(0xaabe, 0xaabf, 1),
        Range16.init(0xaac1, 0xaaec, 43),
        Range16.init(0xaaed, 0xaaf6, 9),
        Range16.init(0xabe5, 0xabe8, 3),
        Range16.init(0xabed, 0xfb1e, 20273),
        Range16.init(0xfe00, 0xfe0f, 1),
        Range16.init(0xfe20, 0xfe2f, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x101fd, 0x102e0, 227),
        Range32.init(0x10376, 0x1037a, 1),
        Range32.init(0x10a01, 0x10a03, 1),
        Range32.init(0x10a05, 0x10a06, 1),
        Range32.init(0x10a0c, 0x10a0f, 1),
        Range32.init(0x10a38, 0x10a3a, 1),
        Range32.init(0x10a3f, 0x10ae5, 166),
        Range32.init(0x10ae6, 0x10d24, 574),
        Range32.init(0x10d25, 0x10d27, 1),
        Range32.init(0x10eab, 0x10eac, 1),
        Range32.init(0x10f46, 0x10f50, 1),
        Range32.init(0x11001, 0x11038, 55),
        Range32.init(0x11039, 0x11046, 1),
        Range32.init(0x1107f, 0x11081, 1),
        Range32.init(0x110b3, 0x110b6, 1),
        Range32.init(0x110b9, 0x110ba, 1),
        Range32.init(0x11100, 0x11102, 1),
        Range32.init(0x11127, 0x1112b, 1),
        Range32.init(0x1112d, 0x11134, 1),
        Range32.init(0x11173, 0x11180, 13),
        Range32.init(0x11181, 0x111b6, 53),
        Range32.init(0x111b7, 0x111be, 1),
        Range32.init(0x111c9, 0x111cc, 1),
        Range32.init(0x111cf, 0x1122f, 96),
        Range32.init(0x11230, 0x11231, 1),
        Range32.init(0x11234, 0x11236, 2),
        Range32.init(0x11237, 0x1123e, 7),
        Range32.init(0x112df, 0x112e3, 4),
        Range32.init(0x112e4, 0x112ea, 1),
        Range32.init(0x11300, 0x11301, 1),
        Range32.init(0x1133b, 0x1133c, 1),
        Range32.init(0x11340, 0x11366, 38),
        Range32.init(0x11367, 0x1136c, 1),
        Range32.init(0x11370, 0x11374, 1),
        Range32.init(0x11438, 0x1143f, 1),
        Range32.init(0x11442, 0x11444, 1),
        Range32.init(0x11446, 0x1145e, 24),
        Range32.init(0x114b3, 0x114b8, 1),
        Range32.init(0x114ba, 0x114bf, 5),
        Range32.init(0x114c0, 0x114c2, 2),
        Range32.init(0x114c3, 0x115b2, 239),
        Range32.init(0x115b3, 0x115b5, 1),
        Range32.init(0x115bc, 0x115bd, 1),
        Range32.init(0x115bf, 0x115c0, 1),
        Range32.init(0x115dc, 0x115dd, 1),
        Range32.init(0x11633, 0x1163a, 1),
        Range32.init(0x1163d, 0x1163f, 2),
        Range32.init(0x11640, 0x116ab, 107),
        Range32.init(0x116ad, 0x116b0, 3),
        Range32.init(0x116b1, 0x116b5, 1),
        Range32.init(0x116b7, 0x1171d, 102),
        Range32.init(0x1171e, 0x1171f, 1),
        Range32.init(0x11722, 0x11725, 1),
        Range32.init(0x11727, 0x1172b, 1),
        Range32.init(0x1182f, 0x11837, 1),
        Range32.init(0x11839, 0x1183a, 1),
        Range32.init(0x1193b, 0x1193c, 1),
        Range32.init(0x1193e, 0x11943, 5),
        Range32.init(0x119d4, 0x119d7, 1),
        Range32.init(0x119da, 0x119db, 1),
        Range32.init(0x119e0, 0x11a01, 33),
        Range32.init(0x11a02, 0x11a0a, 1),
        Range32.init(0x11a33, 0x11a38, 1),
        Range32.init(0x11a3b, 0x11a3e, 1),
        Range32.init(0x11a47, 0x11a51, 10),
        Range32.init(0x11a52, 0x11a56, 1),
        Range32.init(0x11a59, 0x11a5b, 1),
        Range32.init(0x11a8a, 0x11a96, 1),
        Range32.init(0x11a98, 0x11a99, 1),
        Range32.init(0x11c30, 0x11c36, 1),
        Range32.init(0x11c38, 0x11c3d, 1),
        Range32.init(0x11c3f, 0x11c92, 83),
        Range32.init(0x11c93, 0x11ca7, 1),
        Range32.init(0x11caa, 0x11cb0, 1),
        Range32.init(0x11cb2, 0x11cb3, 1),
        Range32.init(0x11cb5, 0x11cb6, 1),
        Range32.init(0x11d31, 0x11d36, 1),
        Range32.init(0x11d3a, 0x11d3c, 2),
        Range32.init(0x11d3d, 0x11d3f, 2),
        Range32.init(0x11d40, 0x11d45, 1),
        Range32.init(0x11d47, 0x11d90, 73),
        Range32.init(0x11d91, 0x11d95, 4),
        Range32.init(0x11d97, 0x11ef3, 348),
        Range32.init(0x11ef4, 0x16af0, 19452),
        Range32.init(0x16af1, 0x16af4, 1),
        Range32.init(0x16b30, 0x16b36, 1),
        Range32.init(0x16f4f, 0x16f8f, 64),
        Range32.init(0x16f90, 0x16f92, 1),
        Range32.init(0x16fe4, 0x1bc9d, 19641),
        Range32.init(0x1bc9e, 0x1d167, 5321),
        Range32.init(0x1d168, 0x1d169, 1),
        Range32.init(0x1d17b, 0x1d182, 1),
        Range32.init(0x1d185, 0x1d18b, 1),
        Range32.init(0x1d1aa, 0x1d1ad, 1),
        Range32.init(0x1d242, 0x1d244, 1),
        Range32.init(0x1da00, 0x1da36, 1),
        Range32.init(0x1da3b, 0x1da6c, 1),
        Range32.init(0x1da75, 0x1da84, 15),
        Range32.init(0x1da9b, 0x1da9f, 1),
        Range32.init(0x1daa1, 0x1daaf, 1),
        Range32.init(0x1e000, 0x1e006, 1),
        Range32.init(0x1e008, 0x1e018, 1),
        Range32.init(0x1e01b, 0x1e021, 1),
        Range32.init(0x1e023, 0x1e024, 1),
        Range32.init(0x1e026, 0x1e02a, 1),
        Range32.init(0x1e130, 0x1e136, 1),
        Range32.init(0x1e2ec, 0x1e2ef, 1),
        Range32.init(0x1e8d0, 0x1e8d6, 1),
        Range32.init(0x1e944, 0x1e94a, 1),
        Range32.init(0xe0100, 0xe01ef, 1),
    },
};

pub const N = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0030, 0x0039, 1),
        Range16.init(0x00b2, 0x00b3, 1),
        Range16.init(0x00b9, 0x00bc, 3),
        Range16.init(0x00bd, 0x00be, 1),
        Range16.init(0x0660, 0x0669, 1),
        Range16.init(0x06f0, 0x06f9, 1),
        Range16.init(0x07c0, 0x07c9, 1),
        Range16.init(0x0966, 0x096f, 1),
        Range16.init(0x09e6, 0x09ef, 1),
        Range16.init(0x09f4, 0x09f9, 1),
        Range16.init(0x0a66, 0x0a6f, 1),
        Range16.init(0x0ae6, 0x0aef, 1),
        Range16.init(0x0b66, 0x0b6f, 1),
        Range16.init(0x0b72, 0x0b77, 1),
        Range16.init(0x0be6, 0x0bf2, 1),
        Range16.init(0x0c66, 0x0c6f, 1),
        Range16.init(0x0c78, 0x0c7e, 1),
        Range16.init(0x0ce6, 0x0cef, 1),
        Range16.init(0x0d58, 0x0d5e, 1),
        Range16.init(0x0d66, 0x0d78, 1),
        Range16.init(0x0de6, 0x0def, 1),
        Range16.init(0x0e50, 0x0e59, 1),
        Range16.init(0x0ed0, 0x0ed9, 1),
        Range16.init(0x0f20, 0x0f33, 1),
        Range16.init(0x1040, 0x1049, 1),
        Range16.init(0x1090, 0x1099, 1),
        Range16.init(0x1369, 0x137c, 1),
        Range16.init(0x16ee, 0x16f0, 1),
        Range16.init(0x17e0, 0x17e9, 1),
        Range16.init(0x17f0, 0x17f9, 1),
        Range16.init(0x1810, 0x1819, 1),
        Range16.init(0x1946, 0x194f, 1),
        Range16.init(0x19d0, 0x19da, 1),
        Range16.init(0x1a80, 0x1a89, 1),
        Range16.init(0x1a90, 0x1a99, 1),
        Range16.init(0x1b50, 0x1b59, 1),
        Range16.init(0x1bb0, 0x1bb9, 1),
        Range16.init(0x1c40, 0x1c49, 1),
        Range16.init(0x1c50, 0x1c59, 1),
        Range16.init(0x2070, 0x2074, 4),
        Range16.init(0x2075, 0x2079, 1),
        Range16.init(0x2080, 0x2089, 1),
        Range16.init(0x2150, 0x2182, 1),
        Range16.init(0x2185, 0x2189, 1),
        Range16.init(0x2460, 0x249b, 1),
        Range16.init(0x24ea, 0x24ff, 1),
        Range16.init(0x2776, 0x2793, 1),
        Range16.init(0x2cfd, 0x3007, 778),
        Range16.init(0x3021, 0x3029, 1),
        Range16.init(0x3038, 0x303a, 1),
        Range16.init(0x3192, 0x3195, 1),
        Range16.init(0x3220, 0x3229, 1),
        Range16.init(0x3248, 0x324f, 1),
        Range16.init(0x3251, 0x325f, 1),
        Range16.init(0x3280, 0x3289, 1),
        Range16.init(0x32b1, 0x32bf, 1),
        Range16.init(0xa620, 0xa629, 1),
        Range16.init(0xa6e6, 0xa6ef, 1),
        Range16.init(0xa830, 0xa835, 1),
        Range16.init(0xa8d0, 0xa8d9, 1),
        Range16.init(0xa900, 0xa909, 1),
        Range16.init(0xa9d0, 0xa9d9, 1),
        Range16.init(0xa9f0, 0xa9f9, 1),
        Range16.init(0xaa50, 0xaa59, 1),
        Range16.init(0xabf0, 0xabf9, 1),
        Range16.init(0xff10, 0xff19, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10107, 0x10133, 1),
        Range32.init(0x10140, 0x10178, 1),
        Range32.init(0x1018a, 0x1018b, 1),
        Range32.init(0x102e1, 0x102fb, 1),
        Range32.init(0x10320, 0x10323, 1),
        Range32.init(0x10341, 0x1034a, 9),
        Range32.init(0x103d1, 0x103d5, 1),
        Range32.init(0x104a0, 0x104a9, 1),
        Range32.init(0x10858, 0x1085f, 1),
        Range32.init(0x10879, 0x1087f, 1),
        Range32.init(0x108a7, 0x108af, 1),
        Range32.init(0x108fb, 0x108ff, 1),
        Range32.init(0x10916, 0x1091b, 1),
        Range32.init(0x109bc, 0x109bd, 1),
        Range32.init(0x109c0, 0x109cf, 1),
        Range32.init(0x109d2, 0x109ff, 1),
        Range32.init(0x10a40, 0x10a48, 1),
        Range32.init(0x10a7d, 0x10a7e, 1),
        Range32.init(0x10a9d, 0x10a9f, 1),
        Range32.init(0x10aeb, 0x10aef, 1),
        Range32.init(0x10b58, 0x10b5f, 1),
        Range32.init(0x10b78, 0x10b7f, 1),
        Range32.init(0x10ba9, 0x10baf, 1),
        Range32.init(0x10cfa, 0x10cff, 1),
        Range32.init(0x10d30, 0x10d39, 1),
        Range32.init(0x10e60, 0x10e7e, 1),
        Range32.init(0x10f1d, 0x10f26, 1),
        Range32.init(0x10f51, 0x10f54, 1),
        Range32.init(0x10fc5, 0x10fcb, 1),
        Range32.init(0x11052, 0x1106f, 1),
        Range32.init(0x110f0, 0x110f9, 1),
        Range32.init(0x11136, 0x1113f, 1),
        Range32.init(0x111d0, 0x111d9, 1),
        Range32.init(0x111e1, 0x111f4, 1),
        Range32.init(0x112f0, 0x112f9, 1),
        Range32.init(0x11450, 0x11459, 1),
        Range32.init(0x114d0, 0x114d9, 1),
        Range32.init(0x11650, 0x11659, 1),
        Range32.init(0x116c0, 0x116c9, 1),
        Range32.init(0x11730, 0x1173b, 1),
        Range32.init(0x118e0, 0x118f2, 1),
        Range32.init(0x11950, 0x11959, 1),
        Range32.init(0x11c50, 0x11c6c, 1),
        Range32.init(0x11d50, 0x11d59, 1),
        Range32.init(0x11da0, 0x11da9, 1),
        Range32.init(0x11fc0, 0x11fd4, 1),
        Range32.init(0x12400, 0x1246e, 1),
        Range32.init(0x16a60, 0x16a69, 1),
        Range32.init(0x16b50, 0x16b59, 1),
        Range32.init(0x16b5b, 0x16b61, 1),
        Range32.init(0x16e80, 0x16e96, 1),
        Range32.init(0x1d2e0, 0x1d2f3, 1),
        Range32.init(0x1d360, 0x1d378, 1),
        Range32.init(0x1d7ce, 0x1d7ff, 1),
        Range32.init(0x1e140, 0x1e149, 1),
        Range32.init(0x1e2f0, 0x1e2f9, 1),
        Range32.init(0x1e8c7, 0x1e8cf, 1),
        Range32.init(0x1e950, 0x1e959, 1),
        Range32.init(0x1ec71, 0x1ecab, 1),
        Range32.init(0x1ecad, 0x1ecaf, 1),
        Range32.init(0x1ecb1, 0x1ecb4, 1),
        Range32.init(0x1ed01, 0x1ed2d, 1),
        Range32.init(0x1ed2f, 0x1ed3d, 1),
        Range32.init(0x1f100, 0x1f10c, 1),
        Range32.init(0x1fbf0, 0x1fbf9, 1),
    },
    .latin_offset = 4,
};

pub const Nd = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0030, 0x0039, 1),
        Range16.init(0x0660, 0x0669, 1),
        Range16.init(0x06f0, 0x06f9, 1),
        Range16.init(0x07c0, 0x07c9, 1),
        Range16.init(0x0966, 0x096f, 1),
        Range16.init(0x09e6, 0x09ef, 1),
        Range16.init(0x0a66, 0x0a6f, 1),
        Range16.init(0x0ae6, 0x0aef, 1),
        Range16.init(0x0b66, 0x0b6f, 1),
        Range16.init(0x0be6, 0x0bef, 1),
        Range16.init(0x0c66, 0x0c6f, 1),
        Range16.init(0x0ce6, 0x0cef, 1),
        Range16.init(0x0d66, 0x0d6f, 1),
        Range16.init(0x0de6, 0x0def, 1),
        Range16.init(0x0e50, 0x0e59, 1),
        Range16.init(0x0ed0, 0x0ed9, 1),
        Range16.init(0x0f20, 0x0f29, 1),
        Range16.init(0x1040, 0x1049, 1),
        Range16.init(0x1090, 0x1099, 1),
        Range16.init(0x17e0, 0x17e9, 1),
        Range16.init(0x1810, 0x1819, 1),
        Range16.init(0x1946, 0x194f, 1),
        Range16.init(0x19d0, 0x19d9, 1),
        Range16.init(0x1a80, 0x1a89, 1),
        Range16.init(0x1a90, 0x1a99, 1),
        Range16.init(0x1b50, 0x1b59, 1),
        Range16.init(0x1bb0, 0x1bb9, 1),
        Range16.init(0x1c40, 0x1c49, 1),
        Range16.init(0x1c50, 0x1c59, 1),
        Range16.init(0xa620, 0xa629, 1),
        Range16.init(0xa8d0, 0xa8d9, 1),
        Range16.init(0xa900, 0xa909, 1),
        Range16.init(0xa9d0, 0xa9d9, 1),
        Range16.init(0xa9f0, 0xa9f9, 1),
        Range16.init(0xaa50, 0xaa59, 1),
        Range16.init(0xabf0, 0xabf9, 1),
        Range16.init(0xff10, 0xff19, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x104a0, 0x104a9, 1),
        Range32.init(0x10d30, 0x10d39, 1),
        Range32.init(0x11066, 0x1106f, 1),
        Range32.init(0x110f0, 0x110f9, 1),
        Range32.init(0x11136, 0x1113f, 1),
        Range32.init(0x111d0, 0x111d9, 1),
        Range32.init(0x112f0, 0x112f9, 1),
        Range32.init(0x11450, 0x11459, 1),
        Range32.init(0x114d0, 0x114d9, 1),
        Range32.init(0x11650, 0x11659, 1),
        Range32.init(0x116c0, 0x116c9, 1),
        Range32.init(0x11730, 0x11739, 1),
        Range32.init(0x118e0, 0x118e9, 1),
        Range32.init(0x11950, 0x11959, 1),
        Range32.init(0x11c50, 0x11c59, 1),
        Range32.init(0x11d50, 0x11d59, 1),
        Range32.init(0x11da0, 0x11da9, 1),
        Range32.init(0x16a60, 0x16a69, 1),
        Range32.init(0x16b50, 0x16b59, 1),
        Range32.init(0x1d7ce, 0x1d7ff, 1),
        Range32.init(0x1e140, 0x1e149, 1),
        Range32.init(0x1e2f0, 0x1e2f9, 1),
        Range32.init(0x1e950, 0x1e959, 1),
        Range32.init(0x1fbf0, 0x1fbf9, 1),
    },
    .latin_offset = 1,
};

pub const Nl = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x16ee, 0x16f0, 1),
        Range16.init(0x2160, 0x2182, 1),
        Range16.init(0x2185, 0x2188, 1),
        Range16.init(0x3007, 0x3021, 26),
        Range16.init(0x3022, 0x3029, 1),
        Range16.init(0x3038, 0x303a, 1),
        Range16.init(0xa6e6, 0xa6ef, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10140, 0x10174, 1),
        Range32.init(0x10341, 0x1034a, 9),
        Range32.init(0x103d1, 0x103d5, 1),
        Range32.init(0x12400, 0x1246e, 1),
    },
};

pub const No = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x00b2, 0x00b3, 1),
        Range16.init(0x00b9, 0x00bc, 3),
        Range16.init(0x00bd, 0x00be, 1),
        Range16.init(0x09f4, 0x09f9, 1),
        Range16.init(0x0b72, 0x0b77, 1),
        Range16.init(0x0bf0, 0x0bf2, 1),
        Range16.init(0x0c78, 0x0c7e, 1),
        Range16.init(0x0d58, 0x0d5e, 1),
        Range16.init(0x0d70, 0x0d78, 1),
        Range16.init(0x0f2a, 0x0f33, 1),
        Range16.init(0x1369, 0x137c, 1),
        Range16.init(0x17f0, 0x17f9, 1),
        Range16.init(0x19da, 0x2070, 1686),
        Range16.init(0x2074, 0x2079, 1),
        Range16.init(0x2080, 0x2089, 1),
        Range16.init(0x2150, 0x215f, 1),
        Range16.init(0x2189, 0x2460, 727),
        Range16.init(0x2461, 0x249b, 1),
        Range16.init(0x24ea, 0x24ff, 1),
        Range16.init(0x2776, 0x2793, 1),
        Range16.init(0x2cfd, 0x3192, 1173),
        Range16.init(0x3193, 0x3195, 1),
        Range16.init(0x3220, 0x3229, 1),
        Range16.init(0x3248, 0x324f, 1),
        Range16.init(0x3251, 0x325f, 1),
        Range16.init(0x3280, 0x3289, 1),
        Range16.init(0x32b1, 0x32bf, 1),
        Range16.init(0xa830, 0xa835, 1),
    },
    .r32 = &[_]Range32{
        Range16.init(0x10107, 0x10133, 1),
        Range16.init(0x10175, 0x10178, 1),
        Range16.init(0x1018a, 0x1018b, 1),
        Range16.init(0x102e1, 0x102fb, 1),
        Range16.init(0x10320, 0x10323, 1),
        Range16.init(0x10858, 0x1085f, 1),
        Range16.init(0x10879, 0x1087f, 1),
        Range16.init(0x108a7, 0x108af, 1),
        Range16.init(0x108fb, 0x108ff, 1),
        Range16.init(0x10916, 0x1091b, 1),
        Range16.init(0x109bc, 0x109bd, 1),
        Range16.init(0x109c0, 0x109cf, 1),
        Range16.init(0x109d2, 0x109ff, 1),
        Range16.init(0x10a40, 0x10a48, 1),
        Range16.init(0x10a7d, 0x10a7e, 1),
        Range16.init(0x10a9d, 0x10a9f, 1),
        Range16.init(0x10aeb, 0x10aef, 1),
        Range16.init(0x10b58, 0x10b5f, 1),
        Range16.init(0x10b78, 0x10b7f, 1),
        Range16.init(0x10ba9, 0x10baf, 1),
        Range16.init(0x10cfa, 0x10cff, 1),
        Range16.init(0x10e60, 0x10e7e, 1),
        Range16.init(0x10f1d, 0x10f26, 1),
        Range16.init(0x10f51, 0x10f54, 1),
        Range16.init(0x10fc5, 0x10fcb, 1),
        Range16.init(0x11052, 0x11065, 1),
        Range16.init(0x111e1, 0x111f4, 1),
        Range16.init(0x1173a, 0x1173b, 1),
        Range16.init(0x118ea, 0x118f2, 1),
        Range16.init(0x11c5a, 0x11c6c, 1),
        Range16.init(0x11fc0, 0x11fd4, 1),
        Range16.init(0x16b5b, 0x16b61, 1),
        Range16.init(0x16e80, 0x16e96, 1),
        Range16.init(0x1d2e0, 0x1d2f3, 1),
        Range16.init(0x1d360, 0x1d378, 1),
        Range16.init(0x1e8c7, 0x1e8cf, 1),
        Range16.init(0x1ec71, 0x1ecab, 1),
        Range16.init(0x1ecad, 0x1ecaf, 1),
        Range16.init(0x1ecb1, 0x1ecb4, 1),
        Range16.init(0x1ed01, 0x1ed2d, 1),
        Range16.init(0x1ed2f, 0x1ed3d, 1),
        Range16.init(0x1f100, 0x1f10c, 1),
    },
    .latin_offset = 3,
};

pub const P = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0021, 0x0023, 1),
        Range16.init(0x0025, 0x002a, 1),
        Range16.init(0x002c, 0x002f, 1),
        Range16.init(0x003a, 0x003b, 1),
        Range16.init(0x003f, 0x0040, 1),
        Range16.init(0x005b, 0x005d, 1),
        Range16.init(0x005f, 0x007b, 28),
        Range16.init(0x007d, 0x00a1, 36),
        Range16.init(0x00a7, 0x00ab, 4),
        Range16.init(0x00b6, 0x00b7, 1),
        Range16.init(0x00bb, 0x00bf, 4),
        Range16.init(0x037e, 0x0387, 9),
        Range16.init(0x055a, 0x055f, 1),
        Range16.init(0x0589, 0x058a, 1),
        Range16.init(0x05be, 0x05c0, 2),
        Range16.init(0x05c3, 0x05c6, 3),
        Range16.init(0x05f3, 0x05f4, 1),
        Range16.init(0x0609, 0x060a, 1),
        Range16.init(0x060c, 0x060d, 1),
        Range16.init(0x061b, 0x061e, 3),
        Range16.init(0x061f, 0x066a, 75),
        Range16.init(0x066b, 0x066d, 1),
        Range16.init(0x06d4, 0x0700, 44),
        Range16.init(0x0701, 0x070d, 1),
        Range16.init(0x07f7, 0x07f9, 1),
        Range16.init(0x0830, 0x083e, 1),
        Range16.init(0x085e, 0x0964, 262),
        Range16.init(0x0965, 0x0970, 11),
        Range16.init(0x09fd, 0x0a76, 121),
        Range16.init(0x0af0, 0x0c77, 391),
        Range16.init(0x0c84, 0x0df4, 368),
        Range16.init(0x0e4f, 0x0e5a, 11),
        Range16.init(0x0e5b, 0x0f04, 169),
        Range16.init(0x0f05, 0x0f12, 1),
        Range16.init(0x0f14, 0x0f3a, 38),
        Range16.init(0x0f3b, 0x0f3d, 1),
        Range16.init(0x0f85, 0x0fd0, 75),
        Range16.init(0x0fd1, 0x0fd4, 1),
        Range16.init(0x0fd9, 0x0fda, 1),
        Range16.init(0x104a, 0x104f, 1),
        Range16.init(0x10fb, 0x1360, 613),
        Range16.init(0x1361, 0x1368, 1),
        Range16.init(0x1400, 0x166e, 622),
        Range16.init(0x169b, 0x169c, 1),
        Range16.init(0x16eb, 0x16ed, 1),
        Range16.init(0x1735, 0x1736, 1),
        Range16.init(0x17d4, 0x17d6, 1),
        Range16.init(0x17d8, 0x17da, 1),
        Range16.init(0x1800, 0x180a, 1),
        Range16.init(0x1944, 0x1945, 1),
        Range16.init(0x1a1e, 0x1a1f, 1),
        Range16.init(0x1aa0, 0x1aa6, 1),
        Range16.init(0x1aa8, 0x1aad, 1),
        Range16.init(0x1b5a, 0x1b60, 1),
        Range16.init(0x1bfc, 0x1bff, 1),
        Range16.init(0x1c3b, 0x1c3f, 1),
        Range16.init(0x1c7e, 0x1c7f, 1),
        Range16.init(0x1cc0, 0x1cc7, 1),
        Range16.init(0x1cd3, 0x2010, 829),
        Range16.init(0x2011, 0x2027, 1),
        Range16.init(0x2030, 0x2043, 1),
        Range16.init(0x2045, 0x2051, 1),
        Range16.init(0x2053, 0x205e, 1),
        Range16.init(0x207d, 0x207e, 1),
        Range16.init(0x208d, 0x208e, 1),
        Range16.init(0x2308, 0x230b, 1),
        Range16.init(0x2329, 0x232a, 1),
        Range16.init(0x2768, 0x2775, 1),
        Range16.init(0x27c5, 0x27c6, 1),
        Range16.init(0x27e6, 0x27ef, 1),
        Range16.init(0x2983, 0x2998, 1),
        Range16.init(0x29d8, 0x29db, 1),
        Range16.init(0x29fc, 0x29fd, 1),
        Range16.init(0x2cf9, 0x2cfc, 1),
        Range16.init(0x2cfe, 0x2cff, 1),
        Range16.init(0x2d70, 0x2e00, 144),
        Range16.init(0x2e01, 0x2e2e, 1),
        Range16.init(0x2e30, 0x2e4f, 1),
        Range16.init(0x2e52, 0x3001, 431),
        Range16.init(0x3002, 0x3003, 1),
        Range16.init(0x3008, 0x3011, 1),
        Range16.init(0x3014, 0x301f, 1),
        Range16.init(0x3030, 0x303d, 13),
        Range16.init(0x30a0, 0x30fb, 91),
        Range16.init(0xa4fe, 0xa4ff, 1),
        Range16.init(0xa60d, 0xa60f, 1),
        Range16.init(0xa673, 0xa67e, 11),
        Range16.init(0xa6f2, 0xa6f7, 1),
        Range16.init(0xa874, 0xa877, 1),
        Range16.init(0xa8ce, 0xa8cf, 1),
        Range16.init(0xa8f8, 0xa8fa, 1),
        Range16.init(0xa8fc, 0xa92e, 50),
        Range16.init(0xa92f, 0xa95f, 48),
        Range16.init(0xa9c1, 0xa9cd, 1),
        Range16.init(0xa9de, 0xa9df, 1),
        Range16.init(0xaa5c, 0xaa5f, 1),
        Range16.init(0xaade, 0xaadf, 1),
        Range16.init(0xaaf0, 0xaaf1, 1),
        Range16.init(0xabeb, 0xfd3e, 20819),
        Range16.init(0xfd3f, 0xfe10, 209),
        Range16.init(0xfe11, 0xfe19, 1),
        Range16.init(0xfe30, 0xfe52, 1),
        Range16.init(0xfe54, 0xfe61, 1),
        Range16.init(0xfe63, 0xfe68, 5),
        Range16.init(0xfe6a, 0xfe6b, 1),
        Range16.init(0xff01, 0xff03, 1),
        Range16.init(0xff05, 0xff0a, 1),
        Range16.init(0xff0c, 0xff0f, 1),
        Range16.init(0xff1a, 0xff1b, 1),
        Range16.init(0xff1f, 0xff20, 1),
        Range16.init(0xff3b, 0xff3d, 1),
        Range16.init(0xff3f, 0xff5b, 28),
        Range16.init(0xff5d, 0xff5f, 2),
        Range16.init(0xff60, 0xff65, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10100, 0x10102, 1),
        Range32.init(0x1039f, 0x103d0, 49),
        Range32.init(0x1056f, 0x10857, 744),
        Range32.init(0x1091f, 0x1093f, 32),
        Range32.init(0x10a50, 0x10a58, 1),
        Range32.init(0x10a7f, 0x10af0, 113),
        Range32.init(0x10af1, 0x10af6, 1),
        Range32.init(0x10b39, 0x10b3f, 1),
        Range32.init(0x10b99, 0x10b9c, 1),
        Range32.init(0x10ead, 0x10f55, 168),
        Range32.init(0x10f56, 0x10f59, 1),
        Range32.init(0x11047, 0x1104d, 1),
        Range32.init(0x110bb, 0x110bc, 1),
        Range32.init(0x110be, 0x110c1, 1),
        Range32.init(0x11140, 0x11143, 1),
        Range32.init(0x11174, 0x11175, 1),
        Range32.init(0x111c5, 0x111c8, 1),
        Range32.init(0x111cd, 0x111db, 14),
        Range32.init(0x111dd, 0x111df, 1),
        Range32.init(0x11238, 0x1123d, 1),
        Range32.init(0x112a9, 0x1144b, 418),
        Range32.init(0x1144c, 0x1144f, 1),
        Range32.init(0x1145a, 0x1145b, 1),
        Range32.init(0x1145d, 0x114c6, 105),
        Range32.init(0x115c1, 0x115d7, 1),
        Range32.init(0x11641, 0x11643, 1),
        Range32.init(0x11660, 0x1166c, 1),
        Range32.init(0x1173c, 0x1173e, 1),
        Range32.init(0x1183b, 0x11944, 265),
        Range32.init(0x11945, 0x11946, 1),
        Range32.init(0x119e2, 0x11a3f, 93),
        Range32.init(0x11a40, 0x11a46, 1),
        Range32.init(0x11a9a, 0x11a9c, 1),
        Range32.init(0x11a9e, 0x11aa2, 1),
        Range32.init(0x11c41, 0x11c45, 1),
        Range32.init(0x11c70, 0x11c71, 1),
        Range32.init(0x11ef7, 0x11ef8, 1),
        Range32.init(0x11fff, 0x12470, 1137),
        Range32.init(0x12471, 0x12474, 1),
        Range32.init(0x16a6e, 0x16a6f, 1),
        Range32.init(0x16af5, 0x16b37, 66),
        Range32.init(0x16b38, 0x16b3b, 1),
        Range32.init(0x16b44, 0x16e97, 851),
        Range32.init(0x16e98, 0x16e9a, 1),
        Range32.init(0x16fe2, 0x1bc9f, 19645),
        Range32.init(0x1da87, 0x1da8b, 1),
        Range32.init(0x1e95e, 0x1e95f, 1),
    },
    .latin_offset = 11,
};

pub const Pc = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x005f, 0x203f, 8160),
        Range16.init(0x2040, 0x2054, 20),
        Range16.init(0xfe33, 0xfe34, 1),
        Range16.init(0xfe4d, 0xfe4f, 1),
        Range16.init(0xff3f, 0xff3f, 1),
    },
};

pub const Pd = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x002d, 0x058a, 1373),
        Range16.init(0x05be, 0x1400, 3650),
        Range16.init(0x1806, 0x2010, 2058),
        Range16.init(0x2011, 0x2015, 1),
        Range16.init(0x2e17, 0x2e1a, 3),
        Range16.init(0x2e3a, 0x2e3b, 1),
        Range16.init(0x2e40, 0x301c, 476),
        Range16.init(0x3030, 0x30a0, 112),
        Range16.init(0xfe31, 0xfe32, 1),
        Range16.init(0xfe58, 0xfe63, 11),
        Range16.init(0xff0d, 0xff0d, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10ead, 0x10ead, 1),
    },
};

pub const Pe = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(x0029, 0x005d, 52),
        Range16.init(0x007d, 0x0f3b, 3774),
        Range16.init(0x0f3d, 0x169c, 1887),
        Range16.init(0x2046, 0x207e, 56),
        Range16.init(0x208e, 0x2309, 635),
        Range16.init(0x230b, 0x232a, 31),
        Range16.init(0x2769, 0x2775, 2),
        Range16.init(0x27c6, 0x27e7, 33),
        Range16.init(0x27e9, 0x27ef, 2),
        Range16.init(0x2984, 0x2998, 2),
        Range16.init(0x29d9, 0x29db, 2),
        Range16.init(0x29fd, 0x2e23, 1062),
        Range16.init(0x2e25, 0x2e29, 2),
        Range16.init(0x3009, 0x3011, 2),
        Range16.init(0x3015, 0x301b, 2),
        Range16.init(0x301e, 0x301f, 1),
        Range16.init(0xfd3e, 0xfe18, 218),
        Range16.init(0xfe36, 0xfe44, 2),
        Range16.init(0xfe48, 0xfe5a, 18),
        Range16.init(0xfe5c, 0xfe5e, 2),
        Range16.init(0xff09, 0xff3d, 52),
        Range16.init(0xff5d, 0xff63, 3),
    },
    .latin_offset = 1,
};

pub const Pf = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x00bb, 0x2019, 8030),
        Range16.init(0x201d, 0x203a, 29),
        Range16.init(0x2e03, 0x2e05, 2),
        Range16.init(0x2e0a, 0x2e0d, 3),
        Range16.init(0x2e1d, 0x2e21, 4),
    },
};

pub const Pi = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x00ab, 0x2018, 8045),
        Range16.init(0x201b, 0x201c, 1),
        Range16.init(0x201f, 0x2039, 26),
        Range16.init(0x2e02, 0x2e04, 2),
        Range16.init(0x2e09, 0x2e0c, 3),
        Range16.init(0x2e1c, 0x2e20, 4),
    },
};

pub const Po = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0021, 0x0023, 1),
        Range16.init(0x0025, 0x0027, 1),
        Range16.init(0x002a, 0x002e, 2),
        Range16.init(0x002f, 0x003a, 11),
        Range16.init(0x003b, 0x003f, 4),
        Range16.init(0x0040, 0x005c, 28),
        Range16.init(0x00a1, 0x00a7, 6),
        Range16.init(0x00b6, 0x00b7, 1),
        Range16.init(0x00bf, 0x037e, 703),
        Range16.init(0x0387, 0x055a, 467),
        Range16.init(0x055b, 0x055f, 1),
        Range16.init(0x0589, 0x05c0, 55),
        Range16.init(0x05c3, 0x05c6, 3),
        Range16.init(0x05f3, 0x05f4, 1),
        Range16.init(0x0609, 0x060a, 1),
        Range16.init(0x060c, 0x060d, 1),
        Range16.init(0x061b, 0x061e, 3),
        Range16.init(0x061f, 0x066a, 75),
        Range16.init(0x066b, 0x066d, 1),
        Range16.init(0x06d4, 0x0700, 44),
        Range16.init(0x0701, 0x070d, 1),
        Range16.init(0x07f7, 0x07f9, 1),
        Range16.init(0x0830, 0x083e, 1),
        Range16.init(0x085e, 0x0964, 262),
        Range16.init(0x0965, 0x0970, 11),
        Range16.init(0x09fd, 0x0a76, 121),
        Range16.init(0x0af0, 0x0c77, 391),
        Range16.init(0x0c84, 0x0df4, 368),
        Range16.init(0x0e4f, 0x0e5a, 11),
        Range16.init(0x0e5b, 0x0f04, 169),
        Range16.init(0x0f05, 0x0f12, 1),
        Range16.init(0x0f14, 0x0f85, 113),
        Range16.init(0x0fd0, 0x0fd4, 1),
        Range16.init(0x0fd9, 0x0fda, 1),
        Range16.init(0x104a, 0x104f, 1),
        Range16.init(0x10fb, 0x1360, 613),
        Range16.init(0x1361, 0x1368, 1),
        Range16.init(0x166e, 0x16eb, 125),
        Range16.init(0x16ec, 0x16ed, 1),
        Range16.init(0x1735, 0x1736, 1),
        Range16.init(0x17d4, 0x17d6, 1),
        Range16.init(0x17d8, 0x17da, 1),
        Range16.init(0x1800, 0x1805, 1),
        Range16.init(0x1807, 0x180a, 1),
        Range16.init(0x1944, 0x1945, 1),
        Range16.init(0x1a1e, 0x1a1f, 1),
        Range16.init(0x1aa0, 0x1aa6, 1),
        Range16.init(0x1aa8, 0x1aad, 1),
        Range16.init(0x1b5a, 0x1b60, 1),
        Range16.init(0x1bfc, 0x1bff, 1),
        Range16.init(0x1c3b, 0x1c3f, 1),
        Range16.init(0x1c7e, 0x1c7f, 1),
        Range16.init(0x1cc0, 0x1cc7, 1),
        Range16.init(0x1cd3, 0x2016, 835),
        Range16.init(0x2017, 0x2020, 9),
        Range16.init(0x2021, 0x2027, 1),
        Range16.init(0x2030, 0x2038, 1),
        Range16.init(0x203b, 0x203e, 1),
        Range16.init(0x2041, 0x2043, 1),
        Range16.init(0x2047, 0x2051, 1),
        Range16.init(0x2053, 0x2055, 2),
        Range16.init(0x2056, 0x205e, 1),
        Range16.init(0x2cf9, 0x2cfc, 1),
        Range16.init(0x2cfe, 0x2cff, 1),
        Range16.init(0x2d70, 0x2e00, 144),
        Range16.init(0x2e01, 0x2e06, 5),
        Range16.init(0x2e07, 0x2e08, 1),
        Range16.init(0x2e0b, 0x2e0e, 3),
        Range16.init(0x2e0f, 0x2e16, 1),
        Range16.init(0x2e18, 0x2e19, 1),
        Range16.init(0x2e1b, 0x2e1e, 3),
        Range16.init(0x2e1f, 0x2e2a, 11),
        Range16.init(0x2e2b, 0x2e2e, 1),
        Range16.init(0x2e30, 0x2e39, 1),
        Range16.init(0x2e3c, 0x2e3f, 1),
        Range16.init(0x2e41, 0x2e43, 2),
        Range16.init(0x2e44, 0x2e4f, 1),
        Range16.init(0x2e52, 0x3001, 431),
        Range16.init(0x3002, 0x3003, 1),
        Range16.init(0x303d, 0x30fb, 190),
        Range16.init(0xa4fe, 0xa4ff, 1),
        Range16.init(0xa60d, 0xa60f, 1),
        Range16.init(0xa673, 0xa67e, 11),
        Range16.init(0xa6f2, 0xa6f7, 1),
        Range16.init(0xa874, 0xa877, 1),
        Range16.init(0xa8ce, 0xa8cf, 1),
        Range16.init(0xa8f8, 0xa8fa, 1),
        Range16.init(0xa8fc, 0xa92e, 50),
        Range16.init(0xa92f, 0xa95f, 48),
        Range16.init(0xa9c1, 0xa9cd, 1),
        Range16.init(0xa9de, 0xa9df, 1),
        Range16.init(0xaa5c, 0xaa5f, 1),
        Range16.init(0xaade, 0xaadf, 1),
        Range16.init(0xaaf0, 0xaaf1, 1),
        Range16.init(0xabeb, 0xfe10, 21029),
        Range16.init(0xfe11, 0xfe16, 1),
        Range16.init(0xfe19, 0xfe30, 23),
        Range16.init(0xfe45, 0xfe46, 1),
        Range16.init(0xfe49, 0xfe4c, 1),
        Range16.init(0xfe50, 0xfe52, 1),
        Range16.init(0xfe54, 0xfe57, 1),
        Range16.init(0xfe5f, 0xfe61, 1),
        Range16.init(0xfe68, 0xfe6a, 2),
        Range16.init(0xfe6b, 0xff01, 150),
        Range16.init(0xff02, 0xff03, 1),
        Range16.init(0xff05, 0xff07, 1),
        Range16.init(0xff0a, 0xff0e, 2),
        Range16.init(0xff0f, 0xff1a, 11),
        Range16.init(0xff1b, 0xff1f, 4),
        Range16.init(0xff20, 0xff3c, 28),
        Range16.init(0xff61, 0xff64, 3),
        Range16.init(0xff65, 0xff65, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10100, 0x10102, 1),
        Range32.init(0x1039f, 0x103d0, 49),
        Range32.init(0x1056f, 0x10857, 744),
        Range32.init(0x1091f, 0x1093f, 32),
        Range32.init(0x10a50, 0x10a58, 1),
        Range32.init(0x10a7f, 0x10af0, 113),
        Range32.init(0x10af1, 0x10af6, 1),
        Range32.init(0x10b39, 0x10b3f, 1),
        Range32.init(0x10b99, 0x10b9c, 1),
        Range32.init(0x10f55, 0x10f59, 1),
        Range32.init(0x11047, 0x1104d, 1),
        Range32.init(0x110bb, 0x110bc, 1),
        Range32.init(0x110be, 0x110c1, 1),
        Range32.init(0x11140, 0x11143, 1),
        Range32.init(0x11174, 0x11175, 1),
        Range32.init(0x111c5, 0x111c8, 1),
        Range32.init(0x111cd, 0x111db, 14),
        Range32.init(0x111dd, 0x111df, 1),
        Range32.init(0x11238, 0x1123d, 1),
        Range32.init(0x112a9, 0x1144b, 418),
        Range32.init(0x1144c, 0x1144f, 1),
        Range32.init(0x1145a, 0x1145b, 1),
        Range32.init(0x1145d, 0x114c6, 105),
        Range32.init(0x115c1, 0x115d7, 1),
        Range32.init(0x11641, 0x11643, 1),
        Range32.init(0x11660, 0x1166c, 1),
        Range32.init(0x1173c, 0x1173e, 1),
        Range32.init(0x1183b, 0x11944, 265),
        Range32.init(0x11945, 0x11946, 1),
        Range32.init(0x119e2, 0x11a3f, 93),
        Range32.init(0x11a40, 0x11a46, 1),
        Range32.init(0x11a9a, 0x11a9c, 1),
        Range32.init(0x11a9e, 0x11aa2, 1),
        Range32.init(0x11c41, 0x11c45, 1),
        Range32.init(0x11c70, 0x11c71, 1),
        Range32.init(0x11ef7, 0x11ef8, 1),
        Range32.init(0x11fff, 0x12470, 1137),
        Range32.init(0x12471, 0x12474, 1),
        Range32.init(0x16a6e, 0x16a6f, 1),
        Range32.init(0x16af5, 0x16b37, 66),
        Range32.init(0x16b38, 0x16b3b, 1),
        Range32.init(0x16b44, 0x16e97, 851),
        Range32.init(0x16e98, 0x16e9a, 1),
        Range32.init(0x16fe2, 0x1bc9f, 19645),
        Range32.init(0x1da87, 0x1da8b, 1),
        Range32.init(0x1e95e, 0x1e95f, 1),
    },
    .latin_offset = 8,
};

pub const Ps = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0028, 0x005b, 51),
        Range16.init(0x007b, 0x0f3a, 3775),
        Range16.init(0x0f3c, 0x169b, 1887),
        Range16.init(0x201a, 0x201e, 4),
        Range16.init(0x2045, 0x207d, 56),
        Range16.init(0x208d, 0x2308, 635),
        Range16.init(0x230a, 0x2329, 31),
        Range16.init(0x2768, 0x2774, 2),
        Range16.init(0x27c5, 0x27e6, 33),
        Range16.init(0x27e8, 0x27ee, 2),
        Range16.init(0x2983, 0x2997, 2),
        Range16.init(0x29d8, 0x29da, 2),
        Range16.init(0x29fc, 0x2e22, 1062),
        Range16.init(0x2e24, 0x2e28, 2),
        Range16.init(0x2e42, 0x3008, 454),
        Range16.init(0x300a, 0x3010, 2),
        Range16.init(0x3014, 0x301a, 2),
        Range16.init(0x301d, 0xfd3f, 52514),
        Range16.init(0xfe17, 0xfe35, 30),
        Range16.init(0xfe37, 0xfe43, 2),
        Range16.init(0xfe47, 0xfe59, 18),
        Range16.init(0xfe5b, 0xfe5d, 2),
        Range16.init(0xff08, 0xff3b, 51),
        Range16.init(0xff5b, 0xff5f, 4),
        Range16.init(0xff62, 0xff62, 1),
    },
    .latin_offset = 1,
};

pub const S = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0024, 0x002b, 7),
        Range16.init(0x003c, 0x003e, 1),
        Range16.init(0x005e, 0x0060, 2),
        Range16.init(0x007c, 0x007e, 2),
        Range16.init(0x00a2, 0x00a6, 1),
        Range16.init(0x00a8, 0x00a9, 1),
        Range16.init(0x00ac, 0x00ae, 2),
        Range16.init(0x00af, 0x00b1, 1),
        Range16.init(0x00b4, 0x00b8, 4),
        Range16.init(0x00d7, 0x00f7, 32),
        Range16.init(0x02c2, 0x02c5, 1),
        Range16.init(0x02d2, 0x02df, 1),
        Range16.init(0x02e5, 0x02eb, 1),
        Range16.init(0x02ed, 0x02ef, 2),
        Range16.init(0x02f0, 0x02ff, 1),
        Range16.init(0x0375, 0x0384, 15),
        Range16.init(0x0385, 0x03f6, 113),
        Range16.init(0x0482, 0x058d, 267),
        Range16.init(0x058e, 0x058f, 1),
        Range16.init(0x0606, 0x0608, 1),
        Range16.init(0x060b, 0x060e, 3),
        Range16.init(0x060f, 0x06de, 207),
        Range16.init(0x06e9, 0x06fd, 20),
        Range16.init(0x06fe, 0x07f6, 248),
        Range16.init(0x07fe, 0x07ff, 1),
        Range16.init(0x09f2, 0x09f3, 1),
        Range16.init(0x09fa, 0x09fb, 1),
        Range16.init(0x0af1, 0x0b70, 127),
        Range16.init(0x0bf3, 0x0bfa, 1),
        Range16.init(0x0c7f, 0x0d4f, 208),
        Range16.init(0x0d79, 0x0e3f, 198),
        Range16.init(0x0f01, 0x0f03, 1),
        Range16.init(0x0f13, 0x0f15, 2),
        Range16.init(0x0f16, 0x0f17, 1),
        Range16.init(0x0f1a, 0x0f1f, 1),
        Range16.init(0x0f34, 0x0f38, 2),
        Range16.init(0x0fbe, 0x0fc5, 1),
        Range16.init(0x0fc7, 0x0fcc, 1),
        Range16.init(0x0fce, 0x0fcf, 1),
        Range16.init(0x0fd5, 0x0fd8, 1),
        Range16.init(0x109e, 0x109f, 1),
        Range16.init(0x1390, 0x1399, 1),
        Range16.init(0x166d, 0x17db, 366),
        Range16.init(0x1940, 0x19de, 158),
        Range16.init(0x19df, 0x19ff, 1),
        Range16.init(0x1b61, 0x1b6a, 1),
        Range16.init(0x1b74, 0x1b7c, 1),
        Range16.init(0x1fbd, 0x1fbf, 2),
        Range16.init(0x1fc0, 0x1fc1, 1),
        Range16.init(0x1fcd, 0x1fcf, 1),
        Range16.init(0x1fdd, 0x1fdf, 1),
        Range16.init(0x1fed, 0x1fef, 1),
        Range16.init(0x1ffd, 0x1ffe, 1),
        Range16.init(0x2044, 0x2052, 14),
        Range16.init(0x207a, 0x207c, 1),
        Range16.init(0x208a, 0x208c, 1),
        Range16.init(0x20a0, 0x20bf, 1),
        Range16.init(0x2100, 0x2101, 1),
        Range16.init(0x2103, 0x2106, 1),
        Range16.init(0x2108, 0x2109, 1),
        Range16.init(0x2114, 0x2116, 2),
        Range16.init(0x2117, 0x2118, 1),
        Range16.init(0x211e, 0x2123, 1),
        Range16.init(0x2125, 0x2129, 2),
        Range16.init(0x212e, 0x213a, 12),
        Range16.init(0x213b, 0x2140, 5),
        Range16.init(0x2141, 0x2144, 1),
        Range16.init(0x214a, 0x214d, 1),
        Range16.init(0x214f, 0x218a, 59),
        Range16.init(0x218b, 0x2190, 5),
        Range16.init(0x2191, 0x2307, 1),
        Range16.init(0x230c, 0x2328, 1),
        Range16.init(0x232b, 0x2426, 1),
        Range16.init(0x2440, 0x244a, 1),
        Range16.init(0x249c, 0x24e9, 1),
        Range16.init(0x2500, 0x2767, 1),
        Range16.init(0x2794, 0x27c4, 1),
        Range16.init(0x27c7, 0x27e5, 1),
        Range16.init(0x27f0, 0x2982, 1),
        Range16.init(0x2999, 0x29d7, 1),
        Range16.init(0x29dc, 0x29fb, 1),
        Range16.init(0x29fe, 0x2b73, 1),
        Range16.init(0x2b76, 0x2b95, 1),
        Range16.init(0x2b97, 0x2bff, 1),
        Range16.init(0x2ce5, 0x2cea, 1),
        Range16.init(0x2e50, 0x2e51, 1),
        Range16.init(0x2e80, 0x2e99, 1),
        Range16.init(0x2e9b, 0x2ef3, 1),
        Range16.init(0x2f00, 0x2fd5, 1),
        Range16.init(0x2ff0, 0x2ffb, 1),
        Range16.init(0x3004, 0x3012, 14),
        Range16.init(0x3013, 0x3020, 13),
        Range16.init(0x3036, 0x3037, 1),
        Range16.init(0x303e, 0x303f, 1),
        Range16.init(0x309b, 0x309c, 1),
        Range16.init(0x3190, 0x3191, 1),
        Range16.init(0x3196, 0x319f, 1),
        Range16.init(0x31c0, 0x31e3, 1),
        Range16.init(0x3200, 0x321e, 1),
        Range16.init(0x322a, 0x3247, 1),
        Range16.init(0x3250, 0x3260, 16),
        Range16.init(0x3261, 0x327f, 1),
        Range16.init(0x328a, 0x32b0, 1),
        Range16.init(0x32c0, 0x33ff, 1),
        Range16.init(0x4dc0, 0x4dff, 1),
        Range16.init(0xa490, 0xa4c6, 1),
        Range16.init(0xa700, 0xa716, 1),
        Range16.init(0xa720, 0xa721, 1),
        Range16.init(0xa789, 0xa78a, 1),
        Range16.init(0xa828, 0xa82b, 1),
        Range16.init(0xa836, 0xa839, 1),
        Range16.init(0xaa77, 0xaa79, 1),
        Range16.init(0xab5b, 0xab6a, 15),
        Range16.init(0xab6b, 0xfb29, 20414),
        Range16.init(0xfbb2, 0xfbc1, 1),
        Range16.init(0xfdfc, 0xfdfd, 1),
        Range16.init(0xfe62, 0xfe64, 2),
        Range16.init(0xfe65, 0xfe66, 1),
        Range16.init(0xfe69, 0xff04, 155),
        Range16.init(0xff0b, 0xff1c, 17),
        Range16.init(0xff1d, 0xff1e, 1),
        Range16.init(0xff3e, 0xff40, 2),
        Range16.init(0xff5c, 0xff5e, 2),
        Range16.init(0xffe0, 0xffe6, 1),
        Range16.init(0xffe8, 0xffee, 1),
        Range16.init(0xfffc, 0xfffd, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10137, 0x1013f, 1),
        Range32.init(0x10179, 0x10189, 1),
        Range32.init(0x1018c, 0x1018e, 1),
        Range32.init(0x10190, 0x1019c, 1),
        Range32.init(0x101a0, 0x101d0, 48),
        Range32.init(0x101d1, 0x101fc, 1),
        Range32.init(0x10877, 0x10878, 1),
        Range32.init(0x10ac8, 0x1173f, 3191),
        Range32.init(0x11fd5, 0x11ff1, 1),
        Range32.init(0x16b3c, 0x16b3f, 1),
        Range32.init(0x16b45, 0x1bc9c, 20823),
        Range32.init(0x1d000, 0x1d0f5, 1),
        Range32.init(0x1d100, 0x1d126, 1),
        Range32.init(0x1d129, 0x1d164, 1),
        Range32.init(0x1d16a, 0x1d16c, 1),
        Range32.init(0x1d183, 0x1d184, 1),
        Range32.init(0x1d18c, 0x1d1a9, 1),
        Range32.init(0x1d1ae, 0x1d1e8, 1),
        Range32.init(0x1d200, 0x1d241, 1),
        Range32.init(0x1d245, 0x1d300, 187),
        Range32.init(0x1d301, 0x1d356, 1),
        Range32.init(0x1d6c1, 0x1d6db, 26),
        Range32.init(0x1d6fb, 0x1d715, 26),
        Range32.init(0x1d735, 0x1d74f, 26),
        Range32.init(0x1d76f, 0x1d789, 26),
        Range32.init(0x1d7a9, 0x1d7c3, 26),
        Range32.init(0x1d800, 0x1d9ff, 1),
        Range32.init(0x1da37, 0x1da3a, 1),
        Range32.init(0x1da6d, 0x1da74, 1),
        Range32.init(0x1da76, 0x1da83, 1),
        Range32.init(0x1da85, 0x1da86, 1),
        Range32.init(0x1e14f, 0x1e2ff, 432),
        Range32.init(0x1ecac, 0x1ecb0, 4),
        Range32.init(0x1ed2e, 0x1eef0, 450),
        Range32.init(0x1eef1, 0x1f000, 271),
        Range32.init(0x1f001, 0x1f02b, 1),
        Range32.init(0x1f030, 0x1f093, 1),
        Range32.init(0x1f0a0, 0x1f0ae, 1),
        Range32.init(0x1f0b1, 0x1f0bf, 1),
        Range32.init(0x1f0c1, 0x1f0cf, 1),
        Range32.init(0x1f0d1, 0x1f0f5, 1),
        Range32.init(0x1f10d, 0x1f1ad, 1),
        Range32.init(0x1f1e6, 0x1f202, 1),
        Range32.init(0x1f210, 0x1f23b, 1),
        Range32.init(0x1f240, 0x1f248, 1),
        Range32.init(0x1f250, 0x1f251, 1),
        Range32.init(0x1f260, 0x1f265, 1),
        Range32.init(0x1f300, 0x1f6d7, 1),
        Range32.init(0x1f6e0, 0x1f6ec, 1),
        Range32.init(0x1f6f0, 0x1f6fc, 1),
        Range32.init(0x1f700, 0x1f773, 1),
        Range32.init(0x1f780, 0x1f7d8, 1),
        Range32.init(0x1f7e0, 0x1f7eb, 1),
        Range32.init(0x1f800, 0x1f80b, 1),
        Range32.init(0x1f810, 0x1f847, 1),
        Range32.init(0x1f850, 0x1f859, 1),
        Range32.init(0x1f860, 0x1f887, 1),
        Range32.init(0x1f890, 0x1f8ad, 1),
        Range32.init(0x1f8b0, 0x1f8b1, 1),
        Range32.init(0x1f900, 0x1f978, 1),
        Range32.init(0x1f97a, 0x1f9cb, 1),
        Range32.init(0x1f9cd, 0x1fa53, 1),
        Range32.init(0x1fa60, 0x1fa6d, 1),
        Range32.init(0x1fa70, 0x1fa74, 1),
        Range32.init(0x1fa78, 0x1fa7a, 1),
        Range32.init(0x1fa80, 0x1fa86, 1),
        Range32.init(0x1fa90, 0x1faa8, 1),
        Range32.init(0x1fab0, 0x1fab6, 1),
        Range32.init(0x1fac0, 0x1fac2, 1),
        Range32.init(0x1fad0, 0x1fad6, 1),
        Range32.init(0x1fb00, 0x1fb92, 1),
        Range32.init(0x1fb94, 0x1fbca, 1),
    },
    .latin_offset = 10,
};

pub const Sc = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0024, 0x00a2, 126),
        Range16.init(0x00a3, 0x00a5, 1),
        Range16.init(0x058f, 0x060b, 124),
        Range16.init(0x07fe, 0x07ff, 1),
        Range16.init(0x09f2, 0x09f3, 1),
        Range16.init(0x09fb, 0x0af1, 246),
        Range16.init(0x0bf9, 0x0e3f, 582),
        Range16.init(0x17db, 0x20a0, 2245),
        Range16.init(0x20a1, 0x20bf, 1),
        Range16.init(0xa838, 0xfdfc, 21956),
        Range16.init(0xfe69, 0xff04, 155),
        Range16.init(0xffe0, 0xffe1, 1),
        Range16.init(0xffe5, 0xffe6, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x11fdd, 0x11fe0, 1),
        Range32.init(0x1e2ff, 0x1ecb0, 2481),
    },
    .latin_offset = 2,
};

pub const Sk = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x005e, 0x0060, 2),
        Range16.init(0x00a8, 0x00af, 7),
        Range16.init(0x00b4, 0x00b8, 4),
        Range16.init(0x02c2, 0x02c5, 1),
        Range16.init(0x02d2, 0x02df, 1),
        Range16.init(0x02e5, 0x02eb, 1),
        Range16.init(0x02ed, 0x02ef, 2),
        Range16.init(0x02f0, 0x02ff, 1),
        Range16.init(0x0375, 0x0384, 15),
        Range16.init(0x0385, 0x1fbd, 7224),
        Range16.init(0x1fbf, 0x1fc1, 1),
        Range16.init(0x1fcd, 0x1fcf, 1),
        Range16.init(0x1fdd, 0x1fdf, 1),
        Range16.init(0x1fed, 0x1fef, 1),
        Range16.init(0x1ffd, 0x1ffe, 1),
        Range16.init(0x309b, 0x309c, 1),
        Range16.init(0xa700, 0xa716, 1),
        Range16.init(0xa720, 0xa721, 1),
        Range16.init(0xa789, 0xa78a, 1),
        Range16.init(0xab5b, 0xab6a, 15),
        Range16.init(0xab6b, 0xfbb2, 20551),
        Range16.init(0xfbb3, 0xfbc1, 1),
        Range16.init(0xff3e, 0xff40, 2),
        Range16.init(0xffe3, 0xffe3, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1f3fb, 0x1f3ff, 1),
    },
    .latin_offset = 3,
};

pub const Sm = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x002b, 0x003c, 17),
        Range16.init(0x003d, 0x003e, 1),
        Range16.init(0x007c, 0x007e, 2),
        Range16.init(0x00ac, 0x00b1, 5),
        Range16.init(0x00d7, 0x00f7, 32),
        Range16.init(0x03f6, 0x0606, 528),
        Range16.init(0x0607, 0x0608, 1),
        Range16.init(0x2044, 0x2052, 14),
        Range16.init(0x207a, 0x207c, 1),
        Range16.init(0x208a, 0x208c, 1),
        Range16.init(0x2118, 0x2140, 40),
        Range16.init(0x2141, 0x2144, 1),
        Range16.init(0x214b, 0x2190, 69),
        Range16.init(0x2191, 0x2194, 1),
        Range16.init(0x219a, 0x219b, 1),
        Range16.init(0x21a0, 0x21a6, 3),
        Range16.init(0x21ae, 0x21ce, 32),
        Range16.init(0x21cf, 0x21d2, 3),
        Range16.init(0x21d4, 0x21f4, 32),
        Range16.init(0x21f5, 0x22ff, 1),
        Range16.init(0x2320, 0x2321, 1),
        Range16.init(0x237c, 0x239b, 31),
        Range16.init(0x239c, 0x23b3, 1),
        Range16.init(0x23dc, 0x23e1, 1),
        Range16.init(0x25b7, 0x25c1, 10),
        Range16.init(0x25f8, 0x25ff, 1),
        Range16.init(0x266f, 0x27c0, 337),
        Range16.init(0x27c1, 0x27c4, 1),
        Range16.init(0x27c7, 0x27e5, 1),
        Range16.init(0x27f0, 0x27ff, 1),
        Range16.init(0x2900, 0x2982, 1),
        Range16.init(0x2999, 0x29d7, 1),
        Range16.init(0x29dc, 0x29fb, 1),
        Range16.init(0x29fe, 0x2aff, 1),
        Range16.init(0x2b30, 0x2b44, 1),
        Range16.init(0x2b47, 0x2b4c, 1),
        Range16.init(0xfb29, 0xfe62, 825),
        Range16.init(0xfe64, 0xfe66, 1),
        Range16.init(0xff0b, 0xff1c, 17),
        Range16.init(0xff1d, 0xff1e, 1),
        Range16.init(0xff5c, 0xff5e, 2),
        Range16.init(0xffe2, 0xffe9, 7),
        Range16.init(0xffea, 0xffec, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1d6c1, 0x1d6db, 26),
        Range32.init(0x1d6fb, 0x1d715, 26),
        Range32.init(0x1d735, 0x1d74f, 26),
        Range32.init(0x1d76f, 0x1d789, 26),
        Range32.init(0x1d7a9, 0x1d7c3, 26),
        Range32.init(0x1eef0, 0x1eef1, 1),
    },
    .latin_offset = 5,
};

pub const So = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x00a6, 0x00a9, 3),
        Range16.init(0x00ae, 0x00b0, 2),
        Range16.init(0x0482, 0x058d, 267),
        Range16.init(0x058e, 0x060e, 128),
        Range16.init(0x060f, 0x06de, 207),
        Range16.init(0x06e9, 0x06fd, 20),
        Range16.init(0x06fe, 0x07f6, 248),
        Range16.init(0x09fa, 0x0b70, 374),
        Range16.init(0x0bf3, 0x0bf8, 1),
        Range16.init(0x0bfa, 0x0c7f, 133),
        Range16.init(0x0d4f, 0x0d79, 42),
        Range16.init(0x0f01, 0x0f03, 1),
        Range16.init(0x0f13, 0x0f15, 2),
        Range16.init(0x0f16, 0x0f17, 1),
        Range16.init(0x0f1a, 0x0f1f, 1),
        Range16.init(0x0f34, 0x0f38, 2),
        Range16.init(0x0fbe, 0x0fc5, 1),
        Range16.init(0x0fc7, 0x0fcc, 1),
        Range16.init(0x0fce, 0x0fcf, 1),
        Range16.init(0x0fd5, 0x0fd8, 1),
        Range16.init(0x109e, 0x109f, 1),
        Range16.init(0x1390, 0x1399, 1),
        Range16.init(0x166d, 0x1940, 723),
        Range16.init(0x19de, 0x19ff, 1),
        Range16.init(0x1b61, 0x1b6a, 1),
        Range16.init(0x1b74, 0x1b7c, 1),
        Range16.init(0x2100, 0x2101, 1),
        Range16.init(0x2103, 0x2106, 1),
        Range16.init(0x2108, 0x2109, 1),
        Range16.init(0x2114, 0x2116, 2),
        Range16.init(0x2117, 0x211e, 7),
        Range16.init(0x211f, 0x2123, 1),
        Range16.init(0x2125, 0x2129, 2),
        Range16.init(0x212e, 0x213a, 12),
        Range16.init(0x213b, 0x214a, 15),
        Range16.init(0x214c, 0x214d, 1),
        Range16.init(0x214f, 0x218a, 59),
        Range16.init(0x218b, 0x2195, 10),
        Range16.init(0x2196, 0x2199, 1),
        Range16.init(0x219c, 0x219f, 1),
        Range16.init(0x21a1, 0x21a2, 1),
        Range16.init(0x21a4, 0x21a5, 1),
        Range16.init(0x21a7, 0x21ad, 1),
        Range16.init(0x21af, 0x21cd, 1),
        Range16.init(0x21d0, 0x21d1, 1),
        Range16.init(0x21d3, 0x21d5, 2),
        Range16.init(0x21d6, 0x21f3, 1),
        Range16.init(0x2300, 0x2307, 1),
        Range16.init(0x230c, 0x231f, 1),
        Range16.init(0x2322, 0x2328, 1),
        Range16.init(0x232b, 0x237b, 1),
        Range16.init(0x237d, 0x239a, 1),
        Range16.init(0x23b4, 0x23db, 1),
        Range16.init(0x23e2, 0x2426, 1),
        Range16.init(0x2440, 0x244a, 1),
        Range16.init(0x249c, 0x24e9, 1),
        Range16.init(0x2500, 0x25b6, 1),
        Range16.init(0x25b8, 0x25c0, 1),
        Range16.init(0x25c2, 0x25f7, 1),
        Range16.init(0x2600, 0x266e, 1),
        Range16.init(0x2670, 0x2767, 1),
        Range16.init(0x2794, 0x27bf, 1),
        Range16.init(0x2800, 0x28ff, 1),
        Range16.init(0x2b00, 0x2b2f, 1),
        Range16.init(0x2b45, 0x2b46, 1),
        Range16.init(0x2b4d, 0x2b73, 1),
        Range16.init(0x2b76, 0x2b95, 1),
        Range16.init(0x2b97, 0x2bff, 1),
        Range16.init(0x2ce5, 0x2cea, 1),
        Range16.init(0x2e50, 0x2e51, 1),
        Range16.init(0x2e80, 0x2e99, 1),
        Range16.init(0x2e9b, 0x2ef3, 1),
        Range16.init(0x2f00, 0x2fd5, 1),
        Range16.init(0x2ff0, 0x2ffb, 1),
        Range16.init(0x3004, 0x3012, 14),
        Range16.init(0x3013, 0x3020, 13),
        Range16.init(0x3036, 0x3037, 1),
        Range16.init(0x303e, 0x303f, 1),
        Range16.init(0x3190, 0x3191, 1),
        Range16.init(0x3196, 0x319f, 1),
        Range16.init(0x31c0, 0x31e3, 1),
        Range16.init(0x3200, 0x321e, 1),
        Range16.init(0x322a, 0x3247, 1),
        Range16.init(0x3250, 0x3260, 16),
        Range16.init(0x3261, 0x327f, 1),
        Range16.init(0x328a, 0x32b0, 1),
        Range16.init(0x32c0, 0x33ff, 1),
        Range16.init(0x4dc0, 0x4dff, 1),
        Range16.init(0xa490, 0xa4c6, 1),
        Range16.init(0xa828, 0xa82b, 1),
        Range16.init(0xa836, 0xa837, 1),
        Range16.init(0xa839, 0xaa77, 574),
        Range16.init(0xaa78, 0xaa79, 1),
        Range16.init(0xfdfd, 0xffe4, 487),
        Range16.init(0xffe8, 0xffed, 5),
        Range16.init(0xffee, 0xfffc, 14),
        Range16.init(0xfffd, 0xfffd, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10137, 0x1013f, 1),
        Range32.init(0x10179, 0x10189, 1),
        Range32.init(0x1018c, 0x1018e, 1),
        Range32.init(0x10190, 0x1019c, 1),
        Range32.init(0x101a0, 0x101d0, 48),
        Range32.init(0x101d1, 0x101fc, 1),
        Range32.init(0x10877, 0x10878, 1),
        Range32.init(0x10ac8, 0x1173f, 3191),
        Range32.init(0x11fd5, 0x11fdc, 1),
        Range32.init(0x11fe1, 0x11ff1, 1),
        Range32.init(0x16b3c, 0x16b3f, 1),
        Range32.init(0x16b45, 0x1bc9c, 20823),
        Range32.init(0x1d000, 0x1d0f5, 1),
        Range32.init(0x1d100, 0x1d126, 1),
        Range32.init(0x1d129, 0x1d164, 1),
        Range32.init(0x1d16a, 0x1d16c, 1),
        Range32.init(0x1d183, 0x1d184, 1),
        Range32.init(0x1d18c, 0x1d1a9, 1),
        Range32.init(0x1d1ae, 0x1d1e8, 1),
        Range32.init(0x1d200, 0x1d241, 1),
        Range32.init(0x1d245, 0x1d300, 187),
        Range32.init(0x1d301, 0x1d356, 1),
        Range32.init(0x1d800, 0x1d9ff, 1),
        Range32.init(0x1da37, 0x1da3a, 1),
        Range32.init(0x1da6d, 0x1da74, 1),
        Range32.init(0x1da76, 0x1da83, 1),
        Range32.init(0x1da85, 0x1da86, 1),
        Range32.init(0x1e14f, 0x1ecac, 2909),
        Range32.init(0x1ed2e, 0x1f000, 722),
        Range32.init(0x1f001, 0x1f02b, 1),
        Range32.init(0x1f030, 0x1f093, 1),
        Range32.init(0x1f0a0, 0x1f0ae, 1),
        Range32.init(0x1f0b1, 0x1f0bf, 1),
        Range32.init(0x1f0c1, 0x1f0cf, 1),
        Range32.init(0x1f0d1, 0x1f0f5, 1),
        Range32.init(0x1f10d, 0x1f1ad, 1),
        Range32.init(0x1f1e6, 0x1f202, 1),
        Range32.init(0x1f210, 0x1f23b, 1),
        Range32.init(0x1f240, 0x1f248, 1),
        Range32.init(0x1f250, 0x1f251, 1),
        Range32.init(0x1f260, 0x1f265, 1),
        Range32.init(0x1f300, 0x1f3fa, 1),
        Range32.init(0x1f400, 0x1f6d7, 1),
        Range32.init(0x1f6e0, 0x1f6ec, 1),
        Range32.init(0x1f6f0, 0x1f6fc, 1),
        Range32.init(0x1f700, 0x1f773, 1),
        Range32.init(0x1f780, 0x1f7d8, 1),
        Range32.init(0x1f7e0, 0x1f7eb, 1),
        Range32.init(0x1f800, 0x1f80b, 1),
        Range32.init(0x1f810, 0x1f847, 1),
        Range32.init(0x1f850, 0x1f859, 1),
        Range32.init(0x1f860, 0x1f887, 1),
        Range32.init(0x1f890, 0x1f8ad, 1),
        Range32.init(0x1f8b0, 0x1f8b1, 1),
        Range32.init(0x1f900, 0x1f978, 1),
        Range32.init(0x1f97a, 0x1f9cb, 1),
        Range32.init(0x1f9cd, 0x1fa53, 1),
        Range32.init(0x1fa60, 0x1fa6d, 1),
        Range32.init(0x1fa70, 0x1fa74, 1),
        Range32.init(0x1fa78, 0x1fa7a, 1),
        Range32.init(0x1fa80, 0x1fa86, 1),
        Range32.init(0x1fa90, 0x1faa8, 1),
        Range32.init(0x1fab0, 0x1fab6, 1),
        Range32.init(0x1fac0, 0x1fac2, 1),
        Range32.init(0x1fad0, 0x1fad6, 1),
        Range32.init(0x1fb00, 0x1fb92, 1),
        Range32.init(0x1fb94, 0x1fbca, 1),
    },
    .latin_offset = 2,
};

pub const Z = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0020, 0x00a0, 128),
        Range16.init(0x1680, 0x2000, 2432),
        Range16.init(0x2001, 0x200a, 1),
        Range16.init(0x2028, 0x2029, 1),
        Range16.init(0x202f, 0x205f, 48),
        Range16.init(0x3000, 0x3000, 1),
    },
    .latin_offset = 1,
};

pub const Zl = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x2028, 0x2028, 1),
    },
};

pub const Zp = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x2029, 0x2029, 1),
    },
};

pub const Zs = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0020, 0x00a0, 128),
        Range16.init(0x1680, 0x2000, 2432),
        Range16.init(0x2001, 0x200a, 1),
        Range16.init(0x202f, 0x205f, 48),
        Range16.init(0x3000, 0x3000, 1),
    },
    .latin_offset = 1,
};

//// These variables have type *RangeTable.
//	Cc     = _Cc // Cc is the set of Unicode characters in category Cc (Other, control).
//	Cf     = _Cf // Cf is the set of Unicode characters in category Cf (Other, format).
//	Co     = _Co // Co is the set of Unicode characters in category Co (Other, private use).
//	Cs     = _Cs // Cs is the set of Unicode characters in category Cs (Other, surrogate).
pub const Digit = &Nd; // Digit is the set of Unicode characters with the "decimal digit" property.
//	Nd     = _Nd // Nd is the set of Unicode characters in category Nd (Number, decimal digit).
pub const Letter = &L; // Letter/L is the set of Unicode letters, category L.
//	L      = _L
//	Lm     = _Lm // Lm is the set of Unicode characters in category Lm (Letter, modifier).
//	Lo     = _Lo // Lo is the set of Unicode characters in category Lo (Letter, other).
pub const Lower = &Ll; // Lower is the set of Unicode lower case letters.
//	Ll     = _Ll // Ll is the set of Unicode characters in category Ll (Letter, lowercase).
pub const Mark = &M; // Mark/M is the set of Unicode mark characters, category M.
//	M      = _M
//	Mc     = _Mc // Mc is the set of Unicode characters in category Mc (Mark, spacing combining).
//	Me     = _Me // Me is the set of Unicode characters in category Me (Mark, enclosing).
//	Mn     = _Mn // Mn is the set of Unicode characters in category Mn (Mark, nonspacing).
//	Nl     = _Nl // Nl is the set of Unicode characters in category Nl (Number, letter).
//	No     = _No // No is the set of Unicode characters in category No (Number, other).
pub const Number = &N; // Number/N is the set of Unicode number characters, category N.
//	N      = _N
pub const Other = &C; // Other/C is the set of Unicode control and special characters, category C.
//	C      = _C
//	Pc     = _Pc // Pc is the set of Unicode characters in category Pc (Punctuation, connector).
//	Pd     = _Pd // Pd is the set of Unicode characters in category Pd (Punctuation, dash).
//	Pe     = _Pe // Pe is the set of Unicode characters in category Pe (Punctuation, close).
//	Pf     = _Pf // Pf is the set of Unicode characters in category Pf (Punctuation, final quote).
//	Pi     = _Pi // Pi is the set of Unicode characters in category Pi (Punctuation, initial quote).
//	Po     = _Po // Po is the set of Unicode characters in category Po (Punctuation, other).
//	Ps     = _Ps // Ps is the set of Unicode characters in category Ps (Punctuation, open).
pub const Punct = &P; // Punct/P is the set of Unicode punctuation characters, category P.
//	P      = _P
//	Sc     = _Sc // Sc is the set of Unicode characters in category Sc (Symbol, currency).
//	Sk     = _Sk // Sk is the set of Unicode characters in category Sk (Symbol, modifier).
//	Sm     = _Sm // Sm is the set of Unicode characters in category Sm (Symbol, math).
//	So     = _So // So is the set of Unicode characters in category So (Symbol, other).
pub const Space = &Z; // Space/Z is the set of Unicode space characters, category Z.
//	Z      = _Z
pub const Symbol = &S; // Symbol/S is the set of Unicode symbol characters, category S.
//	S      = _S
pub const Title = &Lt; // Title is the set of Unicode title case letters.
//	Lt     = _Lt // Lt is the set of Unicode characters in category Lt (Letter, titlecase).
pub const Upper = &Lu; // Upper is the set of Unicode upper case letters.
//	Lu     = _Lu // Lu is the set of Unicode characters in category Lu (Letter, uppercase).
//	Zl     = _Zl // Zl is the set of Unicode characters in category Zl (Separator, line).
//	Zp     = _Zp // Zp is the set of Unicode characters in category Zp (Separator, paragraph).
//	Zs     = _Zs // Zs is the set of Unicode characters in category Zs (Separator, space).

// Scripts is the set of Unicode script tables.
pub const scripts = [_]*RangeTable{
    &Adlam, // 	"Adlam":
    &Ahom, // 	"Ahom":
    &Anatolian_Hieroglyphs, // 	"Anatolian_Hieroglyphs":
    &Arabic, // 	"Arabic":
    &Armenian, // 	"Armenian":
    &Avestan, // 	"Avestan":
    &Balinese, // 	"Balinese":
    &Bamum, // 	"Bamum":
    &Bassa_Vah, // 	"Bassa_Vah":
    &Batak, // 	"Batak":
    &Bengali, // 	"Bengali":
    &Bhaiksuki, // 	"Bhaiksuki":
    &Bopomofo, // 	"Bopomofo":
    &Brahmi, // 	"Brahmi":
    &Braille, // 	"Braille":
    &Buginese, // 	"Buginese":
    &Buhid, // 	"Buhid":
    &Canadian_Aboriginal, // 	"Canadian_Aboriginal":
    &Carian, // 	"Carian":
    &Caucasian_Albanian, // 	"Caucasian_Albanian":
    &Chakma, // 	"Chakma":
    &Cham, // 	"Cham":
    &Cherokee, // 	"Cherokee":
    &Chorasmian, // 	"Chorasmian":
    &Common, // 	"Common":
    &Coptic, // 	"Coptic":
    &Cuneiform, // 	"Cuneiform":
    &Cypriot, // 	"Cypriot":
    &Cyrillic, // 	"Cyrillic":
    &Deseret, // 	"Deseret":
    &Devanagari, // 	"Devanagari":
    &Dives_Akuru, // 	"Dives_Akuru":
    &Dogra, // 	"Dogra":
    &Duployan, // 	"Duployan":
    &Egyptian_Hieroglyphs, // 	"Egyptian_Hieroglyphs":
    &Elbasan, // 	"Elbasan":
    &Elymaic, // 	"Elymaic":
    &Ethiopic, // 	"Ethiopic":
    &Georgian, // 	"Georgian":
    &Glagolitic, // 	"Glagolitic":
    &Gothic, // 	"Gothic":
    &Grantha, // 	"Grantha":
    &Greek, // 	"Greek":
    &Gujarati, // 	"Gujarati":
    &Gunjala_Gondi, // 	"Gunjala_Gondi":
    &Gurmukhi, // 	"Gurmukhi":
    &Han, // 	"Han":
    &Hangul, // 	"Hangul":
    &Hanifi_Rohingya, // 	"Hanifi_Rohingya":
    &Hanunoo, // 	"Hanunoo":
    &Hatran, // 	"Hatran":
    &Hebrew, // 	"Hebrew":
    &Hiragana, // 	"Hiragana":
    &Imperial_Aramaic, // 	"Imperial_Aramaic":
    &Inherited, // 	"Inherited":
    &Inscriptional_Pahlavi, // 	"Inscriptional_Pahlavi":
    &Inscriptional_Parthian, // 	"Inscriptional_Parthian":
    &Javanese, // 	"Javanese":
    &Kaithi, // 	"Kaithi":
    &Kannada, // 	"Kannada":
    &Katakana, // 	"Katakana":
    &Kayah_Li, // 	"Kayah_Li":
    &Kharoshthi, // 	"Kharoshthi":
    &Khitan_Small_Script, // 	"Khitan_Small_Script":
    &Khmer, // 	"Khmer":
    &Khojki, // 	"Khojki":
    &Khudawadi, // 	"Khudawadi":
    &Lao, // 	"Lao":
    &Latin, // 	"Latin":
    &Lepcha, // 	"Lepcha":
    &Limbu, // 	"Limbu":
    &Linear_A, // 	"Linear_A":
    &Linear_B, // 	"Linear_B":
    &Lisu, // 	"Lisu":
    &Lycian, // 	"Lycian":
    &Lydian, // 	"Lydian":
    &Mahajani, // 	"Mahajani":
    &Makasar, // 	"Makasar":
    &Malayalam, // 	"Malayalam":
    &Mandaic, // 	"Mandaic":
    &Manichaean, // 	"Manichaean":
    &Marchen, // 	"Marchen":
    &Masaram_Gondi, // 	"Masaram_Gondi":
    &Medefaidrin, // 	"Medefaidrin":
    &Meetei_Mayek, // 	"Meetei_Mayek":
    &Mende_Kikakui, // 	"Mende_Kikakui":
    &Meroitic_Cursive, // 	"Meroitic_Cursive":
    &Meroitic_Hieroglyphs, // 	"Meroitic_Hieroglyphs":
    &Miao, // 	"Miao":
    &Modi, // 	"Modi":
    &Mongolian, // 	"Mongolian":
    &Mro, // 	"Mro":
    &Multani, // 	"Multani":
    &Myanmar, // 	"Myanmar":
    &Nabataean, // 	"Nabataean":
    &Nandinagari, // 	"Nandinagari":
    &New_Tai_Lue, // 	"New_Tai_Lue":
    &Newa, // 	"Newa":
    &Nko, // 	"Nko":
    &Nushu, // 	"Nushu":
    &Nyiakeng_Puachue_Hmong, // 	"Nyiakeng_Puachue_Hmong":
    &Ogham, // 	"Ogham":
    &Ol_Chiki, // 	"Ol_Chiki":
    &Old_Hungarian, // 	"Old_Hungarian":
    &Old_Italic, // 	"Old_Italic":
    &Old_North_Arabian, // 	"Old_North_Arabian":
    &Old_Permic, // 	"Old_Permic":
    &Old_Persian, // 	"Old_Persian":
    &Old_Sogdian, // 	"Old_Sogdian":
    &Old_South_Arabian, // 	"Old_South_Arabian":
    &Old_Turkic, // 	"Old_Turkic":
    &Oriya, // 	"Oriya":
    &Osage, // 	"Osage":
    &Osmanya, // 	"Osmanya":
    &Pahawh_Hmong, // 	"Pahawh_Hmong":
    &Palmyrene, // 	"Palmyrene":
    &Pau_Cin_Hau, // 	"Pau_Cin_Hau":
    &Phags_Pa, // 	"Phags_Pa":
    &Phoenician, // 	"Phoenician":
    &Psalter_Pahlavi, // 	"Psalter_Pahlavi":
    &Rejang, // 	"Rejang":
    &Runic, // 	"Runic":
    &Samaritan, // 	"Samaritan":
    &Saurashtra, // 	"Saurashtra":
    &Sharada, // 	"Sharada":
    &Shavian, // 	"Shavian":
    &Siddham, // 	"Siddham":
    &SignWriting, // 	"SignWriting":
    &Sinhala, // 	"Sinhala":
    &Sogdian, // 	"Sogdian":
    &Sora_Sompeng, // 	"Sora_Sompeng":
    &Soyombo, // 	"Soyombo":
    &Sundanese, // 	"Sundanese":
    &Syloti_Nagri, // 	"Syloti_Nagri":
    &Syriac, // 	"Syriac":
    &Tagalog, // 	"Tagalog":
    &Tagbanwa, // 	"Tagbanwa":
    &Tai_Le, // 	"Tai_Le":
    &Tai_Tham, // 	"Tai_Tham":
    &Tai_Viet, // 	"Tai_Viet":
    &Takri, // 	"Takri":
    &Tamil, // 	"Tamil":
    &Tangut, // 	"Tangut":
    &Telugu, // 	"Telugu":
    &Thaana, // 	"Thaana":
    &Thai, // 	"Thai":
    &Tibetan, // 	"Tibetan":
    &Tifinagh, // 	"Tifinagh":
    &Tirhuta, // 	"Tirhuta":
    &Ugaritic, // 	"Ugaritic":
    &Vai, // 	"Vai":
    &Wancho, // 	"Wancho":
    &Warang_Citi, // 	"Warang_Citi":
    &Yezidi, // 	"Yezidi":
    &Yi, // 	"Yi":
    &Zanabazar_Square, // 	"Zanabazar_Square":
};

pub const Adlam = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x1e900, 0x1e94b, 1),
        Range32.init(0x1e950, 0x1e959, 1),
        Range32.init(0x1e95e, 0x1e95f, 1),
    },
};

pub const Ahom = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11700, 0x1171a, 1),
        Range32.init(0x1171d, 0x1172b, 1),
        Range32.init(0x11730, 0x1173f, 1),
    },
};

pub const Anatolian_Hieroglyphs = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x14400, 0x14646, 1),
    },
};

pub const Arabic = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0600, 0x0604, 1),
        Range16.init(0x0606, 0x060b, 1),
        Range16.init(0x060d, 0x061a, 1),
        Range16.init(0x061c, 0x0620, 2),
        Range16.init(0x0621, 0x063f, 1),
        Range16.init(0x0641, 0x064a, 1),
        Range16.init(0x0656, 0x066f, 1),
        Range16.init(0x0671, 0x06dc, 1),
        Range16.init(0x06de, 0x06ff, 1),
        Range16.init(0x0750, 0x077f, 1),
        Range16.init(0x08a0, 0x08b4, 1),
        Range16.init(0x08b6, 0x08c7, 1),
        Range16.init(0x08d3, 0x08e1, 1),
        Range16.init(0x08e3, 0x08ff, 1),
        Range16.init(0xfb50, 0xfbc1, 1),
        Range16.init(0xfbd3, 0xfd3d, 1),
        Range16.init(0xfd50, 0xfd8f, 1),
        Range16.init(0xfd92, 0xfdc7, 1),
        Range16.init(0xfdf0, 0xfdfd, 1),
        Range16.init(0xfe70, 0xfe74, 1),
        Range16.init(0xfe76, 0xfefc, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10e60, 0x10e7e, 1),
        Range32.init(0x1ee00, 0x1ee03, 1),
        Range32.init(0x1ee05, 0x1ee1f, 1),
        Range32.init(0x1ee21, 0x1ee22, 1),
        Range32.init(0x1ee24, 0x1ee27, 3),
        Range32.init(0x1ee29, 0x1ee32, 1),
        Range32.init(0x1ee34, 0x1ee37, 1),
        Range32.init(0x1ee39, 0x1ee3b, 2),
        Range32.init(0x1ee42, 0x1ee47, 5),
        Range32.init(0x1ee49, 0x1ee4d, 2),
        Range32.init(0x1ee4e, 0x1ee4f, 1),
        Range32.init(0x1ee51, 0x1ee52, 1),
        Range32.init(0x1ee54, 0x1ee57, 3),
        Range32.init(0x1ee59, 0x1ee61, 2),
        Range32.init(0x1ee62, 0x1ee64, 2),
        Range32.init(0x1ee67, 0x1ee6a, 1),
        Range32.init(0x1ee6c, 0x1ee72, 1),
        Range32.init(0x1ee74, 0x1ee77, 1),
        Range32.init(0x1ee79, 0x1ee7c, 1),
        Range32.init(0x1ee7e, 0x1ee80, 2),
        Range32.init(0x1ee81, 0x1ee89, 1),
        Range32.init(0x1ee8b, 0x1ee9b, 1),
        Range32.init(0x1eea1, 0x1eea3, 1),
        Range32.init(0x1eea5, 0x1eea9, 1),
        Range32.init(0x1eeab, 0x1eebb, 1),
        Range32.init(0x1eef0, 0x1eef1, 1),
    },
};

pub const Armenian = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0531, 0x0556, 1),
        Range16.init(0x0559, 0x058a, 1),
        Range16.init(0x058d, 0x058f, 1),
        Range16.init(0xfb13, 0xfb17, 1),
    },
};

pub const Avestan = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10b00, 0x10b35, 1),
        Range32.init(0x10b39, 0x10b3f, 1),
    },
};

pub const Balinese = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1b00, 0x1b4b, 1),
        Range16.init(0x1b50, 0x1b7c, 1),
    },
};

pub const Bamum = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xa6a0, 0xa6f7, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x16800, 0x16a38, 1),
    },
};

pub const Bassa_Vah = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x16ad0, 0x16aed, 1),
        Range32.init(0x16af0, 0x16af5, 1),
    },
};

pub const Batak = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1bc0, 0x1bf3, 1),
        Range16.init(0x1bfc, 0x1bff, 1),
    },
};

pub const Bengali = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0980, 0x0983, 1),
        Range16.init(0x0985, 0x098c, 1),
        Range16.init(0x098f, 0x0990, 1),
        Range16.init(0x0993, 0x09a8, 1),
        Range16.init(0x09aa, 0x09b0, 1),
        Range16.init(0x09b2, 0x09b6, 4),
        Range16.init(0x09b7, 0x09b9, 1),
        Range16.init(0x09bc, 0x09c4, 1),
        Range16.init(0x09c7, 0x09c8, 1),
        Range16.init(0x09cb, 0x09ce, 1),
        Range16.init(0x09d7, 0x09dc, 5),
        Range16.init(0x09dd, 0x09df, 2),
        Range16.init(0x09e0, 0x09e3, 1),
        Range16.init(0x09e6, 0x09fe, 1),
    },
};

pub const Bhaiksuki = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11c00, 0x11c08, 1),
        Range32.init(0x11c0a, 0x11c36, 1),
        Range32.init(0x11c38, 0x11c45, 1),
        Range32.init(0x11c50, 0x11c6c, 1),
    },
};

pub const Bopomofo = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x02ea, 0x02eb, 1),
        Range16.init(0x3105, 0x312f, 1),
        Range16.init(0x31a0, 0x31bf, 1),
    },
};

pub const Brahmi = RangeTable{
    .r16 = &[_]Range16{},
    .r32 = &[_]Range32{
        Range32.init(0x11000, 0x1104d, 1),
        Range32.init(0x11052, 0x1106f, 1),
        Range32.init(0x1107f, 0x1107f, 1),
    },
};

pub const Braille = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x2800, 0x28ff, 1),
    },
};

pub const Buginese = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1a00, 0x1a1b, 1),
        Range16.init(0x1a1e, 0x1a1f, 1),
    },
};

pub const Buhid = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1740, 0x1753, 1),
    },
};

pub const Canadian_Aboriginal = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1400, 0x167f, 1),
        Range16.init(0x18b0, 0x18f5, 1),
    },
};

pub const Carian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x102a0, 0x102d0, 1),
    },
};

pub const Caucasian_Albanian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10530, 0x10563, 1),
        Range32.init(0x1056f, 0x1056f, 1),
    },
};

pub const Chakma = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11100, 0x11134, 1),
        Range32.init(0x11136, 0x11147, 1),
    },
};

pub const Cham = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xaa00, 0xaa36, 1),
        Range16.init(0xaa40, 0xaa4d, 1),
        Range16.init(0xaa50, 0xaa59, 1),
        Range16.init(0xaa5c, 0xaa5f, 1),
    },
};

pub const Cherokee = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x13a0, 0x13f5, 1),
        Range16.init(0x13f8, 0x13fd, 1),
        Range16.init(0xab70, 0xabbf, 1),
    },
};

pub const Chorasmian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10fb0, 0x10fcb, 1),
    },
};

pub const Common = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0000, 0x0040, 1),
        Range16.init(0x005b, 0x0060, 1),
        Range16.init(0x007b, 0x00a9, 1),
        Range16.init(0x00ab, 0x00b9, 1),
        Range16.init(0x00bb, 0x00bf, 1),
        Range16.init(0x00d7, 0x00f7, 32),
        Range16.init(0x02b9, 0x02df, 1),
        Range16.init(0x02e5, 0x02e9, 1),
        Range16.init(0x02ec, 0x02ff, 1),
        Range16.init(0x0374, 0x037e, 10),
        Range16.init(0x0385, 0x0387, 2),
        Range16.init(0x0605, 0x060c, 7),
        Range16.init(0x061b, 0x061f, 4),
        Range16.init(0x0640, 0x06dd, 157),
        Range16.init(0x08e2, 0x0964, 130),
        Range16.init(0x0965, 0x0e3f, 1242),
        Range16.init(0x0fd5, 0x0fd8, 1),
        Range16.init(0x10fb, 0x16eb, 1520),
        Range16.init(0x16ec, 0x16ed, 1),
        Range16.init(0x1735, 0x1736, 1),
        Range16.init(0x1802, 0x1803, 1),
        Range16.init(0x1805, 0x1cd3, 1230),
        Range16.init(0x1ce1, 0x1ce9, 8),
        Range16.init(0x1cea, 0x1cec, 1),
        Range16.init(0x1cee, 0x1cf3, 1),
        Range16.init(0x1cf5, 0x1cf7, 1),
        Range16.init(0x1cfa, 0x2000, 774),
        Range16.init(0x2001, 0x200b, 1),
        Range16.init(0x200e, 0x2064, 1),
        Range16.init(0x2066, 0x2070, 1),
        Range16.init(0x2074, 0x207e, 1),
        Range16.init(0x2080, 0x208e, 1),
        Range16.init(0x20a0, 0x20bf, 1),
        Range16.init(0x2100, 0x2125, 1),
        Range16.init(0x2127, 0x2129, 1),
        Range16.init(0x212c, 0x2131, 1),
        Range16.init(0x2133, 0x214d, 1),
        Range16.init(0x214f, 0x215f, 1),
        Range16.init(0x2189, 0x218b, 1),
        Range16.init(0x2190, 0x2426, 1),
        Range16.init(0x2440, 0x244a, 1),
        Range16.init(0x2460, 0x27ff, 1),
        Range16.init(0x2900, 0x2b73, 1),
        Range16.init(0x2b76, 0x2b95, 1),
        Range16.init(0x2b97, 0x2bff, 1),
        Range16.init(0x2e00, 0x2e52, 1),
        Range16.init(0x2ff0, 0x2ffb, 1),
        Range16.init(0x3000, 0x3004, 1),
        Range16.init(0x3006, 0x3008, 2),
        Range16.init(0x3009, 0x3020, 1),
        Range16.init(0x3030, 0x3037, 1),
        Range16.init(0x303c, 0x303f, 1),
        Range16.init(0x309b, 0x309c, 1),
        Range16.init(0x30a0, 0x30fb, 91),
        Range16.init(0x30fc, 0x3190, 148),
        Range16.init(0x3191, 0x319f, 1),
        Range16.init(0x31c0, 0x31e3, 1),
        Range16.init(0x3220, 0x325f, 1),
        Range16.init(0x327f, 0x32cf, 1),
        Range16.init(0x32ff, 0x3358, 89),
        Range16.init(0x3359, 0x33ff, 1),
        Range16.init(0x4dc0, 0x4dff, 1),
        Range16.init(0xa700, 0xa721, 1),
        Range16.init(0xa788, 0xa78a, 1),
        Range16.init(0xa830, 0xa839, 1),
        Range16.init(0xa92e, 0xa9cf, 161),
        Range16.init(0xab5b, 0xab6a, 15),
        Range16.init(0xab6b, 0xfd3e, 20947),
        Range16.init(0xfd3f, 0xfe10, 209),
        Range16.init(0xfe11, 0xfe19, 1),
        Range16.init(0xfe30, 0xfe52, 1),
        Range16.init(0xfe54, 0xfe66, 1),
        Range16.init(0xfe68, 0xfe6b, 1),
        Range16.init(0xfeff, 0xff01, 2),
        Range16.init(0xff02, 0xff20, 1),
        Range16.init(0xff3b, 0xff40, 1),
        Range16.init(0xff5b, 0xff65, 1),
        Range16.init(0xff70, 0xff9e, 46),
        Range16.init(0xff9f, 0xffe0, 65),
        Range16.init(0xffe1, 0xffe6, 1),
        Range16.init(0xffe8, 0xffee, 1),
        Range16.init(0xfff9, 0xfffd, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10100, 0x10102, 1),
        Range32.init(0x10107, 0x10133, 1),
        Range32.init(0x10137, 0x1013f, 1),
        Range32.init(0x10190, 0x1019c, 1),
        Range32.init(0x101d0, 0x101fc, 1),
        Range32.init(0x102e1, 0x102fb, 1),
        Range32.init(0x16fe2, 0x16fe3, 1),
        Range32.init(0x1bca0, 0x1bca3, 1),
        Range32.init(0x1d000, 0x1d0f5, 1),
        Range32.init(0x1d100, 0x1d126, 1),
        Range32.init(0x1d129, 0x1d166, 1),
        Range32.init(0x1d16a, 0x1d17a, 1),
        Range32.init(0x1d183, 0x1d184, 1),
        Range32.init(0x1d18c, 0x1d1a9, 1),
        Range32.init(0x1d1ae, 0x1d1e8, 1),
        Range32.init(0x1d2e0, 0x1d2f3, 1),
        Range32.init(0x1d300, 0x1d356, 1),
        Range32.init(0x1d360, 0x1d378, 1),
        Range32.init(0x1d400, 0x1d454, 1),
        Range32.init(0x1d456, 0x1d49c, 1),
        Range32.init(0x1d49e, 0x1d49f, 1),
        Range32.init(0x1d4a2, 0x1d4a5, 3),
        Range32.init(0x1d4a6, 0x1d4a9, 3),
        Range32.init(0x1d4aa, 0x1d4ac, 1),
        Range32.init(0x1d4ae, 0x1d4b9, 1),
        Range32.init(0x1d4bb, 0x1d4bd, 2),
        Range32.init(0x1d4be, 0x1d4c3, 1),
        Range32.init(0x1d4c5, 0x1d505, 1),
        Range32.init(0x1d507, 0x1d50a, 1),
        Range32.init(0x1d50d, 0x1d514, 1),
        Range32.init(0x1d516, 0x1d51c, 1),
        Range32.init(0x1d51e, 0x1d539, 1),
        Range32.init(0x1d53b, 0x1d53e, 1),
        Range32.init(0x1d540, 0x1d544, 1),
        Range32.init(0x1d546, 0x1d54a, 4),
        Range32.init(0x1d54b, 0x1d550, 1),
        Range32.init(0x1d552, 0x1d6a5, 1),
        Range32.init(0x1d6a8, 0x1d7cb, 1),
        Range32.init(0x1d7ce, 0x1d7ff, 1),
        Range32.init(0x1ec71, 0x1ecb4, 1),
        Range32.init(0x1ed01, 0x1ed3d, 1),
        Range32.init(0x1f000, 0x1f02b, 1),
        Range32.init(0x1f030, 0x1f093, 1),
        Range32.init(0x1f0a0, 0x1f0ae, 1),
        Range32.init(0x1f0b1, 0x1f0bf, 1),
        Range32.init(0x1f0c1, 0x1f0cf, 1),
        Range32.init(0x1f0d1, 0x1f0f5, 1),
        Range32.init(0x1f100, 0x1f1ad, 1),
        Range32.init(0x1f1e6, 0x1f1ff, 1),
        Range32.init(0x1f201, 0x1f202, 1),
        Range32.init(0x1f210, 0x1f23b, 1),
        Range32.init(0x1f240, 0x1f248, 1),
        Range32.init(0x1f250, 0x1f251, 1),
        Range32.init(0x1f260, 0x1f265, 1),
        Range32.init(0x1f300, 0x1f6d7, 1),
        Range32.init(0x1f6e0, 0x1f6ec, 1),
        Range32.init(0x1f6f0, 0x1f6fc, 1),
        Range32.init(0x1f700, 0x1f773, 1),
        Range32.init(0x1f780, 0x1f7d8, 1),
        Range32.init(0x1f7e0, 0x1f7eb, 1),
        Range32.init(0x1f800, 0x1f80b, 1),
        Range32.init(0x1f810, 0x1f847, 1),
        Range32.init(0x1f850, 0x1f859, 1),
        Range32.init(0x1f860, 0x1f887, 1),
        Range32.init(0x1f890, 0x1f8ad, 1),
        Range32.init(0x1f8b0, 0x1f8b1, 1),
        Range32.init(0x1f900, 0x1f978, 1),
        Range32.init(0x1f97a, 0x1f9cb, 1),
        Range32.init(0x1f9cd, 0x1fa53, 1),
        Range32.init(0x1fa60, 0x1fa6d, 1),
        Range32.init(0x1fa70, 0x1fa74, 1),
        Range32.init(0x1fa78, 0x1fa7a, 1),
        Range32.init(0x1fa80, 0x1fa86, 1),
        Range32.init(0x1fa90, 0x1faa8, 1),
        Range32.init(0x1fab0, 0x1fab6, 1),
        Range32.init(0x1fac0, 0x1fac2, 1),
        Range32.init(0x1fad0, 0x1fad6, 1),
        Range32.init(0x1fb00, 0x1fb92, 1),
        Range32.init(0x1fb94, 0x1fbca, 1),
        Range32.init(0x1fbf0, 0x1fbf9, 1),
        Range32.init(0xe0001, 0xe0020, 31),
        Range32.init(0xe0021, 0xe007f, 1),
    },
    .latin_offset = 6,
};

pub const Coptic = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x03e2, 0x03ef, 1),
        Range16.init(0x2c80, 0x2cf3, 1),
        Range16.init(0x2cf9, 0x2cff, 1),
    },
};

pub const Cuneiform = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x12000, 0x12399, 1),
        Range32.init(0x12400, 0x1246e, 1),
        Range32.init(0x12470, 0x12474, 1),
        Range32.init(0x12480, 0x12543, 1),
    },
};

pub const Cypriot = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10800, 0x10805, 1),
        Range32.init(0x10808, 0x1080a, 2),
        Range32.init(0x1080b, 0x10835, 1),
        Range32.init(0x10837, 0x10838, 1),
        Range32.init(0x1083c, 0x1083f, 3),
    },
};

pub const Cyrillic = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0400, 0x0484, 1),
        Range16.init(0x0487, 0x052f, 1),
        Range16.init(0x1c80, 0x1c88, 1),
        Range16.init(0x1d2b, 0x1d78, 77),
        Range16.init(0x2de0, 0x2dff, 1),
        Range16.init(0xa640, 0xa69f, 1),
        Range16.init(0xfe2e, 0xfe2f, 1),
    },
};

pub const Deseret = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10400, 0x1044f, 1),
    },
};

pub const Devanagari = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0900, 0x0950, 1),
        Range16.init(0x0955, 0x0963, 1),
        Range16.init(0x0966, 0x097f, 1),
        Range16.init(0xa8e0, 0xa8ff, 1),
    },
};

pub const Dives_Akuru = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11900, 0x11906, 1),
        Range32.init(0x11909, 0x1190c, 3),
        Range32.init(0x1190d, 0x11913, 1),
        Range32.init(0x11915, 0x11916, 1),
        Range32.init(0x11918, 0x11935, 1),
        Range32.init(0x11937, 0x11938, 1),
        Range32.init(0x1193b, 0x11946, 1),
        Range32.init(0x11950, 0x11959, 1),
    },
};

pub const Dogra = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11800, 0x1183b, 1),
    },
};

pub const Duployan = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x1bc00, 0x1bc6a, 1),
        Range32.init(0x1bc70, 0x1bc7c, 1),
        Range32.init(0x1bc80, 0x1bc88, 1),
        Range32.init(0x1bc90, 0x1bc99, 1),
        Range32.init(0x1bc9c, 0x1bc9f, 1),
    },
};

pub const Egyptian_Hieroglyphs = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x13000, 0x1342e, 1),
        Range32.init(0x13430, 0x13438, 1),
    },
};

pub const Elbasan = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10500, 0x10527, 1),
    },
};

pub const Elymaic = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10fe0, 0x10ff6, 1),
    },
};

pub const Ethiopic = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1200, 0x1248, 1),
        Range16.init(0x124a, 0x124d, 1),
        Range16.init(0x1250, 0x1256, 1),
        Range16.init(0x1258, 0x125a, 2),
        Range16.init(0x125b, 0x125d, 1),
        Range16.init(0x1260, 0x1288, 1),
        Range16.init(0x128a, 0x128d, 1),
        Range16.init(0x1290, 0x12b0, 1),
        Range16.init(0x12b2, 0x12b5, 1),
        Range16.init(0x12b8, 0x12be, 1),
        Range16.init(0x12c0, 0x12c2, 2),
        Range16.init(0x12c3, 0x12c5, 1),
        Range16.init(0x12c8, 0x12d6, 1),
        Range16.init(0x12d8, 0x1310, 1),
        Range16.init(0x1312, 0x1315, 1),
        Range16.init(0x1318, 0x135a, 1),
        Range16.init(0x135d, 0x137c, 1),
        Range16.init(0x1380, 0x1399, 1),
        Range16.init(0x2d80, 0x2d96, 1),
        Range16.init(0x2da0, 0x2da6, 1),
        Range16.init(0x2da8, 0x2dae, 1),
        Range16.init(0x2db0, 0x2db6, 1),
        Range16.init(0x2db8, 0x2dbe, 1),
        Range16.init(0x2dc0, 0x2dc6, 1),
        Range16.init(0x2dc8, 0x2dce, 1),
        Range16.init(0x2dd0, 0x2dd6, 1),
        Range16.init(0x2dd8, 0x2dde, 1),
        Range16.init(0xab01, 0xab06, 1),
        Range16.init(0xab09, 0xab0e, 1),
        Range16.init(0xab11, 0xab16, 1),
        Range16.init(0xab20, 0xab26, 1),
        Range16.init(0xab28, 0xab2e, 1),
    },
};

pub const Georgian = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x10a0, 0x10c5, 1),
        Range16.init(0x10c7, 0x10cd, 6),
        Range16.init(0x10d0, 0x10fa, 1),
        Range16.init(0x10fc, 0x10ff, 1),
        Range16.init(0x1c90, 0x1cba, 1),
        Range16.init(0x1cbd, 0x1cbf, 1),
        Range16.init(0x2d00, 0x2d25, 1),
        Range16.init(0x2d27, 0x2d2d, 6),
    },
};

pub const Glagolitic = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x2c00, 0x2c2e, 1),
        Range16.init(0x2c30, 0x2c5e, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1e000, 0x1e006, 1),
        Range32.init(0x1e008, 0x1e018, 1),
        Range32.init(0x1e01b, 0x1e021, 1),
        Range32.init(0x1e023, 0x1e024, 1),
        Range32.init(0x1e026, 0x1e02a, 1),
    },
};

pub const Gothic = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10330, 0x1034a, 1),
    },
};

pub const Grantha = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11300, 0x11303, 1),
        Range32.init(0x11305, 0x1130c, 1),
        Range32.init(0x1130f, 0x11310, 1),
        Range32.init(0x11313, 0x11328, 1),
        Range32.init(0x1132a, 0x11330, 1),
        Range32.init(0x11332, 0x11333, 1),
        Range32.init(0x11335, 0x11339, 1),
        Range32.init(0x1133c, 0x11344, 1),
        Range32.init(0x11347, 0x11348, 1),
        Range32.init(0x1134b, 0x1134d, 1),
        Range32.init(0x11350, 0x11357, 7),
        Range32.init(0x1135d, 0x11363, 1),
        Range32.init(0x11366, 0x1136c, 1),
        Range32.init(0x11370, 0x11374, 1),
    },
};

pub const Greek = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0370, 0x0373, 1),
        Range16.init(0x0375, 0x0377, 1),
        Range16.init(0x037a, 0x037d, 1),
        Range16.init(0x037f, 0x0384, 5),
        Range16.init(0x0386, 0x0388, 2),
        Range16.init(0x0389, 0x038a, 1),
        Range16.init(0x038c, 0x038e, 2),
        Range16.init(0x038f, 0x03a1, 1),
        Range16.init(0x03a3, 0x03e1, 1),
        Range16.init(0x03f0, 0x03ff, 1),
        Range16.init(0x1d26, 0x1d2a, 1),
        Range16.init(0x1d5d, 0x1d61, 1),
        Range16.init(0x1d66, 0x1d6a, 1),
        Range16.init(0x1dbf, 0x1f00, 321),
        Range16.init(0x1f01, 0x1f15, 1),
        Range16.init(0x1f18, 0x1f1d, 1),
        Range16.init(0x1f20, 0x1f45, 1),
        Range16.init(0x1f48, 0x1f4d, 1),
        Range16.init(0x1f50, 0x1f57, 1),
        Range16.init(0x1f59, 0x1f5f, 2),
        Range16.init(0x1f60, 0x1f7d, 1),
        Range16.init(0x1f80, 0x1fb4, 1),
        Range16.init(0x1fb6, 0x1fc4, 1),
        Range16.init(0x1fc6, 0x1fd3, 1),
        Range16.init(0x1fd6, 0x1fdb, 1),
        Range16.init(0x1fdd, 0x1fef, 1),
        Range16.init(0x1ff2, 0x1ff4, 1),
        Range16.init(0x1ff6, 0x1ffe, 1),
        Range16.init(0x2126, 0xab65, 35391),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10140, 0x1018e, 1),
        Range32.init(0x101a0, 0x1d200, 53344),
        Range32.init(0x1d201, 0x1d245, 1),
    },
};

pub const Gujarati = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0a81, 0x0a83, 1),
        Range16.init(0x0a85, 0x0a8d, 1),
        Range16.init(0x0a8f, 0x0a91, 1),
        Range16.init(0x0a93, 0x0aa8, 1),
        Range16.init(0x0aaa, 0x0ab0, 1),
        Range16.init(0x0ab2, 0x0ab3, 1),
        Range16.init(0x0ab5, 0x0ab9, 1),
        Range16.init(0x0abc, 0x0ac5, 1),
        Range16.init(0x0ac7, 0x0ac9, 1),
        Range16.init(0x0acb, 0x0acd, 1),
        Range16.init(0x0ad0, 0x0ae0, 16),
        Range16.init(0x0ae1, 0x0ae3, 1),
        Range16.init(0x0ae6, 0x0af1, 1),
        Range16.init(0x0af9, 0x0aff, 1),
    },
};

pub const Gunjala_Gondi = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11d60, 0x11d65, 1),
        Range32.init(0x11d67, 0x11d68, 1),
        Range32.init(0x11d6a, 0x11d8e, 1),
        Range32.init(0x11d90, 0x11d91, 1),
        Range32.init(0x11d93, 0x11d98, 1),
        Range32.init(0x11da0, 0x11da9, 1),
    },
};

pub const Gurmukhi = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0a01, 0x0a03, 1),
        Range16.init(0x0a05, 0x0a0a, 1),
        Range16.init(0x0a0f, 0x0a10, 1),
        Range16.init(0x0a13, 0x0a28, 1),
        Range16.init(0x0a2a, 0x0a30, 1),
        Range16.init(0x0a32, 0x0a33, 1),
        Range16.init(0x0a35, 0x0a36, 1),
        Range16.init(0x0a38, 0x0a39, 1),
        Range16.init(0x0a3c, 0x0a3e, 2),
        Range16.init(0x0a3f, 0x0a42, 1),
        Range16.init(0x0a47, 0x0a48, 1),
        Range16.init(0x0a4b, 0x0a4d, 1),
        Range16.init(0x0a51, 0x0a59, 8),
        Range16.init(0x0a5a, 0x0a5c, 1),
        Range16.init(0x0a5e, 0x0a66, 8),
        Range16.init(0x0a67, 0x0a76, 1),
    },
};

pub const Han = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x2e80, 0x2e99, 1),
        Range16.init(0x2e9b, 0x2ef3, 1),
        Range16.init(0x2f00, 0x2fd5, 1),
        Range16.init(0x3005, 0x3007, 2),
        Range16.init(0x3021, 0x3029, 1),
        Range16.init(0x3038, 0x303b, 1),
        Range16.init(0x3400, 0x4dbf, 1),
        Range16.init(0x4e00, 0x9ffc, 1),
        Range16.init(0xf900, 0xfa6d, 1),
        Range16.init(0xfa70, 0xfad9, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x16ff0, 0x16ff1, 1),
        Range32.init(0x20000, 0x2a6dd, 1),
        Range32.init(0x2a700, 0x2b734, 1),
        Range32.init(0x2b740, 0x2b81d, 1),
        Range32.init(0x2b820, 0x2cea1, 1),
        Range32.init(0x2ceb0, 0x2ebe0, 1),
        Range32.init(0x2f800, 0x2fa1d, 1),
        Range32.init(0x30000, 0x3134a, 1),
    },
};

pub const Hangul = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1100, 0x11ff, 1),
        Range16.init(0x302e, 0x302f, 1),
        Range16.init(0x3131, 0x318e, 1),
        Range16.init(0x3200, 0x321e, 1),
        Range16.init(0x3260, 0x327e, 1),
        Range16.init(0xa960, 0xa97c, 1),
        Range16.init(0xac00, 0xd7a3, 1),
        Range16.init(0xd7b0, 0xd7c6, 1),
        Range16.init(0xd7cb, 0xd7fb, 1),
        Range16.init(0xffa0, 0xffbe, 1),
        Range16.init(0xffc2, 0xffc7, 1),
        Range16.init(0xffca, 0xffcf, 1),
        Range16.init(0xffd2, 0xffd7, 1),
        Range16.init(0xffda, 0xffdc, 1),
    },
};

pub const Hanifi_Rohingya = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10d00, 0x10d27, 1),
        Range32.init(0x10d30, 0x10d39, 1),
    },
};

pub const Hanunoo = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1720, 0x1734, 1),
    },
};

pub const Hatran = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x108e0, 0x108f2, 1),
        Range32.init(0x108f4, 0x108f5, 1),
        Range32.init(0x108fb, 0x108ff, 1),
    },
};

pub const Hebrew = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0591, 0x05c7, 1),
        Range16.init(0x05d0, 0x05ea, 1),
        Range16.init(0x05ef, 0x05f4, 1),
        Range16.init(0xfb1d, 0xfb36, 1),
        Range16.init(0xfb38, 0xfb3c, 1),
        Range16.init(0xfb3e, 0xfb40, 2),
        Range16.init(0xfb41, 0xfb43, 2),
        Range16.init(0xfb44, 0xfb46, 2),
        Range16.init(0xfb47, 0xfb4f, 1),
    },
};

pub const Hiragana = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x3041, 0x3096, 1),
        Range16.init(0x309d, 0x309f, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1b001, 0x1b11e, 1),
        Range32.init(0x1b150, 0x1b152, 1),
        Range32.init(0x1f200, 0x1f200, 1),
    },
};

pub const Imperial_Aramaic = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10840, 0x10855, 1),
        Range32.init(0x10857, 0x1085f, 1),
    },
};

pub const Inherited = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0300, 0x036f, 1),
        Range16.init(0x0485, 0x0486, 1),
        Range16.init(0x064b, 0x0655, 1),
        Range16.init(0x0670, 0x0951, 737),
        Range16.init(0x0952, 0x0954, 1),
        Range16.init(0x1ab0, 0x1ac0, 1),
        Range16.init(0x1cd0, 0x1cd2, 1),
        Range16.init(0x1cd4, 0x1ce0, 1),
        Range16.init(0x1ce2, 0x1ce8, 1),
        Range16.init(0x1ced, 0x1cf4, 7),
        Range16.init(0x1cf8, 0x1cf9, 1),
        Range16.init(0x1dc0, 0x1df9, 1),
        Range16.init(0x1dfb, 0x1dff, 1),
        Range16.init(0x200c, 0x200d, 1),
        Range16.init(0x20d0, 0x20f0, 1),
        Range16.init(0x302a, 0x302d, 1),
        Range16.init(0x3099, 0x309a, 1),
        Range16.init(0xfe00, 0xfe0f, 1),
        Range16.init(0xfe20, 0xfe2d, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x101fd, 0x102e0, 227),
        Range32.init(0x1133b, 0x1d167, 48684),
        Range32.init(0x1d168, 0x1d169, 1),
        Range32.init(0x1d17b, 0x1d182, 1),
        Range32.init(0x1d185, 0x1d18b, 1),
        Range32.init(0x1d1aa, 0x1d1ad, 1),
        Range32.init(0xe0100, 0xe01ef, 1),
    },
};

pub const Inscriptional_Pahlavi = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10b60, 0x10b72, 1),
        Range32.init(0x10b78, 0x10b7f, 1),
    },
};

pub const Inscriptional_Parthian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10b40, 0x10b55, 1),
        Range32.init(0x10b58, 0x10b5f, 1),
    },
};

pub const Javanese = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xa980, 0xa9cd, 1),
        Range16.init(0xa9d0, 0xa9d9, 1),
        Range16.init(0xa9de, 0xa9df, 1),
    },
};

pub const Kaithi = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11080, 0x110c1, 1),
        Range32.init(0x110cd, 0x110cd, 1),
    },
};

pub const Kannada = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0c80, 0x0c8c, 1),
        Range16.init(0x0c8e, 0x0c90, 1),
        Range16.init(0x0c92, 0x0ca8, 1),
        Range16.init(0x0caa, 0x0cb3, 1),
        Range16.init(0x0cb5, 0x0cb9, 1),
        Range16.init(0x0cbc, 0x0cc4, 1),
        Range16.init(0x0cc6, 0x0cc8, 1),
        Range16.init(0x0cca, 0x0ccd, 1),
        Range16.init(0x0cd5, 0x0cd6, 1),
        Range16.init(0x0cde, 0x0ce0, 2),
        Range16.init(0x0ce1, 0x0ce3, 1),
        Range16.init(0x0ce6, 0x0cef, 1),
        Range16.init(0x0cf1, 0x0cf2, 1),
    },
};

pub const Katakana = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x30a1, 0x30fa, 1),
        Range16.init(0x30fd, 0x30ff, 1),
        Range16.init(0x31f0, 0x31ff, 1),
        Range16.init(0x32d0, 0x32fe, 1),
        Range16.init(0x3300, 0x3357, 1),
        Range16.init(0xff66, 0xff6f, 1),
        Range16.init(0xff71, 0xff9d, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1b000, 0x1b164, 356),
        Range32.init(0x1b165, 0x1b167, 1),
    },
};

pub const Kayah_Li = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xa900, 0xa92d, 1),
        Range16.init(0xa92f, 0xa92f, 1),
    },
};

pub const Kharoshthi = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10a00, 0x10a03, 1),
        Range32.init(0x10a05, 0x10a06, 1),
        Range32.init(0x10a0c, 0x10a13, 1),
        Range32.init(0x10a15, 0x10a17, 1),
        Range32.init(0x10a19, 0x10a35, 1),
        Range32.init(0x10a38, 0x10a3a, 1),
        Range32.init(0x10a3f, 0x10a48, 1),
        Range32.init(0x10a50, 0x10a58, 1),
    },
};

pub const Khitan_Small_Script = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x16fe4, 0x18b00, 6940),
        Range32.init(0x18b01, 0x18cd5, 1),
    },
};

pub const Khmer = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1780, 0x17dd, 1),
        Range16.init(0x17e0, 0x17e9, 1),
        Range16.init(0x17f0, 0x17f9, 1),
        Range16.init(0x19e0, 0x19ff, 1),
    },
};

pub const Khojki = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11200, 0x11211, 1),
        Range32.init(0x11213, 0x1123e, 1),
    },
};

pub const Khudawadi = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x112b0, 0x112ea, 1),
        Range32.init(0x112f0, 0x112f9, 1),
    },
};

pub const Lao = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0e81, 0x0e82, 1),
        Range16.init(0x0e84, 0x0e86, 2),
        Range16.init(0x0e87, 0x0e8a, 1),
        Range16.init(0x0e8c, 0x0ea3, 1),
        Range16.init(0x0ea5, 0x0ea7, 2),
        Range16.init(0x0ea8, 0x0ebd, 1),
        Range16.init(0x0ec0, 0x0ec4, 1),
        Range16.init(0x0ec6, 0x0ec8, 2),
        Range16.init(0x0ec9, 0x0ecd, 1),
        Range16.init(0x0ed0, 0x0ed9, 1),
        Range16.init(0x0edc, 0x0edf, 1),
    },
};

pub const Latin = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0041, 0x005a, 1),
        Range16.init(0x0061, 0x007a, 1),
        Range16.init(0x00aa, 0x00ba, 16),
        Range16.init(0x00c0, 0x00d6, 1),
        Range16.init(0x00d8, 0x00f6, 1),
        Range16.init(0x00f8, 0x02b8, 1),
        Range16.init(0x02e0, 0x02e4, 1),
        Range16.init(0x1d00, 0x1d25, 1),
        Range16.init(0x1d2c, 0x1d5c, 1),
        Range16.init(0x1d62, 0x1d65, 1),
        Range16.init(0x1d6b, 0x1d77, 1),
        Range16.init(0x1d79, 0x1dbe, 1),
        Range16.init(0x1e00, 0x1eff, 1),
        Range16.init(0x2071, 0x207f, 14),
        Range16.init(0x2090, 0x209c, 1),
        Range16.init(0x212a, 0x212b, 1),
        Range16.init(0x2132, 0x214e, 28),
        Range16.init(0x2160, 0x2188, 1),
        Range16.init(0x2c60, 0x2c7f, 1),
        Range16.init(0xa722, 0xa787, 1),
        Range16.init(0xa78b, 0xa7bf, 1),
        Range16.init(0xa7c2, 0xa7ca, 1),
        Range16.init(0xa7f5, 0xa7ff, 1),
        Range16.init(0xab30, 0xab5a, 1),
        Range16.init(0xab5c, 0xab64, 1),
        Range16.init(0xab66, 0xab69, 1),
        Range16.init(0xfb00, 0xfb06, 1),
        Range16.init(0xff21, 0xff3a, 1),
        Range16.init(0xff41, 0xff5a, 1),
    },
    .latin_offset = 5,
};

pub const Lepcha = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1c00, 0x1c37, 1),
        Range16.init(0x1c3b, 0x1c49, 1),
        Range16.init(0x1c4d, 0x1c4f, 1),
    },
};

pub const Limbu = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1900, 0x191e, 1),
        Range16.init(0x1920, 0x192b, 1),
        Range16.init(0x1930, 0x193b, 1),
        Range16.init(0x1940, 0x1944, 4),
        Range16.init(0x1945, 0x194f, 1),
    },
};

pub const Linear_A = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10600, 0x10736, 1),
        Range32.init(0x10740, 0x10755, 1),
        Range32.init(0x10760, 0x10767, 1),
    },
};

pub const Linear_B = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10000, 0x1000b, 1),
        Range32.init(0x1000d, 0x10026, 1),
        Range32.init(0x10028, 0x1003a, 1),
        Range32.init(0x1003c, 0x1003d, 1),
        Range32.init(0x1003f, 0x1004d, 1),
        Range32.init(0x10050, 0x1005d, 1),
        Range32.init(0x10080, 0x100fa, 1),
    },
};

pub const Lisu = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xa4d0, 0xa4ff, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x11fb0, 0x11fb0, 1),
    },
};

pub const Lycian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10280, 0x1029c, 1),
    },
};

pub const Lydian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10920, 0x10939, 1),
        Range32.init(0x1093f, 0x1093f, 1),
    },
};

pub const Mahajani = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11150, 0x11176, 1),
    },
};

pub const Makasar = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11ee0, 0x11ef8, 1),
    },
};

pub const Malayalam = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0d00, 0x0d0c, 1),
        Range16.init(0x0d0e, 0x0d10, 1),
        Range16.init(0x0d12, 0x0d44, 1),
        Range16.init(0x0d46, 0x0d48, 1),
        Range16.init(0x0d4a, 0x0d4f, 1),
        Range16.init(0x0d54, 0x0d63, 1),
        Range16.init(0x0d66, 0x0d7f, 1),
    },
};

pub const Mandaic = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0840, 0x085b, 1),
        Range16.init(0x085e, 0x085e, 1),
    },
};

pub const Manichaean = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10ac0, 0x10ae6, 1),
        Range32.init(0x10aeb, 0x10af6, 1),
    },
};

pub const Marchen = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11c70, 0x11c8f, 1),
        Range32.init(0x11c92, 0x11ca7, 1),
        Range32.init(0x11ca9, 0x11cb6, 1),
    },
};

pub const Masaram_Gondi = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11d00, 0x11d06, 1),
        Range32.init(0x11d08, 0x11d09, 1),
        Range32.init(0x11d0b, 0x11d36, 1),
        Range32.init(0x11d3a, 0x11d3c, 2),
        Range32.init(0x11d3d, 0x11d3f, 2),
        Range32.init(0x11d40, 0x11d47, 1),
        Range32.init(0x11d50, 0x11d59, 1),
    },
};

pub const Medefaidrin = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x16e40, 0x16e9a, 1),
    },
};

pub const Meetei_Mayek = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xaae0, 0xaaf6, 1),
        Range16.init(0xabc0, 0xabed, 1),
        Range16.init(0xabf0, 0xabf9, 1),
    },
};

pub const Mende_Kikakui = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x1e800, 0x1e8c4, 1),
        Range32.init(0x1e8c7, 0x1e8d6, 1),
    },
};

pub const Meroitic_Cursive = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x109a0, 0x109b7, 1),
        Range32.init(0x109bc, 0x109cf, 1),
        Range32.init(0x109d2, 0x109ff, 1),
    },
};

pub const Meroitic_Hieroglyphs = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10980, 0x1099f, 1),
    },
};

pub const Miao = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x16f00, 0x16f4a, 1),
        Range32.init(0x16f4f, 0x16f87, 1),
        Range32.init(0x16f8f, 0x16f9f, 1),
    },
};

pub const Modi = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11600, 0x11644, 1),
        Range32.init(0x11650, 0x11659, 1),
    },
};

pub const Mongolian = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1800, 0x1801, 1),
        Range16.init(0x1804, 0x1806, 2),
        Range16.init(0x1807, 0x180e, 1),
        Range16.init(0x1810, 0x1819, 1),
        Range16.init(0x1820, 0x1878, 1),
        Range16.init(0x1880, 0x18aa, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x11660, 0x1166c, 1),
    },
};

pub const Mro = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x16a40, 0x16a5e, 1),
        Range32.init(0x16a60, 0x16a69, 1),
        Range32.init(0x16a6e, 0x16a6f, 1),
    },
};

pub const Multani = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11280, 0x11286, 1),
        Range32.init(0x11288, 0x1128a, 2),
        Range32.init(0x1128b, 0x1128d, 1),
        Range32.init(0x1128f, 0x1129d, 1),
        Range32.init(0x1129f, 0x112a9, 1),
    },
};

pub const Myanmar = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1000, 0x109f, 1),
        Range16.init(0xa9e0, 0xa9fe, 1),
        Range16.init(0xaa60, 0xaa7f, 1),
    },
};

pub const Nabataean = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10880, 0x1089e, 1),
        Range32.init(0x108a7, 0x108af, 1),
    },
};

pub const Nandinagari = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x119a0, 0x119a7, 1),
        Range32.init(0x119aa, 0x119d7, 1),
        Range32.init(0x119da, 0x119e4, 1),
    },
};

pub const New_Tai_Lue = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1980, 0x19ab, 1),
        Range16.init(0x19b0, 0x19c9, 1),
        Range16.init(0x19d0, 0x19da, 1),
        Range16.init(0x19de, 0x19df, 1),
    },
};

pub const Newa = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11400, 0x1145b, 1),
        Range32.init(0x1145d, 0x11461, 1),
    },
};

pub const Nko = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x07c0, 0x07fa, 1),
        Range16.init(0x07fd, 0x07ff, 1),
    },
};

pub const Nushu = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x16fe1, 0x1b170, 16783),
        Range32.init(0x1b171, 0x1b2fb, 1),
    },
};

pub const Nyiakeng_Puachue_Hmong = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x1e100, 0x1e12c, 1),
        Range32.init(0x1e130, 0x1e13d, 1),
        Range32.init(0x1e140, 0x1e149, 1),
        Range32.init(0x1e14e, 0x1e14f, 1),
    },
};

pub const Ogham = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1680, 0x169c, 1),
    },
};

pub const Ol_Chiki = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1c50, 0x1c7f, 1),
    },
};

pub const Old_Hungarian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10c80, 0x10cb2, 1),
        Range32.init(0x10cc0, 0x10cf2, 1),
        Range32.init(0x10cfa, 0x10cff, 1),
    },
};

pub const Old_Italic = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10300, 0x10323, 1),
        Range32.init(0x1032d, 0x1032f, 1),
    },
};

pub const Old_North_Arabian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10a80, 0x10a9f, 1),
    },
};

pub const Old_Permic = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10350, 0x1037a, 1),
    },
};

pub const Old_Persian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x103a0, 0x103c3, 1),
        Range32.init(0x103c8, 0x103d5, 1),
    },
};

pub const Old_Sogdian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10f00, 0x10f27, 1),
    },
};

pub const Old_South_Arabian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10a60, 0x10a7f, 1),
    },
};

pub const Old_Turkic = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10c00, 0x10c48, 1),
    },
};

pub const Oriya = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0b01, 0x0b03, 1),
        Range16.init(0x0b05, 0x0b0c, 1),
        Range16.init(0x0b0f, 0x0b10, 1),
        Range16.init(0x0b13, 0x0b28, 1),
        Range16.init(0x0b2a, 0x0b30, 1),
        Range16.init(0x0b32, 0x0b33, 1),
        Range16.init(0x0b35, 0x0b39, 1),
        Range16.init(0x0b3c, 0x0b44, 1),
        Range16.init(0x0b47, 0x0b48, 1),
        Range16.init(0x0b4b, 0x0b4d, 1),
        Range16.init(0x0b55, 0x0b57, 1),
        Range16.init(0x0b5c, 0x0b5d, 1),
        Range16.init(0x0b5f, 0x0b63, 1),
        Range16.init(0x0b66, 0x0b77, 1),
    },
};

pub const Osage = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x104b0, 0x104d3, 1),
        Range32.init(0x104d8, 0x104fb, 1),
    },
};

pub const Osmanya = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10480, 0x1049d, 1),
        Range32.init(0x104a0, 0x104a9, 1),
    },
};

pub const Pahawh_Hmong = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x16b00, 0x16b45, 1),
        Range32.init(0x16b50, 0x16b59, 1),
        Range32.init(0x16b5b, 0x16b61, 1),
        Range32.init(0x16b63, 0x16b77, 1),
        Range32.init(0x16b7d, 0x16b8f, 1),
    },
};

pub const Palmyrene = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10860, 0x1087f, 1),
    },
};

pub const Pau_Cin_Hau = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11ac0, 0x11af8, 1),
    },
};

pub const Phags_Pa = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xa840, 0xa877, 1),
    },
};

pub const Phoenician = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10900, 0x1091b, 1),
        Range32.init(0x1091f, 0x1091f, 1),
    },
};

pub const Psalter_Pahlavi = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10b80, 0x10b91, 1),
        Range32.init(0x10b99, 0x10b9c, 1),
        Range32.init(0x10ba9, 0x10baf, 1),
    },
};

pub const Rejang = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xa930, 0xa953, 1),
        Range16.init(0xa95f, 0xa95f, 1),
    },
};

pub const Runic = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x16a0, 0x16ea, 1),
        Range16.init(0x16ee, 0x16f8, 1),
    },
};

pub const Samaritan = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0800, 0x082d, 1),
        Range16.init(0x0830, 0x083e, 1),
    },
};

pub const Saurashtra = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xa880, 0xa8c5, 1),
        Range16.init(0xa8ce, 0xa8d9, 1),
    },
};

pub const Sharada = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11180, 0x111df, 1),
    },
};

pub const Shavian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10450, 0x1047f, 1),
    },
};

pub const Siddham = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11580, 0x115b5, 1),
        Range32.init(0x115b8, 0x115dd, 1),
    },
};

pub const SignWriting = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x1d800, 0x1da8b, 1),
        Range32.init(0x1da9b, 0x1da9f, 1),
        Range32.init(0x1daa1, 0x1daaf, 1),
    },
};

pub const Sinhala = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0d81, 0x0d83, 1),
        Range16.init(0x0d85, 0x0d96, 1),
        Range16.init(0x0d9a, 0x0db1, 1),
        Range16.init(0x0db3, 0x0dbb, 1),
        Range16.init(0x0dbd, 0x0dc0, 3),
        Range16.init(0x0dc1, 0x0dc6, 1),
        Range16.init(0x0dca, 0x0dcf, 5),
        Range16.init(0x0dd0, 0x0dd4, 1),
        Range16.init(0x0dd6, 0x0dd8, 2),
        Range16.init(0x0dd9, 0x0ddf, 1),
        Range16.init(0x0de6, 0x0def, 1),
        Range16.init(0x0df2, 0x0df4, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x111e1, 0x111f4, 1),
    },
};

pub const Sogdian = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10f30, 0x10f59, 1),
    },
};

pub const Sora_Sompeng = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x110d0, 0x110e8, 1),
        Range32.init(0x110f0, 0x110f9, 1),
    },
};

pub const Soyombo = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11a50, 0x11aa2, 1),
    },
};

pub const Sundanese = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1b80, 0x1bbf, 1),
        Range16.init(0x1cc0, 0x1cc7, 1),
    },
};

pub const Syloti_Nagri = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xa800, 0xa82c, 1),
    },
};

pub const Syriac = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0700, 0x070d, 1),
        Range16.init(0x070f, 0x074a, 1),
        Range16.init(0x074d, 0x074f, 1),
        Range16.init(0x0860, 0x086a, 1),
    },
};

pub const Tagalog = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1700, 0x170c, 1),
        Range16.init(0x170e, 0x1714, 1),
    },
};

pub const Tagbanwa = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1760, 0x176c, 1),
        Range16.init(0x176e, 0x1770, 1),
        Range16.init(0x1772, 0x1773, 1),
    },
};

pub const Tai_Le = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1950, 0x196d, 1),
        Range16.init(0x1970, 0x1974, 1),
    },
};

pub const Tai_Tham = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1a20, 0x1a5e, 1),
        Range16.init(0x1a60, 0x1a7c, 1),
        Range16.init(0x1a7f, 0x1a89, 1),
        Range16.init(0x1a90, 0x1a99, 1),
        Range16.init(0x1aa0, 0x1aad, 1),
    },
};

pub const Tai_Viet = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xaa80, 0xaac2, 1),
        Range16.init(0xaadb, 0xaadf, 1),
    },
};

pub const Takri = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11680, 0x116b8, 1),
        Range32.init(0x116c0, 0x116c9, 1),
    },
};

pub const Tamil = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0b82, 0x0b83, 1),
        Range16.init(0x0b85, 0x0b8a, 1),
        Range16.init(0x0b8e, 0x0b90, 1),
        Range16.init(0x0b92, 0x0b95, 1),
        Range16.init(0x0b99, 0x0b9a, 1),
        Range16.init(0x0b9c, 0x0b9e, 2),
        Range16.init(0x0b9f, 0x0ba3, 4),
        Range16.init(0x0ba4, 0x0ba8, 4),
        Range16.init(0x0ba9, 0x0baa, 1),
        Range16.init(0x0bae, 0x0bb9, 1),
        Range16.init(0x0bbe, 0x0bc2, 1),
        Range16.init(0x0bc6, 0x0bc8, 1),
        Range16.init(0x0bca, 0x0bcd, 1),
        Range16.init(0x0bd0, 0x0bd7, 7),
        Range16.init(0x0be6, 0x0bfa, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x11fc0, 0x11ff1, 1),
        Range32.init(0x11fff, 0x11fff, 1),
    },
};

pub const Tangut = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x16fe0, 0x17000, 32),
        Range32.init(0x17001, 0x187f7, 1),
        Range32.init(0x18800, 0x18aff, 1),
        Range32.init(0x18d00, 0x18d08, 1),
    },
};

pub const Telugu = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0c00, 0x0c0c, 1),
        Range16.init(0x0c0e, 0x0c10, 1),
        Range16.init(0x0c12, 0x0c28, 1),
        Range16.init(0x0c2a, 0x0c39, 1),
        Range16.init(0x0c3d, 0x0c44, 1),
        Range16.init(0x0c46, 0x0c48, 1),
        Range16.init(0x0c4a, 0x0c4d, 1),
        Range16.init(0x0c55, 0x0c56, 1),
        Range16.init(0x0c58, 0x0c5a, 1),
        Range16.init(0x0c60, 0x0c63, 1),
        Range16.init(0x0c66, 0x0c6f, 1),
        Range16.init(0x0c77, 0x0c7f, 1),
    },
};

pub const Thaana = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0780, 0x07b1, 1),
    },
};

pub const Thai = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0e01, 0x0e3a, 1),
        Range16.init(0x0e40, 0x0e5b, 1),
    },
};

pub const Tibetan = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0f00, 0x0f47, 1),
        Range16.init(0x0f49, 0x0f6c, 1),
        Range16.init(0x0f71, 0x0f97, 1),
        Range16.init(0x0f99, 0x0fbc, 1),
        Range16.init(0x0fbe, 0x0fcc, 1),
        Range16.init(0x0fce, 0x0fd4, 1),
        Range16.init(0x0fd9, 0x0fda, 1),
    },
};

pub const Tifinagh = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x2d30, 0x2d67, 1),
        Range16.init(0x2d6f, 0x2d70, 1),
        Range16.init(0x2d7f, 0x2d7f, 1),
    },
};

pub const Tirhuta = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11480, 0x114c7, 1),
        Range32.init(0x114d0, 0x114d9, 1),
    },
};

pub const Ugaritic = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10380, 0x1039d, 1),
        Range32.init(0x1039f, 0x1039f, 1),
    },
};

pub const Vai = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xa500, 0xa62b, 1),
    },
};

pub const Wancho = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x1e2c0, 0x1e2f9, 1),
        Range32.init(0x1e2ff, 0x1e2ff, 1),
    },
};

pub const Warang_Citi = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x118a0, 0x118f2, 1),
        Range32.init(0x118ff, 0x118ff, 1),
    },
};

pub const Yezidi = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x10e80, 0x10ea9, 1),
        Range32.init(0x10eab, 0x10ead, 1),
        Range32.init(0x10eb0, 0x10eb1, 1),
    },
};

pub const Yi = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xa000, 0xa48c, 1),
        Range16.init(0xa490, 0xa4c6, 1),
    },
};

pub const Zanabazar_Square = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x11a00, 0x11a47, 1),
    },
};

// Properties is the set of Unicode property tables.
pub const Properties = [_]*RangeTable{
    &ascii_hex_digit, // 	"ascii_hex_digit":
    &bidi_control, // 	"bidi_control":
    &dash, // 	"Dash":
    &deprecated, // 	"Deprecated":
    &diacritic, // 	"Diacritic":
    &extender, // 	"Extender":
    &hex_digit, // 	"Hex_Digit":
    &hyphen, // 	"Hyphen":
    &ids_binary_operator, // 	"IDS_Binary_Operator":
    &ids_trinary_operator, // 	"IDS_Trinary_Operator":
    &ideographic, // 	"Ideographic":
    &join_control, // 	"Join_Control":
    &logical_order_exception, // 	"Logical_Order_Exception":
    &noncharacter_code_point, // 	"Noncharacter_Code_Point":
    &other_alphabetic, // 	"Other_Alphabetic":
    &other_default_ignorable_code_point, // 	"Other_Default_Ignorable_Code_Point":
    &other_grapheme_extend, // 	"Other_Grapheme_Extend":
    &other_id_continue, // 	"Other_ID_Continue":
    &other_id_start, // 	"Other_ID_Start":
    &other_lowercase, // 	"Other_Lowercase":
    &other_math, // 	"Other_Math":
    &other_uppercase, // 	"Other_Uppercase":
    &pattern_syntax, // 	"Pattern_Syntax":
    &pattern_white_space, // 	"Pattern_White_Space":
    &prepended_concatenation_mark, // 	"Prepended_Concatenation_Mark":
    &quotation_mark, // 	"Quotation_Mark":
    &radical, // 	"Radical":
    &regional_indicator, // 	"Regional_Indicator":
    &sentence_terminal, // 	"Sentence_Terminal":
    &sentence_terminal, // 	"STerm":
    &soft_dotted, // 	"Soft_Dotted":
    &terminal_punctuation, // 	"Terminal_Punctuation":
    &unified_ideograph, // 	"Unified_Ideograph":
    &variation_selector, // 	"Variation_Selector":
    &white_space, // 	"White_Space":
};

pub const ascii_hex_digit = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0030, 0x0039, 1),
        Range16.init(0x0041, 0x0046, 1),
        Range16.init(0x0061, 0x0066, 1),
    },
    .latin_offset = 3,
};

pub const bidi_control = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x061c, 0x200e, 6642),
        Range16.init(0x200f, 0x202a, 27),
        Range16.init(0x202b, 0x202e, 1),
        Range16.init(0x2066, 0x2069, 1),
    },
};

pub const dash = RangeTable{
    .r16 = &[_]Range16{
        Range32.init(0x002d, 0x058a, 1373),
        Range32.init(0x05be, 0x1400, 3650),
        Range32.init(0x1806, 0x2010, 2058),
        Range32.init(0x2011, 0x2015, 1),
        Range32.init(0x2053, 0x207b, 40),
        Range32.init(0x208b, 0x2212, 391),
        Range32.init(0x2e17, 0x2e1a, 3),
        Range32.init(0x2e3a, 0x2e3b, 1),
        Range32.init(0x2e40, 0x301c, 476),
        Range32.init(0x3030, 0x30a0, 112),
        Range32.init(0xfe31, 0xfe32, 1),
        Range32.init(0xfe58, 0xfe63, 11),
        Range32.init(0xff0d, 0xff0d, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10ead, 0x10ead, 1),
    },
};

pub const deprecated = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0149, 0x0673, 1322),
        Range16.init(0x0f77, 0x0f79, 2),
        Range16.init(0x17a3, 0x17a4, 1),
        Range16.init(0x206a, 0x206f, 1),
        Range16.init(0x2329, 0x232a, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0xe0001, 0xe0001, 1),
    },
};

pub const diacritic = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x005e, 0x0060, 2),
        Range16.init(0x00a8, 0x00af, 7),
        Range16.init(0x00b4, 0x00b7, 3),
        Range16.init(0x00b8, 0x02b0, 504),
        Range16.init(0x02b1, 0x034e, 1),
        Range16.init(0x0350, 0x0357, 1),
        Range16.init(0x035d, 0x0362, 1),
        Range16.init(0x0374, 0x0375, 1),
        Range16.init(0x037a, 0x0384, 10),
        Range16.init(0x0385, 0x0483, 254),
        Range16.init(0x0484, 0x0487, 1),
        Range16.init(0x0559, 0x0591, 56),
        Range16.init(0x0592, 0x05a1, 1),
        Range16.init(0x05a3, 0x05bd, 1),
        Range16.init(0x05bf, 0x05c1, 2),
        Range16.init(0x05c2, 0x05c4, 2),
        Range16.init(0x064b, 0x0652, 1),
        Range16.init(0x0657, 0x0658, 1),
        Range16.init(0x06df, 0x06e0, 1),
        Range16.init(0x06e5, 0x06e6, 1),
        Range16.init(0x06ea, 0x06ec, 1),
        Range16.init(0x0730, 0x074a, 1),
        Range16.init(0x07a6, 0x07b0, 1),
        Range16.init(0x07eb, 0x07f5, 1),
        Range16.init(0x0818, 0x0819, 1),
        Range16.init(0x08e3, 0x08fe, 1),
        Range16.init(0x093c, 0x094d, 17),
        Range16.init(0x0951, 0x0954, 1),
        Range16.init(0x0971, 0x09bc, 75),
        Range16.init(0x09cd, 0x0a3c, 111),
        Range16.init(0x0a4d, 0x0abc, 111),
        Range16.init(0x0acd, 0x0afd, 48),
        Range16.init(0x0afe, 0x0aff, 1),
        Range16.init(0x0b3c, 0x0b4d, 17),
        Range16.init(0x0b55, 0x0bcd, 120),
        Range16.init(0x0c4d, 0x0cbc, 111),
        Range16.init(0x0ccd, 0x0d3b, 110),
        Range16.init(0x0d3c, 0x0d4d, 17),
        Range16.init(0x0dca, 0x0e47, 125),
        Range16.init(0x0e48, 0x0e4c, 1),
        Range16.init(0x0e4e, 0x0eba, 108),
        Range16.init(0x0ec8, 0x0ecc, 1),
        Range16.init(0x0f18, 0x0f19, 1),
        Range16.init(0x0f35, 0x0f39, 2),
        Range16.init(0x0f3e, 0x0f3f, 1),
        Range16.init(0x0f82, 0x0f84, 1),
        Range16.init(0x0f86, 0x0f87, 1),
        Range16.init(0x0fc6, 0x1037, 113),
        Range16.init(0x1039, 0x103a, 1),
        Range16.init(0x1063, 0x1064, 1),
        Range16.init(0x1069, 0x106d, 1),
        Range16.init(0x1087, 0x108d, 1),
        Range16.init(0x108f, 0x109a, 11),
        Range16.init(0x109b, 0x135d, 706),
        Range16.init(0x135e, 0x135f, 1),
        Range16.init(0x17c9, 0x17d3, 1),
        Range16.init(0x17dd, 0x1939, 348),
        Range16.init(0x193a, 0x193b, 1),
        Range16.init(0x1a75, 0x1a7c, 1),
        Range16.init(0x1a7f, 0x1ab0, 49),
        Range16.init(0x1ab1, 0x1abd, 1),
        Range16.init(0x1b34, 0x1b44, 16),
        Range16.init(0x1b6b, 0x1b73, 1),
        Range16.init(0x1baa, 0x1bab, 1),
        Range16.init(0x1c36, 0x1c37, 1),
        Range16.init(0x1c78, 0x1c7d, 1),
        Range16.init(0x1cd0, 0x1ce8, 1),
        Range16.init(0x1ced, 0x1cf4, 7),
        Range16.init(0x1cf7, 0x1cf9, 1),
        Range16.init(0x1d2c, 0x1d6a, 1),
        Range16.init(0x1dc4, 0x1dcf, 1),
        Range16.init(0x1df5, 0x1df9, 1),
        Range16.init(0x1dfd, 0x1dff, 1),
        Range16.init(0x1fbd, 0x1fbf, 2),
        Range16.init(0x1fc0, 0x1fc1, 1),
        Range16.init(0x1fcd, 0x1fcf, 1),
        Range16.init(0x1fdd, 0x1fdf, 1),
        Range16.init(0x1fed, 0x1fef, 1),
        Range16.init(0x1ffd, 0x1ffe, 1),
        Range16.init(0x2cef, 0x2cf1, 1),
        Range16.init(0x2e2f, 0x302a, 507),
        Range16.init(0x302b, 0x302f, 1),
        Range16.init(0x3099, 0x309c, 1),
        Range16.init(0x30fc, 0xa66f, 30067),
        Range16.init(0xa67c, 0xa67d, 1),
        Range16.init(0xa67f, 0xa69c, 29),
        Range16.init(0xa69d, 0xa6f0, 83),
        Range16.init(0xa6f1, 0xa700, 15),
        Range16.init(0xa701, 0xa721, 1),
        Range16.init(0xa788, 0xa78a, 1),
        Range16.init(0xa7f8, 0xa7f9, 1),
        Range16.init(0xa8c4, 0xa8e0, 28),
        Range16.init(0xa8e1, 0xa8f1, 1),
        Range16.init(0xa92b, 0xa92e, 1),
        Range16.init(0xa953, 0xa9b3, 96),
        Range16.init(0xa9c0, 0xa9e5, 37),
        Range16.init(0xaa7b, 0xaa7d, 1),
        Range16.init(0xaabf, 0xaac2, 1),
        Range16.init(0xaaf6, 0xab5b, 101),
        Range16.init(0xab5c, 0xab5f, 1),
        Range16.init(0xab69, 0xab6b, 1),
        Range16.init(0xabec, 0xabed, 1),
        Range16.init(0xfb1e, 0xfe20, 770),
        Range16.init(0xfe21, 0xfe2f, 1),
        Range16.init(0xff3e, 0xff40, 2),
        Range16.init(0xff70, 0xff9e, 46),
        Range16.init(0xff9f, 0xffe3, 68),
    },
    .r32 = &[_]Range32{
        Range32.init(0x102e0, 0x10ae5, 2053),
        Range32.init(0x10ae6, 0x10d22, 572),
        Range32.init(0x10d23, 0x10d27, 1),
        Range32.init(0x10f46, 0x10f50, 1),
        Range32.init(0x110b9, 0x110ba, 1),
        Range32.init(0x11133, 0x11134, 1),
        Range32.init(0x11173, 0x111c0, 77),
        Range32.init(0x111ca, 0x111cc, 1),
        Range32.init(0x11235, 0x11236, 1),
        Range32.init(0x112e9, 0x112ea, 1),
        Range32.init(0x1133c, 0x1134d, 17),
        Range32.init(0x11366, 0x1136c, 1),
        Range32.init(0x11370, 0x11374, 1),
        Range32.init(0x11442, 0x11446, 4),
        Range32.init(0x114c2, 0x114c3, 1),
        Range32.init(0x115bf, 0x115c0, 1),
        Range32.init(0x1163f, 0x116b6, 119),
        Range32.init(0x116b7, 0x1172b, 116),
        Range32.init(0x11839, 0x1183a, 1),
        Range32.init(0x1193d, 0x1193e, 1),
        Range32.init(0x11943, 0x119e0, 157),
        Range32.init(0x11a34, 0x11a47, 19),
        Range32.init(0x11a99, 0x11c3f, 422),
        Range32.init(0x11d42, 0x11d44, 2),
        Range32.init(0x11d45, 0x11d97, 82),
        Range32.init(0x16af0, 0x16af4, 1),
        Range32.init(0x16b30, 0x16b36, 1),
        Range32.init(0x16f8f, 0x16f9f, 1),
        Range32.init(0x16ff0, 0x16ff1, 1),
        Range32.init(0x1d167, 0x1d169, 1),
        Range32.init(0x1d16d, 0x1d172, 1),
        Range32.init(0x1d17b, 0x1d182, 1),
        Range32.init(0x1d185, 0x1d18b, 1),
        Range32.init(0x1d1aa, 0x1d1ad, 1),
        Range32.init(0x1e130, 0x1e136, 1),
        Range32.init(0x1e2ec, 0x1e2ef, 1),
        Range32.init(0x1e8d0, 0x1e8d6, 1),
        Range32.init(0x1e944, 0x1e946, 1),
        Range32.init(0x1e948, 0x1e94a, 1),
    },
    .latin_offset = 3,
};

pub const extender = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x00b7, 0x02d0, 537),
        Range16.init(0x02d1, 0x0640, 879),
        Range16.init(0x07fa, 0x0b55, 859),
        Range16.init(0x0e46, 0x0ec6, 128),
        Range16.init(0x180a, 0x1843, 57),
        Range16.init(0x1aa7, 0x1c36, 399),
        Range16.init(0x1c7b, 0x3005, 5002),
        Range16.init(0x3031, 0x3035, 1),
        Range16.init(0x309d, 0x309e, 1),
        Range16.init(0x30fc, 0x30fe, 1),
        Range16.init(0xa015, 0xa60c, 1527),
        Range16.init(0xa9cf, 0xa9e6, 23),
        Range16.init(0xaa70, 0xaadd, 109),
        Range16.init(0xaaf3, 0xaaf4, 1),
        Range16.init(0xff70, 0xff70, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1135d, 0x115c6, 617),
        Range32.init(0x115c7, 0x115c8, 1),
        Range32.init(0x11a98, 0x16b42, 20650),
        Range32.init(0x16b43, 0x16fe0, 1181),
        Range32.init(0x16fe1, 0x16fe3, 2),
        Range32.init(0x1e13c, 0x1e13d, 1),
        Range32.init(0x1e944, 0x1e946, 1),
    },
};

pub const hex_digit = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0030, 0x0039, 1),
        Range16.init(0x0041, 0x0046, 1),
        Range16.init(0x0061, 0x0066, 1),
        Range16.init(0xff10, 0xff19, 1),
        Range16.init(0xff21, 0xff26, 1),
        Range16.init(0xff41, 0xff46, 1),
    },
    .latin_offset = 3,
};

pub const hyphen = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x002d, 0x00ad, 128),
        Range16.init(0x058a, 0x1806, 4732),
        Range16.init(0x2010, 0x2011, 1),
        Range16.init(0x2e17, 0x30fb, 740),
        Range16.init(0xfe63, 0xff0d, 170),
        Range16.init(0xff65, 0xff65, 1),
    },
    .latin_offset = 1,
};

pub const ids_binary_operator = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x2ff0, 0x2ff1, 1),
        Range16.init(0x2ff4, 0x2ffb, 1),
    },
};

pub const ids_trinary_operator = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x2ff2, 0x2ff3, 1),
    },
};

pub const ideographic = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x3006, 0x3007, 1),
        Range16.init(0x3021, 0x3029, 1),
        Range16.init(0x3038, 0x303a, 1),
        Range16.init(0x3400, 0x4dbf, 1),
        Range16.init(0x4e00, 0x9ffc, 1),
        Range16.init(0xf900, 0xfa6d, 1),
        Range16.init(0xfa70, 0xfad9, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x16fe4, 0x17000, 28),
        Range32.init(0x17001, 0x187f7, 1),
        Range32.init(0x18800, 0x18cd5, 1),
        Range32.init(0x18d00, 0x18d08, 1),
        Range32.init(0x1b170, 0x1b2fb, 1),
        Range32.init(0x20000, 0x2a6dd, 1),
        Range32.init(0x2a700, 0x2b734, 1),
        Range32.init(0x2b740, 0x2b81d, 1),
        Range32.init(0x2b820, 0x2cea1, 1),
        Range32.init(0x2ceb0, 0x2ebe0, 1),
        Range32.init(0x2f800, 0x2fa1d, 1),
        Range32.init(0x30000, 0x3134a, 1),
    },
};

pub const join_control = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x200c, 0x200d, 1),
    },
};

pub const logical_order_exception = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0e40, 0x0e44, 1),
        Range16.init(0x0ec0, 0x0ec4, 1),
        Range16.init(0x19b5, 0x19b7, 1),
        Range16.init(0x19ba, 0xaab5, 37115),
        Range16.init(0xaab6, 0xaab9, 3),
        Range16.init(0xaabb, 0xaabc, 1),
    },
};

pub const noncharacter_code_point = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0xfdd0, 0xfdef, 1),
        Range16.init(0xfffe, 0xffff, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1fffe, 0x1ffff, 1),
        Range32.init(0x2fffe, 0x2ffff, 1),
        Range32.init(0x3fffe, 0x3ffff, 1),
        Range32.init(0x4fffe, 0x4ffff, 1),
        Range32.init(0x5fffe, 0x5ffff, 1),
        Range32.init(0x6fffe, 0x6ffff, 1),
        Range32.init(0x7fffe, 0x7ffff, 1),
        Range32.init(0x8fffe, 0x8ffff, 1),
        Range32.init(0x9fffe, 0x9ffff, 1),
        Range32.init(0xafffe, 0xaffff, 1),
        Range32.init(0xbfffe, 0xbffff, 1),
        Range32.init(0xcfffe, 0xcffff, 1),
        Range32.init(0xdfffe, 0xdffff, 1),
        Range32.init(0xefffe, 0xeffff, 1),
        Range32.init(0xffffe, 0xfffff, 1),
        Range32.init(0x10fffe, 0x10ffff, 1),
    },
};

pub const other_alphabetic = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0345, 0x05b0, 619),
        Range16.init(0x05b1, 0x05bd, 1),
        Range16.init(0x05bf, 0x05c1, 2),
        Range16.init(0x05c2, 0x05c4, 2),
        Range16.init(0x05c5, 0x05c7, 2),
        Range16.init(0x0610, 0x061a, 1),
        Range16.init(0x064b, 0x0657, 1),
        Range16.init(0x0659, 0x065f, 1),
        Range16.init(0x0670, 0x06d6, 102),
        Range16.init(0x06d7, 0x06dc, 1),
        Range16.init(0x06e1, 0x06e4, 1),
        Range16.init(0x06e7, 0x06e8, 1),
        Range16.init(0x06ed, 0x0711, 36),
        Range16.init(0x0730, 0x073f, 1),
        Range16.init(0x07a6, 0x07b0, 1),
        Range16.init(0x0816, 0x0817, 1),
        Range16.init(0x081b, 0x0823, 1),
        Range16.init(0x0825, 0x0827, 1),
        Range16.init(0x0829, 0x082c, 1),
        Range16.init(0x08d4, 0x08df, 1),
        Range16.init(0x08e3, 0x08e9, 1),
        Range16.init(0x08f0, 0x0903, 1),
        Range16.init(0x093a, 0x093b, 1),
        Range16.init(0x093e, 0x094c, 1),
        Range16.init(0x094e, 0x094f, 1),
        Range16.init(0x0955, 0x0957, 1),
        Range16.init(0x0962, 0x0963, 1),
        Range16.init(0x0981, 0x0983, 1),
        Range16.init(0x09be, 0x09c4, 1),
        Range16.init(0x09c7, 0x09c8, 1),
        Range16.init(0x09cb, 0x09cc, 1),
        Range16.init(0x09d7, 0x09e2, 11),
        Range16.init(0x09e3, 0x0a01, 30),
        Range16.init(0x0a02, 0x0a03, 1),
        Range16.init(0x0a3e, 0x0a42, 1),
        Range16.init(0x0a47, 0x0a48, 1),
        Range16.init(0x0a4b, 0x0a4c, 1),
        Range16.init(0x0a51, 0x0a70, 31),
        Range16.init(0x0a71, 0x0a75, 4),
        Range16.init(0x0a81, 0x0a83, 1),
        Range16.init(0x0abe, 0x0ac5, 1),
        Range16.init(0x0ac7, 0x0ac9, 1),
        Range16.init(0x0acb, 0x0acc, 1),
        Range16.init(0x0ae2, 0x0ae3, 1),
        Range16.init(0x0afa, 0x0afc, 1),
        Range16.init(0x0b01, 0x0b03, 1),
        Range16.init(0x0b3e, 0x0b44, 1),
        Range16.init(0x0b47, 0x0b48, 1),
        Range16.init(0x0b4b, 0x0b4c, 1),
        Range16.init(0x0b56, 0x0b57, 1),
        Range16.init(0x0b62, 0x0b63, 1),
        Range16.init(0x0b82, 0x0bbe, 60),
        Range16.init(0x0bbf, 0x0bc2, 1),
        Range16.init(0x0bc6, 0x0bc8, 1),
        Range16.init(0x0bca, 0x0bcc, 1),
        Range16.init(0x0bd7, 0x0c00, 41),
        Range16.init(0x0c01, 0x0c03, 1),
        Range16.init(0x0c3e, 0x0c44, 1),
        Range16.init(0x0c46, 0x0c48, 1),
        Range16.init(0x0c4a, 0x0c4c, 1),
        Range16.init(0x0c55, 0x0c56, 1),
        Range16.init(0x0c62, 0x0c63, 1),
        Range16.init(0x0c81, 0x0c83, 1),
        Range16.init(0x0cbe, 0x0cc4, 1),
        Range16.init(0x0cc6, 0x0cc8, 1),
        Range16.init(0x0cca, 0x0ccc, 1),
        Range16.init(0x0cd5, 0x0cd6, 1),
        Range16.init(0x0ce2, 0x0ce3, 1),
        Range16.init(0x0d00, 0x0d03, 1),
        Range16.init(0x0d3e, 0x0d44, 1),
        Range16.init(0x0d46, 0x0d48, 1),
        Range16.init(0x0d4a, 0x0d4c, 1),
        Range16.init(0x0d57, 0x0d62, 11),
        Range16.init(0x0d63, 0x0d81, 30),
        Range16.init(0x0d82, 0x0d83, 1),
        Range16.init(0x0dcf, 0x0dd4, 1),
        Range16.init(0x0dd6, 0x0dd8, 2),
        Range16.init(0x0dd9, 0x0ddf, 1),
        Range16.init(0x0df2, 0x0df3, 1),
        Range16.init(0x0e31, 0x0e34, 3),
        Range16.init(0x0e35, 0x0e3a, 1),
        Range16.init(0x0e4d, 0x0eb1, 100),
        Range16.init(0x0eb4, 0x0eb9, 1),
        Range16.init(0x0ebb, 0x0ebc, 1),
        Range16.init(0x0ecd, 0x0f71, 164),
        Range16.init(0x0f72, 0x0f81, 1),
        Range16.init(0x0f8d, 0x0f97, 1),
        Range16.init(0x0f99, 0x0fbc, 1),
        Range16.init(0x102b, 0x1036, 1),
        Range16.init(0x1038, 0x103b, 3),
        Range16.init(0x103c, 0x103e, 1),
        Range16.init(0x1056, 0x1059, 1),
        Range16.init(0x105e, 0x1060, 1),
        Range16.init(0x1062, 0x1064, 1),
        Range16.init(0x1067, 0x106d, 1),
        Range16.init(0x1071, 0x1074, 1),
        Range16.init(0x1082, 0x108d, 1),
        Range16.init(0x108f, 0x109a, 11),
        Range16.init(0x109b, 0x109d, 1),
        Range16.init(0x1712, 0x1713, 1),
        Range16.init(0x1732, 0x1733, 1),
        Range16.init(0x1752, 0x1753, 1),
        Range16.init(0x1772, 0x1773, 1),
        Range16.init(0x17b6, 0x17c8, 1),
        Range16.init(0x1885, 0x1886, 1),
        Range16.init(0x18a9, 0x1920, 119),
        Range16.init(0x1921, 0x192b, 1),
        Range16.init(0x1930, 0x1938, 1),
        Range16.init(0x1a17, 0x1a1b, 1),
        Range16.init(0x1a55, 0x1a5e, 1),
        Range16.init(0x1a61, 0x1a74, 1),
        Range16.init(0x1abf, 0x1ac0, 1),
        Range16.init(0x1b00, 0x1b04, 1),
        Range16.init(0x1b35, 0x1b43, 1),
        Range16.init(0x1b80, 0x1b82, 1),
        Range16.init(0x1ba1, 0x1ba9, 1),
        Range16.init(0x1bac, 0x1bad, 1),
        Range16.init(0x1be7, 0x1bf1, 1),
        Range16.init(0x1c24, 0x1c36, 1),
        Range16.init(0x1de7, 0x1df4, 1),
        Range16.init(0x24b6, 0x24e9, 1),
        Range16.init(0x2de0, 0x2dff, 1),
        Range16.init(0xa674, 0xa67b, 1),
        Range16.init(0xa69e, 0xa69f, 1),
        Range16.init(0xa802, 0xa80b, 9),
        Range16.init(0xa823, 0xa827, 1),
        Range16.init(0xa880, 0xa881, 1),
        Range16.init(0xa8b4, 0xa8c3, 1),
        Range16.init(0xa8c5, 0xa8ff, 58),
        Range16.init(0xa926, 0xa92a, 1),
        Range16.init(0xa947, 0xa952, 1),
        Range16.init(0xa980, 0xa983, 1),
        Range16.init(0xa9b4, 0xa9bf, 1),
        Range16.init(0xa9e5, 0xaa29, 68),
        Range16.init(0xaa2a, 0xaa36, 1),
        Range16.init(0xaa43, 0xaa4c, 9),
        Range16.init(0xaa4d, 0xaa7b, 46),
        Range16.init(0xaa7c, 0xaa7d, 1),
        Range16.init(0xaab0, 0xaab2, 2),
        Range16.init(0xaab3, 0xaab4, 1),
        Range16.init(0xaab7, 0xaab8, 1),
        Range16.init(0xaabe, 0xaaeb, 45),
        Range16.init(0xaaec, 0xaaef, 1),
        Range16.init(0xaaf5, 0xabe3, 238),
        Range16.init(0xabe4, 0xabea, 1),
        Range16.init(0xfb1e, 0xfb1e, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10376, 0x1037a, 1),
        Range32.init(0x10a01, 0x10a03, 1),
        Range32.init(0x10a05, 0x10a06, 1),
        Range32.init(0x10a0c, 0x10a0f, 1),
        Range32.init(0x10d24, 0x10d27, 1),
        Range32.init(0x10eab, 0x10eac, 1),
        Range32.init(0x11000, 0x11002, 1),
        Range32.init(0x11038, 0x11045, 1),
        Range32.init(0x11082, 0x110b0, 46),
        Range32.init(0x110b1, 0x110b8, 1),
        Range32.init(0x11100, 0x11102, 1),
        Range32.init(0x11127, 0x11132, 1),
        Range32.init(0x11145, 0x11146, 1),
        Range32.init(0x11180, 0x11182, 1),
        Range32.init(0x111b3, 0x111bf, 1),
        Range32.init(0x111ce, 0x111cf, 1),
        Range32.init(0x1122c, 0x11234, 1),
        Range32.init(0x11237, 0x1123e, 7),
        Range32.init(0x112df, 0x112e8, 1),
        Range32.init(0x11300, 0x11303, 1),
        Range32.init(0x1133e, 0x11344, 1),
        Range32.init(0x11347, 0x11348, 1),
        Range32.init(0x1134b, 0x1134c, 1),
        Range32.init(0x11357, 0x11362, 11),
        Range32.init(0x11363, 0x11435, 210),
        Range32.init(0x11436, 0x11441, 1),
        Range32.init(0x11443, 0x11445, 1),
        Range32.init(0x114b0, 0x114c1, 1),
        Range32.init(0x115af, 0x115b5, 1),
        Range32.init(0x115b8, 0x115be, 1),
        Range32.init(0x115dc, 0x115dd, 1),
        Range32.init(0x11630, 0x1163e, 1),
        Range32.init(0x11640, 0x116ab, 107),
        Range32.init(0x116ac, 0x116b5, 1),
        Range32.init(0x1171d, 0x1172a, 1),
        Range32.init(0x1182c, 0x11838, 1),
        Range32.init(0x11930, 0x11935, 1),
        Range32.init(0x11937, 0x11938, 1),
        Range32.init(0x1193b, 0x1193c, 1),
        Range32.init(0x11940, 0x11942, 2),
        Range32.init(0x119d1, 0x119d7, 1),
        Range32.init(0x119da, 0x119df, 1),
        Range32.init(0x119e4, 0x11a01, 29),
        Range32.init(0x11a02, 0x11a0a, 1),
        Range32.init(0x11a35, 0x11a39, 1),
        Range32.init(0x11a3b, 0x11a3e, 1),
        Range32.init(0x11a51, 0x11a5b, 1),
        Range32.init(0x11a8a, 0x11a97, 1),
        Range32.init(0x11c2f, 0x11c36, 1),
        Range32.init(0x11c38, 0x11c3e, 1),
        Range32.init(0x11c92, 0x11ca7, 1),
        Range32.init(0x11ca9, 0x11cb6, 1),
        Range32.init(0x11d31, 0x11d36, 1),
        Range32.init(0x11d3a, 0x11d3c, 2),
        Range32.init(0x11d3d, 0x11d3f, 2),
        Range32.init(0x11d40, 0x11d41, 1),
        Range32.init(0x11d43, 0x11d47, 4),
        Range32.init(0x11d8a, 0x11d8e, 1),
        Range32.init(0x11d90, 0x11d91, 1),
        Range32.init(0x11d93, 0x11d96, 1),
        Range32.init(0x11ef3, 0x11ef6, 1),
        Range32.init(0x16f4f, 0x16f51, 2),
        Range32.init(0x16f52, 0x16f87, 1),
        Range32.init(0x16f8f, 0x16f92, 1),
        Range32.init(0x16ff0, 0x16ff1, 1),
        Range32.init(0x1bc9e, 0x1e000, 9058),
        Range32.init(0x1e001, 0x1e006, 1),
        Range32.init(0x1e008, 0x1e018, 1),
        Range32.init(0x1e01b, 0x1e021, 1),
        Range32.init(0x1e023, 0x1e024, 1),
        Range32.init(0x1e026, 0x1e02a, 1),
        Range32.init(0x1e947, 0x1f130, 2025),
        Range32.init(0x1f131, 0x1f149, 1),
        Range32.init(0x1f150, 0x1f169, 1),
        Range32.init(0x1f170, 0x1f189, 1),
    },
};

pub const other_default_ignorable_code_point = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x034f, 0x115f, 3600),
        Range16.init(0x1160, 0x17b4, 1620),
        Range16.init(0x17b5, 0x2065, 2224),
        Range16.init(0x3164, 0xffa0, 52796),
        Range16.init(0xfff0, 0xfff8, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0xe0000, 0xe0002, 2),
        Range32.init(0xe0003, 0xe001f, 1),
        Range32.init(0xe0080, 0xe00ff, 1),
        Range32.init(0xe01f0, 0xe0fff, 1),
    },
};

pub const other_grapheme_extend = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x09be, 0x09d7, 25),
        Range16.init(0x0b3e, 0x0b57, 25),
        Range16.init(0x0bbe, 0x0bd7, 25),
        Range16.init(0x0cc2, 0x0cd5, 19),
        Range16.init(0x0cd6, 0x0d3e, 104),
        Range16.init(0x0d57, 0x0dcf, 120),
        Range16.init(0x0ddf, 0x1b35, 3414),
        Range16.init(0x200c, 0x302e, 4130),
        Range16.init(0x302f, 0xff9e, 53103),
        Range16.init(0xff9f, 0xff9f, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1133e, 0x11357, 25),
        Range32.init(0x114b0, 0x114bd, 13),
        Range32.init(0x115af, 0x11930, 897),
        Range32.init(0x1d165, 0x1d16e, 9),
        Range32.init(0x1d16f, 0x1d172, 1),
        Range32.init(0xe0020, 0xe007f, 1),
    },
};

pub const other_id_continue = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x00b7, 0x0387, 720),
        Range16.init(0x1369, 0x1371, 1),
        Range16.init(0x19da, 0x19da, 1),
    },
};

pub const other_id_start = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x1885, 0x1886, 1),
        Range16.init(0x2118, 0x212e, 22),
        Range16.init(0x309b, 0x309c, 1),
    },
};

pub const other_lowercase = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x00aa, 0x00ba, 16),
        Range16.init(0x02b0, 0x02b8, 1),
        Range16.init(0x02c0, 0x02c1, 1),
        Range16.init(0x02e0, 0x02e4, 1),
        Range16.init(0x0345, 0x037a, 53),
        Range16.init(0x1d2c, 0x1d6a, 1),
        Range16.init(0x1d78, 0x1d9b, 35),
        Range16.init(0x1d9c, 0x1dbf, 1),
        Range16.init(0x2071, 0x207f, 14),
        Range16.init(0x2090, 0x209c, 1),
        Range16.init(0x2170, 0x217f, 1),
        Range16.init(0x24d0, 0x24e9, 1),
        Range16.init(0x2c7c, 0x2c7d, 1),
        Range16.init(0xa69c, 0xa69d, 1),
        Range16.init(0xa770, 0xa7f8, 136),
        Range16.init(0xa7f9, 0xab5c, 867),
        Range16.init(0xab5d, 0xab5f, 1),
    },
    .latin_offset = 1,
};

pub const other_math = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x005e, 0x03d0, 882),
        Range16.init(0x03d1, 0x03d2, 1),
        Range16.init(0x03d5, 0x03f0, 27),
        Range16.init(0x03f1, 0x03f4, 3),
        Range16.init(0x03f5, 0x2016, 7201),
        Range16.init(0x2032, 0x2034, 1),
        Range16.init(0x2040, 0x2061, 33),
        Range16.init(0x2062, 0x2064, 1),
        Range16.init(0x207d, 0x207e, 1),
        Range16.init(0x208d, 0x208e, 1),
        Range16.init(0x20d0, 0x20dc, 1),
        Range16.init(0x20e1, 0x20e5, 4),
        Range16.init(0x20e6, 0x20eb, 5),
        Range16.init(0x20ec, 0x20ef, 1),
        Range16.init(0x2102, 0x2107, 5),
        Range16.init(0x210a, 0x2113, 1),
        Range16.init(0x2115, 0x2119, 4),
        Range16.init(0x211a, 0x211d, 1),
        Range16.init(0x2124, 0x2128, 4),
        Range16.init(0x2129, 0x212c, 3),
        Range16.init(0x212d, 0x212f, 2),
        Range16.init(0x2130, 0x2131, 1),
        Range16.init(0x2133, 0x2138, 1),
        Range16.init(0x213c, 0x213f, 1),
        Range16.init(0x2145, 0x2149, 1),
        Range16.init(0x2195, 0x2199, 1),
        Range16.init(0x219c, 0x219f, 1),
        Range16.init(0x21a1, 0x21a2, 1),
        Range16.init(0x21a4, 0x21a5, 1),
        Range16.init(0x21a7, 0x21a9, 2),
        Range16.init(0x21aa, 0x21ad, 1),
        Range16.init(0x21b0, 0x21b1, 1),
        Range16.init(0x21b6, 0x21b7, 1),
        Range16.init(0x21bc, 0x21cd, 1),
        Range16.init(0x21d0, 0x21d1, 1),
        Range16.init(0x21d3, 0x21d5, 2),
        Range16.init(0x21d6, 0x21db, 1),
        Range16.init(0x21dd, 0x21e4, 7),
        Range16.init(0x21e5, 0x2308, 291),
        Range16.init(0x2309, 0x230b, 1),
        Range16.init(0x23b4, 0x23b5, 1),
        Range16.init(0x23b7, 0x23d0, 25),
        Range16.init(0x23e2, 0x25a0, 446),
        Range16.init(0x25a1, 0x25ae, 13),
        Range16.init(0x25af, 0x25b6, 1),
        Range16.init(0x25bc, 0x25c0, 1),
        Range16.init(0x25c6, 0x25c7, 1),
        Range16.init(0x25ca, 0x25cb, 1),
        Range16.init(0x25cf, 0x25d3, 1),
        Range16.init(0x25e2, 0x25e4, 2),
        Range16.init(0x25e7, 0x25ec, 1),
        Range16.init(0x2605, 0x2606, 1),
        Range16.init(0x2640, 0x2642, 2),
        Range16.init(0x2660, 0x2663, 1),
        Range16.init(0x266d, 0x266e, 1),
        Range16.init(0x27c5, 0x27c6, 1),
        Range16.init(0x27e6, 0x27ef, 1),
        Range16.init(0x2983, 0x2998, 1),
        Range16.init(0x29d8, 0x29db, 1),
        Range16.init(0x29fc, 0x29fd, 1),
        Range16.init(0xfe61, 0xfe63, 2),
        Range16.init(0xfe68, 0xff3c, 212),
        Range16.init(0xff3e, 0xff3e, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1d400, 0x1d454, 1),
        Range32.init(0x1d456, 0x1d49c, 1),
        Range32.init(0x1d49e, 0x1d49f, 1),
        Range32.init(0x1d4a2, 0x1d4a5, 3),
        Range32.init(0x1d4a6, 0x1d4a9, 3),
        Range32.init(0x1d4aa, 0x1d4ac, 1),
        Range32.init(0x1d4ae, 0x1d4b9, 1),
        Range32.init(0x1d4bb, 0x1d4bd, 2),
        Range32.init(0x1d4be, 0x1d4c3, 1),
        Range32.init(0x1d4c5, 0x1d505, 1),
        Range32.init(0x1d507, 0x1d50a, 1),
        Range32.init(0x1d50d, 0x1d514, 1),
        Range32.init(0x1d516, 0x1d51c, 1),
        Range32.init(0x1d51e, 0x1d539, 1),
        Range32.init(0x1d53b, 0x1d53e, 1),
        Range32.init(0x1d540, 0x1d544, 1),
        Range32.init(0x1d546, 0x1d54a, 4),
        Range32.init(0x1d54b, 0x1d550, 1),
        Range32.init(0x1d552, 0x1d6a5, 1),
        Range32.init(0x1d6a8, 0x1d6c0, 1),
        Range32.init(0x1d6c2, 0x1d6da, 1),
        Range32.init(0x1d6dc, 0x1d6fa, 1),
        Range32.init(0x1d6fc, 0x1d714, 1),
        Range32.init(0x1d716, 0x1d734, 1),
        Range32.init(0x1d736, 0x1d74e, 1),
        Range32.init(0x1d750, 0x1d76e, 1),
        Range32.init(0x1d770, 0x1d788, 1),
        Range32.init(0x1d78a, 0x1d7a8, 1),
        Range32.init(0x1d7aa, 0x1d7c2, 1),
        Range32.init(0x1d7c4, 0x1d7cb, 1),
        Range32.init(0x1d7ce, 0x1d7ff, 1),
        Range32.init(0x1ee00, 0x1ee03, 1),
        Range32.init(0x1ee05, 0x1ee1f, 1),
        Range32.init(0x1ee21, 0x1ee22, 1),
        Range32.init(0x1ee24, 0x1ee27, 3),
        Range32.init(0x1ee29, 0x1ee32, 1),
        Range32.init(0x1ee34, 0x1ee37, 1),
        Range32.init(0x1ee39, 0x1ee3b, 2),
        Range32.init(0x1ee42, 0x1ee47, 5),
        Range32.init(0x1ee49, 0x1ee4d, 2),
        Range32.init(0x1ee4e, 0x1ee4f, 1),
        Range32.init(0x1ee51, 0x1ee52, 1),
        Range32.init(0x1ee54, 0x1ee57, 3),
        Range32.init(0x1ee59, 0x1ee61, 2),
        Range32.init(0x1ee62, 0x1ee64, 2),
        Range32.init(0x1ee67, 0x1ee6a, 1),
        Range32.init(0x1ee6c, 0x1ee72, 1),
        Range32.init(0x1ee74, 0x1ee77, 1),
        Range32.init(0x1ee79, 0x1ee7c, 1),
        Range32.init(0x1ee7e, 0x1ee80, 2),
        Range32.init(0x1ee81, 0x1ee89, 1),
        Range32.init(0x1ee8b, 0x1ee9b, 1),
        Range32.init(0x1eea1, 0x1eea3, 1),
        Range32.init(0x1eea5, 0x1eea9, 1),
        Range32.init(0x1eeab, 0x1eebb, 1),
    },
};

pub const other_uppercase = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x2160, 0x216f, 1),
        Range16.init(0x24b6, 0x24cf, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1f130, 0x1f149, 1),
        Range32.init(0x1f150, 0x1f169, 1),
        Range32.init(0x1f170, 0x1f189, 1),
    },
};

pub const pattern_syntax = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0021, 0x002f, 1),
        Range16.init(0x003a, 0x0040, 1),
        Range16.init(0x005b, 0x005e, 1),
        Range16.init(0x0060, 0x007b, 27),
        Range16.init(0x007c, 0x007e, 1),
        Range16.init(0x00a1, 0x00a7, 1),
        Range16.init(0x00a9, 0x00ab, 2),
        Range16.init(0x00ac, 0x00b0, 2),
        Range16.init(0x00b1, 0x00bb, 5),
        Range16.init(0x00bf, 0x00d7, 24),
        Range16.init(0x00f7, 0x2010, 7961),
        Range16.init(0x2011, 0x2027, 1),
        Range16.init(0x2030, 0x203e, 1),
        Range16.init(0x2041, 0x2053, 1),
        Range16.init(0x2055, 0x205e, 1),
        Range16.init(0x2190, 0x245f, 1),
        Range16.init(0x2500, 0x2775, 1),
        Range16.init(0x2794, 0x2bff, 1),
        Range16.init(0x2e00, 0x2e7f, 1),
        Range16.init(0x3001, 0x3003, 1),
        Range16.init(0x3008, 0x3020, 1),
        Range16.init(0x3030, 0xfd3e, 52494),
        Range16.init(0xfd3f, 0xfe45, 262),
        Range16.init(0xfe46, 0xfe46, 1),
    },
    .latin_offset = 10,
};

pub const pattern_white_space = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0009, 0x000d, 1),
        Range16.init(0x0020, 0x0085, 101),
        Range16.init(0x200e, 0x200f, 1),
        Range16.init(0x2028, 0x2029, 1),
    },
    .latin_offset = 2,
};

pub const prepended_concatenation_mark = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0600, 0x0605, 1),
        Range16.init(0x06dd, 0x070f, 50),
        Range16.init(0x08e2, 0x08e2, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x110bd, 0x110cd, 16),
    },
};

pub const quotation_mark = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0022, 0x0027, 5),
        Range16.init(0x00ab, 0x00bb, 16),
        Range16.init(0x2018, 0x201f, 1),
        Range16.init(0x2039, 0x203a, 1),
        Range16.init(0x2e42, 0x300c, 458),
        Range16.init(0x300d, 0x300f, 1),
        Range16.init(0x301d, 0x301f, 1),
        Range16.init(0xfe41, 0xfe44, 1),
        Range16.init(0xff02, 0xff07, 5),
        Range16.init(0xff62, 0xff63, 1),
    },
    .latin_offset = 2,
};

pub const radical = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x2e80, 0x2e99, 1),
        Range16.init(0x2e9b, 0x2ef3, 1),
        Range16.init(0x2f00, 0x2fd5, 1),
    },
};

pub const regional_indicator = RangeTable{
    .r32 = &[_]Range32{
        Range32.init(0x1f1e6, 0x1f1ff, 1),
    },
};

pub const sentence_terminal = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0021, 0x002e, 13),
        Range16.init(0x003f, 0x0589, 1354),
        Range16.init(0x061e, 0x061f, 1),
        Range16.init(0x06d4, 0x0700, 44),
        Range16.init(0x0701, 0x0702, 1),
        Range16.init(0x07f9, 0x0837, 62),
        Range16.init(0x0839, 0x083d, 4),
        Range16.init(0x083e, 0x0964, 294),
        Range16.init(0x0965, 0x104a, 1765),
        Range16.init(0x104b, 0x1362, 791),
        Range16.init(0x1367, 0x1368, 1),
        Range16.init(0x166e, 0x1735, 199),
        Range16.init(0x1736, 0x1803, 205),
        Range16.init(0x1809, 0x1944, 315),
        Range16.init(0x1945, 0x1aa8, 355),
        Range16.init(0x1aa9, 0x1aab, 1),
        Range16.init(0x1b5a, 0x1b5b, 1),
        Range16.init(0x1b5e, 0x1b5f, 1),
        Range16.init(0x1c3b, 0x1c3c, 1),
        Range16.init(0x1c7e, 0x1c7f, 1),
        Range16.init(0x203c, 0x203d, 1),
        Range16.init(0x2047, 0x2049, 1),
        Range16.init(0x2e2e, 0x2e3c, 14),
        Range16.init(0x3002, 0xa4ff, 29949),
        Range16.init(0xa60e, 0xa60f, 1),
        Range16.init(0xa6f3, 0xa6f7, 4),
        Range16.init(0xa876, 0xa877, 1),
        Range16.init(0xa8ce, 0xa8cf, 1),
        Range16.init(0xa92f, 0xa9c8, 153),
        Range16.init(0xa9c9, 0xaa5d, 148),
        Range16.init(0xaa5e, 0xaa5f, 1),
        Range16.init(0xaaf0, 0xaaf1, 1),
        Range16.init(0xabeb, 0xfe52, 21095),
        Range16.init(0xfe56, 0xfe57, 1),
        Range16.init(0xff01, 0xff0e, 13),
        Range16.init(0xff1f, 0xff61, 66),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10a56, 0x10a57, 1),
        Range32.init(0x10f55, 0x10f59, 1),
        Range32.init(0x11047, 0x11048, 1),
        Range32.init(0x110be, 0x110c1, 1),
        Range32.init(0x11141, 0x11143, 1),
        Range32.init(0x111c5, 0x111c6, 1),
        Range32.init(0x111cd, 0x111de, 17),
        Range32.init(0x111df, 0x11238, 89),
        Range32.init(0x11239, 0x1123b, 2),
        Range32.init(0x1123c, 0x112a9, 109),
        Range32.init(0x1144b, 0x1144c, 1),
        Range32.init(0x115c2, 0x115c3, 1),
        Range32.init(0x115c9, 0x115d7, 1),
        Range32.init(0x11641, 0x11642, 1),
        Range32.init(0x1173c, 0x1173e, 1),
        Range32.init(0x11944, 0x11946, 2),
        Range32.init(0x11a42, 0x11a43, 1),
        Range32.init(0x11a9b, 0x11a9c, 1),
        Range32.init(0x11c41, 0x11c42, 1),
        Range32.init(0x11ef7, 0x11ef8, 1),
        Range32.init(0x16a6e, 0x16a6f, 1),
        Range32.init(0x16af5, 0x16b37, 66),
        Range32.init(0x16b38, 0x16b44, 12),
        Range32.init(0x16e98, 0x1bc9f, 19975),
        Range32.init(0x1da88, 0x1da88, 1),
    },
    .latin_offset = 1,
};

pub const soft_dotted = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0069, 0x006a, 1),
        Range16.init(0x012f, 0x0249, 282),
        Range16.init(0x0268, 0x029d, 53),
        Range16.init(0x02b2, 0x03f3, 321),
        Range16.init(0x0456, 0x0458, 2),
        Range16.init(0x1d62, 0x1d96, 52),
        Range16.init(0x1da4, 0x1da8, 4),
        Range16.init(0x1e2d, 0x1ecb, 158),
        Range16.init(0x2071, 0x2148, 215),
        Range16.init(0x2149, 0x2c7c, 2867),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1d422, 0x1d423, 1),
        Range32.init(0x1d456, 0x1d457, 1),
        Range32.init(0x1d48a, 0x1d48b, 1),
        Range32.init(0x1d4be, 0x1d4bf, 1),
        Range32.init(0x1d4f2, 0x1d4f3, 1),
        Range32.init(0x1d526, 0x1d527, 1),
        Range32.init(0x1d55a, 0x1d55b, 1),
        Range32.init(0x1d58e, 0x1d58f, 1),
        Range32.init(0x1d5c2, 0x1d5c3, 1),
        Range32.init(0x1d5f6, 0x1d5f7, 1),
        Range32.init(0x1d62a, 0x1d62b, 1),
        Range32.init(0x1d65e, 0x1d65f, 1),
        Range32.init(0x1d692, 0x1d693, 1),
    },
    .latin_offset = 1,
};

pub const terminal_punctuation = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0021, 0x002c, 11),
        Range16.init(0x002e, 0x003a, 12),
        Range16.init(0x003b, 0x003f, 4),
        Range16.init(0x037e, 0x0387, 9),
        Range16.init(0x0589, 0x05c3, 58),
        Range16.init(0x060c, 0x061b, 15),
        Range16.init(0x061e, 0x061f, 1),
        Range16.init(0x06d4, 0x0700, 44),
        Range16.init(0x0701, 0x070a, 1),
        Range16.init(0x070c, 0x07f8, 236),
        Range16.init(0x07f9, 0x0830, 55),
        Range16.init(0x0831, 0x083e, 1),
        Range16.init(0x085e, 0x0964, 262),
        Range16.init(0x0965, 0x0e5a, 1269),
        Range16.init(0x0e5b, 0x0f08, 173),
        Range16.init(0x0f0d, 0x0f12, 1),
        Range16.init(0x104a, 0x104b, 1),
        Range16.init(0x1361, 0x1368, 1),
        Range16.init(0x166e, 0x16eb, 125),
        Range16.init(0x16ec, 0x16ed, 1),
        Range16.init(0x1735, 0x1736, 1),
        Range16.init(0x17d4, 0x17d6, 1),
        Range16.init(0x17da, 0x1802, 40),
        Range16.init(0x1803, 0x1805, 1),
        Range16.init(0x1808, 0x1809, 1),
        Range16.init(0x1944, 0x1945, 1),
        Range16.init(0x1aa8, 0x1aab, 1),
        Range16.init(0x1b5a, 0x1b5b, 1),
        Range16.init(0x1b5d, 0x1b5f, 1),
        Range16.init(0x1c3b, 0x1c3f, 1),
        Range16.init(0x1c7e, 0x1c7f, 1),
        Range16.init(0x203c, 0x203d, 1),
        Range16.init(0x2047, 0x2049, 1),
        Range16.init(0x2e2e, 0x2e3c, 14),
        Range16.init(0x2e41, 0x2e4c, 11),
        Range16.init(0x2e4e, 0x2e4f, 1),
        Range16.init(0x3001, 0x3002, 1),
        Range16.init(0xa4fe, 0xa4ff, 1),
        Range16.init(0xa60d, 0xa60f, 1),
        Range16.init(0xa6f3, 0xa6f7, 1),
        Range16.init(0xa876, 0xa877, 1),
        Range16.init(0xa8ce, 0xa8cf, 1),
        Range16.init(0xa92f, 0xa9c7, 152),
        Range16.init(0xa9c8, 0xa9c9, 1),
        Range16.init(0xaa5d, 0xaa5f, 1),
        Range16.init(0xaadf, 0xaaf0, 17),
        Range16.init(0xaaf1, 0xabeb, 250),
        Range16.init(0xfe50, 0xfe52, 1),
        Range16.init(0xfe54, 0xfe57, 1),
        Range16.init(0xff01, 0xff0c, 11),
        Range16.init(0xff0e, 0xff1a, 12),
        Range16.init(0xff1b, 0xff1f, 4),
        Range16.init(0xff61, 0xff64, 3),
    },
    .r32 = &[_]Range32{
        Range32.init(0x1039f, 0x103d0, 49),
        Range32.init(0x10857, 0x1091f, 200),
        Range32.init(0x10a56, 0x10a57, 1),
        Range32.init(0x10af0, 0x10af5, 1),
        Range32.init(0x10b3a, 0x10b3f, 1),
        Range32.init(0x10b99, 0x10b9c, 1),
        Range32.init(0x10f55, 0x10f59, 1),
        Range32.init(0x11047, 0x1104d, 1),
        Range32.init(0x110be, 0x110c1, 1),
        Range32.init(0x11141, 0x11143, 1),
        Range32.init(0x111c5, 0x111c6, 1),
        Range32.init(0x111cd, 0x111de, 17),
        Range32.init(0x111df, 0x11238, 89),
        Range32.init(0x11239, 0x1123c, 1),
        Range32.init(0x112a9, 0x1144b, 418),
        Range32.init(0x1144c, 0x1144d, 1),
        Range32.init(0x1145a, 0x1145b, 1),
        Range32.init(0x115c2, 0x115c5, 1),
        Range32.init(0x115c9, 0x115d7, 1),
        Range32.init(0x11641, 0x11642, 1),
        Range32.init(0x1173c, 0x1173e, 1),
        Range32.init(0x11944, 0x11946, 2),
        Range32.init(0x11a42, 0x11a43, 1),
        Range32.init(0x11a9b, 0x11a9c, 1),
        Range32.init(0x11aa1, 0x11aa2, 1),
        Range32.init(0x11c41, 0x11c43, 1),
        Range32.init(0x11c71, 0x11ef7, 646),
        Range32.init(0x11ef8, 0x12470, 1400),
        Range32.init(0x12471, 0x12474, 1),
        Range32.init(0x16a6e, 0x16a6f, 1),
        Range32.init(0x16af5, 0x16b37, 66),
        Range32.init(0x16b38, 0x16b39, 1),
        Range32.init(0x16b44, 0x16e97, 851),
        Range32.init(0x16e98, 0x1bc9f, 19975),
        Range32.init(0x1da87, 0x1da8a, 1),
    },
    .latin_offset = 3,
};

pub const unified_ideograph = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x3400, 0x4dbf, 1),
        Range16.init(0x4e00, 0x9ffc, 1),
        Range16.init(0xfa0e, 0xfa0f, 1),
        Range16.init(0xfa11, 0xfa13, 2),
        Range16.init(0xfa14, 0xfa1f, 11),
        Range16.init(0xfa21, 0xfa23, 2),
        Range16.init(0xfa24, 0xfa27, 3),
        Range16.init(0xfa28, 0xfa29, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x20000, 0x2a6dd, 1),
        Range32.init(0x2a700, 0x2b734, 1),
        Range32.init(0x2b740, 0x2b81d, 1),
        Range32.init(0x2b820, 0x2cea1, 1),
        Range32.init(0x2ceb0, 0x2ebe0, 1),
        Range32.init(0x30000, 0x3134a, 1),
    },
};

pub const variation_selector = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x180b, 0x180d, 1),
        Range16.init(0xfe00, 0xfe0f, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0xe0100, 0xe01ef, 1),
    },
};

pub const white_space = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0009, 0x000d, 1),
        Range16.init(0x0020, 0x0085, 101),
        Range16.init(0x00a0, 0x1680, 5600),
        Range16.init(0x2000, 0x200a, 1),
        Range16.init(0x2028, 0x2029, 1),
        Range16.init(0x202f, 0x205f, 48),
        Range16.init(0x3000, 0x3000, 1),
    },
    .latin_offset = 2,
};

// CaseRanges is the table describing case mappings for all letters with
// non-self mappings.
pub const Case = enum(usize) {
    Upper,
    Lower,
    Title,
    Max,

    pub fn rune(self: Case) i32 {
        return @intCast(i32, @enumToInt(self));
    }
};

pub const CaseRange = struct {
    lo: u32,
    hi: u32,
    delta: []const i32,

    pub fn init(lo: u32, hi: u32, delta: []const i32) CaseRange {
        return CaseRange{ .lo = lo, .hi = hi, .delta = delta };
    }
};

pub const CaseRanges = [_]CaseRange{
    CaseRange.init(0x0041, 0x005A, &[_]i32{ 0, 32, 0 }),
    CaseRange.init(0x0061, 0x007A, &[_]i32{ -32, 0, -32 }),
    CaseRange.init(0x00B5, 0x00B5, &[_]i32{ 743, 0, 743 }),
    CaseRange.init(0x00C0, 0x00D6, &[_]i32{ 0, 32, 0 }),
    CaseRange.init(0x00D8, 0x00DE, &[_]i32{ 0, 32, 0 }),
    CaseRange.init(0x00E0, 0x00F6, &[_]i32{ -32, 0, -32 }),
    CaseRange.init(0x00F8, 0x00FE, &[_]i32{ -32, 0, -32 }),
    CaseRange.init(0x00FF, 0x00FF, &[_]i32{ 121, 0, 121 }),
    CaseRange.init(0x0100, 0x012F, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x0130, 0x0130, &[_]i32{ 0, -199, 0 }),
    CaseRange.init(0x0131, 0x0131, &[_]i32{ -232, 0, -232 }),
    CaseRange.init(0x0132, 0x0137, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x0139, 0x0148, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x014A, 0x0177, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x0178, 0x0178, &[_]i32{ 0, -121, 0 }),
    CaseRange.init(0x0179, 0x017E, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x017F, 0x017F, &[_]i32{ -300, 0, -300 }),
    CaseRange.init(0x0180, 0x0180, &[_]i32{ 195, 0, 195 }),
    CaseRange.init(0x0181, 0x0181, &[_]i32{ 0, 210, 0 }),
    CaseRange.init(0x0182, 0x0185, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x0186, 0x0186, &[_]i32{ 0, 206, 0 }),
    CaseRange.init(0x0187, 0x0188, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x0189, 0x018A, &[_]i32{ 0, 205, 0 }),
    CaseRange.init(0x018B, 0x018C, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x018E, 0x018E, &[_]i32{ 0, 79, 0 }),
    CaseRange.init(0x018F, 0x018F, &[_]i32{ 0, 202, 0 }),
    CaseRange.init(0x0190, 0x0190, &[_]i32{ 0, 203, 0 }),
    CaseRange.init(0x0191, 0x0192, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x0193, 0x0193, &[_]i32{ 0, 205, 0 }),
    CaseRange.init(0x0194, 0x0194, &[_]i32{ 0, 207, 0 }),
    CaseRange.init(0x0195, 0x0195, &[_]i32{ 97, 0, 97 }),
    CaseRange.init(0x0196, 0x0196, &[_]i32{ 0, 211, 0 }),
    CaseRange.init(0x0197, 0x0197, &[_]i32{ 0, 209, 0 }),
    CaseRange.init(0x0198, 0x0199, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x019A, 0x019A, &[_]i32{ 163, 0, 163 }),
    CaseRange.init(0x019C, 0x019C, &[_]i32{ 0, 211, 0 }),
    CaseRange.init(0x019D, 0x019D, &[_]i32{ 0, 213, 0 }),
    CaseRange.init(0x019E, 0x019E, &[_]i32{ 130, 0, 130 }),
    CaseRange.init(0x019F, 0x019F, &[_]i32{ 0, 214, 0 }),
    CaseRange.init(0x01A0, 0x01A5, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x01A6, 0x01A6, &[_]i32{ 0, 218, 0 }),
    CaseRange.init(0x01A7, 0x01A8, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x01A9, 0x01A9, &[_]i32{ 0, 218, 0 }),
    CaseRange.init(0x01AC, 0x01AD, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x01AE, 0x01AE, &[_]i32{ 0, 218, 0 }),
    CaseRange.init(0x01AF, 0x01B0, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x01B1, 0x01B2, &[_]i32{ 0, 217, 0 }),
    CaseRange.init(0x01B3, 0x01B6, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x01B7, 0x01B7, &[_]i32{ 0, 219, 0 }),
    CaseRange.init(0x01B8, 0x01B9, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x01BC, 0x01BD, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x01BF, 0x01BF, &[_]i32{ 56, 0, 56 }),
    CaseRange.init(0x01C4, 0x01C4, &[_]i32{ 0, 2, 1 }),
    CaseRange.init(0x01C5, 0x01C5, &[_]i32{ -1, 1, 0 }),
    CaseRange.init(0x01C6, 0x01C6, &[_]i32{ -2, 0, -1 }),
    CaseRange.init(0x01C7, 0x01C7, &[_]i32{ 0, 2, 1 }),
    CaseRange.init(0x01C8, 0x01C8, &[_]i32{ -1, 1, 0 }),
    CaseRange.init(0x01C9, 0x01C9, &[_]i32{ -2, 0, -1 }),
    CaseRange.init(0x01CA, 0x01CA, &[_]i32{ 0, 2, 1 }),
    CaseRange.init(0x01CB, 0x01CB, &[_]i32{ -1, 1, 0 }),
    CaseRange.init(0x01CC, 0x01CC, &[_]i32{ -2, 0, -1 }),
    CaseRange.init(0x01CD, 0x01DC, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x01DD, 0x01DD, &[_]i32{ -79, 0, -79 }),
    CaseRange.init(0x01DE, 0x01EF, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x01F1, 0x01F1, &[_]i32{ 0, 2, 1 }),
    CaseRange.init(0x01F2, 0x01F2, &[_]i32{ -1, 1, 0 }),
    CaseRange.init(0x01F3, 0x01F3, &[_]i32{ -2, 0, -1 }),
    CaseRange.init(0x01F4, 0x01F5, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x01F6, 0x01F6, &[_]i32{ 0, -97, 0 }),
    CaseRange.init(0x01F7, 0x01F7, &[_]i32{ 0, -56, 0 }),
    CaseRange.init(0x01F8, 0x021F, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x0220, 0x0220, &[_]i32{ 0, -130, 0 }),
    CaseRange.init(0x0222, 0x0233, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x023A, 0x023A, &[_]i32{ 0, 10795, 0 }),
    CaseRange.init(0x023B, 0x023C, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x023D, 0x023D, &[_]i32{ 0, -163, 0 }),
    CaseRange.init(0x023E, 0x023E, &[_]i32{ 0, 10792, 0 }),
    CaseRange.init(0x023F, 0x0240, &[_]i32{ 10815, 0, 10815 }),
    CaseRange.init(0x0241, 0x0242, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x0243, 0x0243, &[_]i32{ 0, -195, 0 }),
    CaseRange.init(0x0244, 0x0244, &[_]i32{ 0, 69, 0 }),
    CaseRange.init(0x0245, 0x0245, &[_]i32{ 0, 71, 0 }),
    CaseRange.init(0x0246, 0x024F, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x0250, 0x0250, &[_]i32{ 10783, 0, 10783 }),
    CaseRange.init(0x0251, 0x0251, &[_]i32{ 10780, 0, 10780 }),
    CaseRange.init(0x0252, 0x0252, &[_]i32{ 10782, 0, 10782 }),
    CaseRange.init(0x0253, 0x0253, &[_]i32{ -210, 0, -210 }),
    CaseRange.init(0x0254, 0x0254, &[_]i32{ -206, 0, -206 }),
    CaseRange.init(0x0256, 0x0257, &[_]i32{ -205, 0, -205 }),
    CaseRange.init(0x0259, 0x0259, &[_]i32{ -202, 0, -202 }),
    CaseRange.init(0x025B, 0x025B, &[_]i32{ -203, 0, -203 }),
    CaseRange.init(0x025C, 0x025C, &[_]i32{ 42319, 0, 42319 }),
    CaseRange.init(0x0260, 0x0260, &[_]i32{ -205, 0, -205 }),
    CaseRange.init(0x0261, 0x0261, &[_]i32{ 42315, 0, 42315 }),
    CaseRange.init(0x0263, 0x0263, &[_]i32{ -207, 0, -207 }),
    CaseRange.init(0x0265, 0x0265, &[_]i32{ 42280, 0, 42280 }),
    CaseRange.init(0x0266, 0x0266, &[_]i32{ 42308, 0, 42308 }),
    CaseRange.init(0x0268, 0x0268, &[_]i32{ -209, 0, -209 }),
    CaseRange.init(0x0269, 0x0269, &[_]i32{ -211, 0, -211 }),
    CaseRange.init(0x026A, 0x026A, &[_]i32{ 42308, 0, 42308 }),
    CaseRange.init(0x026B, 0x026B, &[_]i32{ 10743, 0, 10743 }),
    CaseRange.init(0x026C, 0x026C, &[_]i32{ 42305, 0, 42305 }),
    CaseRange.init(0x026F, 0x026F, &[_]i32{ -211, 0, -211 }),
    CaseRange.init(0x0271, 0x0271, &[_]i32{ 10749, 0, 10749 }),
    CaseRange.init(0x0272, 0x0272, &[_]i32{ -213, 0, -213 }),
    CaseRange.init(0x0275, 0x0275, &[_]i32{ -214, 0, -214 }),
    CaseRange.init(0x027D, 0x027D, &[_]i32{ 10727, 0, 10727 }),
    CaseRange.init(0x0280, 0x0280, &[_]i32{ -218, 0, -218 }),
    CaseRange.init(0x0282, 0x0282, &[_]i32{ 42307, 0, 42307 }),
    CaseRange.init(0x0283, 0x0283, &[_]i32{ -218, 0, -218 }),
    CaseRange.init(0x0287, 0x0287, &[_]i32{ 42282, 0, 42282 }),
    CaseRange.init(0x0288, 0x0288, &[_]i32{ -218, 0, -218 }),
    CaseRange.init(0x0289, 0x0289, &[_]i32{ -69, 0, -69 }),
    CaseRange.init(0x028A, 0x028B, &[_]i32{ -217, 0, -217 }),
    CaseRange.init(0x028C, 0x028C, &[_]i32{ -71, 0, -71 }),
    CaseRange.init(0x0292, 0x0292, &[_]i32{ -219, 0, -219 }),
    CaseRange.init(0x029D, 0x029D, &[_]i32{ 42261, 0, 42261 }),
    CaseRange.init(0x029E, 0x029E, &[_]i32{ 42258, 0, 42258 }),
    CaseRange.init(0x0345, 0x0345, &[_]i32{ 84, 0, 84 }),
    CaseRange.init(0x0370, 0x0373, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x0376, 0x0377, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x037B, 0x037D, &[_]i32{ 130, 0, 130 }),
    CaseRange.init(0x037F, 0x037F, &[_]i32{ 0, 116, 0 }),
    CaseRange.init(0x0386, 0x0386, &[_]i32{ 0, 38, 0 }),
    CaseRange.init(0x0388, 0x038A, &[_]i32{ 0, 37, 0 }),
    CaseRange.init(0x038C, 0x038C, &[_]i32{ 0, 64, 0 }),
    CaseRange.init(0x038E, 0x038F, &[_]i32{ 0, 63, 0 }),
    CaseRange.init(0x0391, 0x03A1, &[_]i32{ 0, 32, 0 }),
    CaseRange.init(0x03A3, 0x03AB, &[_]i32{ 0, 32, 0 }),
    CaseRange.init(0x03AC, 0x03AC, &[_]i32{ -38, 0, -38 }),
    CaseRange.init(0x03AD, 0x03AF, &[_]i32{ -37, 0, -37 }),
    CaseRange.init(0x03B1, 0x03C1, &[_]i32{ -32, 0, -32 }),
    CaseRange.init(0x03C2, 0x03C2, &[_]i32{ -31, 0, -31 }),
    CaseRange.init(0x03C3, 0x03CB, &[_]i32{ -32, 0, -32 }),
    CaseRange.init(0x03CC, 0x03CC, &[_]i32{ -64, 0, -64 }),
    CaseRange.init(0x03CD, 0x03CE, &[_]i32{ -63, 0, -63 }),
    CaseRange.init(0x03CF, 0x03CF, &[_]i32{ 0, 8, 0 }),
    CaseRange.init(0x03D0, 0x03D0, &[_]i32{ -62, 0, -62 }),
    CaseRange.init(0x03D1, 0x03D1, &[_]i32{ -57, 0, -57 }),
    CaseRange.init(0x03D5, 0x03D5, &[_]i32{ -47, 0, -47 }),
    CaseRange.init(0x03D6, 0x03D6, &[_]i32{ -54, 0, -54 }),
    CaseRange.init(0x03D7, 0x03D7, &[_]i32{ -8, 0, -8 }),
    CaseRange.init(0x03D8, 0x03EF, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x03F0, 0x03F0, &[_]i32{ -86, 0, -86 }),
    CaseRange.init(0x03F1, 0x03F1, &[_]i32{ -80, 0, -80 }),
    CaseRange.init(0x03F2, 0x03F2, &[_]i32{ 7, 0, 7 }),
    CaseRange.init(0x03F3, 0x03F3, &[_]i32{ -116, 0, -116 }),
    CaseRange.init(0x03F4, 0x03F4, &[_]i32{ 0, -60, 0 }),
    CaseRange.init(0x03F5, 0x03F5, &[_]i32{ -96, 0, -96 }),
    CaseRange.init(0x03F7, 0x03F8, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x03F9, 0x03F9, &[_]i32{ 0, -7, 0 }),
    CaseRange.init(0x03FA, 0x03FB, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x03FD, 0x03FF, &[_]i32{ 0, -130, 0 }),
    CaseRange.init(0x0400, 0x040F, &[_]i32{ 0, 80, 0 }),
    CaseRange.init(0x0410, 0x042F, &[_]i32{ 0, 32, 0 }),
    CaseRange.init(0x0430, 0x044F, &[_]i32{ -32, 0, -32 }),
    CaseRange.init(0x0450, 0x045F, &[_]i32{ -80, 0, -80 }),
    CaseRange.init(0x0460, 0x0481, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x048A, 0x04BF, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x04C0, 0x04C0, &[_]i32{ 0, 15, 0 }),
    CaseRange.init(0x04C1, 0x04CE, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x04CF, 0x04CF, &[_]i32{ -15, 0, -15 }),
    CaseRange.init(0x04D0, 0x052F, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x0531, 0x0556, &[_]i32{ 0, 48, 0 }),
    CaseRange.init(0x0561, 0x0586, &[_]i32{ -48, 0, -48 }),
    CaseRange.init(0x10A0, 0x10C5, &[_]i32{ 0, 7264, 0 }),
    CaseRange.init(0x10C7, 0x10C7, &[_]i32{ 0, 7264, 0 }),
    CaseRange.init(0x10CD, 0x10CD, &[_]i32{ 0, 7264, 0 }),
    CaseRange.init(0x10D0, 0x10FA, &[_]i32{ 3008, 0, 0 }),
    CaseRange.init(0x10FD, 0x10FF, &[_]i32{ 3008, 0, 0 }),
    CaseRange.init(0x13A0, 0x13EF, &[_]i32{ 0, 38864, 0 }),
    CaseRange.init(0x13F0, 0x13F5, &[_]i32{ 0, 8, 0 }),
    CaseRange.init(0x13F8, 0x13FD, &[_]i32{ -8, 0, -8 }),
    CaseRange.init(0x1C80, 0x1C80, &[_]i32{ -6254, 0, -6254 }),
    CaseRange.init(0x1C81, 0x1C81, &[_]i32{ -6253, 0, -6253 }),
    CaseRange.init(0x1C82, 0x1C82, &[_]i32{ -6244, 0, -6244 }),
    CaseRange.init(0x1C83, 0x1C84, &[_]i32{ -6242, 0, -6242 }),
    CaseRange.init(0x1C85, 0x1C85, &[_]i32{ -6243, 0, -6243 }),
    CaseRange.init(0x1C86, 0x1C86, &[_]i32{ -6236, 0, -6236 }),
    CaseRange.init(0x1C87, 0x1C87, &[_]i32{ -6181, 0, -6181 }),
    CaseRange.init(0x1C88, 0x1C88, &[_]i32{ 35266, 0, 35266 }),
    CaseRange.init(0x1C90, 0x1CBA, &[_]i32{ 0, -3008, 0 }),
    CaseRange.init(0x1CBD, 0x1CBF, &[_]i32{ 0, -3008, 0 }),
    CaseRange.init(0x1D79, 0x1D79, &[_]i32{ 35332, 0, 35332 }),
    CaseRange.init(0x1D7D, 0x1D7D, &[_]i32{ 3814, 0, 3814 }),
    CaseRange.init(0x1D8E, 0x1D8E, &[_]i32{ 35384, 0, 35384 }),
    CaseRange.init(0x1E00, 0x1E95, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x1E9B, 0x1E9B, &[_]i32{ -59, 0, -59 }),
    CaseRange.init(0x1E9E, 0x1E9E, &[_]i32{ 0, -7615, 0 }),
    CaseRange.init(0x1EA0, 0x1EFF, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x1F00, 0x1F07, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F08, 0x1F0F, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1F10, 0x1F15, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F18, 0x1F1D, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1F20, 0x1F27, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F28, 0x1F2F, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1F30, 0x1F37, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F38, 0x1F3F, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1F40, 0x1F45, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F48, 0x1F4D, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1F51, 0x1F51, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F53, 0x1F53, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F55, 0x1F55, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F57, 0x1F57, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F59, 0x1F59, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1F5B, 0x1F5B, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1F5D, 0x1F5D, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1F5F, 0x1F5F, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1F60, 0x1F67, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F68, 0x1F6F, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1F70, 0x1F71, &[_]i32{ 74, 0, 74 }),
    CaseRange.init(0x1F72, 0x1F75, &[_]i32{ 86, 0, 86 }),
    CaseRange.init(0x1F76, 0x1F77, &[_]i32{ 100, 0, 100 }),
    CaseRange.init(0x1F78, 0x1F79, &[_]i32{ 128, 0, 128 }),
    CaseRange.init(0x1F7A, 0x1F7B, &[_]i32{ 112, 0, 112 }),
    CaseRange.init(0x1F7C, 0x1F7D, &[_]i32{ 126, 0, 126 }),
    CaseRange.init(0x1F80, 0x1F87, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F88, 0x1F8F, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1F90, 0x1F97, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1F98, 0x1F9F, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1FA0, 0x1FA7, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1FA8, 0x1FAF, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1FB0, 0x1FB1, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1FB3, 0x1FB3, &[_]i32{ 9, 0, 9 }),
    CaseRange.init(0x1FB8, 0x1FB9, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1FBA, 0x1FBB, &[_]i32{ 0, -74, 0 }),
    CaseRange.init(0x1FBC, 0x1FBC, &[_]i32{ 0, -9, 0 }),
    CaseRange.init(0x1FBE, 0x1FBE, &[_]i32{ -7205, 0, -7205 }),
    CaseRange.init(0x1FC3, 0x1FC3, &[_]i32{ 9, 0, 9 }),
    CaseRange.init(0x1FC8, 0x1FCB, &[_]i32{ 0, -86, 0 }),
    CaseRange.init(0x1FCC, 0x1FCC, &[_]i32{ 0, -9, 0 }),
    CaseRange.init(0x1FD0, 0x1FD1, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1FD8, 0x1FD9, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1FDA, 0x1FDB, &[_]i32{ 0, -100, 0 }),
    CaseRange.init(0x1FE0, 0x1FE1, &[_]i32{ 8, 0, 8 }),
    CaseRange.init(0x1FE5, 0x1FE5, &[_]i32{ 7, 0, 7 }),
    CaseRange.init(0x1FE8, 0x1FE9, &[_]i32{ 0, -8, 0 }),
    CaseRange.init(0x1FEA, 0x1FEB, &[_]i32{ 0, -112, 0 }),
    CaseRange.init(0x1FEC, 0x1FEC, &[_]i32{ 0, -7, 0 }),
    CaseRange.init(0x1FF3, 0x1FF3, &[_]i32{ 9, 0, 9 }),
    CaseRange.init(0x1FF8, 0x1FF9, &[_]i32{ 0, -128, 0 }),
    CaseRange.init(0x1FFA, 0x1FFB, &[_]i32{ 0, -126, 0 }),
    CaseRange.init(0x1FFC, 0x1FFC, &[_]i32{ 0, -9, 0 }),
    CaseRange.init(0x2126, 0x2126, &[_]i32{ 0, -7517, 0 }),
    CaseRange.init(0x212A, 0x212A, &[_]i32{ 0, -8383, 0 }),
    CaseRange.init(0x212B, 0x212B, &[_]i32{ 0, -8262, 0 }),
    CaseRange.init(0x2132, 0x2132, &[_]i32{ 0, 28, 0 }),
    CaseRange.init(0x214E, 0x214E, &[_]i32{ -28, 0, -28 }),
    CaseRange.init(0x2160, 0x216F, &[_]i32{ 0, 16, 0 }),
    CaseRange.init(0x2170, 0x217F, &[_]i32{ -16, 0, -16 }),
    CaseRange.init(0x2183, 0x2184, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x24B6, 0x24CF, &[_]i32{ 0, 26, 0 }),
    CaseRange.init(0x24D0, 0x24E9, &[_]i32{ -26, 0, -26 }),
    CaseRange.init(0x2C00, 0x2C2E, &[_]i32{ 0, 48, 0 }),
    CaseRange.init(0x2C30, 0x2C5E, &[_]i32{ -48, 0, -48 }),
    CaseRange.init(0x2C60, 0x2C61, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x2C62, 0x2C62, &[_]i32{ 0, -10743, 0 }),
    CaseRange.init(0x2C63, 0x2C63, &[_]i32{ 0, -3814, 0 }),
    CaseRange.init(0x2C64, 0x2C64, &[_]i32{ 0, -10727, 0 }),
    CaseRange.init(0x2C65, 0x2C65, &[_]i32{ -10795, 0, -10795 }),
    CaseRange.init(0x2C66, 0x2C66, &[_]i32{ -10792, 0, -10792 }),
    CaseRange.init(0x2C67, 0x2C6C, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x2C6D, 0x2C6D, &[_]i32{ 0, -10780, 0 }),
    CaseRange.init(0x2C6E, 0x2C6E, &[_]i32{ 0, -10749, 0 }),
    CaseRange.init(0x2C6F, 0x2C6F, &[_]i32{ 0, -10783, 0 }),
    CaseRange.init(0x2C70, 0x2C70, &[_]i32{ 0, -10782, 0 }),
    CaseRange.init(0x2C72, 0x2C73, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x2C75, 0x2C76, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x2C7E, 0x2C7F, &[_]i32{ 0, -10815, 0 }),
    CaseRange.init(0x2C80, 0x2CE3, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x2CEB, 0x2CEE, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x2CF2, 0x2CF3, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0x2D00, 0x2D25, &[_]i32{ -7264, 0, -7264 }),
    CaseRange.init(0x2D27, 0x2D27, &[_]i32{ -7264, 0, -7264 }),
    CaseRange.init(0x2D2D, 0x2D2D, &[_]i32{ -7264, 0, -7264 }),
    CaseRange.init(0xA640, 0xA66D, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA680, 0xA69B, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA722, 0xA72F, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA732, 0xA76F, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA779, 0xA77C, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA77D, 0xA77D, &[_]i32{ 0, -35332, 0 }),
    CaseRange.init(0xA77E, 0xA787, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA78B, 0xA78C, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA78D, 0xA78D, &[_]i32{ 0, -42280, 0 }),
    CaseRange.init(0xA790, 0xA793, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA794, 0xA794, &[_]i32{ 48, 0, 48 }),
    CaseRange.init(0xA796, 0xA7A9, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA7AA, 0xA7AA, &[_]i32{ 0, -42308, 0 }),
    CaseRange.init(0xA7AB, 0xA7AB, &[_]i32{ 0, -42319, 0 }),
    CaseRange.init(0xA7AC, 0xA7AC, &[_]i32{ 0, -42315, 0 }),
    CaseRange.init(0xA7AD, 0xA7AD, &[_]i32{ 0, -42305, 0 }),
    CaseRange.init(0xA7AE, 0xA7AE, &[_]i32{ 0, -42308, 0 }),
    CaseRange.init(0xA7B0, 0xA7B0, &[_]i32{ 0, -42258, 0 }),
    CaseRange.init(0xA7B1, 0xA7B1, &[_]i32{ 0, -42282, 0 }),
    CaseRange.init(0xA7B2, 0xA7B2, &[_]i32{ 0, -42261, 0 }),
    CaseRange.init(0xA7B3, 0xA7B3, &[_]i32{ 0, 928, 0 }),
    CaseRange.init(0xA7B4, 0xA7BF, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA7C2, 0xA7C3, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA7C4, 0xA7C4, &[_]i32{ 0, -48, 0 }),
    CaseRange.init(0xA7C5, 0xA7C5, &[_]i32{ 0, -42307, 0 }),
    CaseRange.init(0xA7C6, 0xA7C6, &[_]i32{ 0, -35384, 0 }),
    CaseRange.init(0xA7C7, 0xA7CA, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xA7F5, 0xA7F6, &[_]i32{ upper_lower, upper_lower, upper_lower }),
    CaseRange.init(0xAB53, 0xAB53, &[_]i32{ -928, 0, -928 }),
    CaseRange.init(0xAB70, 0xABBF, &[_]i32{ -38864, 0, -38864 }),
    CaseRange.init(0xFF21, 0xFF3A, &[_]i32{ 0, 32, 0 }),
    CaseRange.init(0xFF41, 0xFF5A, &[_]i32{ -32, 0, -32 }),
    CaseRange.init(0x10400, 0x10427, &[_]i32{ 0, 40, 0 }),
    CaseRange.init(0x10428, 0x1044F, &[_]i32{ -40, 0, -40 }),
    CaseRange.init(0x104B0, 0x104D3, &[_]i32{ 0, 40, 0 }),
    CaseRange.init(0x104D8, 0x104FB, &[_]i32{ -40, 0, -40 }),
    CaseRange.init(0x10C80, 0x10CB2, &[_]i32{ 0, 64, 0 }),
    CaseRange.init(0x10CC0, 0x10CF2, &[_]i32{ -64, 0, -64 }),
    CaseRange.init(0x118A0, 0x118BF, &[_]i32{ 0, 32, 0 }),
    CaseRange.init(0x118C0, 0x118DF, &[_]i32{ -32, 0, -32 }),
    CaseRange.init(0x16E40, 0x16E5F, &[_]i32{ 0, 32, 0 }),
    CaseRange.init(0x16E60, 0x16E7F, &[_]i32{ -32, 0, -32 }),
    CaseRange.init(0x1E900, 0x1E921, &[_]i32{ 0, 34, 0 }),
    CaseRange.init(0x1E922, 0x1E943, &[_]i32{ -34, 0, -34 }),
};

pub const pC: u8 = 1;
pub const pP: u8 = 2;
pub const pN: u8 = 4;
pub const pS: u8 = 8;
pub const pZ: u8 = 16;
pub const pLu: u8 = 32;
pub const pLl: u8 = 64;
pub const pp: u8 = 128;
pub const pg: u8 = 144;
pub const pLo: u8 = 96;
pub const pLmask: u8 = 96;

pub const properties = [max_latin1 + 1]u8{
    pC, // '\x00'
    pC, // '\x01'
    pC, // '\x02'
    pC, // '\x03'
    pC, // '\x04'
    pC, // '\x05'
    pC, // '\x06'
    pC, // '\a'
    pC, // '\b'
    pC, // '\t'
    pC, // '\n'
    pC, // '\v'
    pC, // '\f'
    pC, // '\r'
    pC, // '\x0e'
    pC, // '\x0f'
    pC, // '\x10'
    pC, // '\x11'
    pC, // '\x12'
    pC, // '\x13'
    pC, // '\x14'
    pC, // '\x15'
    pC, // '\x16'
    pC, // '\x17'
    pC, // '\x18'
    pC, // '\x19'
    pC, // '\x1a'
    pC, // '\x1b'
    pC, // '\x1c'
    pC, // '\x1d'
    pC, // '\x1e'
    pC, // '\x1f'
    pZ | pp, // ' '
    pP | pp, // '!'
    pP | pp, // '"'
    pP | pp, // '#'
    pS | pp, // '$'
    pP | pp, // '%'
    pP | pp, // '&'
    pP | pp, // '\''
    pP | pp, // '('
    pP | pp, // ')'
    pP | pp, // '*'
    pS | pp, // '+'
    pP | pp, // ','
    pP | pp, // '-'
    pP | pp, // '.'
    pP | pp, // '/'
    pN | pp, // '0'
    pN | pp, // '1'
    pN | pp, // '2'
    pN | pp, // '3'
    pN | pp, // '4'
    pN | pp, // '5'
    pN | pp, // '6'
    pN | pp, // '7'
    pN | pp, // '8'
    pN | pp, // '9'
    pP | pp, // ':'
    pP | pp, // ';'
    pS | pp, // '<'
    pS | pp, // '='
    pS | pp, // '>'
    pP | pp, // '?'
    pP | pp, // '@'
    pLu | pp, // 'A'
    pLu | pp, // 'B'
    pLu | pp, // 'C'
    pLu | pp, // 'D'
    pLu | pp, // 'E'
    pLu | pp, // 'F'
    pLu | pp, // 'G'
    pLu | pp, // 'H'
    pLu | pp, // 'I'
    pLu | pp, // 'J'
    pLu | pp, // 'K'
    pLu | pp, // 'L'
    pLu | pp, // 'M'
    pLu | pp, // 'N'
    pLu | pp, // 'O'
    pLu | pp, // 'P'
    pLu | pp, // 'Q'
    pLu | pp, // 'R'
    pLu | pp, // 'S'
    pLu | pp, // 'T'
    pLu | pp, // 'U'
    pLu | pp, // 'V'
    pLu | pp, // 'W'
    pLu | pp, // 'X'
    pLu | pp, // 'Y'
    pLu | pp, // 'Z'
    pP | pp, // '['
    pP | pp, // '\\'
    pP | pp, // ']'
    pS | pp, // '^'
    pP | pp, // '_'
    pS | pp, // '`'
    pLl | pp, // 'a'
    pLl | pp, // 'b'
    pLl | pp, // 'c'
    pLl | pp, // 'd'
    pLl | pp, // 'e'
    pLl | pp, // 'f'
    pLl | pp, // 'g'
    pLl | pp, // 'h'
    pLl | pp, // 'i'
    pLl | pp, // 'j'
    pLl | pp, // 'k'
    pLl | pp, // 'l'
    pLl | pp, // 'm'
    pLl | pp, // 'n'
    pLl | pp, // 'o'
    pLl | pp, // 'p'
    pLl | pp, // 'q'
    pLl | pp, // 'r'
    pLl | pp, // 's'
    pLl | pp, // 't'
    pLl | pp, // 'u'
    pLl | pp, // 'v'
    pLl | pp, // 'w'
    pLl | pp, // 'x'
    pLl | pp, // 'y'
    pLl | pp, // 'z'
    pP | pp, // '{'
    pS | pp, // '|'
    pP | pp, // '}'
    pS | pp, // '~'
    pC, // '\u007f'
    pC, // '\u0080'
    pC, // '\u0081'
    pC, // '\u0082'
    pC, // '\u0083'
    pC, // '\u0084'
    pC, // '\u0085'
    pC, // '\u0086'
    pC, // '\u0087'
    pC, // '\u0088'
    pC, // '\u0089'
    pC, // '\u008a'
    pC, // '\u008b'
    pC, // '\u008c'
    pC, // '\u008d'
    pC, // '\u008e'
    pC, // '\u008f'
    pC, // '\u0090'
    pC, // '\u0091'
    pC, // '\u0092'
    pC, // '\u0093'
    pC, // '\u0094'
    pC, // '\u0095'
    pC, // '\u0096'
    pC, // '\u0097'
    pC, // '\u0098'
    pC, // '\u0099'
    pC, // '\u009a'
    pC, // '\u009b'
    pC, // '\u009c'
    pC, // '\u009d'
    pC, // '\u009e'
    pC, // '\u009f'
    pZ, // '\u00a0'
    pP | pp, // '¡'
    pS | pp, // '¢'
    pS | pp, // '£'
    pS | pp, // '¤'
    pS | pp, // '¥'
    pS | pp, // '¦'
    pP | pp, // '§'
    pS | pp, // '¨'
    pS | pp, // '©'
    pLo | pp, // 'ª'
    pP | pp, // '«'
    pS | pp, // '¬'
    0, // '\u00ad'
    pS | pp, // '®'
    pS | pp, // '¯'
    pS | pp, // '°'
    pS | pp, // '±'
    pN | pp, // '²'
    pN | pp, // '³'
    pS | pp, // '´'
    pLl | pp, // 'µ'
    pP | pp, // '¶'
    pP | pp, // '·'
    pS | pp, // '¸'
    pN | pp, // '¹'
    pLo | pp, // 'º'
    pP | pp, // '»'
    pN | pp, // '¼'
    pN | pp, // '½'
    pN | pp, // '¾'
    pP | pp, // '¿'
    pLu | pp, // 'À'
    pLu | pp, // 'Á'
    pLu | pp, // 'Â'
    pLu | pp, // 'Ã'
    pLu | pp, // 'Ä'
    pLu | pp, // 'Å'
    pLu | pp, // 'Æ'
    pLu | pp, // 'Ç'
    pLu | pp, // 'È'
    pLu | pp, // 'É'
    pLu | pp, // 'Ê'
    pLu | pp, // 'Ë'
    pLu | pp, // 'Ì'
    pLu | pp, // 'Í'
    pLu | pp, // 'Î'
    pLu | pp, // 'Ï'
    pLu | pp, // 'Ð'
    pLu | pp, // 'Ñ'
    pLu | pp, // 'Ò'
    pLu | pp, // 'Ó'
    pLu | pp, // 'Ô'
    pLu | pp, // 'Õ'
    pLu | pp, // 'Ö'
    pS | pp, // '×'
    pLu | pp, // 'Ø'
    pLu | pp, // 'Ù'
    pLu | pp, // 'Ú'
    pLu | pp, // 'Û'
    pLu | pp, // 'Ü'
    pLu | pp, // 'Ý'
    pLu | pp, // 'Þ'
    pLl | pp, // 'ß'
    pLl | pp, // 'à'
    pLl | pp, // 'á'
    pLl | pp, // 'â'
    pLl | pp, // 'ã'
    pLl | pp, // 'ä'
    pLl | pp, // 'å'
    pLl | pp, // 'æ'
    pLl | pp, // 'ç'
    pLl | pp, // 'è'
    pLl | pp, // 'é'
    pLl | pp, // 'ê'
    pLl | pp, // 'ë'
    pLl | pp, // 'ì'
    pLl | pp, // 'í'
    pLl | pp, // 'î'
    pLl | pp, // 'ï'
    pLl | pp, // 'ð'
    pLl | pp, // 'ñ'
    pLl | pp, // 'ò'
    pLl | pp, // 'ó'
    pLl | pp, // 'ô'
    pLl | pp, // 'õ'
    pLl | pp, // 'ö'
    pS | pp, // '÷'
    pLl | pp, // 'ø'
    pLl | pp, // 'ù'
    pLl | pp, // 'ú'
    pLl | pp, // 'û'
    pLl | pp, // 'ü'
    pLl | pp, // 'ý'
    pLl | pp, // 'þ'
    pLl | pp, // 'ÿ'
};

pub const ascii_fold = [max_latin1 + 1]u16{
    0x0000,
    0x0001,
    0x0002,
    0x0003,
    0x0004,
    0x0005,
    0x0006,
    0x0007,
    0x0008,
    0x0009,
    0x000A,
    0x000B,
    0x000C,
    0x000D,
    0x000E,
    0x000F,
    0x0010,
    0x0011,
    0x0012,
    0x0013,
    0x0014,
    0x0015,
    0x0016,
    0x0017,
    0x0018,
    0x0019,
    0x001A,
    0x001B,
    0x001C,
    0x001D,
    0x001E,
    0x001F,
    0x0020,
    0x0021,
    0x0022,
    0x0023,
    0x0024,
    0x0025,
    0x0026,
    0x0027,
    0x0028,
    0x0029,
    0x002A,
    0x002B,
    0x002C,
    0x002D,
    0x002E,
    0x002F,
    0x0030,
    0x0031,
    0x0032,
    0x0033,
    0x0034,
    0x0035,
    0x0036,
    0x0037,
    0x0038,
    0x0039,
    0x003A,
    0x003B,
    0x003C,
    0x003D,
    0x003E,
    0x003F,
    0x0040,
    0x0061,
    0x0062,
    0x0063,
    0x0064,
    0x0065,
    0x0066,
    0x0067,
    0x0068,
    0x0069,
    0x006A,
    0x006B,
    0x006C,
    0x006D,
    0x006E,
    0x006F,
    0x0070,
    0x0071,
    0x0072,
    0x0073,
    0x0074,
    0x0075,
    0x0076,
    0x0077,
    0x0078,
    0x0079,
    0x007A,
    0x005B,
    0x005C,
    0x005D,
    0x005E,
    0x005F,
    0x0060,
    0x0041,
    0x0042,
    0x0043,
    0x0044,
    0x0045,
    0x0046,
    0x0047,
    0x0048,
    0x0049,
    0x004A,
    0x212A,
    0x004C,
    0x004D,
    0x004E,
    0x004F,
    0x0050,
    0x0051,
    0x0052,
    0x017F,
    0x0054,
    0x0055,
    0x0056,
    0x0057,
    0x0058,
    0x0059,
    0x005A,
    0x007B,
    0x007C,
    0x007D,
    0x007E,
    0x007F,
};

pub const FoldPair = struct {
    from: u16,
    to: u16,

    pub fn init(from: u16, to: u16) FoldPair {
        return FoldPair{ .from = from, .to = to };
    }
};

pub const case_orbit = [_]FoldPair{
    FoldPair.init(0x004B, 0x006B),
    FoldPair.init(0x0053, 0x0073),
    FoldPair.init(0x006B, 0x212A),
    FoldPair.init(0x0073, 0x017F),
    FoldPair.init(0x00B5, 0x039C),
    FoldPair.init(0x00C5, 0x00E5),
    FoldPair.init(0x00DF, 0x1E9E),
    FoldPair.init(0x00E5, 0x212B),
    FoldPair.init(0x0130, 0x0130),
    FoldPair.init(0x0131, 0x0131),
    FoldPair.init(0x017F, 0x0053),
    FoldPair.init(0x01C4, 0x01C5),
    FoldPair.init(0x01C5, 0x01C6),
    FoldPair.init(0x01C6, 0x01C4),
    FoldPair.init(0x01C7, 0x01C8),
    FoldPair.init(0x01C8, 0x01C9),
    FoldPair.init(0x01C9, 0x01C7),
    FoldPair.init(0x01CA, 0x01CB),
    FoldPair.init(0x01CB, 0x01CC),
    FoldPair.init(0x01CC, 0x01CA),
    FoldPair.init(0x01F1, 0x01F2),
    FoldPair.init(0x01F2, 0x01F3),
    FoldPair.init(0x01F3, 0x01F1),
    FoldPair.init(0x0345, 0x0399),
    FoldPair.init(0x0392, 0x03B2),
    FoldPair.init(0x0395, 0x03B5),
    FoldPair.init(0x0398, 0x03B8),
    FoldPair.init(0x0399, 0x03B9),
    FoldPair.init(0x039A, 0x03BA),
    FoldPair.init(0x039C, 0x03BC),
    FoldPair.init(0x03A0, 0x03C0),
    FoldPair.init(0x03A1, 0x03C1),
    FoldPair.init(0x03A3, 0x03C2),
    FoldPair.init(0x03A6, 0x03C6),
    FoldPair.init(0x03A9, 0x03C9),
    FoldPair.init(0x03B2, 0x03D0),
    FoldPair.init(0x03B5, 0x03F5),
    FoldPair.init(0x03B8, 0x03D1),
    FoldPair.init(0x03B9, 0x1FBE),
    FoldPair.init(0x03BA, 0x03F0),
    FoldPair.init(0x03BC, 0x00B5),
    FoldPair.init(0x03C0, 0x03D6),
    FoldPair.init(0x03C1, 0x03F1),
    FoldPair.init(0x03C2, 0x03C3),
    FoldPair.init(0x03C3, 0x03A3),
    FoldPair.init(0x03C6, 0x03D5),
    FoldPair.init(0x03C9, 0x2126),
    FoldPair.init(0x03D0, 0x0392),
    FoldPair.init(0x03D1, 0x03F4),
    FoldPair.init(0x03D5, 0x03A6),
    FoldPair.init(0x03D6, 0x03A0),
    FoldPair.init(0x03F0, 0x039A),
    FoldPair.init(0x03F1, 0x03A1),
    FoldPair.init(0x03F4, 0x0398),
    FoldPair.init(0x03F5, 0x0395),
    FoldPair.init(0x0412, 0x0432),
    FoldPair.init(0x0414, 0x0434),
    FoldPair.init(0x041E, 0x043E),
    FoldPair.init(0x0421, 0x0441),
    FoldPair.init(0x0422, 0x0442),
    FoldPair.init(0x042A, 0x044A),
    FoldPair.init(0x0432, 0x1C80),
    FoldPair.init(0x0434, 0x1C81),
    FoldPair.init(0x043E, 0x1C82),
    FoldPair.init(0x0441, 0x1C83),
    FoldPair.init(0x0442, 0x1C84),
    FoldPair.init(0x044A, 0x1C86),
    FoldPair.init(0x0462, 0x0463),
    FoldPair.init(0x0463, 0x1C87),
    FoldPair.init(0x1C80, 0x0412),
    FoldPair.init(0x1C81, 0x0414),
    FoldPair.init(0x1C82, 0x041E),
    FoldPair.init(0x1C83, 0x0421),
    FoldPair.init(0x1C84, 0x1C85),
    FoldPair.init(0x1C85, 0x0422),
    FoldPair.init(0x1C86, 0x042A),
    FoldPair.init(0x1C87, 0x0462),
    FoldPair.init(0x1C88, 0xA64A),
    FoldPair.init(0x1E60, 0x1E61),
    FoldPair.init(0x1E61, 0x1E9B),
    FoldPair.init(0x1E9B, 0x1E60),
    FoldPair.init(0x1E9E, 0x00DF),
    FoldPair.init(0x1FBE, 0x0345),
    FoldPair.init(0x2126, 0x03A9),
    FoldPair.init(0x212A, 0x004B),
    FoldPair.init(0x212B, 0x00C5),
    FoldPair.init(0xA64A, 0xA64B),
    FoldPair.init(0xA64B, 0x1C88),
};

// FoldCategory maps a category name to a table of
// code points outside the category that are equivalent under
// simple case folding to code points inside the category.
// If there is no entry for a category name, there are no such points.
pub fn foldCategory(cat: []const u8) ?*RangeTable {
    return switch (cat) {
        "L" => &foldL,
        "Ll" => &foldLl,
        "Lt" => &foldLt,
        "Lu" => &foldLu,
        "M" => &foldM,
        "Mn" => &foldMn,
        else => null,
    };
}

pub const foldL = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0345, 0x0345, 1),
    },
};

pub const foldLl = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0041, 0x005a, 1),
        Range16.init(0x00c0, 0x00d6, 1),
        Range16.init(0x00d8, 0x00de, 1),
        Range16.init(0x0100, 0x012e, 2),
        Range16.init(0x0132, 0x0136, 2),
        Range16.init(0x0139, 0x0147, 2),
        Range16.init(0x014a, 0x0178, 2),
        Range16.init(0x0179, 0x017d, 2),
        Range16.init(0x0181, 0x0182, 1),
        Range16.init(0x0184, 0x0186, 2),
        Range16.init(0x0187, 0x0189, 2),
        Range16.init(0x018a, 0x018b, 1),
        Range16.init(0x018e, 0x0191, 1),
        Range16.init(0x0193, 0x0194, 1),
        Range16.init(0x0196, 0x0198, 1),
        Range16.init(0x019c, 0x019d, 1),
        Range16.init(0x019f, 0x01a0, 1),
        Range16.init(0x01a2, 0x01a6, 2),
        Range16.init(0x01a7, 0x01a9, 2),
        Range16.init(0x01ac, 0x01ae, 2),
        Range16.init(0x01af, 0x01b1, 2),
        Range16.init(0x01b2, 0x01b3, 1),
        Range16.init(0x01b5, 0x01b7, 2),
        Range16.init(0x01b8, 0x01bc, 4),
        Range16.init(0x01c4, 0x01c5, 1),
        Range16.init(0x01c7, 0x01c8, 1),
        Range16.init(0x01ca, 0x01cb, 1),
        Range16.init(0x01cd, 0x01db, 2),
        Range16.init(0x01de, 0x01ee, 2),
        Range16.init(0x01f1, 0x01f2, 1),
        Range16.init(0x01f4, 0x01f6, 2),
        Range16.init(0x01f7, 0x01f8, 1),
        Range16.init(0x01fa, 0x0232, 2),
        Range16.init(0x023a, 0x023b, 1),
        Range16.init(0x023d, 0x023e, 1),
        Range16.init(0x0241, 0x0243, 2),
        Range16.init(0x0244, 0x0246, 1),
        Range16.init(0x0248, 0x024e, 2),
        Range16.init(0x0345, 0x0370, 43),
        Range16.init(0x0372, 0x0376, 4),
        Range16.init(0x037f, 0x0386, 7),
        Range16.init(0x0388, 0x038a, 1),
        Range16.init(0x038c, 0x038e, 2),
        Range16.init(0x038f, 0x0391, 2),
        Range16.init(0x0392, 0x03a1, 1),
        Range16.init(0x03a3, 0x03ab, 1),
        Range16.init(0x03cf, 0x03d8, 9),
        Range16.init(0x03da, 0x03ee, 2),
        Range16.init(0x03f4, 0x03f7, 3),
        Range16.init(0x03f9, 0x03fa, 1),
        Range16.init(0x03fd, 0x042f, 1),
        Range16.init(0x0460, 0x0480, 2),
        Range16.init(0x048a, 0x04c0, 2),
        Range16.init(0x04c1, 0x04cd, 2),
        Range16.init(0x04d0, 0x052e, 2),
        Range16.init(0x0531, 0x0556, 1),
        Range16.init(0x10a0, 0x10c5, 1),
        Range16.init(0x10c7, 0x10cd, 6),
        Range16.init(0x13a0, 0x13f5, 1),
        Range16.init(0x1c90, 0x1cba, 1),
        Range16.init(0x1cbd, 0x1cbf, 1),
        Range16.init(0x1e00, 0x1e94, 2),
        Range16.init(0x1e9e, 0x1efe, 2),
        Range16.init(0x1f08, 0x1f0f, 1),
        Range16.init(0x1f18, 0x1f1d, 1),
        Range16.init(0x1f28, 0x1f2f, 1),
        Range16.init(0x1f38, 0x1f3f, 1),
        Range16.init(0x1f48, 0x1f4d, 1),
        Range16.init(0x1f59, 0x1f5f, 2),
        Range16.init(0x1f68, 0x1f6f, 1),
        Range16.init(0x1f88, 0x1f8f, 1),
        Range16.init(0x1f98, 0x1f9f, 1),
        Range16.init(0x1fa8, 0x1faf, 1),
        Range16.init(0x1fb8, 0x1fbc, 1),
        Range16.init(0x1fc8, 0x1fcc, 1),
        Range16.init(0x1fd8, 0x1fdb, 1),
        Range16.init(0x1fe8, 0x1fec, 1),
        Range16.init(0x1ff8, 0x1ffc, 1),
        Range16.init(0x2126, 0x212a, 4),
        Range16.init(0x212b, 0x2132, 7),
        Range16.init(0x2183, 0x2c00, 2685),
        Range16.init(0x2c01, 0x2c2e, 1),
        Range16.init(0x2c60, 0x2c62, 2),
        Range16.init(0x2c63, 0x2c64, 1),
        Range16.init(0x2c67, 0x2c6d, 2),
        Range16.init(0x2c6e, 0x2c70, 1),
        Range16.init(0x2c72, 0x2c75, 3),
        Range16.init(0x2c7e, 0x2c80, 1),
        Range16.init(0x2c82, 0x2ce2, 2),
        Range16.init(0x2ceb, 0x2ced, 2),
        Range16.init(0x2cf2, 0xa640, 31054),
        Range16.init(0xa642, 0xa66c, 2),
        Range16.init(0xa680, 0xa69a, 2),
        Range16.init(0xa722, 0xa72e, 2),
        Range16.init(0xa732, 0xa76e, 2),
        Range16.init(0xa779, 0xa77d, 2),
        Range16.init(0xa77e, 0xa786, 2),
        Range16.init(0xa78b, 0xa78d, 2),
        Range16.init(0xa790, 0xa792, 2),
        Range16.init(0xa796, 0xa7aa, 2),
        Range16.init(0xa7ab, 0xa7ae, 1),
        Range16.init(0xa7b0, 0xa7b4, 1),
        Range16.init(0xa7b6, 0xa7be, 2),
        Range16.init(0xa7c2, 0xa7c4, 2),
        Range16.init(0xa7c5, 0xa7c7, 1),
        Range16.init(0xa7c9, 0xa7f5, 44),
        Range16.init(0xff21, 0xff3a, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10400, 0x10427, 1),
        Range32.init(0x104b0, 0x104d3, 1),
        Range32.init(0x10c80, 0x10cb2, 1),
        Range32.init(0x118a0, 0x118bf, 1),
        Range32.init(0x16e40, 0x16e5f, 1),
        Range32.init(0x1e900, 0x1e921, 1),
    },
    .latin_offset = 3,
};

pub const foldLt = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x01c4, 0x01c6, 2),
        Range16.init(0x01c7, 0x01c9, 2),
        Range16.init(0x01ca, 0x01cc, 2),
        Range16.init(0x01f1, 0x01f3, 2),
        Range16.init(0x1f80, 0x1f87, 1),
        Range16.init(0x1f90, 0x1f97, 1),
        Range16.init(0x1fa0, 0x1fa7, 1),
        Range16.init(0x1fb3, 0x1fc3, 16),
        Range16.init(0x1ff3, 0x1ff3, 1),
    },
};

pub const foldLu = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0061, 0x007a, 1),
        Range16.init(0x00b5, 0x00df, 42),
        Range16.init(0x00e0, 0x00f6, 1),
        Range16.init(0x00f8, 0x00ff, 1),
        Range16.init(0x0101, 0x012f, 2),
        Range16.init(0x0133, 0x0137, 2),
        Range16.init(0x013a, 0x0148, 2),
        Range16.init(0x014b, 0x0177, 2),
        Range16.init(0x017a, 0x017e, 2),
        Range16.init(0x017f, 0x0180, 1),
        Range16.init(0x0183, 0x0185, 2),
        Range16.init(0x0188, 0x018c, 4),
        Range16.init(0x0192, 0x0195, 3),
        Range16.init(0x0199, 0x019a, 1),
        Range16.init(0x019e, 0x01a1, 3),
        Range16.init(0x01a3, 0x01a5, 2),
        Range16.init(0x01a8, 0x01ad, 5),
        Range16.init(0x01b0, 0x01b4, 4),
        Range16.init(0x01b6, 0x01b9, 3),
        Range16.init(0x01bd, 0x01bf, 2),
        Range16.init(0x01c5, 0x01c6, 1),
        Range16.init(0x01c8, 0x01c9, 1),
        Range16.init(0x01cb, 0x01cc, 1),
        Range16.init(0x01ce, 0x01dc, 2),
        Range16.init(0x01dd, 0x01ef, 2),
        Range16.init(0x01f2, 0x01f3, 1),
        Range16.init(0x01f5, 0x01f9, 4),
        Range16.init(0x01fb, 0x021f, 2),
        Range16.init(0x0223, 0x0233, 2),
        Range16.init(0x023c, 0x023f, 3),
        Range16.init(0x0240, 0x0242, 2),
        Range16.init(0x0247, 0x024f, 2),
        Range16.init(0x0250, 0x0254, 1),
        Range16.init(0x0256, 0x0257, 1),
        Range16.init(0x0259, 0x025b, 2),
        Range16.init(0x025c, 0x0260, 4),
        Range16.init(0x0261, 0x0265, 2),
        Range16.init(0x0266, 0x0268, 2),
        Range16.init(0x0269, 0x026c, 1),
        Range16.init(0x026f, 0x0271, 2),
        Range16.init(0x0272, 0x0275, 3),
        Range16.init(0x027d, 0x0280, 3),
        Range16.init(0x0282, 0x0283, 1),
        Range16.init(0x0287, 0x028c, 1),
        Range16.init(0x0292, 0x029d, 11),
        Range16.init(0x029e, 0x0345, 167),
        Range16.init(0x0371, 0x0373, 2),
        Range16.init(0x0377, 0x037b, 4),
        Range16.init(0x037c, 0x037d, 1),
        Range16.init(0x03ac, 0x03af, 1),
        Range16.init(0x03b1, 0x03ce, 1),
        Range16.init(0x03d0, 0x03d1, 1),
        Range16.init(0x03d5, 0x03d7, 1),
        Range16.init(0x03d9, 0x03ef, 2),
        Range16.init(0x03f0, 0x03f3, 1),
        Range16.init(0x03f5, 0x03fb, 3),
        Range16.init(0x0430, 0x045f, 1),
        Range16.init(0x0461, 0x0481, 2),
        Range16.init(0x048b, 0x04bf, 2),
        Range16.init(0x04c2, 0x04ce, 2),
        Range16.init(0x04cf, 0x052f, 2),
        Range16.init(0x0561, 0x0586, 1),
        Range16.init(0x10d0, 0x10fa, 1),
        Range16.init(0x10fd, 0x10ff, 1),
        Range16.init(0x13f8, 0x13fd, 1),
        Range16.init(0x1c80, 0x1c88, 1),
        Range16.init(0x1d79, 0x1d7d, 4),
        Range16.init(0x1d8e, 0x1e01, 115),
        Range16.init(0x1e03, 0x1e95, 2),
        Range16.init(0x1e9b, 0x1ea1, 6),
        Range16.init(0x1ea3, 0x1eff, 2),
        Range16.init(0x1f00, 0x1f07, 1),
        Range16.init(0x1f10, 0x1f15, 1),
        Range16.init(0x1f20, 0x1f27, 1),
        Range16.init(0x1f30, 0x1f37, 1),
        Range16.init(0x1f40, 0x1f45, 1),
        Range16.init(0x1f51, 0x1f57, 2),
        Range16.init(0x1f60, 0x1f67, 1),
        Range16.init(0x1f70, 0x1f7d, 1),
        Range16.init(0x1fb0, 0x1fb1, 1),
        Range16.init(0x1fbe, 0x1fd0, 18),
        Range16.init(0x1fd1, 0x1fe0, 15),
        Range16.init(0x1fe1, 0x1fe5, 4),
        Range16.init(0x214e, 0x2184, 54),
        Range16.init(0x2c30, 0x2c5e, 1),
        Range16.init(0x2c61, 0x2c65, 4),
        Range16.init(0x2c66, 0x2c6c, 2),
        Range16.init(0x2c73, 0x2c76, 3),
        Range16.init(0x2c81, 0x2ce3, 2),
        Range16.init(0x2cec, 0x2cee, 2),
        Range16.init(0x2cf3, 0x2d00, 13),
        Range16.init(0x2d01, 0x2d25, 1),
        Range16.init(0x2d27, 0x2d2d, 6),
        Range16.init(0xa641, 0xa66d, 2),
        Range16.init(0xa681, 0xa69b, 2),
        Range16.init(0xa723, 0xa72f, 2),
        Range16.init(0xa733, 0xa76f, 2),
        Range16.init(0xa77a, 0xa77c, 2),
        Range16.init(0xa77f, 0xa787, 2),
        Range16.init(0xa78c, 0xa791, 5),
        Range16.init(0xa793, 0xa794, 1),
        Range16.init(0xa797, 0xa7a9, 2),
        Range16.init(0xa7b5, 0xa7bf, 2),
        Range16.init(0xa7c3, 0xa7c8, 5),
        Range16.init(0xa7ca, 0xa7f6, 44),
        Range16.init(0xab53, 0xab70, 29),
        Range16.init(0xab71, 0xabbf, 1),
        Range16.init(0xff41, 0xff5a, 1),
    },
    .r32 = &[_]Range32{
        Range32.init(0x10428, 0x1044f, 1),
        Range32.init(0x104d8, 0x104fb, 1),
        Range32.init(0x10cc0, 0x10cf2, 1),
        Range32.init(0x118c0, 0x118df, 1),
        Range32.init(0x16e60, 0x16e7f, 1),
        Range32.init(0x1e922, 0x1e943, 1),
    },
    .latin_offset = 4,
};

pub const foldM = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0399, 0x03b9, 32),
        Range16.init(0x1fbe, 0x1fbe, 1),
    },
};

pub const foldMn = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0399, 0x03b9, 32),
        Range16.init(0x1fbe, 0x1fbe, 1),
    },
};

// FoldScript maps a script name to a table of
// code points outside the script that are equivalent under
// simple case folding to code points inside the script.
// If there is no entry for a script name, there are no such points.
pub fn FoldScript(script: []const u8) ?*RangeTable {
    return switch (script) {
        "Common" => &fold_common,
        "Greek" => &fold_greek,
        "Inherited" => &fold_inherited,
        else => null,
    };
}

pub const fold_common = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x039c, 0x03bc, 32),
    },
};

pub const fold_greek = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x00b5, 0x0345, 656),
    },
};

pub const fold_inherited = RangeTable{
    .r16 = &[_]Range16{
        Range16.init(0x0399, 0x03b9, 32),
        Range16.init(0x1fbe, 0x1fbe, 1),
    },
};

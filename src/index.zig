pub const base = @import("base.zig");
const tables = @import("tables.zig");
const warn = @import("std").debug.warn;

pub fn is16(ranges: []const base.Range16, r: u16) bool {
    if (ranges.len <= base.linear_max or r <= base.linear_max) {
        for (ranges) |*range| {
            if (r < range.lo) {
                return false;
            }
            if (r <= range.hi) {
                return range.stride == 1 or (r - range.lo) % range.stride == 0;
            }
        }
        return false;
    }
    var lo: usize = 0;
    var hi: usize = ranges.len;
    while (lo < hi) {
        const m: usize = lo + ((hi - lo) / 2);
        const range = &ranges[m];
        if (range.lo <= r and r <= range.hi) {
            return range.stride == 1 or (r - range.lo) % range.stride == 0;
        }
        if (r < range.lo) {
            hi = m;
        } else {
            lo = m + 1;
        }
    }
    return false;
}

pub fn is32(ranges: []base.Range32, r: u32) bool {
    if (ranges.len <= base.linear_max) {
        for (ranges) |*range| {
            if (r < range.lo) {
                return false;
            }
            if (r <= range.hi) {
                return range.stride == 1 or (r - range.lo) % range.stride == 0;
            }
        }
        return false;
    }
    var lo: usize = 0;
    var hi: usize = ranges.len;
    while (lo < hi) {
        const m: usize = lo + (hi - lo) / 2;
        const range = &ranges[m];
        if (range.lo <= r and r <= range.hi) {
            return range.stride == 1 or (r - range.lo) % range.stride == 0;
        }
        if (r < range.lo) {
            hi = m;
        } else {
            lo = m + 1;
        }
    }
    return false;
}

pub fn is(range_tab: *const base.RangeTable, r: i32) bool {
    if (range_tab.r16.len > 0 and r <= @intCast(i32, range_tab.r16[range_tab.r16.len - 1].hi)) {
        return is16(range_tab.r16, @intCast(u16, r));
    }
    if (range_tab.r32.len > 0 and r > @intCast(i32, range_tab.r32[0].lo)) {
        return is32(range_tab.r32, @intCast(u32, r));
    }
    return false;
}

pub fn isExcludingLatin(range_tab: *const base.RangeTable, r: i32) bool {
    const off = range_tab.latin_offset;
    const r16_len = range_tab.r16.len;
    if (r16_len > off and r <= @intCast(i32, range_tab.r16[r16_len - 1].hi)) {
        return is16(range_tab.r16[off..], @intCast(u16, r));
    }
    if (range_tab.r32.len > 0 and r >= @intCast(i32, range_tab.r32[0].lo)) {
        return is32(range_tab.r32, @intCast(u32, r));
    }
    return false;
}

/// isUpper reports whether the rune is an upper case
pub fn isUpper(rune: i32) bool {
    if (rune <= base.max_latin1) {
        const p = tables.properties[@intCast(usize, rune)];
        return (p & base.pLmask) == base.pLu;
    }
    return isExcludingLatin(tables.Upper, rune);
}

// isLower reports whether the rune is a lower case
pub fn isLower(rune: i32) bool {
    if (rune <= base.max_latin1) {
        const p = tables.properties[@intCast(usize, rune)];
        return (p & base.pLmask) == base.pLl;
    }
    return isExcludingLatin(tables.Lower, rune);
}

// IsTitle reports whether the rune is a title case
pub fn isTitle(rune: u32) bool {
    if (rune <= base.max_latin1) {
        return false;
    }
    return isExcludingLatin(tables.Title, rune);
}

const toResult = struct {
    mapped: i32,
    found_mapping: bool,
};

fn to_case(_case: base.Case, rune: i32, case_range: []base.CaseRange) toResult {
    if (_case.rune() < 0 or base.Case.Max.rune() <= _case.rune()) {
        return toResult{
            .mapped = base.replacement_char,
            .found_mapping = false,
        };
    }
    var lo: usize = 0;
    var hi = case_range.len;
    while (lo < hi) {
        const m = lo + (hi - lo) / 2;
        const cr = case_range[m];
        if (@intCast(i32, cr.lo) <= rune and rune <= @intCast(i32, cr.hi)) {
            const delta = cr.delta[@intCast(usize, _case.rune())];
            if (delta > @intCast(i32, base.max_rune)) {
                // In an Upper-Lower sequence, which always starts with
                // an UpperCase letter, the real deltas always look like:
                //{0, 1, 0}    UpperCase (Lower is next)
                //{-1, 0, -1}  LowerCase (Upper, Title are previous)
                // The characters at even offsets from the beginning of the
                // sequence are upper case; the ones at odd offsets are lower.
                // The correct mapping can be done by clearing or setting the low
                // bit in the sequence offset.
                // The constants UpperCase and TitleCase are even while LowerCase
                // is odd so we take the low bit from _case.
                var i: i32 = 1;
                return toResult{
                    .mapped = @intCast(i32, cr.lo) + ((rune - @intCast(i32, cr.lo)) & ~i | (_case.rune() & 1)),
                    .found_mapping = true,
                };
            }
            return toResult{
                .mapped = @intCast(i32, @intCast(i32, rune) + delta),
                .found_mapping = true,
            };
        }
        if (rune < @intCast(i32, cr.lo)) {
            hi = m;
        } else {
            lo = m + 1;
        }
    }
    return toResult{
        .mapped = rune,
        .found_mapping = false,
    };
}

// to maps the rune to the specified case: UpperCase, LowerCase, or TitleCase.
pub fn to(case: base.Case, rune: i32) i32 {
    const v = to_case(case, rune, tables.CaseRanges);
    return v.mapped;
}

pub fn toUpper(rune: i32) i32 {
    if (rune <= base.max_ascii) {
        if ('a' <= rune and rune <= 'z') {
            return rune - ('a' - 'A');
        }
        return rune;
    }
    return to(base.Case.Upper, rune);
}

pub fn toLower(rune: i32) i32 {
    if (rune <= base.max_ascii) {
        if ('A' <= rune and rune <= 'Z') {
            return rune + ('a' - 'A');
        }
        return rune;
    }
    return to(base.Case.Lower, rune);
}

pub fn toTitle(rune: i32) i32 {
    if (rune <= base.max_ascii) {
        if ('a' <= rune and rune <= 'z') {
            return rune - ('a' - 'A');
        }
        return rune;
    }
    return to(base.Case.Title, rune);
}

// SimpleFold iterates over Unicode code points equivalent under
// the Unicode-defined simple case folding. Among the code points
// equivalent to rune (including rune itself), SimpleFold returns the
// smallest rune > r if one exists, or else the smallest rune >= 0.
// If r is not a valid Unicode code point, SimpleFold(r) returns r.
//
// For example:
//  SimpleFold('A') = 'a'
//  SimpleFold('a') = 'A'
//
//  SimpleFold('K') = 'k'
//  SimpleFold('k') = '\u212A' (Kelvin symbol, K)
//  SimpleFold('\u212A') = 'K'
//
//  SimpleFold('1') = '1'
//
//  SimpleFold(-2) = -2
//
pub fn simpleFold(r: u32) u32 {
    if (r < 0 or r > base.max_rune) {
        return r;
    }
    const idx = @intCast(usize, r);
    if (idx < tables.asciiFold.len) {
        return @intCast(u32, tables.asciiFold[idx]);
    }
    var lo: usize = 0;
    var hi = caseOrbit.len;
    while (lo < hi) {
        const m = lo + (hi - lo) / 2;
        if (@intCast(u32, tables.caseOrbit[m].from) < r) {
            lo = m + 1;
        } else {
            hi = m;
        }
    }
    if (lo < tables.caseOrbit.len and @intCast(tables.caseOrbit[lo].from) == r) {
        return @intCast(u32, tables.caseOrbit[lo].to);
    }
    // No folding specified. This is a one- or two-element
    // equivalence class containing rune and ToLower(rune)
    // and ToUpper(rune) if they are different from rune
    const l = toLower(r);
    if (l != r) {
        return l;
    }
    return toUpper(r);
}

pub const graphic_ranges = []*const base.RangeTable{
    tables.L, tables.M, tables.N, tables.P, tables.S, tables.Zs,
};

pub const print_ranges = []*const base.RangeTable{
    tables.L, tables.M, tables.N, tables.P, tables.S,
};

pub fn in(r: i32, ranges: []const *const base.RangeTable) bool {
    for (ranges) |inside| {
        if (is(inside, r)) {
            return true;
        }
    }
    return false;
}

// IsGraphic reports whether the rune is defined as a Graphic by Unicode.
// Such characters include letters, marks, numbers, punctuation, symbols, and
// spaces, from categories L, M, N, P, S, Zs.
pub fn isGraphic(r: i32) bool {
    if (r <= base.max_latin1) {
        return tables.properties[@intCast(usize, r)] & base.pg != 0;
    }
    return in(r, graphic_ranges[0..]);
}

// IsPrint reports whether the rune is defined as printable by Go. Such
// characters include letters, marks, numbers, punctuation, symbols, and the
// ASCII space character, from categories L, M, N, P, S and the ASCII space
// character. This categorization is the same as IsGraphic except that the
// only spacing character is ASCII space, U+0020
pub fn isPrint(r: i32) bool {
    if (r <= base.max_latin1) {
        return tables.properties[@intCast(usize, r)] & base.pp != 0;
    }
    return in(r, print_ranges[0..]);
}

pub fn isOneOf(ranges: []*base.RangeTable, r: u32) bool {
    return in(r, ranges);
}

// IsControl reports whether the rune is a control character.
// The C (Other) Unicode category includes more code points
// such as surrogates; use Is(C, r) to test for them.
pub fn isControl(r: i32) bool {
    if (r <= base.max_latin1) {
        return tables.properties[@intCast(usize, r)] & base.pC != 0;
    }
    return false;
}

// IsLetter reports whether the rune is a letter (category L).
pub fn isLetter(r: i32) bool {
    if (r <= base.max_latin1) {
        return tables.properties[@intCast(usize, r)] & base.pLmask != 0;
    }
    return isExcludingLatin(tables.Letter, r);
}

// IsMark reports whether the rune is a mark character (category M).
pub fn isMark(r: i32) bool {
    // There are no mark characters in Latin-1.
    return isExcludingLatin(tables.Mark, r);
}

// IsNumber reports whether the rune is a number (category N).
pub fn isNumber(r: i32) bool {
    if (r <= base.max_latin1) {
        return tables.properties[@intCast(usize, r)] & base.pN != 0;
    }
    return isExcludingLatin(tables.Number, r);
}

// IsPunct reports whether the rune is a Unicode punctuation character
// (category P).
pub fn isPunct(r: i32) bool {
    if (r <= base.max_latin1) {
        return tables.properties[@intCast(usize, r)] & base.pP != 0;
    }
    return is(tables.Punct, r);
}

// IsSpace reports whether the rune is a space character as defined
// by Unicode's White Space property; in the Latin-1 space
// this is
//  '\t', '\n', '\v', '\f', '\r', ' ', U+0085 (NEL), U+00A0 (NBSP).
// Other definitions of spacing characters are set by category
// Z and property Pattern_White_Space.
pub fn isSpace(r: i32) bool {
    if (r <= base.max_latin1) {
        switch (r) {
            '\t', '\n', 0x0B, 0x0C, '\r', ' ', 0x85, 0xA0 => return true,
            else => return false,
        }
    }
    return isExcludingLatin(tables.White_Space, r);
}

// IsSymbol reports whether the rune is a symbolic character.
pub fn isSymbol(r: i32) bool {
    if (r <= base.max_latin1) {
        return tables.properties[@intCast(usize, r)] & base.pS != 0;
    }
    return isExcludingLatin(tables.Symbol, r);
}

// isDigit reports whether the rune is a decimal digit.
pub fn isDigit(r: i32) bool {
    if (r <= base.max_latin1) {
        return '0' <= r and r <= '9';
    }
    return isExcludingLatin(tables.Digit, r);
}

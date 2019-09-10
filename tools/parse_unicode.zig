const std = @import("std");
const file_name = "tools/UnicodeData.txt";

const letters = [_][]const u8{ "Lu", "Ll", "Lt", "Lm", "Lo" };
const spaces = [_][]const u8{ "Zs", "Zl", "Zp" };
const left_brace = "{";
const right_brace = "}";
const Range = struct {
    start: isize,
    stop: isize,
    diff: isize,

    pub fn format(
        self: Range,
        comptime fmt: []const u8,
        options: std.fmt.FormatOptions,
        context: var,
        comptime Errors: type,
        output: fn (@typeOf(context), []const u8) Errors!void,
    ) Errors!void {
        try std.fmt.format(
            context,
            Errors,
            output,
            "  0x{X},0x{X},{}",
            self.start,
            self.stop,
            self.diff,
        );
    }
};

const NonLetterRange = struct {
    start: isize,
    stop: isize,
    pub fn format(
        self: NonLetterRange,
        comptime fmt: []const u8,
        options: std.fmt.FormatOptions,
        context: var,
        comptime Errors: type,
        output: fn (@typeOf(context), []const u8) Errors!void,
    ) Errors!void {
        try std.fmt.format(
            context,
            Errors,
            output,
            "  0x{X},0x{X}",
            self.start,
            self.stop,
        );
    }
};

const Singlet = struct {
    code: isize,
    diff: isize,
    pub fn format(
        self: Singlet,
        comptime fmt: []const u8,
        options: std.fmt.FormatOptions,
        context: var,
        comptime Errors: type,
        output: fn (@typeOf(context), []const u8) Errors!void,
    ) Errors!void {
        try std.fmt.format(
            context,
            Errors,
            output,
            "  0x{X},{}",
            self.code,
            self.diff,
        );
    }
};
var allocator = std.heap.direct_allocator;

const SingletList = std.ArrayList(Singlet);
const UsizeList = std.ArrayList(isize);
const RangeList = std.ArrayList(Range);
const NonLetterRangeList = std.ArrayList(NonLetterRange);

const Context = struct {
    to_upper: SingletList,
    to_lower: SingletList,
    to_title: SingletList,
    alphas: UsizeList,
    unispaces: UsizeList,

    to_upper_ranges: RangeList,
    to_upper_singlets: SingletList,
    to_lower_ranges: RangeList,
    to_lower_singlets: SingletList,
    to_title_ranges: RangeList,
    to_title_singlets: SingletList,

    space_ranges: NonLetterRangeList,
    unicode_spaces: UsizeList,
    alpha_ranges: NonLetterRangeList,
    alphas_singlets: UsizeList,

    fn init(a: *std.mem.Allocator) Context {
        return Context{
            .to_upper = SingletList.init(a),
            .to_lower = SingletList.init(a),
            .to_title = SingletList.init(a),
            .alphas = UsizeList.init(a),
            .unispaces = UsizeList.init(a),

            .to_upper_ranges = RangeList.init(a),
            .to_upper_singlets = SingletList.init(a),
            .to_lower_ranges = RangeList.init(a),
            .to_lower_singlets = SingletList.init(a),
            .to_title_ranges = RangeList.init(a),
            .to_title_singlets = SingletList.init(a),

            .space_ranges = NonLetterRangeList.init(a),
            .unicode_spaces = UsizeList.init(a),
            .alpha_ranges = NonLetterRangeList.init(a),
            .alphas_singlets = UsizeList.init(a),
        };
    }

    fn dump(self: *Context, stream: var) !void {
        try createheader(self, stream);
        try dumpRangeList(&self.to_lower_ranges, "to_lower_ranges", stream);
        try dumpSingletList(&self.to_lower_singlets, "to_lower_singlets", stream);

        try dumpRangeList(&self.to_upper_ranges, "to_upper_ranges", stream);
        try dumpSingletList(&self.to_upper_singlets, "to_upper_singlets", stream);

        try dumpSingletList(&self.to_title_singlets, "to_title_singlets", stream);
        try dumpNLRangeList(&self.alpha_ranges, "alpha_ranges", stream);
        try dumpUsizeList(&self.alphas_singlets, "alphas_singlets", stream);
        try dumpNLRangeList(&self.space_ranges, "space_ranges", stream);
        try dumpUsizeList(&self.unispaces, "unicode_spaces", stream);
    }

    fn createheader(self: *Context, stream: var) !void {
        try stream.print("// This file was auto generated\n");
    }

    fn dumpRangeList(v: *RangeList, name: []const u8, stream: var) !void {
        try stream.print("pub const {}=[_]isize{}\n", name, left_brace);

        for (v.toSlice()) |r| {
            try stream.print("  {},\n", r);
        }
        try stream.print("{};\n", right_brace);
    }

    fn dumpNLRangeList(v: *NonLetterRangeList, name: []const u8, stream: var) !void {
        try stream.print("pub const {}=[_]isize{}\n", name, left_brace);

        for (v.toSlice()) |r| {
            try stream.print("  {},\n", r);
        }
        try stream.print("{};\n", right_brace);
    }

    fn dumpSingletList(v: *SingletList, name: []const u8, stream: var) !void {
        try stream.print("pub const {}=[_]isize{}\n", name, left_brace);

        for (v.toSlice()) |r| {
            try stream.print("  {},\n", r);
        }
        try stream.print("{};\n", right_brace);
    }

    fn dumpUsizeList(v: *UsizeList, name: []const u8, stream: var) !void {
        try stream.print("pub const {}=[_]isize{}\n", name, left_brace);

        for (v.toSlice()) |r| {
            try stream.print("  0x{X},\n", r);
        }
        try stream.print("{};", right_brace);
    }
};

fn parse(ctx: *Context, data: []const u8) !void {
    var stream = &std.io.SliceInStream.init(data).stream;
    var buf = &try std.Buffer.init(allocator, "");
    defer buf.deinit();
    var not_done = true;
    while (not_done) {
        try buf.resize(0);
        if (std.io.readLineFrom(stream, buf)) |_| {} else |err| {
            if (err != error.EndOfStream) {
                return err;
            }
            not_done = false;
        }
        if (buf.len() == 0) {
            return;
        }
        var iter = &std.mem.SplitIterator{
            .buffer = buf.toSlice(),
            .index = 0,
            .delimiter = ";",
        };
        var i: usize = 0;
        var code: isize = undefined;
        var uc: []const u8 = "";
        var lc: []const u8 = "";
        var tc: []const u8 = "";
        var category: []const u8 = "";
        while (iter.next()) |value| {
            switch (i) {
                0 => {
                    code = try std.fmt.parseInt(isize, value, 16);
                },
                2 => {
                    category = value;
                },
                12 => {
                    uc = value;
                },
                13 => {
                    lc = value;
                },
                14 => {
                    tc = value;
                },
                else => {},
            }
            i += 1;
        }
        if (!categoryInSpace(category) and categoryInSpace(category)) {
            continue;
        }
        if (uc.len > 0) {
            const n = try std.fmt.parseInt(isize, uc, 16);
            const diff: isize = 500 + n - code;
            try ctx.to_upper.append(Singlet{
                .code = code,
                .diff = diff,
            });
        }
        if (lc.len > 0) {
            const n = try std.fmt.parseInt(isize, lc, 16);
            const diff: isize = 500 + n - code;
            try ctx.to_lower.append(Singlet{
                .code = code,
                .diff = diff,
            });
        }
        if (tc.len > 0 and !std.mem.eql(u8, tc, uc)) {
            const n = try std.fmt.parseInt(isize, tc, 16);
            const diff: isize = 500 + n - code;
            if (diff != 500) {
                try ctx.to_title.append(Singlet{
                    .code = code,
                    .diff = diff,
                });
            }
        }
        if (categoryInSpace(category)) {
            try ctx.unispaces.append(code);
        } else {
            try ctx.alphas.append(code);
        }
    }
}

fn categoryInLetters(category: []const u8) bool {
    for (letters) |v| {
        if (std.mem.eql(u8, category, v)) {
            return true;
        }
    }
    return false;
}

fn categoryInSpace(category: []const u8) bool {
    for (spaces) |v| {
        if (std.mem.eql(u8, category, v)) {
            return true;
        }
    }
    return false;
}

fn splitRange1(a: *SingletList, r: *RangeList, s: *SingletList) !void {
    var i: usize = 0;
    var j: usize = 0;
    while (i < a.len) {
        j = 1;
        const start_code = a.at(i).code;
        const start_diff = a.at(i).diff;
        while (i + j <= a.len) {
            if (i + j >= a.len or a.at(i + j).code != start_code + @intCast(isize, j) or a.at(i + j).diff != start_diff) {
                if (j == 1) {
                    try s.append(Singlet{
                        .code = start_code,
                        .diff = start_diff,
                    });
                } else {
                    try r.append(Range{
                        .start = start_code,
                        .stop = a.at(i + j - 1).code,
                        .diff = start_diff,
                    });
                }
                i += j + 1;
                break;
            } else {
                j += 1;
            }
        }
        i += 1;
    }
}

fn splitRange2(a: *UsizeList, r: *NonLetterRangeList, s: *UsizeList) !void {
    var i: usize = 0;
    var j: usize = 0;
    while (i < a.len) {
        j = 1;
        const start_code = a.at(i);
        while (i + j <= a.len) {
            if (i + j >= a.len or a.at(i + j) != start_code + @intCast(isize, j)) {
                if (j == 1) {
                    try s.append(start_code);
                } else {
                    try r.append(NonLetterRange{
                        .start = start_code,
                        .stop = a.at(i + j - 1),
                    });
                }
                i += j + 1;
                break;
            } else {
                j += 1;
            }
        }
        i += 1;
    }
}

fn splitSpaces(a: *UsizeList, r: *NonLetterRangeList, s: *UsizeList) !void {
    var i: usize = 0;
    var j: usize = 0;
    while (i < a.len) {
        j = 1;
        const start_code = a.at(i);
        while (i + j <= a.len) {
            if (i + j >= a.len or a.at(i + j) != start_code + @intCast(isize, j)) {
                try r.append(NonLetterRange{
                    .start = start_code,
                    .stop = a.at(i + j - 1),
                });
                i += j - 1;
                break;
            } else {
                j += 1;
            }
        }
        i += 1;
    }
}

pub fn main() !void {
    const data = try std.io.readFileAlloc(allocator, file_name);
    defer allocator.free(data);
    var ctx = Context.init(allocator);
    try parse(&ctx, data);
    try splitRange1(&ctx.to_lower, &ctx.to_lower_ranges, &ctx.to_lower_singlets);
    try splitRange1(&ctx.to_upper, &ctx.to_upper_ranges, &ctx.to_upper_singlets);
    try splitRange1(&ctx.to_title, &ctx.to_title_ranges, &ctx.to_title_singlets);
    try splitRange2(&ctx.alphas, &ctx.alpha_ranges, &ctx.alphas_singlets);

    var i: usize = 9;
    while (i <= 13) : (i += 1) {
        try (&ctx.unispaces).append(@intCast(isize, i));
    }
    try ctx.unispaces.append(0x85);
    sortUsizeList(&ctx.unispaces);
    try splitSpaces(&ctx.unispaces, &ctx.space_ranges, &ctx.unicode_spaces);

    var std_out_file = try std.io.getStdOut();
    var out_stream = std_out_file.outStream();
    try ctx.dump(&out_stream.stream);
}

fn sortUsizeList(v: *UsizeList) void {
    std.sort.sort(isize, v.toSlice(), lessIsize);
}

fn lessIsize(a: isize, b: isize) bool {
    return a < b;
}

const utf8 = @import("index.zig");
const unicode = @import("../index.zig");
const t = @import("../util/index.zig");

test "init" {
    if (utf8.max_rune != unicode.base.max_rune) {
        try t.terror("wrong utf8.max_rune");
    }
}

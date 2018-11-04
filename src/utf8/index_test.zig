const utf8 = @import("index.zig");
const unicode = @import("../index.zig");
const t = @import("../util/index.zig");

test "init" {
    if (utf8.max_rune != unicode.base.max_rune) {
        try t.terror("wrong utf8.max_rune");
    }
    if (utf8.rune_error != unicode.base.replacement_char) {
        try t.terror("wrong utf8.rune_error");
    }
}

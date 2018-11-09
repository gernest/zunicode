const unicode = @import("../index.zig");
const utf16 = @import("index.zig");
const t = @import("../util/index.zig");

test "constants" {
    if (utf16.max_rune != unicode.base.max_rune) {
        try t.terror("utf16.max_rune is wrong");
    }
}

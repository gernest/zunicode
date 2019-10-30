test "all" {
    _ = @import("./zunicode_test.zig");
    _ = @import("./utf8/index_test.zig");
    _ = @import("./utf16/index_test.zig");
}

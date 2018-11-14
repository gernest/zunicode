test "all" {
    _ = @import("./index_test.zig");
    _ = @import("./utf8/index_test.zig");
    _ = @import("./utf16/index_test.zig");
}

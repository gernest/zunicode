const utf8 = @import("./src/utf8/index.zig");
const warn = @import("std").debug.warn;

test "ExampleRuneLen" {
    warn("\n{}\n", try utf8.runeLen('a'));
    warn("{}\n", try utf8.runeLen(0x754c)); // chinese character 0x754c 界

    // Test 1/1 ExampleRuneLen...
    // 1
    // 3
    // OK
}

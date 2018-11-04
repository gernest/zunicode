# zunicode

This package provided functions for working with unicode code points. It is the
goal of the package to be low level, offering primitives for working with
unicode in the `ziglang`.

The source was ported from go standard unicode package. The port was done by
hand which means the API is not exactly `1:1` mapping.

For working with `utf-8` values see `src/utf8/` , and for `utf-16` see `src/utf16`.


## `Rune`
This is a concept borrowed from go. It is an alias for `u32` which is a
representation of a unicode code point.


# examples 

## how many bytes required to encode a unicode code point

```zig
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
```

## notes

For some reason it is not possible to define some other characters using `'界'`,
so I have used the character's hex values instead.



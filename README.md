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

#### how many bytes required to encode a unicode code point

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


##### check what type of characters you are dealing with

```zig
const utf8 = @import("./src/utf8/index.zig");
const unicode = @import("./src/index.zig");
const warn = @import("std").debug.warn;

test "Example_is" {
    const mixed = "\t5Ὂg̀9! ℃ᾭG";
    var iter = utf8.Iterator.init(mixed);
    var a = []u8.{0} ** 5;
    warn("\n");
    while (true) {
        const next = try iter.next();
        if (next == null) {
            break;
        }
        const size = try utf8.encodeRune(a[0..], next.?.value);
        warn("For {}:\n", a[0..size]);
        if (unicode.isControl(next.?.value)) {
            warn("\t is control rune\n");
        }
        if (unicode.isDigit(next.?.value)) {
            warn("\t is digit rune\n");
        }
        if (unicode.isGraphic(next.?.value)) {
            warn("\t is graphic rune\n");
        }
        if (unicode.isLetter(next.?.value)) {
            warn("\t is letter rune\n");
        }
        if (unicode.isLower(next.?.value)) {
            warn("\t is lower case rune\n");
        }
        if (unicode.isMark(next.?.value)) {
            warn("\t is mark rune\n");
        }
        if (unicode.isNumber(next.?.value)) {
            warn("\t is number rune\n");
        }
        if (unicode.isPrint(next.?.value)) {
            warn("\t is printable rune\n");
        }
        if (unicode.isPunct(next.?.value)) {
            warn("\t is punct rune\n");
        }
        if (unicode.isSpace(next.?.value)) {
            warn("\t is space rune\n");
        }
        if (unicode.isSymbol(next.?.value)) {
            warn("\t is symbol rune\n");
        }
        if (unicode.isTitle(next.?.value)) {
            warn("\t is title rune\n");
        }
        if (unicode.isUpper(next.?.value)) {
            warn("\t is upper case rune\n");
        }
    }
    // Test 2/2 Example_is...
    // For     :
    //          is control rune
    //          is space rune
    // For 5:
    //          is digit rune
    //          is graphic rune
    //          is number rune
    //          is printable rune
    // For Ὂ:
    //          is graphic rune
    //          is letter rune
    //          is printable rune
    //          is upper case rune
    // For g:
    //          is graphic rune
    //          is letter rune
    //          is lower case rune
    //          is printable rune
    // For ̀:
    //          is graphic rune
    //          is mark rune
    //          is printable rune
    // For 9:
    //          is digit rune
    //          is graphic rune
    //          is number rune
    //          is printable rune
    // For !:
    //          is graphic rune
    //          is printable rune
    //          is punct rune
    // For  :
    //          is graphic rune
    //          is printable rune
    //          is space rune
    // For ℃:
    //          is graphic rune
    //          is printable rune
    //          is symbol rune
    // For ᾭ:
    //          is graphic rune
    //          is letter rune
    //          is printable rune
    //          is title rune
    // For G:
    //          is graphic rune
    //          is letter rune
    //          is printable rune
    //          is upper case rune
    // OK
}
```

## notes

For some reason it is not possible to define some other characters using `'界'`,
so I have used the character's hex values instead.

Many functions in the go unicode package are found in pairs , one for byte
slice and one for strings. Since there is no concept of strings in zig, I have
intentionally omitted the string functions and only port operations over byte
slice `[] const u8` or `[]u8`.

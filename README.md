# zunicode

This package provided functions for working with unicode code points. It is the
goa of the package to be low lever, offering primitives for working with
unicode in the `ziglang`.

The source was ported from go standard unicode package. The port was done by
hand which means the API is not exactly `1:1` mapping.

For working with `utf-8` values see `src/utf8/` , and for `utf-16` see `src/utf16`.


## `Rune`
This is a concept borrowed from go. It is an alias for `u32` which is a
representation of a unicode code point.




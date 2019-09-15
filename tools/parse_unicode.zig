const std = @import("std");
const warn = std.debug.warn;
const assert = std.debug.assert;
const mem = std.mem;
const ascii = std.ascii;
const math = std.math;

const GeneralCategory = enum(usize) {
    Cn, // "Unassigned"
    Lu, // "Uppercase_Letter"
    Ll, // "Lowercase_Letter"
    Lt, // "Titlecase_Letter"
    Lm, // "Modifier_Letter"
    Lo, // "Other_Letter"
    Mn, // "Nonspacing_Mark"
    Mc, // "Spacing_Mark"
    Me, // "Enclosing_Mark"
    Nd, // "Decimal_Number,d// igit"
    Nl, // "Letter_Number"
    No, // "Other_Number"
    Sm, // "Math_Symbol"
    Sc, // "Currency_Symbol"
    Sk, // "Modifier_Symbol"
    So, // "Other_Symbol"
    Pc, // "Connector_Punctuation"
    Pd, // "Dash_Punctuation"
    Ps, // "Open_Punctuation"
    Pe, // "Close_Punctuation"
    Pi, // "Initial_Punctuation"
    Pf, // "Final_Punctuation"
    Po, // "Other_Punctuation"
    Zs, // "Space_Separator"
    Zl, // "Line_Separator"
    Zp, // "Paragraph_Separator"
    Cc, // "Control,c// ntrl"
    Cf, // "Format"
    Cs, // "Surrogate"
    Co, // "Private_Use"
    // synthetic properties
    LC, // "Cased_Letter"
    L, // "Letter"
    M, // "Mark,C// ombining_Mark"
    N, // "Number"
    S, // "Symbol"
    P, // "Punctuation,p// unct"
    Z, // "Separator"
    C, // "Other"
};

const unicode_gc_name = [_][]const u8{
    "Cn", "Lu", "Ll",
    "Lt", "Lm", "Lo",
    "Mn", "Mc", "Me",
    "Nd", "Nl", "No",
    "Sm", "Sc", "Sk",
    "So", "Pc", "Pd",
    "Ps", "Pe", "Pi",
    "Pf", "Po", "Zs",
    "Zl", "Zp", "Cc",
    "Cf", "Cs", "Co",
    "LC", "L",  "M",
    "N",  "S",  "P",
    "Z",  "C",
};

const unicode_gc_short_name = [_][]const u8{
    "Unassigned",            "Uppercase_Letter",
    "Lowercase_Letter",      "Titlecase_Letter",
    "Modifier_Letter",       "Other_Letter",
    "Nonspacing_Mark",       "Spacing_Mark",
    "Enclosing_Mark",        "Decimal_Number,digit",
    "Letter_Number",         "Other_Number",
    "Math_Symbol",           "Currency_Symbol",
    "Modifier_Symbol",       "Other_Symbol",
    "Connector_Punctuation", "Dash_Punctuation",
    "Open_Punctuation",      "Close_Punctuation",
    "Initial_Punctuation",   "Final_Punctuation",
    "Other_Punctuation",     "Space_Separator",
    "Line_Separator",        "Paragraph_Separator",
    "Control,cntrl",         "Format",
    "Surrogate",             "Private_Use",
    "Cased_Letter",          "Letter",
    "Mark,Combining_Mark",   "Number",
    "Symbol",                "Punctuation,punct",
    "Separator",             "Other",
};

const GeneralStript = enum(usize) {
    Unknown, // "Zzzz"
    Adlam, // "Adlm"
    Ahom, // "Ahom"
    Anatolian_Hieroglyphs, // "Hluw"
    Arabic, // "Arab"
    Armenian, // "Armn"
    Avestan, // "Avst"
    Balinese, // "Bali"
    Bamum, // "Bamu"
    Bassa_Vah, // "Bass"
    Batak, // "Batk"
    Bengali, // "Beng"
    Bhaiksuki, // "Bhks"
    Bopomofo, // "Bopo"
    Brahmi, // "Brah"
    Braille, // "Brai"
    Buginese, // "Bugi"
    Buhid, // "Buhd"
    Canadian_Aboriginal, // "Cans"
    Carian, // "Cari"
    Caucasian_Albanian, // "Aghb"
    Chakma, // "Cakm"
    Cham, // "Cham"
    Cherokee, // "Cher"
    Common, // "Zyyy"
    Coptic, // "Copt,  //Qaac"
    Cuneiform, // "Xsux"
    Cypriot, // "Cprt"
    Cyrillic, // "Cyrl"
    Deseret, // "Dsrt"
    Devanagari, // "Deva"
    Dogra, // "Dogr"
    Duployan, // "Dupl"
    Egyptian_Hieroglyphs, // "Egyp"
    Elbasan, // "Elba"
    Ethiopic, // "Ethi"
    Georgian, // "Geor"
    Glagolitic, // "Glag"
    Gothic, // "Goth"
    Grantha, // "Gran"
    Greek, // "Grek"
    Gujarati, // "Gujr"
    Gunjala_Gondi, // "Gong"
    Gurmukhi, // "Guru"
    Han, // "Hani"
    Hangul, // "Hang"
    Hanifi_Rohingya, // "Rohg"
    Hanunoo, // "Hano"
    Hatran, // "Hatr"
    Hebrew, // "Hebr"
    Hiragana, // "Hira"
    Imperial_Aramaic, // "Armi"
    Inherited, // "Zinh,  //Qaai"
    Inscriptional_Pahlavi, // "Phli"
    Inscriptional_Parthian, // "Prti"
    Javanese, // "Java"
    Kaithi, // "Kthi"
    Kannada, // "Knda"
    Katakana, // "Kana"
    Kayah_Li, // "Kali"
    Kharoshthi, // "Khar"
    Khmer, // "Khmr"
    Khojki, // "Khoj"
    Khudawadi, // "Sind"
    Lao, // "Laoo"
    Latin, // "Latn"
    Lepcha, // "Lepc"
    Limbu, // "Limb"
    Linear_A, // "Lina"
    Linear_B, // "Linb"
    Lisu, // "Lisu"
    Lycian, // "Lyci"
    Lydian, // "Lydi"
    Makasar, // "Maka"
    Mahajani, // "Mahj"
    Malayalam, // "Mlym"
    Mandaic, // "Mand"
    Manichaean, // "Mani"
    Marchen, // "Marc"
    Masaram_Gondi, // "Gonm"
    Medefaidrin, // "Medf"
    Meetei_Mayek, // "Mtei"
    Mende_Kikakui, // "Mend"
    Meroitic_Cursive, // "Merc"
    Meroitic_Hieroglyphs, // "Mero"
    Miao, // "Plrd"
    Modi, // "Modi"
    Mongolian, // "Mong"
    Mro, // "Mroo"
    Multani, // "Mult"
    Myanmar, // "Mymr"
    Nabataean, // "Nbat"
    New_Tai_Lue, // "Talu"
    Newa, // "Newa"
    Nko, // "Nkoo"
    Nushu, // "Nshu"
    Ogham, // "Ogam"
    Ol_Chiki, // "Olck"
    Old_Hungarian, // "Hung"
    Old_Italic, // "Ital"
    Old_North_Arabian, // "Narb"
    Old_Permic, // "Perm"
    Old_Persian, // "Xpeo"
    Old_Sogdian, // "Sogo"
    Old_South_Arabian, // "Sarb"
    Old_Turkic, // "Orkh"
    Oriya, // "Orya"
    Osage, // "Osge"
    Osmanya, // "Osma"
    Pahawh_Hmong, // "Hmng"
    Palmyrene, // "Palm"
    Pau_Cin_Hau, // "Pauc"
    Phags_Pa, // "Phag"
    Phoenician, // "Phnx"
    Psalter_Pahlavi, // "Phlp"
    Rejang, // "Rjng"
    Runic, // "Runr"
    Samaritan, // "Samr"
    Saurashtra, // "Saur"
    Sharada, // "Shrd"
    Shavian, // "Shaw"
    Siddham, // "Sidd"
    SignWriting, // "Sgnw"
    Sinhala, // "Sinh"
    Sogdian, // "Sogd"
    Sora_Sompeng, // "Sora"
    Soyombo, // "Soyo"
    Sundanese, // "Sund"
    Syloti_Nagri, // "Sylo"
    Syriac, // "Syrc"
    Tagalog, // "Tglg"
    Tagbanwa, // "Tagb"
    Tai_Le, // "Tale"
    Tai_Tham, // "Lana"
    Tai_Viet, // "Tavt"
    Takri, // "Takr"
    Tamil, // "Taml"
    Tangut, // "Tang"
    Telugu, // "Telu"
    Thaana, // "Thaa"
    Thai, // "Thai"
    Tibetan, // "Tibt"
    Tifinagh, // "Tfng"
    Tirhuta, // "Tirh"
    Ugaritic, // "Ugar"
    Vai, // "Vaii"
    Warang_Citi, // "Wara"
    Yi, // "Yiii"
    Zanabazar_Square, // "Zanb"
};

const unicode_script_name = [_][]const u8{
    "Unknown",            "Adlam",            "Ahom",          "Anatolian_Hieroglyphs", "Arabic",
    "Armenian",           "Avestan",          "Balinese",      "Bamum",                 "Bassa_Vah",
    "Batak",              "Bengali",          "Bhaiksuki",     "Bopomofo",              "Brahmi",
    "Braille",            "Buginese",         "Buhid",         "Canadian_Aboriginal",   "Carian",
    "Caucasian_Albanian", "Chakma",           "Cham",          "Cherokee",              "Common",
    "Coptic",             "Cuneiform",        "Cypriot",       "Cyrillic",              "Deseret",
    "Devanagari",         "Dogra",            "Duployan",      "Egyptian_Hieroglyphs",  "Elbasan",
    "Ethiopic",           "Georgian",         "Glagolitic",    "Gothic",                "Grantha",
    "Greek",              "Gujarati",         "Gunjala_Gondi", "Gurmukhi",              "Han",
    "Hangul",             "Hanifi_Rohingya",  "Hanunoo",       "Hatran",                "Hebrew",
    "Hiragana",           "Imperial_Aramaic", "Inherited",     "Inscriptional_Pahlavi", "Inscriptional_Parthian",
    "Javanese",           "Kaithi",           "Kannada",       "Katakana",              "Kayah_Li",
    "Kharoshthi",         "Khmer",            "Khojki",        "Khudawadi",             "Lao",
    "Latin",              "Lepcha",           "Limbu",         "Linear_A",              "Linear_B",
    "Lisu",               "Lycian",           "Lydian",        "Makasar",               "Mahajani",
    "Malayalam",          "Mandaic",          "Manichaean",    "Marchen",               "Masaram_Gondi",
    "Medefaidrin",        "Meetei_Mayek",     "Mende_Kikakui", "Meroitic_Cursive",      "Meroitic_Hieroglyphs",
    "Miao",               "Modi",             "Mongolian",     "Mro",                   "Multani",
    "Myanmar",            "Nabataean",        "New_Tai_Lue",   "Newa",                  "Nko",
    "Nushu",              "Ogham",            "Ol_Chiki",      "Old_Hungarian",         "Old_Italic",
    "Old_North_Arabian",  "Old_Permic",       "Old_Persian",   "Old_Sogdian",           "Old_South_Arabian",
    "Old_Turkic",         "Oriya",            "Osage",         "Osmanya",               "Pahawh_Hmong",
    "Palmyrene",          "Pau_Cin_Hau",      "Phags_Pa",      "Phoenician",            "Psalter_Pahlavi",
    "Rejang",             "Runic",            "Samaritan",     "Saurashtra",            "Sharada",
    "Shavian",            "Siddham",          "SignWriting",   "Sinhala",               "Sogdian",
    "Sora_Sompeng",       "Soyombo",          "Sundanese",     "Syloti_Nagri",          "Syriac",
    "Tagalog",            "Tagbanwa",         "Tai_Le",        "Tai_Tham",              "Tai_Viet",
    "Takri",              "Tamil",            "Tangut",        "Telugu",                "Thaana",
    "Thai",               "Tibetan",          "Tifinagh",      "Tirhuta",               "Ugaritic",
    "Vai",                "Warang_Citi",      "Yi",            "Zanabazar_Square",
};

const unicode_script_short_name = [_][]const u8{
    "Zzzz", "Adlm", "Ahom", "Hluw",      ",Arab",     "Armn", "Avst",
    "Bali", "Bamu", "Bass", "Batk",      "Beng",      "Bhks", "Bopo",
    "Brah", "Brai", "Bugi", "Buhd",      "Cans",      "Cari", "Aghb",
    "Cakm", "Cham", "Cher", "Zyyy",      "Copt,Qaac", "Xsux", "Cprt",
    "Cyrl", "Dsrt", "Deva", "Dogr",      "Dupl",      "Egyp", "Elba",
    "Ethi", "Geor", "Glag", "Goth",      "Gran",      "Grek", "Gujr",
    "Gong", "Guru", "Hani", "Hang",      "Rohg",      "Hano", "Hatr",
    "Hebr", "Hira", "Armi", "Zinh,Qaai", "Phli",      "Prti", "Java",
    "Kthi", "Knda", "Kana", "Kali",      "Khar",      "Khmr", "Khoj",
    "Sind", "Laoo", "Latn", "Lepc",      "Limb",      "Lina", "Linb",
    "Lisu", "Lyci", "Lydi", "Maka",      "Mahj",      "Mlym", "Mand",
    "Mani", "Marc", "Gonm", "Medf",      "Mtei",      "Mend", "Merc",
    "Mero", "Plrd", "Modi", "Mong",      "Mroo",      "Mult", "Mymr",
    "Nbat", "Talu", "Newa", "Nkoo",      "Nshu",      "Ogam", "Olck",
    "Hung", "Ital", "Narb", "Perm",      "Xpeo",      "Sogo", "Sarb",
    "Orkh", "Orya", "Osge", "Osma",      "Hmng",      "Palm", "Pauc",
    "Phag", "Phnx", "Phlp", "Rjng",      "Runr",      "Samr", "Saur",
    "Shrd", "Shaw", "Sidd", "Sgnw",      "Sinh",      "Sogd", "Sora",
    "Soyo", "Sund", "Sylo", "Syrc",      "Tglg",      "Tagb", "Tale",
    "Lana", "Tavt", "Takr", "Taml",      "Tang",      "Telu", "Thaa",
    "Thai", "Tibt", "Tfng", "Tirh",      "Ugar",      "Vaii", "Wara",
    "Yiii", "Zanb",
};

const Prop = enum(usize) {

    // /* Prop list not exported to regexp */
    Hyphen,
    Other_Math,
    Other_Alphabetic,
    Other_Lowercase,
    Other_Uppercase,
    Other_Grapheme_Extend,
    Other_Default_Ignorable_Code_Point,
    Other_ID_Start,
    Other_ID_Continue,
    Prepended_Concatenation_Mark,
    // /* additional computed properties for smaller tables */
    ID_Continue1,
    XID_Start1,
    XID_Continue1,
    Changes_When_Titlecased1,
    Changes_When_Casefolded1,
    Changes_When_NFKC_Casefolded1,

    // /* Prop list exported to JS */
    ASCII_Hex_Digit, // "AHex"
    Bidi_Control, // "Bidi_C"
    Dash,
    Deprecated, // "Dep"
    Diacritic, // "Dia"
    Extender, // "Ext"
    Hex_Digit, // "Hex"
    IDS_Binary_Operator, // "IDSB"
    IDS_Trinary_Operator, // "IDST"
    Ideographic, // "Ideo"
    Join_Control, // "Join_C"
    Logical_Order_Exception, // "LOE"
    Noncharacter_Code_Point, // "NChar"
    Pattern_Syntax, // "Pat_Syn"
    Pattern_White_Space, // "Pat_WS"
    Quotation_Mark, // "QMark"
    Radical,
    Regional_Indicator, // "RI"
    Sentence_Terminal, // "STerm"
    Soft_Dotted, // "SD"
    Terminal_Punctuation, // "Term"
    Unified_Ideograph, // "UIdeo"
    Variation_Selector, // "VS"
    White_Space, // "space"
    Bidi_Mirrored, // "Bidi_M"
    Emoji,
    Emoji_Component,
    Emoji_Modifier,
    Emoji_Modifier_Base,
    Emoji_Presentation,
    Extended_Pictographic,
    Default_Ignorable_Code_Point, // "DI"
    ID_Start, // "IDS"
    Case_Ignorable, // "CI"

    // /* other binary properties */
    ASCII,
    Alphabetic, // "Alpha"
    Any,
    Assigned,
    Cased,
    Changes_When_Casefolded, // "CWCF"
    Changes_When_Casemapped, // "CWCM"
    Changes_When_Lowercased, // "CWL"
    Changes_When_NFKC_Casefolded, // "CWKCF"
    Changes_When_Titlecased, // "CWT"
    Changes_When_Uppercased, // "CWU"
    Grapheme_Base, // "Gr_Base"
    Grapheme_Extend, // "Gr_Ext"
    ID_Continue, // "IDC"
    Lowercase, // "Lower"
    Math,
    Uppercase, // "Upper"
    XID_Continue, // "XIDC"
    XID_Start, // "XIDS"

    // /* internal tables with index */
    Cased1,
};

const unicode_prop_name = [_][]const u8{
    "Hyphen",                             "Other_Math",                   "Other_Alphabetic",
    "Other_Lowercase",                    "Other_Uppercase",              "Other_Grapheme_Extend",
    "Other_Default_Ignorable_Code_Point", "Other_ID_Start",               "Other_ID_Continue",
    "Prepended_Concatenation_Mark",       "ID_Continue1",                 "XID_Start1",
    "XID_Continue1",                      "Changes_When_Titlecased1",     "Changes_When_Casefolded1",
    "Changes_When_NFKC_Casefolded1",      "ASCII_Hex_Digit",              "Bidi_Control",
    "Dash",                               "Deprecated",                   "Diacritic",
    "Extender",                           "Hex_Digit",                    "IDS_Binary_Operator",
    "IDS_Trinary_Operator",               "Ideographic",                  "Join_Control",
    "Logical_Order_Exception",            "Noncharacter_Code_Point",      "Pattern_Syntax",
    "Pattern_White_Space",                "Quotation_Mark",               "Radical",
    "Regional_Indicator",                 "Sentence_Terminal",            "Soft_Dotted",
    "Terminal_Punctuation",               "Unified_Ideograph",            "Variation_Selector",
    "White_Space",                        "Bidi_Mirrored",                "Emoji",
    "Emoji_Component",                    "Emoji_Modifier",               "Emoji_Modifier_Base",
    "Emoji_Presentation",                 "Extended_Pictographic",        "Default_Ignorable_Code_Point",
    "ID_Start",                           "Case_Ignorable",               "ASCII",
    "Alphabetic",                         "Any",                          "Assigned",
    "Cased",                              "Changes_When_Casefolded",      "Changes_When_Casemapped",
    "Changes_When_Lowercased",            "Changes_When_NFKC_Casefolded", "Changes_When_Titlecased",
    "Changes_When_Uppercased",            "Grapheme_Base",                "Grapheme_Extend",
    "ID_Continue",                        "Lowercase",                    "Math",
    "Uppercase",                          "XID_Continue",                 "XID_Start",
    "Cased1",
};

const unicode_prop_short_name = [_][]const u8{
    "",      "",        "",       "",       "",      "",        "",
    "",      "",        "",       "",       "",      "",        "",
    "",      "",        "AHex",   "Bidi_C", "",      "Dep",     "Dia",
    "Ext",   "Hex",     "IDSB",   "IDST",   "Ideo",  "Join_C",  "LOE",
    "NChar", "Pat_Syn", "Pat_WS", "QMark",  "",      "RI",      "STerm",
    "SD",    "Term",    "UIdeo",  "VS",     "space", "Bidi_M",  "",
    "",      "",        "",       "",       "",      "DI",      "IDS",
    "CI",    "",        "Alpha",  "",       "",      "",        "CWCF",
    "CWCM",  "CWL",     "CWKCF",  "CWT",    "CWU",   "Gr_Base", "Gr_Ext",
    "IDC",   "Lower",   "",       "Upper",  "XIDC",  "XIDS",    "",
};

const CHARCODE_MAX = 0x10ffff;
const CC_LEN_MAX = 3;

const CCInfo = struct {
    combining_class: isize,
    u_len: usize,
    l_len: usize,
    u_data: [CC_LEN_MAX]usize,
    l_data: [CC_LEN_MAX]usize,
    f_code: isize,
    is_compat: bool,
    is_excluded: bool,
    general_category: usize,
    script: usize,
    prop_bitmap_tab: [3]u32,
    decomp_data: std.ArrayList(isize),

    fn init(a: *mem.Allocator) CCInfo {
        return CCInfo{
            .combining_class = 0,
            .u_len = 0,
            .l_len = 0,
            .u_data = [_]usize{0} ** CC_LEN_MAX,
            .l_data = [_]usize{0} ** CC_LEN_MAX,
            .f_code = 0,
            .is_compat = false,
            .is_excluded = false,
            .general_category = 0,
            .script = 0,
            .prop_bitmap_tab = [_]u32{0} ** 3,
            .decomp_data = std.ArrayList(isize).init(a),
        };
    }

    fn setProp(self: *CCInfo, prop_idx: usize, val: usize) void {
        const mask = @intCast(u32, math.shl(usize, 1, prop_idx & 0x1f));
        const idx = prop_idx >> 5;
        const value = self.prop_bitmap_tab[idx];
        if (val != 0) {
            self.prop_bitmap_tab[idx] = value | mask;
        } else {
            self.prop_bitmap_tab[idx] = value & ~mask;
        }
    }

    fn getProp(self: *CCInfo, prop_idx: usize) u32 {
        return (self.prop_bitmap_tab[prop_idx >> 5] >> (prop_idx & 0x1f)) & 1;
    }
};

// Returns the nth field values. line is in the form field0;field1;field3...;fieldn
fn getField(line: []const u8, n: usize) ?[]const u8 {
    var iter = &std.mem.SplitIterator{
        .buffer = line,
        .index = 0,
        .delimiter = ";",
    };
    var i: usize = 0;
    var p = iter.next();
    while (i < n) : (i += 1) {
        p = iter.next();
        if (p == null) {
            return null;
        }
    }
    return p;
}

test "getField" {
    const line: []const u8 = "0;1;2;3;4";
    var i: usize = 0;
    while (i < 4) : (i += 1) {
        warn("{} ==> {}\n", i, getField(line, i));
    }
}

const UnicodeDB = std.ArrayList(CCInfo);

fn findName(a: []const []const u8, name: []const u8) ?usize {
    for (a) |v, idx| {
        if (std.mem.eql(u8, v, name)) {
            return idx;
        }
    }
    return null;
}

fn parseUnicodeData(allocator: *mem.Allocator, unicode_db: []CCInfo, data: []const u8) !void {
    var stream = &std.io.SliceInStream.init(data).stream;
    var buf = &try std.Buffer.init(allocator, "");
    defer buf.deinit();
    var not_done = true;
    var last_code: usize = 0;
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
        const line = trimSpace(buf.toSlice());
        if (line[0] == '#') continue;
        var field = getField(line, 0);
        if (field == null) {
            continue;
        }
        const code = try std.fmt.parseInt(usize, field.?, 16);
        var uc: usize = 0;
        field = getField(line, 12);
        if (field) |value| {
            uc = try std.fmt.parseInt(usize, value, 16);
        }
        var lc: usize = 0;
        field = getField(line, 13);
        if (field) |value| {
            lc = try std.fmt.parseInt(usize, value, 16);
        }
        var ci = &unicode_db[code];
        ci.* = CCInfo.init(allocator);
        if (uc > 0 or lc > 0) {
            if (uc > 0) {
                ci.u_len = 1;
                ci.u_data[0] = uc;
            }
            if (lc > 0) {
                ci.l_len = 1;
                ci.l_data[0] = lc;
            }
        }
        // check general category
        field = getField(line, 2);
        if (field == null) {
            return error.MissingGeneralCategory;
        }
        const c = findName(unicode_gc_name[0..], field.?);
        if (c == null) {
            return error.GeneralCategoryNotFound;
        }
        ci.general_category = c.?;

        field = getField(line, 3);
        if (field) |value| {
            if (value.len > 0) {
                const cc = try std.fmt.parseInt(isize, value, 10);
                assert(code <= CHARCODE_MAX);
                ci.combining_class = cc;
            }
        }
        field = getField(line, 5);
        if (field) |value| {
            if (value.len > 0) {
                assert(code <= CHARCODE_MAX);
                var v = value;
                if (mem.eql(u8, value, "<")) {
                    if (value[0] == '<') {
                        var x: usize = 0;
                        while (x < value.len and value[x] != '>') {
                            x += 1;
                        }
                        if (x < value.len and value[x] == '>') x += 1;
                        if (x < value.len) v = value[x..];
                        ci.is_compat = true;
                    }
                }
                var tmp: [1]u8 = undefined;
                for (v) |x| {
                    if (ascii.isSpace(x)) {
                        continue;
                    }
                    if (!ascii.isXDigit(x)) {
                        break;
                    }
                    tmp[0] = x;
                    const n = try std.fmt.parseInt(isize, tmp[0..], 16);
                    try ci.decomp_data.append(x);
                }
            }
        }

        if (getField(line, 9)) |value| {
            if (mem.eql(u8, value, "Y")) {}
        }
        if (getField(line, 1)) |value| {
            if (mem.indexOf(u8, value, " Last>")) |idx| {
                var i = last_code + 1;
                while (i < code) : (i += 1) {
                    unicode_db[i] = ci.*;
                }
            }
        }
        last_code = code;
    }
}

fn parseSpecialCasing(allocator: *mem.Allocator, unicode_db: []CCInfo, data: []const u8) !void {
    var stream = &std.io.SliceInStream.init(data).stream;
    var buf = &try std.Buffer.init(allocator, "");
    defer buf.deinit();
    var not_done = true;
    var last_code: usize = 0;
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
        const line = trimSpace(buf.toSlice());
        if (line[0] == '#') continue;

        var field = getField(line, 0);
        if (field == null) {
            continue;
        }
        const code = try std.fmt.parseInt(usize, field.?, 16);
        assert(code <= CHARCODE_MAX);
        var ci = &unicode_db[code];
        field = getField(line, 4);
        if (field != null) {
            const value = trimSpace(field.?);
            if (value.len > 0 and value[0] != '#') {
                continue;
            }
        }
        field = getField(line, 1);
        if (field != null) {
            ci.l_len = 0;
            var tmp: [1]u8 = undefined;
            for (field.?) |value| {
                if (ascii.isSpace(value)) {
                    continue;
                }
                assert(ci.l_len < CC_LEN_MAX);
                ci.l_len += 1;
                tmp[0] = value;
                ci.l_data[ci.l_len] = try std.fmt.parseInt(usize, tmp[0..], 16);
            }
            if (ci.l_len == 1 and ci.l_data[0] == code) {
                ci.l_len = 0;
            }
        }

        field = getField(line, 3);
        if (field != null) {
            ci.u_len = 0;
            var tmp: [1]u8 = undefined;
            for (field.?) |value| {
                if (ascii.isSpace(value)) {
                    continue;
                }
                assert(ci.u_len < CC_LEN_MAX);
                ci.u_len += 1;
                tmp[0] = value;
                ci.u_data[ci.u_len] = try std.fmt.parseInt(usize, tmp[0..], 16);
            }
            if (ci.u_len == 1 and ci.u_data[0] == code) {
                ci.u_len = 0;
            }
        }
    }
}

fn trimSpace(v: []const u8) []const u8 {
    if (v.len == 0) return v;
    if (!ascii.isSpace(v[0])) return v;
    var i: usize = 0;
    while (i < v.len) {
        if (!ascii.isSpace(v[0])) {
            break;
        }
        i += 1;
    }
    return v[i..];
}

var codes_db: [CHARCODE_MAX + 1]CCInfo = undefined;

const unicode_data_file = "tools/unicode/UnicodeData.txt";
const special_casing__file = "tools/unicode/SpecialCasing.txt";

pub fn main() !void {
    var allocator = std.heap.direct_allocator;
    var arena = std.heap.ArenaAllocator.init(allocator);
    const data = try std.io.readFileAlloc(allocator, unicode_data_file);
    defer allocator.free(data);
    defer arena.deinit();

    try parseUnicodeData(&arena.allocator, codes_db[0..], data);

    const specia_case_data = try std.io.readFileAlloc(allocator, special_casing__file);
    defer allocator.free(specia_case_data);
    try parseSpecialCasing(&arena.allocator, codes_db[0..], specia_case_data);
}

#!/bin/sh
set -e

url="ftp://ftp.unicode.org/Public/12.1.0/ucd"
emoji_url="ftp://ftp.unicode.org/Public/emoji/12.0/emoji-data.txt"

files="CaseFolding.txt DerivedNormalizationProps.txt PropList.txt \
SpecialCasing.txt CompositionExclusions.txt ScriptExtensions.txt \
UnicodeData.txt DerivedCoreProperties.txt NormalizationTest.txt Scripts.txt \
PropertyValueAliases.txt"

mkdir -p unicode

for f in $files; do
    g="${url}/${f}"
    wget $g -O unicode/$f
done
    
wget $emoji_url -O unicode/emoji-data.txt
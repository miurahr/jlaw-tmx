#!/bin/sh
ruby jlawconv.rb utf8_law.je.dic.9.0.a.csv
rm -r sdic
mkdir sdic
mv jlaw_je.tab sdic/
(cd sdic; /usr/lib/stardict-tools/tabfile jlaw_je.tab )
mv sdic/jlaw_je.tab ./

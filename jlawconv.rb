#!/usr/bin/env ruby
#
# This program is distributed with MIT license
#
# Copyright 2014, Hiroshi Miura <miurahr@linux.com>
#

require 'csv'

tmx_header = <<HEADER
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE tmx SYSTEM "tmx11.dtd">
<tmx version="1.1">
<header creationtool="hourei2tmx" o-tmf="OmegaT TMX" adminlang="EN-US" datatype="plaintext" creationtoolversion="0.1" segtype="sentence" srclang="JA"/>
<body>
HEADER
tmx_trailer = <<TRAILER
</body>
</tmx>
TRAILER

source = ARGV[0]

# Source data format and example
# ------------------------------------------------
# 用語,読み,訳語候補番号,訳語候補,使い分け基準,用例(和文),用例(英文),用例出典,注釈,
#相手方,あいてがた,1,opponent,対審手続の場合,検察官、被告人又は弁護人が証人、鑑定人、通訳人又は翻訳人の尋問を請求するについては、あらかじめ、相手方に対し、その氏名及び住居を知る機会を与えなければならない,"When requesting examination of a witness, expert witness, interpreter or translator, the public prosecutor, the accused or a counsel of the accused must give the opponent an opportunity to know the name and address of that person in advance.",刑事訴訟法299条,,
# ------------------------------------------------

tmx = File.new("jlaw_je.tmx","w")
tmx.write(tmx_header)

tabfile = File.new("jlaw_je.tab","w")

first_line = true
# source should be CSV format.
CSV.foreach(source) do |data|
  # check first line and skip it
  if first_line
    if /^用語/ =~ data[0]
       first_line = false
       next
    else
      puts "Wrong input file! Aborted."
      exit(1)
    end
  end

  ja = data[0]
  en = data[3]

  yomi  = data[1]
  order = data[2]
  crit  = data[4]

  jpn = data[5]
  eng = data[6]
  ref = data[7]

  tmx.write("<tu><prop type='reference'>#{ref}</prop><tuv lang='JA'><seg>#{jpn}</seg></tuv><tuv lang='EN-GB'><seg>#{eng}</seg></tuv></tu>\n")
  if crit
    tabfile.write("#{ja}\t【#{crit}】 #{en}\n")
  else
    tabfile.write("#{ja}\t#{en}\n")
  end
end

tmx.write(tmx_trailer)
tmx.close
tabfile.close

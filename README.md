jlaw-tmx
========

Generation an OmegaT TMX file from Japanese Law Translation data from http://www.japaneselawtranslation.go.jp/


Source
======

An original data is downloaded from http://www.japaneselawtranslation.go.jp/dict/download?re=01

標準対訳辞書データ(最新版 v9.0)
utf8_law.je.dic.9.0.a.csv

LICENSE of data
--------------

    翻訳について
    この「日本法令外国語訳データベースシステム」に掲載している全ての翻訳は、公定訳ではありません。
    法的効力を有するのは日本語の法令自体であり、翻訳はあくまでその理解を助けるための参考資料です。このページの利用に伴って発生した問題について、一切の責任を負いかねますので、法律上の問題に関しては、官報に掲載された日本語の法令を参照してください。
    「暫定版」について
    法令名に「（暫定版）」と表示されている翻訳は、ネイティブや法令翻訳専門家によるチェック及び修正前の翻訳であり、今後、修正される場合があります。
    引用、複製、転載について
    この「日本法令外国語訳データベースシステム」に掲載している全てのデータは、引用し、複製し又は転載して差し支えありません。

Convert
=======

run make.sh or 
   ruby jlawconv.rb <input csv file>


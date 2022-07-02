#!/bin/bash

svn mv solr/core/src/java/org/apache/solr/analysis/ArabicNormalizationFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/ar/ArabicNormalizationFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/ArabicStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/ar/ArabicStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/ASCIIFoldingFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/miscellaneous/ASCIIFoldingFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/BeiderMorseFilterFactory.java lucene/analysis/phonetic/src/java/org/apache/lucene/analysis/phonetic/BeiderMorseFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/BrazilianStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/br/BrazilianStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/BulgarianStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/bg/BulgarianStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/CapitalizationFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/miscellaneous/CapitalizationFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/CJKBigramFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/cjk/CJKBigramFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/CJKWidthFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/cjk/CJKWidthFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/ClassicFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/standard/ClassicFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/ClassicTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/standard/ClassicTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/CommonGramsFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/commongrams/CommonGramsFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/CommonGramsQueryFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/commongrams/CommonGramsQueryFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/CzechStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/cz/CzechStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/DelimitedPayloadTokenFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/payloads/DelimitedPayloadTokenFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/DictionaryCompoundWordTokenFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/compound/DictionaryCompoundWordTokenFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/DoubleMetaphoneFilterFactory.java lucene/analysis/phonetic/src/java/org/apache/lucene/analysis/phonetic/DoubleMetaphoneFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/EdgeNGramFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/ngram/EdgeNGramFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/EdgeNGramTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/ngram/EdgeNGramTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/ElisionFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/fr/ElisionFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/EnglishMinimalStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/en/EnglishMinimalStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/EnglishPossessiveFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/en/EnglishPossessiveFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/FinnishLightStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/fi/FinnishLightStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/FrenchLightStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/fr/FrenchLightStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/FrenchMinimalStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/fr/FrenchMinimalStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/GalicianMinimalStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/gl/GalicianMinimalStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/GalicianStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/gl/GalicianStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/GermanLightStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/de/GermanLightStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/GermanMinimalStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/de/GermanMinimalStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/GermanNormalizationFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/de/GermanNormalizationFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/GermanStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/de/GermanStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/GreekLowerCaseFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/el/GreekLowerCaseFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/GreekStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/el/GreekStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/HindiNormalizationFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/hi/HindiNormalizationFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/HindiStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/hi/HindiStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/HTMLStripCharFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/charfilter/HTMLStripCharFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/HungarianLightStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/hu/HungarianLightStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/HunspellStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/hunspell/HunspellStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/HyphenatedWordsFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/miscellaneous/HyphenatedWordsFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/HyphenationCompoundWordTokenFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/compound/HyphenationCompoundWordTokenFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/IndicNormalizationFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/in/IndicNormalizationFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/IndonesianStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/id/IndonesianStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/IrishLowerCaseFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/ga/IrishLowerCaseFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/ItalianLightStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/it/ItalianLightStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/JapaneseBaseFormFilterFactory.java lucene/analysis/kuromoji/src/java/org/apache/lucene/analysis/ja/JapaneseBaseFormFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/JapaneseKatakanaStemFilterFactory.java lucene/analysis/kuromoji/src/java/org/apache/lucene/analysis/ja/JapaneseKatakanaStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/JapanesePartOfSpeechStopFilterFactory.java lucene/analysis/kuromoji/src/java/org/apache/lucene/analysis/ja/JapanesePartOfSpeechStopFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/JapaneseReadingFormFilterFactory.java lucene/analysis/kuromoji/src/java/org/apache/lucene/analysis/ja/JapaneseReadingFormFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/JapaneseTokenizerFactory.java lucene/analysis/kuromoji/src/java/org/apache/lucene/analysis/ja/JapaneseTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/KeepWordFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/miscellaneous/KeepWordFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/KeywordMarkerFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/miscellaneous/KeywordMarkerFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/KeywordTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/core/KeywordTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/KStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/en/KStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/LatvianStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/lv/LatvianStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/LengthFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/miscellaneous/LengthFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/LetterTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/core/LetterTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/LimitTokenCountFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/miscellaneous/LimitTokenCountFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/LowerCaseFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/core/LowerCaseFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/LowerCaseTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/core/LowerCaseTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/MappingCharFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/charfilter/MappingCharFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/NGramFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/ngram/NGramFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/NGramTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/ngram/NGramTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/NorwegianLightStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/no/NorwegianLightStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/NorwegianMinimalStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/no/NorwegianMinimalStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/NumericPayloadTokenFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/payloads/NumericPayloadTokenFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PathHierarchyTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/path/PathHierarchyTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PatternReplaceCharFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/pattern/PatternReplaceCharFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PatternReplaceFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/pattern/PatternReplaceFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PatternTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/pattern/PatternTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PersianCharFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/fa/PersianCharFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PersianNormalizationFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/fa/PersianNormalizationFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PhoneticFilterFactory.java lucene/analysis/phonetic/src/java/org/apache/lucene/analysis/phonetic/PhoneticFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PorterStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/en/PorterStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PortugueseLightStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/pt/PortugueseLightStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PortugueseMinimalStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/pt/PortugueseMinimalStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PortugueseStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/pt/PortugueseStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/PositionFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/position/PositionFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/RemoveDuplicatesTokenFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/miscellaneous/RemoveDuplicatesTokenFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/ReverseStringFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/reverse/ReverseStringFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/RussianLightStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/ru/RussianLightStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/ShingleFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/shingle/ShingleFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/SnowballPorterFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/snowball/SnowballPorterFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/SpanishLightStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/es/SpanishLightStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/StandardFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/standard/StandardFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/StandardTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/standard/StandardTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/StemmerOverrideFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/miscellaneous/StemmerOverrideFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/StopFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/core/StopFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/SwedishLightStemFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/sv/SwedishLightStemFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/ThaiWordFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/th/ThaiWordFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/TokenOffsetPayloadTokenFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/payloads/TokenOffsetPayloadTokenFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/TrimFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/miscellaneous/TrimFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/TurkishLowerCaseFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/tr/TurkishLowerCaseFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/TypeAsPayloadTokenFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/payloads/TypeAsPayloadTokenFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/TypeTokenFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/core/TypeTokenFilterFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/UAX29URLEmailTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/standard/UAX29URLEmailTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/WhitespaceTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/core/WhitespaceTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/WikipediaTokenizerFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/wikipedia/WikipediaTokenizerFactory.java
svn mv solr/core/src/java/org/apache/solr/analysis/WordDelimiterFilterFactory.java lucene/analysis/common/src/java/org/apache/lucene/analysis/miscellaneous/WordDelimiterFilterFactory.java

# Tests

svn mv solr/core/src/test/org/apache/solr/analysis/TestBeiderMorseFilterFactory.java lucene/analysis/phonetic/src/test/org/apache/lucene/analysis/phonetic/TestBeiderMorseFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestBrazilianStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/br/TestBrazilianStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestBulgarianStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/bg/TestBulgarianStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestCapitalizationFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/miscellaneous/TestCapitalizationFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestCJKWidthFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/cjk/TestCJKWidthFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/CommonGramsFilterFactoryTest.java lucene/analysis/common/src/test/org/apache/lucene/analysis/commongrams/TestCommonGramsFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/CommonGramsQueryFilterFactoryTest.java lucene/analysis/common/src/test/org/apache/lucene/analysis/commongrams/TestCommonGramsQueryFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/DoubleMetaphoneFilterFactoryTest.java lucene/analysis/phonetic/src/test/org/apache/lucene/analysis/phonetic/TestDoubleMetaphoneFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/LengthFilterTest.java lucene/analysis/common/src/test/org/apache/lucene/analysis/miscellaneous/TestLengthFilter.java
svn mv solr/core/src/test/org/apache/solr/analysis/SnowballPorterFilterFactoryTest.java lucene/analysis/common/src/test/org/apache/lucene/analysis/snowball/TestSnowballPorterFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestCzechStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/cz/TestCzechStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestDelimitedPayloadTokenFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/payloads/TestDelimitedPayloadTokenFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestDictionaryCompoundWordTokenFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/compound/TestDictionaryCompoundWordTokenFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestElisionFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/fr/TestElisionFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestEnglishMinimalStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/en/TestEnglishMinimalStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestFinnishLightStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/fi/TestFinnishLightStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestFrenchLightStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/fr/TestFrenchLightStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestFrenchMinimalStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/fr/TestFrenchMinimalStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestGalicianMinimalStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/gl/TestGalicianMinimalStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestGalicianStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/gl/TestGalicianStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestGermanLightStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/de/TestGermanLightStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestGermanMinimalStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/de/TestGermanMinimalStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestGermanNormalizationFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/de/TestGermanNormalizationFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestGermanStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/de/TestGermanStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestGreekLowerCaseFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/el/TestGreekLowerCaseFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestGreekStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/el/TestGreekStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestHindiFilters.java lucene/analysis/common/src/test/org/apache/lucene/analysis/hi/TestHindiFilters.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestHTMLStripCharFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/charfilter/TestHTMLStripCharFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestHungarianLightStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/hu/TestHungarianLightStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestHunspellStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/hunspell/TestHunspellStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestHyphenationCompoundWordTokenFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/compound/TestHyphenationCompoundWordTokenFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestIndonesianStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/id/TestIndonesianStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestIrishLowerCaseFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/ga/TestIrishLowerCaseFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestItalianLightStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/it/TestItalianLightStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestJapaneseBaseFormFilterFactory.java lucene/analysis/kuromoji/src/test/org/apache/lucene/analysis/ja/TestJapaneseBaseFormFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestJapanesePartOfSpeechStopFilterFactory.java lucene/analysis/kuromoji/src/test/org/apache/lucene/analysis/ja/TestJapanesePartOfSpeechStopFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestJapaneseTokenizerFactory.java lucene/analysis/kuromoji/src/test/org/apache/lucene/analysis/ja/TestJapaneseTokenizerFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestKeepFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/miscellaneous/TestKeepFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestKeywordMarkerFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/miscellaneous/TestKeywordMarkerFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestKStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/en/TestKStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestLatvianStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/lv/TestLatvianStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestMappingCharFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/charfilter/TestMappingCharFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestNGramFilters.java lucene/analysis/common/src/test/org/apache/lucene/analysis/ngram/TestNGramFilters.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestNorwegianLightStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/no/TestNorwegianLightStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestNorwegianMinimalStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/no/TestNorwegianMinimalStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestPatternReplaceCharFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/pattern/TestPatternReplaceCharFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestPatternReplaceFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/pattern/TestPatternReplaceFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestPatternTokenizerFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/pattern/TestPatternTokenizerFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestPersianNormalizationFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/fa/TestPersianNormalizationFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestPhoneticFilterFactory.java lucene/analysis/phonetic/src/test/org/apache/lucene/analysis/phonetic/TestPhoneticFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestPorterStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/en/TestPorterStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestPortugueseLightStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/pt/TestPortugueseLightStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestPortugueseMinimalStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/pt/TestPortugueseMinimalStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestPortugueseStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/pt/TestPortugueseStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestRemoveDuplicatesTokenFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/miscellaneous/TestRemoveDuplicatesTokenFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestReverseStringFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/reverse/TestReverseStringFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestRussianFilters.java lucene/analysis/common/src/test/org/apache/lucene/analysis/ru/TestRussianFilters.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestRussianLightStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/ru/TestRussianLightStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestShingleFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/shingle/TestShingleFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestSpanishLightStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/es/TestSpanishLightStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestStandardFactories.java lucene/analysis/common/src/test/org/apache/lucene/analysis/standard/TestStandardFactories.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestStemmerOverrideFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/miscellaneous/TestStemmerOverrideFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestStopFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/core/TestStopFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestSwedishLightStemFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/sv/TestSwedishLightStemFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestThaiWordFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/th/TestThaiWordFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestTrimFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/miscellaneous/TestTrimFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestTurkishLowerCaseFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/tr/TestTurkishLowerCaseFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestTypeTokenFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/core/TestTypeTokenFilterFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestUAX29URLEmailTokenizerFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/standard/TestUAX29URLEmailTokenizerFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestWikipediaTokenizerFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/wikipedia/TestWikipediaTokenizerFactory.java
svn mv solr/core/src/test/org/apache/solr/analysis/TestWordDelimiterFilterFactory.java lucene/analysis/common/src/test/org/apache/lucene/analysis/miscellaneous/TestWordDelimiterFilterFactory.java
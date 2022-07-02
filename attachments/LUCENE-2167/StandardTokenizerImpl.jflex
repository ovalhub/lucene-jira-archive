package org.apache.lucene.analysis.standard;

/**
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;

import java.nio.CharBuffer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This class implements the Unicode Text Segmentation algorithm, as specified
 * in Unicode Standard Annex #29 <http://unicode.org/reports/tr29/>.
 * <p/>
 * <b>WARNING</b>: Because JFlex does not support Unicode supplementary 
 * characters (characters above the Basic Multilingual Plane, which contains
 * those up to and including U+FFFF), this scanner will not recognize them
 * properly.  If you need to be able to process text containing supplementary 
 * characters, consider using the ICU4J-backed implementation in contrib/icu  
 * ({@link org.apache.lucene.analysis.icu.segmentation.ICUTokenizer})
 * instead of this class, since the ICU4J-backed implementation does not have
 * this limitation.
 */
%%

%unicode 5.2
%integer
%final
%public
%class StandardTokenizerImpl
%implements StandardTokenizerInterface
%function getNextToken
%char
%state NO_IPV6

// UAX#29 WB4. X (Extend | Format)* --> X
//
ALetterEx      = \p{WB:ALetter}                     [\p{WB:Format}\p{WB:Extend}]*
// TODO: Convert hard-coded full-width numeric range to property intersection (something like [\p{Full-Width}&&\p{Numeric}]) once JFlex supports it
NumericEx      = [\p{WB:Numeric}\uFF10-\uFF19]      [\p{WB:Format}\p{WB:Extend}]*
KatakanaEx     = \p{WB:Katakana}                    [\p{WB:Format}\p{WB:Extend}]* 
MidLetterEx    = [\p{WB:MidLetter}\p{WB:MidNumLet}] [\p{WB:Format}\p{WB:Extend}]* 
MidNumericEx   = [\p{WB:MidNum}\p{WB:MidNumLet}]    [\p{WB:Format}\p{WB:Extend}]*
ExtendNumLetEx = \p{WB:ExtendNumLet}                [\p{WB:Format}\p{WB:Extend}]*


// URL and E-mail syntax specifications:
//
//     RFC-952:  DOD INTERNET HOST TABLE SPECIFICATION
//     RFC-1035: DOMAIN NAMES - IMPLEMENTATION AND SPECIFICATION
//     RFC-1123: Requirements for Internet Hosts - Application and Support
//     RFC-1738: Uniform Resource Locators (URL)
//     RFC-3986: Uniform Resource Identifier (URI): Generic Syntax
//     RFC-5234: Augmented BNF for Syntax Specifications: ABNF
//     RFC-5321: Simple Mail Transfer Protocol
//     RFC-5322: Internet Message Format

%include src/java/org/apache/lucene/analysis/standard/ASCIITLD.jflex-macro

DomainLabel = [A-Za-z0-9] ([-A-Za-z0-9]* [A-Za-z0-9])?
DomainNameStrict = {DomainLabel} ("." {DomainLabel})* {ASCIITLD}
DomainNameLoose  = {DomainLabel} ("." {DomainLabel})*

IPv4DecimalOctet = "0"{0,2} [0-9] | "0"? [1-9][0-9] | "1" [0-9][0-9] | "2" ([0-4][0-9] | "5" [0-5])
IPv4Address  = {IPv4DecimalOctet} ("." {IPv4DecimalOctet}){3} 
IPv6Hex16Bit = [0-9A-Fa-f]{1,4}
IPv6LeastSignificant32Bits = {IPv4Address} | ({IPv6Hex16Bit} ":" {IPv6Hex16Bit})
IPv6StrictAddress =                                                  ({IPv6Hex16Bit} ":"){6} {IPv6LeastSignificant32Bits}
                  |                                             "::" ({IPv6Hex16Bit} ":"){5} {IPv6LeastSignificant32Bits}
                  |                            {IPv6Hex16Bit}?  "::" ({IPv6Hex16Bit} ":"){4} {IPv6LeastSignificant32Bits}
                  | (({IPv6Hex16Bit} ":"){0,1} {IPv6Hex16Bit})? "::" ({IPv6Hex16Bit} ":"){3} {IPv6LeastSignificant32Bits}
                  | (({IPv6Hex16Bit} ":"){0,2} {IPv6Hex16Bit})? "::" ({IPv6Hex16Bit} ":"){2} {IPv6LeastSignificant32Bits}
                  | (({IPv6Hex16Bit} ":"){0,3} {IPv6Hex16Bit})? "::"  {IPv6Hex16Bit} ":"     {IPv6LeastSignificant32Bits}
                  | (({IPv6Hex16Bit} ":"){0,4} {IPv6Hex16Bit})? "::"                         {IPv6LeastSignificant32Bits}
                  | (({IPv6Hex16Bit} ":"){0,5} {IPv6Hex16Bit})? "::"                         {IPv6Hex16Bit}
                  | (({IPv6Hex16Bit} ":"){0,6} {IPv6Hex16Bit})? "::"
IPv6LooseAddress = [0-9A-Fa-f]* ":" [.:0-9A-Fa-f]*
URIunreserved = [-._~A-Za-z0-9]
URIpercentEncoded = "%" [0-9A-Fa-f]{2}
URIsubDelims = [!$&'()*+,;=]
URIloginSegment = ({URIunreserved} | {URIpercentEncoded} | {URIsubDelims})*
URIlogin = {URIloginSegment} (":" {URIloginSegment})? "@"
URIquery    = "?" ({URIunreserved} | {URIpercentEncoded} | {URIsubDelims} | [:@/?])*
URIfragment = "#" ({URIunreserved} | {URIpercentEncoded} | {URIsubDelims} | [:@/?])*
URIport = ":" [0-9]{1,5}
URIhostStrict = {IPv4Address} | {DomainNameStrict}  
URIhostLoose  = {IPv4Address} | {DomainNameLoose} 

URIauthorityStrict    =                 {URIhostStrict}        {URIport}?
URIauthorityLoose     = {URIlogin}?     {URIhostLoose}         {URIport}?
IPv6LooseURIauthority = {URIlogin}? "[" {IPv6LooseAddress} "]" {URIport}?

HTTPsegment = ({URIunreserved} | {URIpercentEncoded} | [;:@&=])*
HTTPpath = ("/" {HTTPsegment})*
HTTPscheme = [hH][tT][tT][pP][sS]? "://"
HTTPurlFull              = {HTTPscheme} {URIauthorityLoose}     {HTTPpath}? {URIquery}? {URIfragment}?
IPv6LooseHTTPurlFull     = {HTTPscheme} {IPv6LooseURIauthority} {HTTPpath}? {URIquery}? {URIfragment}?
// {HTTPurlNoScheme} excludes {URIlogin}, because it could otherwise accept e-mail addresses
HTTPurlNoScheme          =              {URIauthorityStrict}    {HTTPpath}? {URIquery}? {URIfragment}?
IPv6LooseHTTPurlNoScheme =              {IPv6LooseURIauthority} {HTTPpath}? {URIquery}? {URIfragment}?
HTTPurl          = {HTTPurlFull} | {HTTPurlNoScheme}
IPv6LooseHTTPurl = {IPv6LooseHTTPurlFull} | {IPv6LooseHTTPurlNoScheme}

FTPorFILEsegment = ({URIunreserved} | {URIpercentEncoded} | [?:@&=])*
FTPorFILEpath = "/" {FTPorFILEsegment} ("/" {FTPorFILEsegment})*

FTPtype = ";" [tT][yY][pP][eE] "=" [aAiIdD]
FTPscheme = [fF][tT][pP] "://"
FTPurl          = {FTPscheme} {URIauthorityLoose}     {FTPorFILEpath} {FTPtype}? {URIfragment}?
IPv6LooseFTPurl = {FTPscheme} {IPv6LooseURIauthority} {FTPorFILEpath} {FTPtype}? {URIfragment}?

FILEscheme = [fF][iI][lL][eE] "://"
FILEurl          = {FILEscheme} {URIhostLoose}?         {FTPorFILEpath} {URIfragment}?
IPv6LooseFILEurl = {FILEscheme} {IPv6LooseURIauthority} {FTPorFILEpath} {URIfragment}?

URL          = {HTTPurl}          | {FTPurl}          | {FILEurl}
IPv6LooseURL = {IPv6LooseHTTPurl} | {IPv6LooseFTPurl} | {IPv6LooseFILEurl}


EMAILquotedString = [\"] ([\u0001-\u0008\u000B\u000C\u000E-\u0021\u0023-\u005B\u005D-\u007E] | [\\] [\u0000-\u007F])* [\"]
EMAILatomText = [A-Za-z0-9!#$%&'*+-/=?\^_`{|}~]
EMAILlabel = {EMAILatomText}+ | {EMAILquotedString}
EMAILlocalPart = {EMAILlabel} ("." {EMAILlabel})*
EMAILdomainLiteralText = [\u0001-\u0008\u000B\u000C\u000E-\u005A\u005E-\u007F] | [\\] [\u0000-\u007F]
// DFA minimization allows {IPv6StrictAddress} and {IPv4Address} to be included 
// in the {EMAILbracketedHost} definition without incurring any size penalties, 
// since {EMAILdomainLiteralText} recognizes all valid IP addresses.
// The IP address regexes are included in {EMAILbracketedHost} simply as a 
// reminder that they are acceptable bracketed host forms.
EMAILbracketedHost = "[" ({EMAILdomainLiteralText}* | {IPv4Address} | [iI][pP][vV] "6:" {IPv6StrictAddress}) "]"
EMAILaddress = {EMAILlocalPart} "@" ({DomainNameStrict} | {EMAILbracketedHost})

%{
  /** Alphanumeric sequences */
  public static final int WORD_TYPE = StandardTokenizer.ALPHANUM;
  
  /** Numbers */
  public static final int NUMERIC_TYPE = StandardTokenizer.NUM;
  
  /** URLs with scheme: HTTP(S), FTP, or FILE; no-scheme URLs match HTTP syntax */
  public static final int URL_TYPE = StandardTokenizer.URL;
  
  /** E-mail addresses */
  public static final int EMAIL_TYPE = StandardTokenizer.EMAIL;
  
  /**
   * Chars in class \p{Line_Break = Complex_Context} are from South East Asian
   * scripts (Thai, Lao, Myanmar, Khmer, etc.).  Sequences of these are kept 
   * together as as a single token rather than broken up, because the logic
   * required to break them at word boundaries is too complex for UAX#29.
   * {@see Unicode Line Breaking Algorithm http://www.unicode.org/reports/tr14/#SA}
   */
  public static final int SOUTH_EAST_ASIAN_TYPE = StandardTokenizer.SOUTHEAST_ASIAN;
  
  public static final int IDEOGRAPHIC_TYPE = StandardTokenizer.IDEOGRAPHIC;
  
  public static final int HIRAGANA_TYPE = StandardTokenizer.HIRAGANA;

  private static final String IPv4DecimalOctet 
    = "(?:" + "0{0,2}[0-9]" + "|" + "0?[1-9][0-9]" + "|" + "1[0-9][0-9]" + "|" + "2(?:[0-4][0-9]|5[0-5])" + ")";
  private static final String IPv4Address 
    = IPv4DecimalOctet + "\\." + IPv4DecimalOctet + "\\." + IPv4DecimalOctet + "\\." + IPv4DecimalOctet; 
  private static final String IPv6Hex16Bit = "[0-9A-F]{1,4}";
  private static final String IPv6LeastSignificant32Bits 
    = "(?:(?:" + IPv4Address + ")|" + IPv6Hex16Bit + ":" + IPv6Hex16Bit + ")";
  private static final String IPv6StrictAddress =                      "(?:" + IPv6Hex16Bit + ":){6}" + IPv6LeastSignificant32Bits
      + "|"                                                      +   "::(?:" + IPv6Hex16Bit + ":){5}" + IPv6LeastSignificant32Bits
      + "|(?:"                                    + IPv6Hex16Bit + ")?::(?:" + IPv6Hex16Bit + ":){4}" + IPv6LeastSignificant32Bits
      + "|(?:(?:" + IPv6Hex16Bit + ":)" + "{0,1}" + IPv6Hex16Bit + ")?::(?:" + IPv6Hex16Bit + ":){3}" + IPv6LeastSignificant32Bits
      + "|(?:(?:" + IPv6Hex16Bit + ":)" + "{0,2}" + IPv6Hex16Bit + ")?::(?:" + IPv6Hex16Bit + ":){2}" + IPv6LeastSignificant32Bits
      + "|(?:(?:" + IPv6Hex16Bit + ":)" + "{0,3}" + IPv6Hex16Bit + ")?::"    + IPv6Hex16Bit + ":"     + IPv6LeastSignificant32Bits
      + "|(?:(?:" + IPv6Hex16Bit + ":)" + "{0,4}" + IPv6Hex16Bit + ")?::"                             + IPv6LeastSignificant32Bits
      + "|(?:(?:" + IPv6Hex16Bit + ":)" + "{0,5}" + IPv6Hex16Bit + ")?::"                             + IPv6Hex16Bit
      + "|(?:(?:" + IPv6Hex16Bit + ":)" + "{0,6}" + IPv6Hex16Bit + ")?::";
  private static final Pattern IPV6_URL_PATTERN 
    = Pattern.compile("(?:(?:https?|ftp|file)://)?\\[(?:" + IPv6StrictAddress + ")\\]", 
                      Pattern.CASE_INSENSITIVE);
  
  private boolean isValidIPv6URL() {
    return IPV6_URL_PATTERN.matcher(CharBuffer.wrap(zzBuffer, zzStartRead, zzMarkedPos - zzStartRead)).lookingAt();
  }
  
  public final int yychar() {
    return yychar;
  }

  /**
   * Fills CharTermAttribute with the current token text.
   */
  public final void getText(CharTermAttribute t) {
    t.copyBuffer(zzBuffer, zzStartRead, zzMarkedPos-zzStartRead);
  }
%}

%%

// UAX#29 WB1. 	sot 	÷ 	
//        WB2. 		÷ 	eot
//
<<EOF>> { return StandardTokenizerInterface.YYEOF; }

{URL} { return URL_TYPE; }
<YYINITIAL> {IPv6LooseURL} { if (isValidIPv6URL()) {
                               return URL_TYPE; 
                             } else {                 
                               // Backtrack, and don't revisit this rule
                               yypushback(yylength());
                               yybegin(NO_IPV6);
                             }
                           }
{EMAILaddress} { return EMAIL_TYPE; }

// UAX#29 WB8.   Numeric × Numeric
//        WB11.  Numeric (MidNum | MidNumLet) × Numeric
//        WB12.  Numeric × (MidNum | MidNumLet) Numeric
//        WB13a. (ALetter | Numeric | Katakana | ExtendNumLet) × ExtendNumLet
//        WB13b. ExtendNumLet × (ALetter | Numeric | Katakana)
//
{ExtendNumLetEx}* {NumericEx} ({ExtendNumLetEx}+ {NumericEx} 
                              | {MidNumericEx} {NumericEx} 
                              | {NumericEx})*
{ExtendNumLetEx}* 
  { return NUMERIC_TYPE; }


// UAX#29 WB5.   ALetter × ALetter
//        WB6.   ALetter × (MidLetter | MidNumLet) ALetter
//        WB7.   ALetter (MidLetter | MidNumLet) × ALetter
//        WB9.   ALetter × Numeric
//        WB10.  Numeric × ALetter
//        WB13.  Katakana × Katakana
//        WB13a. (ALetter | Numeric | Katakana | ExtendNumLet) × ExtendNumLet
//        WB13b. ExtendNumLet × (ALetter | Numeric | Katakana)
//
{ExtendNumLetEx}*  ( {KatakanaEx} ({ExtendNumLetEx}* {KatakanaEx})* 
                   | ( {NumericEx}  ({ExtendNumLetEx}+ {NumericEx} | {MidNumericEx} {NumericEx} | {NumericEx})*
                     | {ALetterEx}  ({ExtendNumLetEx}+ {ALetterEx} | {MidLetterEx}  {ALetterEx} | {ALetterEx})* )* ) 
({ExtendNumLetEx}+ ( {KatakanaEx} ({ExtendNumLetEx}* {KatakanaEx})* 
                   | ( {NumericEx}  ({ExtendNumLetEx}+ {NumericEx} | {MidNumericEx} {NumericEx} | {NumericEx})*
                     | {ALetterEx}  ({ExtendNumLetEx}+ {ALetterEx} | {MidLetterEx}  {ALetterEx} | {ALetterEx})* )* ) )*
{ExtendNumLetEx}*  
  { yybegin(YYINITIAL); return WORD_TYPE; }


// From UAX #29:
//
//    [C]haracters with the Line_Break property values of Contingent_Break (CB), 
//    Complex_Context (SA/South East Asian), and XX (Unknown) are assigned word 
//    boundary property values based on criteria outside of the scope of this
//    annex.  That means that satisfactory treatment of languages like Chinese
//    or Thai requires special handling.
// 
// In Unicode 5.2, only one character has the \p{Line_Break = Contingent_Break}
// property: U+FFFC ( ￼ ) OBJECT REPLACEMENT CHARACTER.
//
// In the ICU implementation of UAX#29, \p{Line_Break = Complex_Context}
// character sequences (from South East Asian scripts like Thai, Myanmar, Khmer,
// Lao, etc.) are kept together.  This grammar does the same below.
//
// See also the Unicode Line Breaking Algorithm:
//
//    http://www.unicode.org/reports/tr14/#SA
//
\p{LB:Complex_Context}+ { return SOUTH_EAST_ASIAN_TYPE; }

// UAX#29 WB14.  Any ÷ Any
//
\p{Script:Han} { return IDEOGRAPHIC_TYPE; }
\p{Script:Hiragana} { return HIRAGANA_TYPE; }


// UAX#29 WB3.   CR × LF
// UAX#29 WB3a.  (Newline | CR | LF) ÷
// UAX#29 WB3b.  ÷ (Newline | CR | LF)
// UAX#29 WB14.  Any ÷ Any
//
[^] { yybegin(YYINITIAL); /* Not numeric, word, ideographic, hiragana, or SE Asian -- ignore it. */ }

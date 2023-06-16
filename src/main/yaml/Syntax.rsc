module Syntax

lexical Id = ([a-z A-Z][a-z A-Z 0-9_\-]* !>> [a-z A-Z 0-9 _\-]);
lexical Integer = [0-9] !<< [0-9]+ !>> [0-9];

lexical String = [\"] String_Char* [\"];
lexical String_Char  = ![\\ \" \n] | "\\" [\\ \"];

layout Standard 
	= WhitespaceOrComment* !>> [\ \t\f\r] !>> "#"
	;

lexical WhitespaceOrComment 
  = whitespace: Whitespace
  | comment: Comment
  ; 

lexical Whitespace 
  =
  [\u0009 \u000C \u000D \u0020 \u00A0 \u1680 \u180E \u2000-\u200A \u2028 \u2029 \u202F \u205F \u3000]
  ;


lexical Comment = @lineComment @category="Comment" "#" ![\n\r]* $;

lexical DLM = "\n"+;


start syntax Document = document: {Block DLM}+ DLM? | Empty;
syntax Empty =;

syntax Block = block: MappingBlock;

syntax MappingBlock = mappingBlock: Id ":" DLM? Values*;

syntax Values = values: {Value DLM}+;

syntax Value 
            = sequenceVal: SequenceValue
            | quotedVal: QuotedValue
            | plainVal: PlainValue
            | numberVal: Number
            ;


syntax SequenceValue = sequenceValue: "- " Value;

syntax QuotedValue = quotedValue: String;

syntax PlainValue = plainValue: Id;

syntax Number = number: Integer;



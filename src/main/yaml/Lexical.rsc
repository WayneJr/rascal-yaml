module Lexical


lexical Id = ([a-z A-Z][a-z A-Z 0-9_\-]* !>> [a-z A-Z 0-9 _\-]) ;
lexical Integer = [0-9] !<< [0-9]+ !>> [0-9];
lexical Unit =[0-9];
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

lexical DatePart
	= [0-9] [0-9] [0-9] [0-9] "-" [0-1] [0-9] "-" [0-3] [0-9] 
	| [0-9] [0-9] [0-9] [0-9] [0-1] [0-9] [0-3] [0-9] 
  ;

  lexical TimePartNoTZ
	= [0-2] [0-9] ":" [0-5] [0-9] ":" [0-5] [0-9] ([, .] [0-9] ([0-9] [0-9]?)?)? 
	;
lexical TimeZonePart
	= [+ \-] [0-1] [0-9] ":" [0-5] [0-9] 
	| "Z" 
	| [+ \-] [0-1] [0-9] 
	| [+ \-] [0-1] [0-9] [0-5] [0-9] 
	;
  lexical JustTime
	=  TimePartNoTZ !>> [+\-] 
	|  TimePartNoTZ TimeZonePart 
	;
lexical Bool= True:"true"| False: "false" ;
lexical Comment = @lineComment @category="Comment" "#" ![\n\r]* $;

lexical DLM = "\n"+;

keyword YamlKeyWords
         = "true"
         | "false"
         ;


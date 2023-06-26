module Syntax

extend Lexical;

start syntax Document = document: {Block!sequenceBlock!mappingToBlock DLM}+ DLM? | Empty;
syntax Empty =;
// blocks
syntax Block = mappingBlock: MappingBlock 
             | blockSequence: SequenceBlock
             ;

syntax MappingBlock = mappingBlockWBlock: Id ":" DLM? Block+
                    | mappingBlock: Id ":" DLM? Values
                    | mappingBlockWType: Id "@" TypedValue
                    ;
    

// syntax Maps =   scalar: Node !sequence node ":" Value !sequenceVal  val DLM?
//                      | scalarmappingBlock: Node !sequence node ":" DLM  {SequenceValue !sequenceBlock DLM}+ sequence DLM?
//                     ;

syntax SequenceBlock = sequenceBlock: "- " Block;

// values
syntax Values = values: {Value DLM}+;

syntax Value
            = sequenceVal: SequenceValue
            | quotedVal: QuotedScalar 
            | plainVal: PlainScalar 
            | numberVal: Number
            // | time : JustTime
            | date:Date
            | boolean:Bool
            ;


syntax SequenceValue = sequenceValue: "- " Value
                    //  | sequenceBlock: "- " Block
                     ;

syntax QuotedScalar = quotedScalar: String \YamlKeyWords;

syntax PlainScalar = plainScalar: Id \YamlKeyWords;

syntax Number = number: Integer;

syntax Timestamp =time: Unit Unit ":" Unit Unit ":" Unit Unit ;
syntax Type 
            = integer: "integer"
            | string: "string"
            | boolean: "boolean"           
            ;

syntax TypedValue
           = integer: "integer:" Value !sequenceVal !quotedVal !plainVal
           | string : "string:" Value !sequenceVal !numberVal 
           | boolean: "boolean:"  Bool
           ;



syntax Date= date: DatePart;
module Syntax

extend Lexical;

start syntax Document = document: {Block!sequenceBlock!mappingToBlock DLM}+ DLM? | Empty;
syntax Empty =;
// blocks
syntax Block = mappingBlock: MappingBlock 
             | blockSequence: SequenceBlock
             ;

syntax MappingBlock = mappingToBlock: Id ":" DLM? Block
                    | mappingToValue: Id ":" DLM? Values
                    | mappingToValueWithType: Id "@" Type ":" DLM? Value
                    ;

syntax SequenceBlock = sequenceBlock: "- " Block;

// values
syntax Values = values: {Value DLM}+;

syntax Value
            = valueSequence: SequenceValue
            | quotedValue: QuotedScalar
            | plainValue: PlainScalar
            | numberValue: Number
            ;


syntax SequenceValue = sequenceValue: "- " Value
                    //  | sequenceBlock: "- " Block
                     ;

syntax QuotedScalar = quotedScalar: String;

syntax PlainScalar = plainScalar: Id;

syntax Number = number: Integer;

syntax Type 
            = integer: "integer"
            | string: "string"
            | boolean: "boolean"
            ;
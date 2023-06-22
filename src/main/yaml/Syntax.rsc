module Syntax

extend Lexical;

start syntax Document = document: {Block !sequenceBlock DLM}+ DLM? | Empty;
syntax Empty =;
// blocks
syntax Block = MappingBlock | SequenceBlock;

syntax MappingBlock = mappingBlockWBlock: Id ":" DLM? Block+
                    | mappingBlock: Id ":" DLM? Values
                    | mappingBlockWType: Id "@" Type ":" DLM? Value
                    ;

syntax SequenceBlock = sequenceBlock: "- " Block;

// values
syntax Values = values: {Value DLM}+;

syntax Value
            = sequenceVal: SequenceValue
            | quotedVal: QuotedScalar
            | plainVal: PlainScalar
            | numberVal: Number
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
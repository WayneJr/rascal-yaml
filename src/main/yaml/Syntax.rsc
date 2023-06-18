module Syntax

extend Lexical;

start syntax Document = document: {Block DLM}+ DLM? | Empty;
syntax Empty =;

// Block
syntax Block = block: MappingBlock;

syntax MappingBlock = mappingBlockWBlock: Id ":" DLM? Block+
                    | mappingBlock: Id ":" DLM? Values
                    ;

// Values
syntax Values = values: {Value DLM}+;

syntax Value
            = sequenceVal: SequenceValue
            | quotedVal: QuotedValue
            | plainVal: PlainValue
            | numberVal: Number
            ;

syntax SequenceValue = sequenceValue: "- " Value
                     | sequenceBlock: "- " Block+
                     ;

syntax QuotedValue = quotedValue: String;

syntax PlainValue = plainValue: Id;

syntax Number = number: Integer;
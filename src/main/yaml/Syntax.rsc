module Syntax

extend Lexical;

// start syntax Document = document: {Block DLM}+ DLM? | empty: Empty;
// syntax Empty =;

// Block
// syntax Block = block: MappingBlock;

// syntax MappingBlock = mappingBlockWBlock: Id ":" DLM? Block+
//                     | mappingBlock: Id ":" DLM? Values
                    // ;
syntax Maps =   scalar: Node !sequence node ":" Value !sequenceVal  val DLM?
                     | scalarmappingBlock: Node !sequence node ":" DLM {SequenceValue !sequenceBlock DLM}+ sequence DLM?
                    ;

// Values
syntax Values = values: {Value DLM}+;

syntax Value
            = sequenceVal: SequenceValue
            | quotedVal: QuotedValue
            | plainVal: PlainValue
            | numberVal: Number
            ;

start syntax Node
          = sequence:Sequence
          | values :Value !numberVal !sequenceVal value DLM?
          | mapping : Maps
          ;
syntax Sequence="- " {Node DLM}+ node;
syntax SequenceValue = sequenceValue: "- " Value
                    //  | sequenceBlock: "- " Block+
                     ;

syntax QuotedValue = quotedValue: String;

syntax PlainValue = plainValue: Id;

syntax Number = number: Integer;
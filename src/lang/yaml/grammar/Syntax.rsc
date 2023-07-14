module lang::yaml::grammar::Syntax

extend lang::yaml::grammar::Lexical;

start syntax Document =val:Values|mapb: MappingBlock+;

syntax MappingBlock= //= mappingBlockWBlock: Id name ":" DLM? Block //{Block DLM !>> "\n"}+ DLM? !>> "\n"
                     mappingBlock: Id name ":" Values vals
                    | mappingBlockWType: Id name "@" Type t ": " Value!sequenceVal val
                    // | mappingToBlock: Id name ":" MappingBlock+ mp
                    | mappingToBlock: Id name ":" MappingBlock
                    | mappingToBlocks: Id name ":" "{" MappingBlock+ "}"
                    | sequenceMapping: "-" MappingBlock //nesting syntax
                    ;


// syntax MappingBlocks = single: MappingBlock
//                      > right mappings: MappingBlock MappingBlocks
//                      ;
    
syntax Values = singleVal: Value
              > right mappingsVal: Value Values
              ;


syntax Value
            = quotedVal: QuotedScalar 
            | plainVal: PlainScalar 
            | numberVal: Number
            | time: Time 
            | date: Date
            | booleanVal: BooleanScalar
            | sequenceVal: "-" Value
            ;


syntax QuotedScalar = quotedScalar: String;

syntax PlainScalar = plainScalar: Id;

syntax Number = number: Integer;

syntax BooleanScalar = booleanScalar: Boolean;

syntax Time = timeScalar: JustTime;

syntax Date = date: DatePart;


syntax Type 
            = integer: "integer"
            | string: "string"
            | boolean: "boolean"
            | date: "date"
            | time: "time"
            ;

// syntax TypedValue
//            = integer: "integer:" Value !sequenceVal !quotedVal !plainVal
//            | string : "string:" Value !sequenceVal !numberVal 
//            | boolean: "boolean:"  Bool
//            ;
 
	
module lang::yaml::grammar::Syntax

extend lang::yaml::grammar::Lexical;

start syntax Document = Values | MappingBlock+;

syntax MappingBlock = //= mappingBlockWBlock: Id name ":" DLM? Block //{Block DLM !>> "\n"}+ DLM? !>> "\n"
                     mappingBlock: Id name ":" Values vals
                    | mappingToBlock: Id name ":" MappingBlocks
                    | mappingBlockWType: Id name "@" Type t ":" Value!sequenceVal val
                    | sequenceMapping: "-" MappingBlock
                    // | mappingToBlock: Id name ":" MappingBlock+ mp
                    ;


syntax MappingBlocks = MappingBlock
                     > right conc: MappingBlock MappingBlocks
                     ;
    
syntax Values = Value
              > right Value Values
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
 
	
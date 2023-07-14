module lang::yaml::grammar::AST


import lang::yaml::grammar::Syntax;


data Document =
              val(Values v)
             |mapb(list[MappingBlock] mb)
             ;



data MappingBlock =
                    mappingBlock(str id , Values vs)
                  | mappingBlockWType(str id, str typeName, Value val)
                  | mappingToBlock(str id, MappingBlock mb)
                  | mappingToBlocks(str id , list[MappingBlock] mbs)
                  | sequenceMapping(MappingBlock sm)
                  ;
// data MappingBlocks =
//                  single(MappingBlock mb)
//                  | mappings(MappingBlock mb,MappingBlocks mbs )
//                  ;

data Values = singleVal(Value v)| mappingsVal( Value v,list[Value] vals);

data Value
          = sequenceVal(Value sv)
          | quotedVal(QuotedScalar qv)
          | plainVal(PlainScalar pv)
          | numberVal(Number numb)
          | time(Time t)
          | date(Date d)
          | booleanVal(BooleanScalar b)
          ;

data SequenceValue = sequenceValue(Value sqv)
                   ;


data QuotedScalar = quotedScalar(str quotedVal);

// data Year = year(Unit e1, Unit e2,  Unit e3,  Unit e4 ) ;
// int Month ;
// int Day ;

data PlainScalar = plainScalar(str plainV);

data Number = number(int number);

data BooleanScalar = booleanScalar(str boolVal);

data Time = timeScalar(str timeVal);

data Date = date(DatePart d);


// data Timestamp= time(JustTime t);


// data Type 
//          = integer()
//          | string()
//          | boolean()
//          | date()
//          | time()
//          ;
// data TypedValue 
//          = integer( int number)
//          | string(Value val)
//          | boolean(Bool bv)
//          ;
// data JustTime
//          = ntz(str t1)
//          | tz(str t1 ,str t2)
//          ;
// data TimePartNoTZ
//          =tests(str t)  ;
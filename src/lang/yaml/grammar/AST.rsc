module lang::yaml::grammar::AST


import lang::yaml::grammar::Syntax;


data Document
             = document(list[Block] blocks, list[str] dlms)
             ;

data Block = mappingBlock(MappingBlock mb)
           | blockSequence(SequenceBlock sb)
           ;

data MappingBlock = mappingBlockWBlock(str id, list[str] dlms, list[Block] blocks)
                  | mappingBlock(str id, list[str], Values values)
                  | mappingBlockWType(str id, str typeName, list[str] dlms, Value val)
                  // | mappingBlockWType(str id, TypedValue  val)
                  ;

data SequenceBlock = sequenceBlock(Block blk);

data Values = values(list[Value] vals);

data Value
          = sequenceVal(SequenceValue sv)
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


data Type 
         = integer()
         | string()
         | boolean()
         | date()
         | time()
         ;
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
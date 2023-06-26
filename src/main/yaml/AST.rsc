module AST


import Syntax;


data Document
             = document(list[Block] blocks, list[str] dlms)
             ;

data Block = mapBlock(MappingBlock mb)
           | seqBlock(SequenceBlock sb)
           ;

data MappingBlock = mappingBlockWBlock(str id, list[str] dlms, list[Block] blocks)
                  | mappingBlock(str id, list[str], Values values)
                //   | mappingBlockWType(str id, str typeName, list[str] dlms, Value val)
                  | mappingBlockWType(str id, TypedValue  val)
                  ;

data SequenceBlock = sequenceBlock(Block blk);

data Values = values(list[Value] vals);

data Value
          = sequenceVal(SequenceValue sv)
          | quotedVal(QuotedScalar qv)
          | plainVal(PlainScalar pv)
          | numberVal(Number numb)
          // | time(Timestamp t)
          | date(Date d)
          | boolean(Bool b)
          ;

data SequenceValue = sequenceValue(Value sqv)
                  //  | sequenceBlock(list[Block] blk)
                   ;


data QuotedScalar = quotedScalar(str quotedVal);

data Date = date(DatePart d);

// data Year = year(Unit e1, Unit e2,  Unit e3,  Unit e4 ) ;
// int Month ;
// int Day ;

data PlainScalar = plainScalar(str plainV);

data Number = number(int number);
data Timestamp = time(JustTime t );
data Bool
        = True(str b1)
        | False(str b2)
        ;

data Type 
         = integer()
         | string()
         | boolean()
         ;
data TypedValue 
         = integer( int number)
         | string(Value val)
         | boolean(Bool bv)
         ;
         
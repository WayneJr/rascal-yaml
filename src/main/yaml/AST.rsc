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
          ;

data SequenceValue = sequenceValue(Value sqv)
                  //  | sequenceBlock(list[Block] blk)
                   ;

data QuotedScalar = quotedScalar(str quotedVal);

data PlainScalar = plainScalar(str plainV);

data Number = number(int number);

data Type 
         = integer()
         | string()
         | boolean()
         ;
data TypedValue 
         = integer( int )
         | string(Value val)
         | boolean(bool)
         ;

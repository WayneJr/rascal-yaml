module AST

import Syntax;

data Document
             = document(list[Block] blocks, list[str] dlms)
             ;

data Block = mappingBlock(MappingBlock mb)
           | blockSequence(SequenceBlock sb)
           ;

data MappingBlock = mappingToBlock(str id, list[str] dlms, Block blocks)
                  | mappingToValue(str id, list[str], Values values)
                  | mappingToValueWithType(str id, str typeName, list[str] dlms, Value val)
                  ;

data SequenceBlock = sequenceBlock(Block blk);

data Values = values(list[Value] vals);

data Value
          = valueSequence(SequenceValue sv)
          | quotedValue(QuotedScalar qv)
          | plainValue(PlainScalar pv)
          | numberValue(Number numb)
          ;

data SequenceValue = sequenceValue(Value sqv)
                   ;

data QuotedScalar = quotedScalar(str quotedVal);

data PlainScalar = plainScalar(str plainV);

data Number = number(int number);

data Type 
         = integer()
         | string()
         | boolean()
         ;

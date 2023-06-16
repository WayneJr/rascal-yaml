module AST

import Syntax;

data Document
             = document(list[Block] blocks, list[str] dlms)
             ;

data Block = block(MappingBlock mb);

data MappingBlock = mappingBlock(str id, list[str] dlms, list[Values] values);

data Values = values(list[Value] vals);

data Value
          = sequenceVal(SequenceValue sv)
          | quotedVal(QuotedValue qv)
          | plainVal(PlainValue pv)
          | numberVal(Number numb)
          ;

data SequenceValue = sequenceValue(Value sqv);

data QuotedValue = quotedValue(str quotedVal);

data PlainValue = plainValue(str plainV);

data Number = number(int number);

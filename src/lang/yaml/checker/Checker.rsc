module lang::yaml::checker::Checker

extend analysis::typepal::TypePal;

import lang::yaml::grammar::Syntax;

data AType 
         = intType()
         | stringType()
         | boolType()
         | dateType()
         | timeType()
         ;

data IdRole = mappingId() | blockId();

str prettyAType(boolType()) = "boolean";
str prettyAType(intType()) = "integer";
str prettyAType(stringType()) = "string";
str prettyAType(dateType()) = "date";
str prettyAType(timeType()) = "time";




// Mappings

// void collect(current: /{Block DLM}+ DLM?, Collector c) {
//   // c.define(current, blockId, current, def)
//   c.enterScope(current);
//     collect(block, c);
//   c.leaveScope(current);
// }

void collect(current: /MappingBlock mp, Collector c) {
  c.enterScope(current);
    collect(mp, c);
  c.leaveScope(current);
}

// void collect(current: (MappingBlock) `<Id name> @ <Type t> ":" <DLM? _> <Value val>`, Collector c) {
//   c.define("<name>", mappingId(), current, defType(t));
//   c.requireEqual(t, val, error(val, "Incorrect initialization, expected %t, found %t", t, val));
//   // c.enterScope(current);
//     collect(val, c);
//   c.leaveScope(current);
//   c.report(info(t, "<name> type is %t", t));
// }

void collect(current: (MappingBlock) `<Id name> @ <Type t> ":" <DLM? _> <Value val>`, Collector c) {
  c.define("<name>", mappingId(), current, defType(t));
  c.requireEqual(t, val, error(val, "Incorrect initialization, expected %t, found %t", t, val));
  // c.enterScope(current);
  // collect(val, c);
  // c.leaveScope(current);
  c.report(info(t, "<name> type is %t", t));
  collect(t, val, c);
}

// Values
void collect(current: (Value) `<Number _>`, Collector c) {
  c.fact(current, intType());
}

void collect(current: (Value) `<BooleanScalar _>`, Collector c) {
  c.fact(current, boolType());
}

void collect(current: (Value) `<QuotedScalar _>`, Collector c) {
  c.fact(current, stringType);
}

// void collect(current: (Value) ``, Collector c) {

// }

// Type Constraints

void collect(current: (Type) `integer`, Collector c) {
  c.fact(current, intType());
}

void collect(current: (Type) `string`, Collector c) {
  c.fact(current, stringType());
}

void collect(current: (Type) `boolean`, Collector c) {
  c.fact(current, boolType());
}

void collect(current: (Type) `date`, Collector c) {
  c.fact(current, dateType());
}

void collect(current: (Type) `time`, Collector c) {
  c.fact(current, timeType());
}


// str prettyAType(entityType(str name)) = "<name>"; 

TModel yamlTModelForTree(Tree pt){
    return collectAndSolve(pt);
}

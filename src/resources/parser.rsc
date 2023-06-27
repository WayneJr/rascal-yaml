module parser
import ParseTree;
import Syntax;
// import AST;
import IO;

str doc = readFile(|project://rascal-yaml/src/resources/test.yml|) ;
public Tree parseDoc(str dat)= parse(#Document , dat);


void main(){
    implode(#Document,parseDoc(doc));
}

// import parser;
// import AST;
// import ParseTree;
// implode(#Document,parseDoc(readFile(doc)));
module parser
import ParseTree;
import Syntax;
import IO;

public Document parseDoc(){
    str doc = readFile(|project://rascal-yaml/src/resources/test.yml|) ;
    // println(doc);
    return parse(#Document , doc);
}

void main(){
    Document result = parseDoc();
    println(result);
}
module lang::yaml::grammar::Implode

extend lang::yaml::grammar::AST;

import lang::yaml::grammar::Parse;
import ParseTree;
import IO;


public Document implode(Tree pt) = implode(#Document, pt);

public Document load(loc l) = implode(#Document, parse(l));

public void loadToFile(loc src) = iprintToFile(|project://rascal-yaml/src/resources/aterm.yml|, load(src));

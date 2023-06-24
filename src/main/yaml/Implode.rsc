module Implode

extend AST;

import Parse;
import ParseTree;
import IO;


public Document implode(Tree pt) = implode(#Document, pt);

public Document load(loc l) = implode(#Document, parse(l));

public void loadToFile(loc src, loc dest) = iprintToFile(dest, load(src));

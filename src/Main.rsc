module Main

import IO;
// import ParseTree;

import lang::yaml::grammar::Parse;
// import lang::yaml::grammar::Implode;
import vis::Text;
// import util::Reflective;
import lang::yaml::LanguageServer;

void main() {

  // setupIDE();
  // newRascalProject(|home:///myDocuments/projects/grace-grammar-vs|);

  loc src = |project://rascal-yaml/src/resources/test.yml|;

  println(prettyTree(parse(src)));

  // Tree t = parse(src);

  // println(t);

  // loadToFile(src);

}
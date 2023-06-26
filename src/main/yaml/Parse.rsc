module Parse

extend Syntax;

import ParseTree;

// void parseYaml() {
//   loc src = |project://rascal-test-project/src/resources/test.yml|;
//   loc dest = |project://rascal-test-project/src/resources/aterm.yml|;
//   try {
//     Tree t = parse(#start[Document], src);
//     println(t);
//     iprintToFile(dest, implodeParseTree(t));
//   } catch Ambiguity(loc l, str s, _): {
//     println("the input is ambiguous on the string: <s> at <l> on line: <l.begin.line> at begin column: <l.begin.column>");
//   }
// }


public start[Document] parse(str src, loc origin) = parse(#start[Document], src, origin);

public start[Document] parse(loc origin) = parse(#start[Document], origin);

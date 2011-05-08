
%{
#define YYSTYPE void *
#define ON (void *) 1
#define OFF (void *) 0
%}

program =
    switch
  | eol
  | < (!eol .)* >
  { fprintf(stderr, "parse error near '%s'\n", yytext); }
  ;

switch =
  a:name - '=' - b:value
  { printf("%s is now %s\n", a, b ? "on" : "off"); }
  ;

value =
    'on' { $$ = ON; }
  | 'off' { $$ = OFF; }
  ;

name =
  < [a-zA-Z_]+ >
  { $$ = strdup(yytext); }
  ;

eol = '\n'
- = [ \t]*

%%

int
main(){
  CDESCENT *G = yyparse_new(NULL);
  while (yyparse(G)) ;
  yyparse_free(G);
  return 0;
}
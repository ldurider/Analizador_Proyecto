package compi;

import java_cup.runtime.*;

%%

%class AnalizadorLexico
%unicode
%line
%column
%public
%cup

%{    
%}

TIPO = "int"|"float"|"char"|"String"|"bool"
ID = [a-z][_a-zA-Z0-9]*
OP_UNARIO = "++"|"--"
OP_BINARIO = "+"|"-"|"*"|"/"
OP_COMP = ">="|"<="|"!="|"&&"|"||"|"=="
IGUAL = "="

ENTERO = -?[0-9]

COMENT_1 = "//".*
COMENT_M = "/*"[^"*/"]*"*/"
%%
"if"    { return new Symbol( sym.IF, yyline + 1 , yycolumn + 1 , yytext());} 
"then"	{ return new Symbol( sym.THEN, yyline + 1 , yycolumn + 1 , yytext());} 
"else"	{ return new Symbol( sym.ELSE, yyline + 1 , yycolumn + 1 , yytext());} 
"do"	{ return new Symbol( sym.DO, yyline + 1 , yycolumn + 1 , yytext());} 
"while"	{ return new Symbol( sym.WHILE, yyline + 1 , yycolumn + 1 , yytext());} 

{TIPO}  { return new Symbol( sym.TIPO , yyline + 1 , yycolumn + 1 , yytext() ) ;  }
{ID}    { return new Symbol( sym.ID , yyline + 1 , yycolumn + 1 , yytext() ) ;  }

";"   	{ return new Symbol( sym.END , yyline + 1 , yycolumn + 1 , yytext() ) ;  }
"," 	{ return new Symbol( sym.COMA , yyline + 1 , yycolumn + 1 , yytext() ) ;  }
":"		{ return new Symbol( sym.DOSPUN , yyline + 1 , yycolumn + 1 , yytext() ) ;}

{OP_UNARIO}	 {return new Symbol( sym.OP_UNARIO , yyline + 1 , yycolumn + 1 , yytext() ) ;}
{OP_BINARIO} {return new Symbol( sym.OP_BINARIO , yyline + 1 , yycolumn + 1 , yytext() ) ;}
{IGUAL}		 {return new Symbol( sym.IGUAL , yyline + 1 , yycolumn + 1 , yytext() ) ;}
{OP_COMP}	 {return new Symbol( sym.OP_COMP , yyline + 1 , yycolumn + 1 , yytext() ) ;}
 
"("		{ return new Symbol( sym.PAR_AB, yyline + 1 , yycolumn + 1 , yytext());} 
")"		{ return new Symbol( sym.PAR_CER, yyline + 1 , yycolumn + 1 , yytext());} 
"{"		{ return new Symbol( sym.LLAV_AB, yyline + 1 , yycolumn + 1 , yytext());} 
"}"		{ return new Symbol( sym.LLAV_CER, yyline + 1 , yycolumn + 1 , yytext());} 
"["		{ return new Symbol( sym.COR_AB, yyline + 1 , yycolumn + 1 , yytext());} 
"]"		{ return new Symbol( sym.COR_CER, yyline + 1 , yycolumn + 1 , yytext());} 
 
{ENTERO}	{ return new Symbol( sym.ENTERO, yyline + 1 , yycolumn + 1 , yytext());}
 

[ \n\t\r]| {COMENT_1}| {COMENT_M} {}


[^ \n\t\r] { System.out.println("Error Lexico: " +"Token no reconocido< "+yytext()+" > En linea "+(yyline+1)+" y columna "+(yycolumn+1)); }
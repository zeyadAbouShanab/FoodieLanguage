%option noyywrap c++ yylineno

%{
#include "Parserbase.h"
%}

%%

muffins?        return Parser::MUFFIN;
sandwich(es)?   return Parser::SANDWICH;
burgers?        return Parser::BURGER;
cakes?          return Parser::CAKE;

a|one           return Parser::ONE;
two             return Parser::TWO;
three           return Parser::THREE;
dozen           return Parser::DOZEN;

for             return Parser::FOR;
people:?        return Parser::PEOPLE;

then|plus|and|, return Parser::PLUS;

[ \t\r\n]       /* dropping whitespaces */

.           {
                std::cerr << lineno() << ": Lexical error." << std::endl;
                exit(1);
            }

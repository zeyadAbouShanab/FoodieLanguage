%baseclass-preinclude "semantics.h"
%lsp-needed

%token ONE TWO THREE DOZEN
%token BURGER SANDWICH MUFFIN CAKE
%token FOR PEOPLE
%left PLUS

%union {
    food* food_info;
    int amount;
}

%type<food_info> food;
%type<amount> amount;

%%

start:
    food
    {
        if($1->calories > 2000) {
            error("That's a lot of calories, you cannot eat that much!");
        }
        if($1->type == sweet) {
            std::cout << "OK, that's gonna be " << $1->calories << " sweet calories!" << std::endl;
        }
        else if($1->type == salty) {
            std::cout << "OK, that's gonna be " << $1->calories << " salty calories!" << std::endl;
        }
        else {
            std::cout << "OK, that's gonna be " << $1->calories << " balanced calories!" << std::endl;
        }
    }
;

food:
    amount BURGER
    {
        $$ = new food($1*500, salty);
    }
|
    amount SANDWICH
    {
        $$ = new food($1*200, salty);
    }
|
    amount MUFFIN
    {
        $$ = new food($1*100, sweet);
    }
|
    amount CAKE
    {
        $$ = new food($1*500, sweet);
    }
|
    food PLUS food
    {
        if(($1->type == sweet || $1->type == mixed) && $3->type == salty) {
            error("Really? No, you should not eat salty after the sweet...");
        }
        if($1->type == $3->type) {
            $$ = new food($1->calories + $3->calories, $1->type);
        }
        else {
            $$ = new food($1->calories + $3->calories, mixed);
        }
    }
|
    FOR amount PEOPLE food
    {
        if($4->calories / $2 > 2000){
            std::cout << "That's too much!  " << $2 << " people cannot eat that much" << std::endl;    	
	}
        else{
	    std::cout << "OK, that's gonna be " << $4->calories / $2 << " calories for each person" << std::endl;
        }
    }
|
    food FOR amount PEOPLE{
        if($1->calories / $3 > 2000){
	    std::cout << "That's too much!  " << $3 << " people cannot eat that much" << std::endl;
        }
        else{
     	    std::cout << "OK, that's gonna be " << $1->calories / $3 << " calories for each person" << std::endl;
        }
    }
;

amount:
    ONE     { $$ = 1; }
|
    TWO     { $$ = 2; }
|
    THREE   { $$ = 3; }
|
    DOZEN   { $$ = 12; }
;

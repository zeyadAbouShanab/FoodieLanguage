#ifndef SEMANTICS_H
#define SEMANTICS_H
#include<iostream>
#include<stdlib.h>

enum food_type { salty, sweet, mixed };

struct food {
    int calories;
    food_type type;
    food() {}
    food(int c, food_type t) : calories(c), type(t) {}
};

#endif

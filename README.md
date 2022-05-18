# FoodieLanguage
This is the description of a simple artificial language. This is a case study for specifying formal languages with attribute grammars.

In this language, we compose English-like sentences, which may be a specification of one's lunch or dinner menu (or maybe a whole day's consumption) :) The speciality of this language is that the meaning and restrictions of sentences are related to the calories and other attributes rather than to the common meaning of words. Thus, this language can be seen as a DSL (Domain Specific Language).

**Examples**
- "two sandwiches plus a burger" means salty food and 900 calories.
- "three muffins" means sweet food and 300 calories.
- "three burgers, two sandwiches and two muffins" is invalid (improper), because it determines more than 2000 calories.
- "for two people: three burgers, two sandwiches and two muffins" means 1050 calories per person.

**Lexical elements**

There a number of simple elements, words, that you can put together to form a sentence in this language:
- Food names (e.g. muffin, sandwich, burger) and their plural forms;
- Quantities (e.g. one, two and three);
- Connectives (e.g. then, plus, and). 
- People(e.g for, people)

If there are words in the sentence that do not fall into any of these categories, the sentence is lexically invalid (and therefore the lexical analyser has to report an error).

**Syntax**

The context-free syntax of this language is very simple. It allows the "programmer" to enumerate a number of dishes, food names along with the amount we are going to eat up thereof. For example, the sentence "a burger and two muffins" is valid, while the sentence "burger and muffin" would be invalid because of the missing counts.

**Static semantics**

There a few restrictions on the sentences that can be accepted as lunch descriptions:
- Food enumerations summing up to more than 2000 calories are not accepted as it is too much :)
- Descriptions mentioning salty food after sweet ones are rejected. Obviously :)

**Dynamic semantics**

The meaning of sentences in this language are the total number of calories of the dishes as well as whether the foods are salty or sweet (or mixed). In order to calculate these, the implementation has to keep track of the taste of the food, as well as it has to count the number of calories, which is the amount multiplied by the calory information of the food.

Semantics of quantitative words:
- one: 1
- a: 1
- two: 2
- three: 3
- dozen: 12
 
Semantics of foods:
- muffin: sweet, 100 calories
- sandwich: salty, 200 calories
- burger: salty, 500 calories
- cake: sweet, 500 calories

The semantics of the composition operators (all mean the same) is adding the calories of the connected foods and determining whether the combination is salty, sweet or a mixture.

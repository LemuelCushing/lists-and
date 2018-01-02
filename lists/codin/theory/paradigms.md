# Paradigms

## Imperative vs Declarative

`x = 3` in an imperative language is just sugar coating of `set(x,3)`, which is what makes it imperative.
Declarative programming, on the other hand, is just that - it declares, not orders. 

`let` confuses me a bit here, but I think it can be understood as in a sort of buffer between the two. With its mathematical past, it echos the declarative nature of math, but the implicit executor of the action (`let`) places it as a literal imperative function.  

## Functional

>Functional is a particular kind of declarative. - [stackoverflow](https://stackoverflow.com/questions/10925689/functional-programming-vs-declarative-programming-vs-imperative-programming)  


## Reactive 

> For example, in an imperative programming setting, {\displaystyle a:=b+c} a:=b+c would mean that {\displaystyle a} a is being assigned the result of {\displaystyle b+c} b+c in the instant the expression is evaluated, and later, the values of {\displaystyle b} b and/or {\displaystyle c} c can be changed with no effect on the value of {\displaystyle a} a. However, in reactive programming, the value of {\displaystyle a} a is automatically updated whenever the values of {\displaystyle b} b and/or {\displaystyle c} c change; without the program having to re-execute the sentence {\displaystyle a:=b+c} a:=b+c to determine the presently assigned value of {\displaystyle a} a. - Wikipedia
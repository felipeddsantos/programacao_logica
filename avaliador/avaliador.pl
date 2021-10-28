/*

Programação Lógica - Avaliador de Expressões
Felipe Daniel Dias dos Santos - 11711ECP004
Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

*/

/*

Avaliador de expressões

Avalia e resolve expressões com as operações: soma, subtração, multiplicação, divisão, potência, exponencial, logaritmo base 10, logaritmo natural, raíz quadrada, máximo, mínimo, seno, cosseno e tangente.

Os valores permitidos para as expressões são todos os reais, incluindo os símbolos "e" e "pi".

*/

avalia(C, C) :- number(C).

avalia(pi, X) :- X is pi.

avalia(e, X) :- X is e.

avalia(-A, X) :- 
    avalia(A, X1), 
    X is -X1.

avalia(A + B, X) :-
    avalia(A, X1),
    avalia(B, X2),
    X is X1 + X2.

avalia(A - B, X) :-
    avalia(A, X1),
    avalia(B, X2),
    X is X1 - X2.

avalia(A * B, X) :-
    avalia(A, X1),
    avalia(B, X2),
    X is X1 * X2.

avalia(A / B, X) :-
    avalia(A, X1),
    avalia(B, X2),
    X is X1 / X2.

avalia(A ^ B, X) :-
    avalia(A, X1),
    avalia(B, X2),
    X is X1 ** X2.

avalia(sin(A), X) :-
    avalia(A, X1),
    X is sin(X1).

avalia(cos(A), X) :-
    avalia(A, X1),
    X is cos(X1).

avalia(tg(A), X) :-
    avalia(A, X1),
    X is tan(X1).

avalia(log(A), X) :-
    avalia(A, X1),
    X is log(X1).

avalia(log10(A), X) :-
    avalia(A, X1),
    X is log10(X1).

avalia(exp(A), X) :-
    avalia(A, X1),
    X is exp(X1).

avalia(sqrt(A), X) :-
    avalia(A, X1),
    X is sqrt(X1).

avalia(max(A, B), X) :-
    avalia(A, X1),
    avalia(B, X2),
    X is max(X1, X2).

avalia(min(A, B), X) :-
    avalia(A, X1),
    avalia(B, X2),
    X is min(X1, X2).

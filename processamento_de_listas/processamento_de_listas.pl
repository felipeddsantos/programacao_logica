/*

Programação Lógica - Processamento de Listas
Felipe Daniel Dias dos Santos - 11711ECP004
Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

*/

%Exercício 1: Cálculo do produto interno

produtoInterno([], [], 0).
produtoInterno([H1|T1], [H2|T2], X) :- produtoInterno(T1, T2, X1), X is H1 * H2 + X1. 

%Exercício 2.a): Conversão de binário para octal

bin2oct(B, O) :- reverso(B, B1), bin2octAux(B1, O).

bin2octAux([], []) :- !.
bin2octAux([B], [B]) :- !.
bin2octAux([B1, B2], [O]) :- O is B1 + 2 * B2, !.
bin2octAux([B1, B2, B3|T], O) :- bin2octAux(T, O1), O2 is B1 + 2 * B2 + 4 * B3, append(O1, [O2], O).

%Exercício 2.b): Conversão de octal para binário

oct2bin([], []) :- !.
oct2bin([O|T], B) :- oct2binAux(O, B1), oct2bin(T, B2), append(B1, B2, B).

oct2binAux(0, [0, 0, 0]).
oct2binAux(1, [0, 0, 1]).
oct2binAux(2, [0, 1, 0]).
oct2binAux(3, [0, 1, 1]).
oct2binAux(4, [1, 0, 0]).
oct2binAux(5, [1, 0, 1]).
oct2binAux(6, [1, 1, 0]).
oct2binAux(7, [1, 1, 1]).

%Exercício 5: Definição da árvore genealógica

homem(josé).
homem(júnior).
homem(marcos).
homem(márcio).
homem(mário).

mulher(ana).
mulher(ada).
mulher(maria).
mulher(alana).
mulher(cláudia).

filho(júnior, josé).
filho(júnior, ada).
filho(marcos, mário).
filho(marcos, ana).
filho(márcio, mário).
filho(márcio, ana).

filha(ana, josé).
filha(ana, ada).
filha(maria, josé).
filha(maria, ada).
filha(alana, júnior).
filha(alana, cláudia).

%Exercício 5.a): Definição de pais

pais(X, Y) :- filho(Y, X); filha(Y, X).

%Exercício 5.b): Definição de irmãos

irmao(X, Y) :- homem(X), filho(X, P1), !, pais(P1, Y), X \= Y.
irma(X, Y) :- mulher(X), filha(X, P1), !, pais(P1, Y), X \= Y.

%Exercício 5.c): Definição de primos

primos(X, Y) :- pais(P1, X), pais(P2, Y), (irmao(P1, P2); irma(P1, P2)).

%Exercício 5.d): Definição de tios

tia(X, Y) :- mulher(X), pais(P1, Y), irma(X, P1).
tio(X, Y) :- homem(X), pais(P1, Y), irmao(X, P1).

%Exercício 5.e): Definição de sobrinho

sobrinho(X, Y) :- tia(Y, X); tio(Y, X).

%Exercício 5.f): Definição de bisavó

bisavo(X, Y) :- mulher(X), pais(P1, Y), pais(P2, P1), (filho(P2, X); filha(P2, X)).

%Exercício 5.g): Definição de ascendente

ascendente(X, Y) :- pais(Y, X); (pais(P1, X), ascendente(P1, Y)). 

%Exercício 9: Cálculo dos valores extremos

extremos(L, Max, Min) :- maximo(L, Max), minimo(L, Min). 

maximo([H], H).
maximo([H1, H2], Max) :- Max is max(H1, H2).
maximo([H1, H2|T], Max) :- M is max(H1, H2), maximo([M|T], Max), !. 

minimo([H], H).
minimo([H1, H2], Min) :- Min is min(H1, H2).
minimo([H1, H2|T], Min) :- M is min(H1, H2), minimo([M|T], Min), !. 

%Exercício 11: Verificação de ocorrência de valores repetidos

multiplo([H|T]) :- pertence(T, H), !; multiplo(T).
pertence([H|T], X) :- X == H, !; pertence(T, X).

%Exercício 13.a): Definição da função f

f(X, Y) :- X > 100, Y is X - 10, !.
f(X, Y) :- X =< 100, f(X + 11, Y1), f(Y1, Y).

%Exercício 13.b): Avaliação da função f no ponto x = 95
%A questão ?- f(95, Y). gera o seguinte resultado: Y = 91.

%Exercício 14: Transformação da escala Celsius para a escala Fahrenheit

c2f(C, F) :- F is C * 1.8 + 32.

%Exercício 15: Cálculo da raíz quadrada

raiz(X, R) :- raizAux(X, 1 - X, R).
raizAux(A, C, R) :- AI is (A * (1 + C / 2)), CI is ((C ^ 2) * (3 + C) / 4), abs(A - AI) >= 0.0000001, !, raizAux(AI, CI, R).    
raizAux(A, _, A).

%Exercício 19: Inversão de uma lista

reverso(L, I) :- reversoAux(L, [], I).
reversoAux([], L, L).
reversoAux([H|T], L, I) :- reversoAux(T, [H|L], I).

%Exercício 20: Verificação de palíndrome

palindrome(L) :- reverso(L, I), I == L.

/*

Programação Lógica - Problema da Visita ao Pet-Shop
Felipe Daniel Dias dos Santos - 11711ECP004
Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

*/

/*

O problema da visita ao pet shop

Deseja-se uma resposta através de uma estrutura da forma:

pet_shop(Dono1, Dono2, Dono3, Dono4, Dono5, Dono6)
dono(Coleira, Nome, Raca, Idade, Dono, Gasto) 

*/

%Definição da estrutura da solução: o pet shop possui 5 donos, onde cada um possui 5 atributos.
resolve(S) :-
    S = pet_shop(dono(_, _, _, _, _, _),
                 dono(_, _, _, _, _, _),
                 dono(_, _, _, _, _, _),
                 dono(_, _, _, _, _, _),
                 dono(_, _, _, _, _, _)),

%Hércules está entre o cachorro da coleira Vermelha e o Rex, nessa ordem.
    algum_lugar_entre(AA, AB, AC, S),
    nome(AA, hercules),
    coleira(AB, vermelha),
    nome(AC, rex),

%Na quarta posição está quem vai gastar R$60.
    quarta_posicao(AD, S),
    gasto(AD, 60),

%José está exatamente à esquerda de Fernando.
    exatamente_esquerda(AE, AF, S),
    dono_nome(AE, jose),
    dono_nome(AF, fernando),

%André está em algum lugar à direita do dono do cão da coleira Verde.
%Proposição equivalente: o dono do cão da coleira Verde está em algum lugar à esquerda de André.
    algum_lugar_esquerda(AG, AH, S),
    coleira(AG, verde),
    dono_nome(AH, andre),

%O Yorkshire está exatamente à direita do cachorro de 4 anos.
%Proposição equivalente: o cachorro de 4 anos está exatamente à esquerda do Yorkshire.
    exatamente_esquerda(AI, AJ, S),
    idade(AI, 4),
    raca(AJ, yorkshire),

%O cachorro da coleira Amarela está em algum lugar entre 
%o Dalmata e o rapaz que vai gastar R$60, nessa ordem.
    algum_lugar_entre(AK, AL, AM, S),
    coleira(AK, amarela),
    raca(AL, dalmata),
    gasto(AM, 60),

%Quem vai gastar R$40 está exatamente à esquerda de José.
    exatamente_esquerda(AN, AO, S),
    gasto(AN, 40),
    dono_nome(AO, jose),

%O cachorro de 5 anos está em algum lugar entre o Snoopy e o cachorro de 4 anos, nessa ordem.
    algum_lugar_entre(AP, AQ, AR, S),
    idade(AP, 5),
    nome(AQ, snoopy),
    idade(AR, 4),

%O cachorro da coleira Verde está em algum lugar à esquerda do Marley.
    algum_lugar_esquerda(AS, AT, S),
    coleira(AS, verde),
    nome(AT, marley),

%O rapaz que gastará R$70 está exatamente à esquerda do que vai gastar R$60.
    exatamente_esquerda(AU, AV, S),
    gasto(AU, 70),
    gasto(AV, 60),

%O cachorro mais velho está na quinta posição.
%OBS: o cachorro mais velho tem 7 anos.
    quinta_posicao(AW, S),
    idade(AW, 7),

%José está ao lado do homem que gastará R$70.
    lado(AX, AY, S),
    dono_nome(AX, jose),
    gasto(AY, 70),

%André está na quarta posição.
    quarta_posicao(AZ, S),
    dono_nome(AZ, andre),

%Fernando está ao lado do dono do Rex.
    lado(BA, BB, S),
    dono_nome(BA, fernando),
    nome(BB, rex),

%Bidu está em algum lugar à direita do cachorro da coleira Amarela.
%Proposição equivalente: o cachorro de coleira Amarela está em algum lugar à esquerda de Bidu.
    algum_lugar_esquerda(BC, BD, S),
    coleira(BC, amarela),
    nome(BD, bidu),

%O cachorro de 6 anos está em algum lugar entre 
%o rapaz que gastará R$40 e o cachorro de 5 anos, nessa ordem.
    algum_lugar_entre(BE, BF, BG, S),
    idade(BE, 6),
    gasto(BF, 40),
    idade(BG, 5),

%O Boxer e o cão da coleira Amarela estão lado a lado.
    lado(BH, BI, S),
    raca(BH, boxer),
    coleira(BI, amarela),

%O cachorro da coleira Amarela está em algum lugar à esquerda de quem gastará R$30.
    algum_lugar_esquerda(BJ, BK, S),
    coleira(BJ, amarela),
    gasto(BK, 30),

%Rafael está em algum lugar à direira do cachorro da coleira Azul.
%Proposição equivalente: o cachorro de coleira azul está em algum lugar à esquerda de Rafael.
    algum_lugar_esquerda(BL, BM, S),
    coleira(BL, azul),
    dono_nome(BM, rafael),
    
%O cachorro da coleira Amarela está em algum lugar entre 
%o cão da coleira Vermelha e o Labrador, nessa orderm.
    algum_lugar_entre(BN, BO, BQ, S),
    coleira(BN, amarela),
    coleira(BO, vermelha),
    raca(BQ, labrador),

%O Poodle está exatamente à esquerda do Boxer.
    exatamente_esquerda(BR, BS, S),
    raca(BR, poodle),
    raca(BS, boxer),

%Restrições de fechamento: aqui serão colocados os atributos que não constam nas definições anteriores.
    dono(BT, S),
    coleira(BT, branca),

    dono(BU, S),
    idade(BU, 3),

    dono(BV, S),
    dono_nome(BV, guilherme),

    dono(BW, S),
    gasto(BW, 50).

%Definição de "dono": pode estar em qualquer uma das 5 posições de "pet_shop".
dono(X, pet_shop(X, _, _, _, _)).
dono(X, pet_shop(_, X, _, _, _)).
dono(X, pet_shop(_, _, X, _, _)).
dono(X, pet_shop(_, _, _, X, _)).
dono(X, pet_shop(_, _, _, _, X)).

%Definição de "coleira": é o primeiro atributo de "dono".
coleira(dono(X, _, _, _, _, _), X).

%Definição de "nome": é o segundo atributo de "dono".
nome(dono(_, X, _, _, _, _), X).

%Definição de "raca": é o terceiro atributo de "dono".
raca(dono(_, _, X, _, _, _), X).

%Definição de "idade": é o quarto atributo de "dono".
idade(dono(_, _, _, X, _, _), X).

%Definição de "dono_nome": é o quinto atributo de "dono".
dono_nome(dono(_, _, _, _, X, _), X).

%Definição de "gasto": é o sexto atributo de "dono".
gasto(dono(_, _, _, _, _, X), X).

%Definição de "algum_lugar_esquerda": dados dois donos "X" e "Y", avaliar todas as possibilidades 
%tal que "X" esteja à esquerda de "Y" em "pet_shop". Nesse caso, existem 10 possibilidades.   
algum_lugar_esquerda(X, Y, pet_shop(X, Y, _, _, _)).
algum_lugar_esquerda(X, Y, pet_shop(X, _, Y, _, _)).
algum_lugar_esquerda(X, Y, pet_shop(X, _, _, Y, _)).
algum_lugar_esquerda(X, Y, pet_shop(X, _, _, _, Y)).
algum_lugar_esquerda(X, Y, pet_shop(_, X, Y, _, _)).
algum_lugar_esquerda(X, Y, pet_shop(_, X, _, Y, _)).
algum_lugar_esquerda(X, Y, pet_shop(_, X, _, _, Y)).
algum_lugar_esquerda(X, Y, pet_shop(_, _, X, Y, _)).
algum_lugar_esquerda(X, Y, pet_shop(_, _, X, _, Y)).
algum_lugar_esquerda(X, Y, pet_shop(_, _, _, X, Y)).

%Definição de "exatamente_esquerda": dados dois donos "X" e "Y", avaliar todas as possibilidades 
%tal que "X" esteja exatamente à esquerda de "Y" em "pet_shop". Nesse caso, existem 4 possibilidades.  
exatamente_esquerda(X, Y, pet_shop(X, Y, _, _, _)).
exatamente_esquerda(X, Y, pet_shop(_, X, Y, _, _)).
exatamente_esquerda(X, Y, pet_shop(_, _, X, Y, _)).
exatamente_esquerda(X, Y, pet_shop(_, _, _, X, Y)).

%Definição de "algum_lugar_entre": dados três donos "X", "Y" e "Z", avaliar todas as possibilidades 
%tal que "X" esteja entre "Y" e "Z", nessa ordem, em "pet_shop". Nesse caso, existem 10 possibilidades.
algum_lugar_entre(X, Y, Z, pet_shop(Y, X, Z, _, _)).
algum_lugar_entre(X, Y, Z, pet_shop(Y, X, _, Z, _)).
algum_lugar_entre(X, Y, Z, pet_shop(Y, X, _, _, Z)).
algum_lugar_entre(X, Y, Z, pet_shop(Y, _, X, Z, _)).
algum_lugar_entre(X, Y, Z, pet_shop(Y, _, X, _, Z)).
algum_lugar_entre(X, Y, Z, pet_shop(Y, _, _, X, Z)).
algum_lugar_entre(X, Y, Z, pet_shop(_, Y, X, Z, _)).
algum_lugar_entre(X, Y, Z, pet_shop(_, Y, X, _, Z)).
algum_lugar_entre(X, Y, Z, pet_shop(_, Y, _, X, Z)).
algum_lugar_entre(X, Y, Z, pet_shop(_, _, Y, X, Z)).

%Definição de "lado": dados dois donos "X" e "Y", avaliar todas as possibilidades 
%tal que "X" esteja ao lado de "Y" em "pet_shop". Nesse caso, existem 8 possibilidades.
lado(X, Y, pet_shop(X, Y, _, _, _)).
lado(X, Y, pet_shop(_, X, Y, _, _)).
lado(X, Y, pet_shop(_, _, X, Y, _)).
lado(X, Y, pet_shop(_, _, _, X, Y)).
lado(X, Y, pet_shop(Y, X, _, _, _)).
lado(X, Y, pet_shop(_, Y, X, _, _)).
lado(X, Y, pet_shop(_, _, Y, X, _)).
lado(X, Y, pet_shop(_, _, _, Y, X)).

%Definição de "quarta_posicao": dado um dono "X", alocá-lo na quarta posição em "pet_shop". 
quarta_posicao(X, pet_shop(_, _, _, X, _)).

%Definição de "quinta_posicao": dado um dono "X", alocá-lo na quinta posição em "pet_shop". 
quinta_posicao(X, pet_shop(_, _, _, _, X)).

{-

Programação Lógica - Testes do Módulo de Funções Auxiliares
Felipe Daniel Dias dos Santos - 11711ECP004
Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

-}

import FuncoesAuxiliares
import Data.List

main :: IO()
main = do
    
    putStrLn "\n*****/////Testes das funções utilizadas no módulo de funções auxiliares/////*****"
    putStrLn "\n\nA função div recebe dois números inteiros e retorna a divisão inteira dos mesmos."
    putStrLn "Exemplo: div 9 2"
    print $ div 9 2

    putStrLn "\nA função abs recebe um número e retorna seu módulo."
    putStrLn "Exemplo: abs (-2)"
    print $ abs (-2)
    
    putStrLn "\nA função mod recebe dois números inteiros e retorna o resto da divisão dos mesmos."
    putStrLn "Exemplo: mod 5 2"
    print $ mod 5 2
    
    putStrLn "\nA função length recebe uma lista e retorna seu comprimento."
    putStrLn "Exemplo: length [1, 2, 3, 4]"
    print $ length [1, 2, 3, 4]

    putStrLn "\nA função sort recebe uma lista e retorna a mesma ordenada."
    putStrLn "Exemplo: sort [2, 4, 1, 3]"
    print $ sort [2, 4, 1, 3]
    
    putStrLn "\nA função sum recebe uma lista de números e retorna a soma de seus elementos."
    putStrLn "Exemplo: sum [1, 2, 3, 4]"
    print $ sum [1, 2, 3, 4]

    putStrLn "\nA função minimum recebe uma lista e retorna o menor elemento da mesma."
    putStrLn "Exemplo: minimum [1, 2, 0, 4]"
    print $ minimum [1, 2, 0, 4]
    
    putStrLn "\nA função elem recebe um elemento e uma lista e verifica se o elemento pertence a lista."
    putStrLn "Exemplo: elem 2 [1, 2, 3, 4]"
    print $ elem 2 [1, 2, 3, 4]
    
    putStrLn "\nA função notElem recebe um elemento e uma lista e verifica se o elemento não pertence a lista."
    putStrLn "Exemplo: notElem 5 [1, 2, 3, 4]"
    print $ notElem 5 [1, 2, 3, 4]

    putStrLn "\nA função delete recebe um elemento e uma lista e retorna a lista sem o elemento."
    putStrLn "Exemplo: delete 2 [1, 2, 3, 4]"
    print $ delete 2 [1, 2, 3, 4]
    
    putStrLn "\nA função union recebe duas listas e retorna a união das listas."
    putStrLn "Exemplo: union [1, 2, 3, 4] [2, 3, 4, 5]"
    print $ union [1, 2, 3, 4] [2, 3, 4, 5]
    
    putStrLn "\nA função procurarIndice recebe uma lista e um elemento e retorna o indice do elemento na lista."
    putStrLn "Exemplo: procurarIndice [1, 2, 3, 4] 2"
    print $ procurarIndice [1, 2, 3, 4] 2
    
    putStrLn "\nA função estadoValido recebe um estado do jogo (contendo somente sua configuração) e verifica se ele é válido."
    putStrLn "Exemplo: estadoValido 710285643"
    print $ estadoValido "710285643"
    
    putStrLn "\nA função obterTabuleiro recebe um índice inicial (que deve ser sempre 0) e um estado do jogo (contendo somente sua configuração) e retorna o estado em forma de tabuleiro."
    putStrLn "Exemplo: obterTabuleiro 0 123456780"
    putStrLn $ obterTabuleiro 0 "123456780"
    
    putStrLn "\nA função obterFilhos recebe um estado do jogo (contendo sua configuração e custos associados) e retorna uma lista contendo seus filhos, isto é, seus possíveis movimentos e custos de movimentação associados."
    putStrLn "Exemplo: obterFilhos (710285643, 0, 0)"
    print $ obterFilhos ("710285643", 0, 0)

    putStrLn "\nA função eFilho recebe dois estado do jogo (contendo somente suas configurações) e verifica se o segundo estado é filho do primeiro."
    putStrLn "Exemplo: eFilho 123456708 123456780"
    print $ eFilho "123456708" "123456780"
    
    putStrLn "\nA função procurarSolucao recebe uma solução e uma lista de estados visitados do jogo (contendo suas configurações e custos associados) e verifica se a solução pertence a lista."
    putStrLn "Exemplo: procurarSolucao 123456780 [(710285643, 0, 1), (701285643, 2, 1), (123456780, 5, 0)]"
    print $ procurarSolucao "123456780" [("710285643", 0, 1), ("701285643", 2, 1), ("123456780", 5, 0)]
    
    putStrLn "\nA função distManhattan recebe dois estados do jogo (contendo somente suas configurações) e retorna a Distância de Manhattan entre eles."
    putStrLn "Exemplo: distManhattan 710285643 123456780"
    print $ distManhattan "710285643" "123456780"

    putStrLn "\nA função calcularHeuristica recebe uma lista de estados do jogo (contendo suas configurações e custos associados) e uma solução e retorna a mesma lista com as heurísticas atualizadas (calculando as mesmas com a função distManhattan)."
    putStrLn "Exemplo: calcularHeuristica [(710285643, 0, 0), (701285643, 2, 0), (123456780, 5, 0)] 123456780"
    print $ calcularHeuristica [("710285643", 0, 0), ("701285643", 2, 0), ("123456780", 5, 0)] "123456780"

    putStrLn "\nA função aEstrela recebe um estado inicial do jogo (contendo sua configuração e custos associados, que logicamente devem ser iniciados em 0), um estado final (solução desejada, contendo somente sua configuração), uma lista vazia (onde será armazenado os estados visitados) e um índice inicial para contabilizar as iterações do algoritmo (logicamente, deve ser 0) e retorna uma tupla, contendo a lista de estados visitados após encontrar a solução e a quantidade de iterações do algoritmo."
    putStrLn "Exemplo: aEstrela [(123560784, 0, 0)] 123456780 [] 0"
    let s = aEstrela [("123560784", 0, 0)] "123456780" [] 0
    print s
    
    putStrLn "\nA função obterCaminho recebe uma lista de estados visitados (resultante da função aEstrela) e retorna a lista de estados que devem ser seguidos para encontrar a solução."
    putStrLn "Exemplo: obterCaminho $ fst (aEstrela [(123560784, 0, 0)] 123456780 [] 0)"
    print $ obterCaminho (fst s)

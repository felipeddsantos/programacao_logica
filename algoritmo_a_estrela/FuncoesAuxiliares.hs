{-

Programação Lógica - Módulo de Funções Auxiliares
Felipe Daniel Dias dos Santos - 11711ECP004
Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

-}

module FuncoesAuxiliares(

    procurarIndice,
    procurarSolucao,
    distManhattan,
    calcularHeuristica,
    obterFilhos,
    eFilho,
    obterCaminho,
    estadoValido,
    obterTabuleiro,
    aEstrela
)where

import Data.List

--Função que retorna o índice de um elemento y em uma lista xs
procurarIndice :: Eq a => [a] -> a -> Int
procurarIndice (x:xs) y | y == x = 0
                        | otherwise = 1 + procurarIndice xs y

--Função que verifica se uma solução s pertence a uma lista de estados visitados qs
procurarSolucao :: String -> [(String, Int, Int)] -> Bool
procurarSolucao _ [] = False
procurarSolucao s ((q, _, _):qs) | s == q = True
                                 | otherwise = procurarSolucao s qs
                                        
--Função que retorna a heurística Distância de Manhattan entre dois estados q0 e qf
distManhattan :: String -> String -> Int
distManhattan q0 qf = sum custo where 
    custo = [abs(div(procurarIndice q0 n) 3 - div(procurarIndice qf n) 3) + abs(mod(procurarIndice q0 n) 3 - mod(procurarIndice qf n) 3) | n <- ['1'..'8']]
    
--Função que retorna a heurística para um conjunto de estados qs dada uma solução s
calcularHeuristica :: [(String, Int, Int)] -> String -> [(String, Int, Int)]
calcularHeuristica [] _ = []
calcularHeuristica ((q, n, _):qs) s = (q, n, distManhattan q s):(calcularHeuristica qs s)

--Função que retorna os filhos de um estado q
obterFilhos :: (String, Int, Int) -> [(String, Int, Int)]
obterFilhos (['0', a, b, c, d, e, f, g, h], n, k) = [([a, '0', b, c, d, e, f, g, h], n + 1, k), ([c, a, b, '0', d, e, f, g, h], n + 1, k)]
obterFilhos ([a, '0', b, c, d, e, f, g, h], n, k) = [(['0', a, b, c, d, e, f, g, h], n + 1, k), ([a, b, '0', c, d, e, f, g, h], n + 1, k), ([a, d, b, c, '0', e, f, g, h], n + 1, k)]
obterFilhos ([a, b, '0', c, d, e, f, g, h], n, k) = [([a, b, e, c, d, '0', f, g, h], n + 1, k), ([a, '0', b, c, d, e, f, g, h], n + 1, k)]
obterFilhos ([a, b, c, '0', d, e, f, g, h], n, k) = [(['0', b, c, a, d, e, f, g, h], n + 1, k), ([a, b, c, f, d, e, '0', g, h], n + 1, k), ([a, b, c, d, '0', e, f, g, h], n + 1, k)]
obterFilhos ([a, b, c, d, '0', e, f, g, h], n, k) = [([a, '0', c, d, b, e, f, g, h], n + 1, k), ([a, b, c, d, g, e, f, '0', h], n + 1, k), ([a, b, c, '0', d, e, f, g, h], n + 1, k), ([a, b, c, d, e, '0', f, g, h], n + 1, k)]
obterFilhos ([a, b, c, d, e, '0', f, g, h], n, k) = [([a, b, '0', d, e, c, f, g, h], n + 1, k), ([a, b, c, d, '0', e, f, g, h], n + 1, k), ([a, b, c, d, e, h, f, g, '0'], n + 1, k)]
obterFilhos ([a, b, c, d, e, f, '0', g, h], n, k) = [([a, b, c, '0', e, f, d, g, h], n + 1, k), ([a, b, c, d, e, f, g, '0', h], n + 1, k)]
obterFilhos ([a, b, c, d, e, f, g, '0', h], n, k) = [([a, b, c, d, e, f, '0', g, h], n + 1, k), ([a, b, c, d, '0', f, g, e, h], n + 1, k), ([a, b, c, d, e, f, g, h, '0'], n + 1, k)]
obterFilhos ([a, b, c, d, e, f, g, h, '0'], n, k) = [([a, b, c, d, e, '0', g, h, f], n + 1, k), ([a, b, c, d, e, f, g, '0', h], n + 1, k)]

--Função que verifica se um estado f é filho de um estado p 
eFilho :: String -> String -> Bool
eFilho p f = elem (f, 1, 0) filhos where
  filhos = obterFilhos (p, 0, 0)

--Função que retorna o caminho entre um estado raíz e um estado folha final (solução) de um conjunto de estados visitados qs
obterCaminho :: [String] -> [String] 
obterCaminho [x] = [x]
obterCaminho [x, y] = [x, y]
obterCaminho qs | eFilho qff qf = obterCaminho (delete qf qs) ++ [qf]
                | otherwise = obterCaminho $ delete qff qs where
                    qf = qs !! (n - 1)
                    qff = qs !! (n - 2)
                    n = length qs

--Função que verifica se um estado q é válido
estadoValido :: String -> Bool
estadoValido q = sort q == "012345678"

--Função que retorna a modificação de um estado q para se parecer mais com o tabuleiro do jogo
obterTabuleiro :: Int -> String -> String
obterTabuleiro 8 q = q ++ "\n"
obterTabuleiro i (q:qs) = [q] ++ ext ++ obterTabuleiro (i + 1) (qs) where
    ext = if i == 2 || i == 5 then "\n" else []

--Função que procura uma solução s em uma árvore utilizando o algoritmo A* e a heurística Distância de Manhattan 
aEstrela :: [(String, Int, Int)] -> String -> [String] -> Int -> ([String], Int)
aEstrela _ _ _ 7000 = (["Apos 7000 iteracoes, a solucao nao foi encontrada."], 7000)
aEstrela q s qVisitados i | procurarSolucao s q = (qVisitados ++ [s], i)
                          | otherwise = aEstrela qs s qsVisitados (i + 1) where
                            custo = [n + h | (_, n, h) <- q]
                            pAtual = procurarIndice custo (minimum custo)
                            (qAtual, n, h) = q !! pAtual  
                            fs = obterFilhos (qAtual, n, h)
                            qExtensao = calcularHeuristica ([(q, n, h) | (q, n, h) <- fs, notElem q qVisitados]) s
                            qs = delete (qAtual, n, h) (union q qExtensao)
                            qsVisitados = union qVisitados [qAtual]

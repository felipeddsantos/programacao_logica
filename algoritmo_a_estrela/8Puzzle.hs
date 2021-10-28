{-

Programação Lógica - Solução do Jogo 8-Puzzle com Algoritmo A*
Felipe Daniel Dias dos Santos - 11711ECP004
Graduação em Engenharia de Computação - Faculdade de Engenharia Elétrica - Universidade Federal de Uberlândia

-}

import FuncoesAuxiliares
import Data.List
import Control.Monad

main :: IO()
main = do

    putStrLn "\n*****/////Solução do jogo 8-Puzzle com o algoritmo A*/////*****"
    putStrLn "\nOBS: o algarismo 0 indica a posição vazia do tabuleiro."
    putStrLn "\nInsira a configuração inicial do tabuleiro em sequência (Ex: 123456780):"
    q0 <- getLine
    
    when(not $ estadoValido q0) $ putStrLn "Estado inválido."
    when(not $ estadoValido q0) main
    
    putStrLn "\nInsira a configuração final do tabuleiro: "
    qf <- getLine
    
    when(not $ estadoValido qf) $ putStrLn "Estado inválido."
    when(not $ estadoValido qf) main
    
    let (s, i) = aEstrela [(q0, 0, 0)] qf [] 0
    
    when(length s == 1) $ print s
    when(length s == 1) main
    
    let c = obterCaminho s
    
    putStrLn "\nSequência de movimentos para alcançar a solução:\n"
    
    mapM_ putStrLn $ map (obterTabuleiro 0) c
    
    putStrLn "Quantidade de movimentos necessários para alcançar a solução:"
    print $ length (c) - 1
    
    putStrLn "\nQuantidade de iterações utilizadas pelo algortimo para encontrar a solução:"
    print $ i 
    putStr "\n"
    
    main

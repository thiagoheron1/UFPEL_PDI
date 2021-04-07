# Exemplo 1: Escreva um programa que calcula soma de todos os elementos da matriz A.
A = [1 2 3; 4 5 6; 7 8 9];
A = sum(A);
sum(A)

# Exemplo 2: Escreva um programa que calcula s oma de todos os elementos da diagonal da matriz A.
A = [1 2 3; 4 5 6; 7 8 9];
B = diag(A)
sum(B)

# Exemplo 3: Escreva um programa que extraia o elemento localizao na segunda linha e terceira coluna, isto é, o element (2,3);
A = [1 2 3; 4 5 6; 7 8 9]
A(2,3) 

# Exemplo 4: Escreva um programa que calcule a soma de todos os elementos na segunda linha da matriz B.
B = [1 2 3 4; 4 6 7 8; 9 10 11 12]
sum(B(2, :))

# Exemplo 5:

# Exemplo 6: Escreva um programa que deleta a última coluna da matriz A.
A = [1 2 3; 4 5 6; 7 8 9]
A(:, 3) = []

# Exemplo 7: Escreva um programa que delete as duas primeiras linhas da matriz A;
A = [1 2 3; 4 5 6; 7 8 9]
A(1:2, :) = []

# Exemplo 8:

# Exemplo 9: Escreva um programa que substitua todos os valores 5 na matriz A por valores 0
A = [1 2 3 4 5; 5 6 3 9 1; 9 5 3 1 5]
A(find(A==5)) = 0

# Exemplo 10: Escreva um programa que exiba a tabuada completa (tabela multiplicativa de 1 a 10) usando laços for. A resposta deve ser similar a esta:

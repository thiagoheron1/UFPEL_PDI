# Criação de Matrizes (Cada ; quebra linha)
A = [1  2 3; 4 5 6; 7 8 9] 

# Sum
sum(A)

# Transpoziação
A = [1 2 3; 4 5 6; 7 8 9];
B = A'

# Diagonal
diag(A)

# 2 Linha
# 3 Coluna
A(2,3)

# Operador Dois-Pontos (Cria um Vetor) inclusive:inclusive
fprintf('1:5'), 1:5
fprintf('1:2:5'), 1:2:5
fprintf('1:3:5'), 1:3:5
fprintf('50:10:150'), 50:10:150

B = [1 2 3 4; 4 6 7 8; 9 10 11 12]
B(1:3, 2) # Pega as três primeiras linhas, da segunda coluna

# Imagens
#I = imread('lena_color.bmp');
#figure, imshow(I);
#figure, imshow(I(:,:,1));
#figure, imshow(I(:,:,2));
#figure, imshow(I(:,:,3));
#I(:,:,2) = 0;
#figure, imshow(I);
#imwrite(I, 'lena_blue.png');
#I(:,:,3) = 0;
#figure, imshow(I);
#imwrite(I, 'lena_red.png');

# Imprime informações e tipos dos vetores
whos

# Geração Matrizes
zeros(2,3) # Matriz 2x3 preenchidas com valor 0
ones(2, 3) # Matriz 2x3 preenchidas com valor 1
4*ones(2,3) # Matriz 2x3 preenchidas com valor 4

# Concatenando Matrizes
A = ones(2,3);
A = zeros(4);
C = 2*ones(1,3); # 1x3 com valores 2
D = 3*ones(1,2); # 1x2 com valores 3
#E = [A B; C D] 

# Deletando Índices
A = [1 2 3; 4 5 6; 7 8 9]
A(2,:) = [] # N segunda linha, em todas as colunas deleta

# Aplicações de Álgebra Linear
A = [1 2 3; 4 5 6; 7 8 9]
det(A)
inv(A)
A'
A*B

#Função Find
A = [1 2 3 4 5; 5 6 3 9 1; 9 5 3 1 5]
find(A==5)

test = imread('test.png');
figure, imshow(test);



A = [1, 2; 3, 4]


b = zeros(4);
b


A  = [1:2; 3:4]

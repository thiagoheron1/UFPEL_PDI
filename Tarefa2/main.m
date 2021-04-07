# Leitura da Imagem
img = imread('lena_cinza.bmp');

# Leitura dos Inputs de Redimensionamento
number_resizes_axis_x = input("Número de Redimensionamentos no Eixo X: ");
number_resizes_axis_y = input("Número de Redimensionamento no Eixo Y: ");

# Leitura do Tipo de Interpolação
fprintf("Escolhe o Tipo de Interpolação: \n")
fprintf("--- 1: Interpolação por Vizinho Mais Próximo\n")
fprintf("--- 2: Interpolação Bilinear \n") 
type_interpolation = input("Opção: ");

# Chamando Redimensionar
image_resized = redimensionar(img, type_interpolation, number_resizes_axis_x, number_resizes_axis_y);

# Mostrando Imagem
figure, imshow(image_resized);

# Salvando Imagem
imwrite(image_resized, 'lena_cinza_resized.png');

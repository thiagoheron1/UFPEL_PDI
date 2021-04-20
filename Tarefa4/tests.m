# [Input]
filename = "images/input/lena_cinza.bmp";
imagem = imread(filename);
figure, imshow(imagem);

# [Realce]
W = [0, 1, 0; 1, -4, 1; 0, 1 , 0]; 
image_saida = convolucao(filename, W); 

# [Suaviza]
W = [1, 2, 1; 2, 4, 2; 1, 2, 1]; 
image_saida = convolucao(filename, W); 


img = imread('lena_cinza.bmp');

# [Interpolação Vizinho Mais Próximo] [Mesmo Tamanho]
#image_resized = redimensionar(img, 1, 1, 1); # [ Figura 1]
#figure, imshow(image_resized);

# [Interpolação Vizinho Mais Próximo] [Aumentando a Imagem]
#image_resized = redimensionar(img, 1, 2, 1); # [ Figura 2]
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 1, 3, 1); # [ Figura 3]
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 1, 1, 2); # [ Figura 4]
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 1, 1, 3); # [ Figura 5]
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 1, 2, 2); # [ Figura 6]
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 1, 3, 3); # [ Figura 7]
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 1, 4, 2); # [ Figura 8]
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 1, 2, 4); # [ Figura 9]
#figure, imshow(image_resized);

# [Interpolação Vizinho Mais Próximo] [Diminuindo a Imagem]
#image_resized = redimensionar(img, 1, 0.5, 1); # [ Figura 10]
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 1, 1, 0.5); # [ Figura 11]
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 1, 0.5, 0.5); # [ Figura 12]
#figure, imshow(image_resized);

# [Interpolação Vizinho Mais Próximo] [Aumentando um Eixo e Diminuindo outro Eixo]
image_resized = redimensionar(img, 1, 0.5, 2);
figure, imshow(image_resized);
#image_resized = redimensionar(img, 1, 2, 0.5);
#figure, imshow(image_resized);

# [Interpolação Bilienear] [Aumentando a Imagem]
#image_resized = redimensionar(img, 2, 2, 1);
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 2, 3, 1);
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 2, 1, 2);
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 2, 1, 3);
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 2, 2, 2);
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 2, 3, 3);
#figure, imshow(image_resized);

# [Interpolação Bilienear] [Diminuindo a Imagem]
#image_resized = redimensionar(img, 2, 0.5, 1);
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 2, 1, 0.5);
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 2, 0.5, 0.5);
#figure, imshow(image_resized);

# [Interpolação Bilienear] [Aumentando em um Eixo e Diminuindo em outro Eixo a Imagem]
#image_resized = redimensionar(img, 2, 2, 0.5);
#figure, imshow(image_resized);
#image_resized = redimensionar(img, 2, 0.5, 2);
#figure, imshow(image_resized);

I = imread("images/input/lena_cinza.bmp");

I1 = imnoise(I, "gaussian", 0, 0.01);
imshow(I1); title("Ruído Gaussiano, 0, 0.01");

I2 = imnoise(I, "gaussian", 0.30, 0.01);
imshow(I2); title("Ruído Gaussiano, .30, 0.01");

I3 = imnoise(I, "gaussian", 0.50, 0.05);
imshow(I3); title("Ruído Gaussiano, .50, 0.05");

I4 = imnoise(I, "poisson");
imshow(I4); title("Ruído com Distribuição de Poisson");

I5 = imnoise(I, "salt & pepper", 2/100);
imshow(I5); title("Ruído Sal-e-Pimenta 2%");

I6 = imnoise(I, "salt & pepper", 10/100);
imshow(I6); title("Ruído Sal-e-Pimenta 10%");
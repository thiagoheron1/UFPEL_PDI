I = imread('images/input/lena_cinza.bmp');

W1 = [0 1 0; 1 -4 1; 0 1 0];
W2 = 1/16 * [1, 2, 1; 2, 4, 2; 1, 2, 1];
W3 = 1/44 * [0, 0, -4, 0, 0; 0, 0, 10, 0, 0; -4, 10, 20, 10, -4; 0, 0, 10, 0, 0; 0, 0, -4, 0, 0];

resultW1 = filter2(W1, I);
resultW2 = filter2(W2, I);
resultW3= filter2(W3, I);

figure, imshow(uint8(resultW1));
figure, imshow(uint8(resultW2));
figure, imshow(uint8(resultW3));

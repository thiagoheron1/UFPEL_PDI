function result = fourier(pathImage)

         imageInput = imread(pathImage);
         
         imageTransformed = fft2(imageInput);
         imageShifted = fftshift(imageTransformed);
         imageIshifted = ifftshift(imageShifted);
         imageTransformedInverse = ifft2(imageIshifted);

         figure, imshow(uint8(imageInput));
         title("Imagem Original");
         subplot(2,2,1)
         imshow(log(abs(imageTransformed)), []);
         title("Transformada de Fourier");
         
         subplot(2,2,2)
         imshow(log(abs(imageShifted)), []);
         title("Frequência Zero no Centro");
         
         subplot(2,2,3)
         imshow(log(abs(imageIshifted)), []);
         title("Inversa da Centralizada");
         
         subplot(2,2,4)
         imshow(imageTransformedInverse, []);
         title("Transformada de Fourier Inversa");

         return;
endfunction

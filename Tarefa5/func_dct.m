function result = func_dct(pathImage)

          imageInput = imread(pathImage);
          figure, imshow(imageInput);
          title("Imagem Original");

          imageDCT = dct2(imageInput);
          figure, imshow(uint8(imageTransform), [ ]);
          title("DCT");
          
          imageIDCT = idct2(imageDCT);
          figure, imshow(uint8(imageIDCT), [ ]);
          title("IDCT");

         return;
endfunction

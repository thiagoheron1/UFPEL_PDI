function result = Quantiza(entrada, saida, bitsY, bitsCb, bitsCr)
  imageInput = imread(entrada);

  YCbCr = rgb2ycbcr(imageInput);

  Y = YCbCr(:, :, 1);
  Cb = YCbCr(:, :, 2);
  Cr = YCbCr(:, :, 3);

  QY = (Y.*bitsY);
  QCb = (Cb.*bitsCb);
  QCr = (Cr.*bitsCr);

  imageQuantizada(:, :, 1) = QY;
  imageQuantizada(:, :, 2) = QCb;
  imageQuantizada(:, :, 3) = QCr;

  result = ycbcr2rgb(imageQuantizada)

  figure,imshow(imageInput); title("Image RGB");
  figure,imshow(YCbCr); title("Image YCbCr");

  imwrite(YCbCr, saida);
  
  return;
endfunction
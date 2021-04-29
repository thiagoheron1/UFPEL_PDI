function imagem_saida = convolucao(imagem, W);
         imagem = imread(imagem);
         maskFilter = zeros(3, 3);

         axisY = 1;
         axisX = 2;
         sizeImage = size(imagem);
         sizeImageConvolucao = zeros(int32(sizeImage(axisY)), int32(sizeImage(axisX)));
         sizeImageAxisY = sizeImage(axisY);
         sizeImageAxisX = sizeImage(axisX);

         for y = 1:sizeImageAxisY;
                  for x = 1:sizeImageAxisX;
                           maskFilter(1, 1) = imagem(y,x);
                           if(x+1 < sizeImageAxisX)
                                    maskFilter(1, 2) = imagem(y,x+1);
                           endif
                           if(x+2 < sizeImageAxisX)
                                    maskFilter(1, 3) = imagem(y,x+2);
                           endif
                           if(y+1 < sizeImageAxisY)
                                    maskFilter(2, 1) = imagem(y+1,x);
                           endif
                           if(y+2 < sizeImageAxisY)
                                    maskFilter(3, 1) = imagem(y+2,x);
                           endif
                           if( y+1 < sizeImageAxisY && x+1 < sizeImageAxisX) 
                                    maskFilter(2, 2) = imagem(y+1,x+1);
                           endif
                           if(y+1 < sizeImageAxisY && x+2 < sizeImageAxisX)
                                    maskFilter(2, 3) = imagem(y+1,x+2);
                           endif
                           if(y+2 < sizeImageAxisY && x+1 < sizeImageAxisX)
                                    maskFilter(3, 2) = imagem(y+2,x+1);
                           endif
                           if(y+2 < sizeImageAxisY && x+2 < sizeImageAxisX) 
                                    maskFilter(3, 3) = imagem(y+2,x+2);
                           endif
                           
                           matriz_result = maskFilter .* W;
                           A = sum(matriz_result);
                           A = sum(A');
                           
                           sumW = sum(sum(W));
                           if sumW > 0
                                    A = A/sumW;
                           elseif
                                    A = (imagem(y, x) - A);
                           endif
                           sizeImageConvolucao(y, x) = A;
                  endfor
           endfor

           sizeImageConvolucao = uint8(sizeImageConvolucao);
           figure, imshow(sizeImageConvolucao);
           imwrite(sizeImageConvolucao, 'images/output/imagem_saida.png');
           imagem_saida = "images/output/imagem_saida.png"
           return;
endfunction

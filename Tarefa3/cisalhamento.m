function cisalhada = cisalhamento(imagem, cv, ch)
         imagem = imread(imagem);
         
         axisW= 1;
         axisV = 2;

         sizeImage = size(imagem)
         sizeImageAxisW = sizeImage(axisW)
         sizeImageAxisV = sizeImage(axisV)

         imageCorrected = uint8(-1 * ones(sizeImageAxisW, sizeImageAxisV));

         if cv > 0 && ch ==0
                  for w =1:sizeImageAxisW;
                           for v =1:sizeImageAxisV;
                                    x =  floor(v + cv * w);
                                    y = w;

                                    if (x <= sizeImageAxisV && y <= sizeImageAxisW)
                                             imageCorrected(y, x) = imagem(w, v);
                                    endif
                           endfor
                  endfor

         elseif ch > 0 && cv == 0
                  for w =1:sizeImageAxisW;
                           for v =1:sizeImageAxisV;
                                    x =  v;
                                    y = floor(ch * v + w);
                                    if (x <= sizeImageAxisV && y <= sizeImageAxisW)
                                             imageCorrected(y, x) = imagem(w, v);
                                    endif
                           endfor
                  endfor
         
         
         else
                  for w =1:sizeImageAxisW;
                           for v =1:sizeImageAxisV;
                                    x =  floor(v + cv * w);
                                    y = floor(ch * v + w);
                                    if (x <= sizeImageAxisV && y <= sizeImageAxisW)
                                             imageCorrected(y, x) = imagem(w, v);
                                    endif
                           endfor
                  endfor
         
         endif 
         cisalhada = imageCorrected;
endfunction
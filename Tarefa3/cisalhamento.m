function cisalhada = cisalhamento(imagem, cv, ch)
                                
         axisW= 1;
         axisV = 2;
    
         sizeImage = size(imagem)
         sizeImageAxisW = sizeImage(axisW)
         sizeImageAxisV = sizeImage(axisV)

                  
         imageCorrected = uint8(-1 * ones(sizeImageAxisW, sizeImageAxisV));
         
         if cv > 0
                  for w =1:sizeImageAxisW;
                           for v =1:sizeImageAxisV;
                                    x =  int32(v + cv * w);
                                    y = w;
                                    
                                    if (x <= sizeImageAxisV && y <= sizeImageAxisW)

                                             imageCorrected(x, y) = imagem(v, w);

                                    endif
                           endfor
                  endfor
         endif
         
         if ch > 0
                  for w =1:sizeImageAxisW;
                           for v =1:sizeImageAxisV;
                                    x =  v;
                                    y = int32(ch * v + w);
                                    
                                    if (x <= sizeImageAxisV && y <= sizeImageAxisW)

                                             imageCorrected(x, y) = imagem(v, w);

                                    endif
                           endfor
                  endfor
         endif

                  
         cisalhada = imageCorrected;
         
endfunction
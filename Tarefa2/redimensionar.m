function arquivo2 = redimensionar(arquivo1, tipo, num1, num2)

    INTERPOLACAO_VIZINHO_MAIS_PROXIMO = 1;
    INTERPOLACAO_BILINEAR = 2;
    
    axisY = 1;
    axisX = 2;
    axisV = 1;
    axisU = 2;

    resizeX = num1;
    resizeY = num2;
         
    fixIndexMatrix = 1;
         
    imageOriginal = arquivo1;
    sizeImageOriginal = size(imageOriginal);
    sizeImageOriginalAxisY = sizeImageOriginal(axisY)
    sizeImageOriginalAxisX = sizeImageOriginal(axisX)
    
    imageResized = zeros( int32(resizeY * sizeImageOriginalAxisY), int32(resizeX * sizeImageOriginalAxisX));
    sizeImageResized = size(imageResized);
    sizeImageResizedAxisV = sizeImageResized(axisV)
    sizeImageResizedAxisU = sizeImageResized(axisU)
    

    if (tipo == INTERPOLACAO_VIZINHO_MAIS_PROXIMO)

        # [Aumentando]
        if (resizeX >= 1 && resizeY >= 1)
            imageResized(1:resizeY:sizeImageResizedAxisV, 1:resizeX:sizeImageResizedAxisU) = arquivo1(:, :);
            for v = 1:resizeY:sizeImageResizedAxisV
                for u = 1:resizeX:sizeImageResizedAxisU
                    for expand_v = 0:resizeY-1
                        for expand_u = 0:resizeX-1
                            imageResized(v + expand_v, u + expand_u) = imageResized(v, u);
                        endfor
                    endfor
                endfor
            endfor

        # [Diminuindo]
        elseif (resizeX <= 1 && resizeY <= 1)
            offsetX = sizeImageOriginalAxisX / sizeImageResizedAxisU
            offsetY = sizeImageOriginalAxisY / sizeImageResizedAxisV
            
            imageResized(:, :) = arquivo1(1:offsetY:sizeImageOriginalAxisY, 1:offsetX:sizeImageOriginalAxisX);
        endif

    elseif (tipo == INTERPOLACAO_BILINEAR)

             # Criando uma Linha/Coluna a mais
            imageOriginalLineColumn = zeros(sizeImageOriginalAxisY+1, sizeImageOriginalAxisX+1);
            imageOriginalLineColumn(1:sizeImageOriginalAxisY, 1:sizeImageOriginalAxisX) = imageOriginal(:, :);
            imageOriginalLineColumn(sizeImageOriginalAxisY+1, :) = imageOriginalLineColumn(sizeImageOriginalAxisY, :);
            imageOriginalLineColumn(:, sizeImageOriginalAxisX+1) = imageOriginalLineColumn(:, sizeImageOriginalAxisX);

         for posV = 0:sizeImageResizedAxisV-1
                 for posU = 0:sizeImageResizedAxisU-1
                          
                 if (mod(posU, resizeX) > 0)
                          tx = (posU / resizeX ) - floor(posU / resizeX );
                 else
                          tx = 0;
                 endif 

                 if (mod(posV, resizeY) > 0)  
                          ty = (posV / resizeY) - floor(posV / resizeY );
                 else
                          ty = 0;
                 endif
                 R = floor(posU / resizeX)  + fixIndexMatrix;
                 S = ceil(posU / resizeX) + fixIndexMatrix;
                 if S == R
                        S = S+1;
                 endif
                 UP = floor(posV / resizeY)  + fixIndexMatrix;
                 DOWN = UP + 1;
                  
                 Q1 = double(tx * imageOriginalLineColumn(UP, S)          +   (1-tx) * imageOriginalLineColumn(UP, R));
                 Q2 = double(tx * imageOriginalLineColumn(DOWN, S)    +  (1-tx) * imageOriginalLineColumn(DOWN, R));
                 P = double((1-ty) * Q1 + (ty) * Q2);
                 imageResized(posV+1,  posU+1) = P;

                 endfor
           endfor

    endif

    arquivo2 = uint8(imageResized);
    return

endfunction

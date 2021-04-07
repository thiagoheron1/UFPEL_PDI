function arquivo2 = redimensionar(arquivo1, tipo, num1, num2)

    INTERPOLACAO_VIZINHO_MAIS_PROXIMO = 1
    INTERPOLACAO_BILINEAR = 2    
    axisX = 1
    axisY = 2
    axisU = 1
    axisV = 2
    resizeX = num1
    resizeY = num2

    imageOriginal = arquivo1;
    sizeImageOriginal = size(imageOriginal);
    sizeImageOriginalAxisX = sizeImageOriginal(axisX)
    sizeImageOriginalAxisY = sizeImageOriginal(axisY)

    imageResized = zeros( int32(resizeX * sizeImageOriginalAxisX), int32(resizeY * sizeImageOriginalAxisY));
    sizeImageResized = size(imageResized);
    sizeImageResizedAxisU = sizeImageResized(axisU)
    sizeImageResizedAxisV = sizeImageResized(axisV)

    if (tipo == INTERPOLACAO_VIZINHO_MAIS_PROXIMO)

        # [Aumentando]
        if (resizeX >= 1 && resizeY >= 1)
            # Falar sobre a Ampliação aqui
            imageResized(1:resizeX:sizeImageResizedAxisU, 1:resizeY:sizeImageResizedAxisV) = arquivo1(:, :);
            for u = 1:resizeX:sizeImageResizedAxisU
                for v = 1:resizeY:sizeImageResizedAxisV
                    for expand_u = 0:resizeX-1
                        for expand_v = 0:resizeY-1
                            imageResized(u + expand_u, v + expand_v) = imageResized(u, v);
                        endfor
                    endfor
                endfor
            endfor

        # [Diminuindo]
        elseif (resizeX <= 1 && resizeY <= 1)
            offsetX = sizeImageOriginalAxisX / sizeImageResizedAxisU
            offsetY = sizeImageOriginalAxisY / sizeImageResizedAxisV
            # Falar sobre a Redução aqui
            imageResized(:, :) = arquivo1(1:offsetX:sizeImageOriginalAxisX, 1:offsetY:sizeImageOriginalAxisY);
        endif

    elseif (tipo == INTERPOLACAO_BILINEAR)

        # [Aumentando]
        for pos_x = 0:sizeImageOriginalAxisX-1:
            for pos_y = 0:sizeImageOriginalAxisY-1:
                  tx = pos_y + (pos_y + num2-1) / 2
                  
            endfor
        endfor
        
        # Matriz Duplicando Linha e Coluna
        imageOriginalLineColumn = zeros(sizeImageOriginalAxisX, sizeImageOriginalAxisY);
        imageOriginalLineColumn(1:sizeImageOriginalAxisX, 1:sizeImageOriginalAxisY) = imageOriginal(:, :)
        

        
        for u = 1:resizeX:sizeImageResizedAxisU
            for v = 1:resizeY:sizeImageResizedAxisV
                  tx = u-1 / num1
                  ty = v-1 / num2
                  Q1 = tx * imageOriginal(1,1)  + (1-tx) * imageOriginal(1,2)
                  Q2 = tx * imageOriginal(2,1)  + (1-tx) * imageOriginal(2, 2)
                  P = ty * Q1 + (1-ty) * Q2 
            endfor
        endfor

        


        # P(x, y) = aR + bS + cT + dU
        # O 'P' é dado pelo um PESO entre Q1 e Q2
        # Q1 é dado pela distância TX, quanto maior TX maior o peso S, quanto menor mais proximo de R: R ---tx--- S
        # Multiplicação no Eixo Horizontal 
        # Logo, Q1 = tx * S  + (1-tx)* R  
        # Logo, Q2 = tx * T  + (1-tx)* U  
        # Com isso vamos ter R Q1 S
        #                    X XX X
        #                    T Q2 U
        # P é uma relação entre Q1 e Q2, então:
        # P = ty*Q1 + (1-ty) * Q2
        # TX no meio é 0.5
        # o TX vai ser definido pela distância entre o pixel da matriz maior/menor em relação a original, pega o pixel da matriz maior e divide por num1/num2 e tu tem o tx.

       
        
    endif
        




    arquivo2 = uint8(imageResized);
    return


endfunction

function corrigida = corr_gama(imagem, c, gama);

         axisY = 1;
         axisX = 2;

         sizeImage = size(imagem);
         sizeImageAxisY = sizeImage(axisY);
         sizeImageAxisX = sizeImage(axisX);

         imageCorrected = uint8(-1 * ones(sizeImageAxisY, sizeImageAxisX));

         r = double(imagem)/double((max(max(max(imagem)))));
         imageCorrected = c.*(r.^gama);

         corrigida = imageCorrected;
         return
endfunction
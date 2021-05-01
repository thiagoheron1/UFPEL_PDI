function img_filtrada = filtra_freq(imagem, mascara)
  raio = 50;
  raio_1 = 25;
  raio_2 = 15;

  PASSA_ALTA = 1;
  PASSA_BAIXA = 2;
  ELIMINA_BORDAS_VERTIFICAIS = 3;
  REJEITA_FAIXA = 4;
  PASSA_FAIXA = 5;

  imageDominioEspacial = imread(imagem);
  imageT = fft2(imageDominioEspacial);
  imageST = fftshift(imageT);

  subplot(2, 3, 1)
  imshow(imageDominioEspacial); title('Domínio Espacial');

  subplot(2, 3, 2)
  imshow(log(abs(imageT)), []); title('Domínio de Fourier');

  subplot(2, 3, 3)
  imshow(log(abs(imageST)), []); title('Frequencia Zero no Centro');
  imwrite(imageST, 'images/output/lena_cinza_fourier.png');

  if (mascara == PASSA_ALTA)
    padrao_circular = [];
    for I = 0:2*raio;
      for J = 0:2*raio;
        padrao_circular(I+1,J+1) = (double((I-raio).^2+(J-raio).^2>raio^2));
      end
    end

    mascara_apply = ones(size(imageST,1), size(imageST,2));
    mascara_apply(size(imageST,1)/2-raio:size(imageST,1)/2+raio, size(imageST,2)/2-raio:size(imageST,2)/2+raio) = padrao_circular; 

  elseif (mascara == PASSA_BAIXA)
    padrao_circular = [];
    for I = 0:2*raio
      for J = 0:2*raio
        padrao_circular(I+1,J+1) = (double((I-raio).^2+(J-raio).^2<=raio^2));
      end
    end

    mascara_apply = zeros(size(imageST,1), size(imageST,2));
    mascara_apply(size(imageST,1)/2-raio:size(imageST,1)/2+raio, size(imageST,2)/2-raio:size(imageST,2)/2+raio) = padrao_circular; 

  elseif (mascara == ELIMINA_BORDAS_VERTIFICAIS)
      padrao_circular = [];
      for I = 0:2*raio;
        for J = 0:2*raio;
          padrao_circular(I+1,J+1) = (double((I-raio).^2+(J-raio).^2<=raio^2));
        end
      end

      mascara_apply = ones(size(imageT,1), size(imageT,2));

      k=[];
      k=size(imageST,1)/2-raio:size(imageST,1)/2+raio;
      linhaInicial = k(1);
      linhaFinal = k(1) + size(k,2) - 1;

      for i=linhaInicial:linhaFinal
        for j = 1: size(mascara_apply,2);
              mascara_apply(i,j) = 0;
          endfor
      endfor


      mascara_apply(size(imageST,1)/2-raio:size(imageST,1)/2+raio, size(imageST,2)/2-raio:size(imageST,2)/2+raio) = padrao_circular; 

  elseif (mascara == PASSA_FAIXA)

    padrao_circular_1 = [];
    for I = 0:2*raio_1
      for J = 0:2*raio_1
        padrao_circular_1(I+1,J+1) = (double((I-raio_1).^2+(J-raio_1).^2>raio_1^2));
      end
    end
    
    padrao_circular_2 = [];
    for I = 0:2*raio_2
      for J = 0:2*raio_2
        padrao_circular_2(I+1,J+1) = (double((I-raio_2).^2+(J-raio_2).^2<=raio_2^2));
      end
    end

    mascara_apply = ones(size(imageST,1), size(imageST,2));
    mascara_apply(size(imageST,1)/2-raio_1:size(imageST,1)/2+raio_1, size(imageST,2)/2-raio_1:size(imageST,2)/2+raio_1) = padrao_circular_1; 
    mascara_apply(size(imageST,1)/2-raio_2:size(imageST,1)/2+raio_2, size(imageST,2)/2-raio_2:size(imageST,2)/2+raio_2) = padrao_circular_2; 

  elseif (mascara == REJEITA_FAIXA)

    padrao_circular_1 = [];
    for I = 0:2*raio_1
      for J = 0:2*raio_1
        padrao_circular_1(I+1,J+1) = (double((I-raio_1).^2+(J-raio_1).^2<=raio_1^2));
      end
    end
    
    padrao_circular_2 = [];
    for I = 0:2*raio_2
      for J = 0:2*raio_2
        padrao_circular_2(I+1,J+1) = (double((I-raio_2).^2+(J-raio_2).^2>raio_2^2));
      end
    end

    mascara_apply = zeros(size(imageST,1), size(imageST,2));
    mascara_apply(size(imageST,1)/2-raio_1:size(imageST,1)/2+raio_1, size(imageST,2)/2-raio_1:size(imageST,2)/2+raio_1) = padrao_circular_1; 
    mascara_apply(size(imageST,1)/2-raio_2:size(imageST,1)/2+raio_2, size(imageST,2)/2-raio_2:size(imageST,2)/2+raio_2) = padrao_circular_2; 
  endif

  # Mascara
  subplot(2, 3, 4)
  imshow(mascara_apply, []); title('Mascara');

  # Reconstrua a imagem filtrada
  #subplot(2, 3, 5)
  imageFiltrada = imageST.*mascara_apply;
  #imshow(log(abs(imageFiltrada)), []); title('Mascara * Dominio');

  # Coloque o espectro novamente na posição original com  ifftshift
  subplot(2, 3, 6)
  I2 = ifft2(ifftshift(imageFiltrada));
  figure, imshow(I2,[]); title('TIF .* Mascara')

  return;
endfunction
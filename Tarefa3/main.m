# Selecionando Imagem
fprintf("[Opções de Carregamento de Imagem]\n");
fprintf("---------------------------------\n");
fprintf("0 - Digite o Nome da Imagem\n");
fprintf("1 - Imagem texto_xerox.jpg\n");
fprintf("2 - Imagem lena_sal_e_pimenta.jpg\n");
fprintf("3 - Imagem lena_cinza.bmp\n");
fprintf("4 - Imagem Fig0241_conv.png\n");
fprintf("5 - Imagem barbara_gray.bmp\n");
numberSelectImage = input("Digite a Opção da Imagem: ");
switch numberSelectImage
         case 0 
                  nameImage = input("Digite Nome da Imagem: ");
         case 1
                  nameImage = 'images/input/texto_xerox.jpg'
         case 2
                  nameImage = 'images/input/lena_sal_e_pimenta.jpg'
         case 3
                  nameImage = 'images/input/lena_cinza.bmp'
         case 4
                  nameImage = 'images/input/Fig0241_conv.png'
         case 5
                  nameImage = 'images/input/barbara_gray.bmp'
         otherwise
                  fprintf("Opção Inválida");
endswitch

# Lendo Operação de Transformação
fprintf("Escolha a Operação: \n");
fprintf("1 - Transformação de Intensidade - Correção Gama (Transformação de Potência)\n");
fprintf("2 - Transformação Geométrica - Cisalhamento (Vertifical/Horizontal)\n");
numberOperation = input("Digite o Número da Operação: ");

# Chamando Operação
if numberOperation == 1
         paramC = input("Digite o Parâmetro c: ")
         paramGama = input("Digite o Parâmetro gama(γ): ")
         outputImage = corr_gama(nameImage, paramC, paramGama);

elseif numberOperation == 2
         paramCV = input("Digite o Parâmetro Cisalhamento Vertical (cv): ")
         paramCH = input("Digite o Parâmetro Cisalhamento Horizontal (ch): ")
         outputImage = cisalhamento(nameImage, paramCV, paramCH);

endif

# Salvando a Imagem
if numberOperation == 1 || numberOperation == 2
         figure, imshow(outputImage);
         imwrite(outputImage, 'images/output/image_result.png');
         'images/output/image_result.png'
endif


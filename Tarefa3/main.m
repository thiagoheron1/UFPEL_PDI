# Selecionando Imagem
fprintf("[Opções de Carregamento de Imagem]\n");
fprintf("---------------------------------\n");
fprintf("0 - Digite o Nome da Imagem\n");
fprintf("1 - Imagem texto_xerox.jpg\n");
fprintf("2 - Imagem lena.jpg\n");
fprintf("3 - Imagem lena_sal_e_pimenta.jpg\n");
fprintf("4 - Imagem lena_cinza.bmp\n");
fprintf("5 - Imagem Fig0241.tif\n");
fprintf("6 - Imagem Fig0241_conv.png\n");
fprintf("7 - Imagem Fig0232a.tif\n");
fprintf("8 - Imagem Fig0228b.png\n");
fprintf("9 - Imagem cameraman.tif\n")
fprintf("10 - Imagem barbara_gray.tif\n");
numberSelectImage = input("Digite a Opção da Imagem: ");

switch numberSelectImage
         case 0 
                  numberSelectImage = input("Digite Nome da Imagem: ");
                  inputImage = imread(numberSelectImage);
         case 1
                  inputImage = imread('images/texto_xerox.jpg');
         case 2
                  inputImage = imread('images/lena.png');
         case 3
                  inputImage = imread('images/lena_sal_e_pimenta.jpg');
         case 4
                  inputImage = imread('images/lena_cinza.bmp');
         case 5
                  inputImage = imread('images/Fig0241.tif');
         case 6
                  inputImage = imread('images/Fig0241_conv.png');
         case 7
                  inputImage = imread('images/Fig0232a.tif');
         case 8
                  inputImage = imread('images/Fig0228b.png');
         case 9
                  inputImage = imread('images/cameraman.tif');
         case 10
                  inputImage = imread('images/barbara_gray.bmp');
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
         outputImage = corr_gama(inputImage, paramC, paramGama);

elseif numberOperation == 2
         paramCV = input("Digite o Parâmetro Cisalhamento Vertical (cv): ")
         paramCH = input("Digite o Parâmetro Cisalhamento Horizontal (ch): ")
         outputImage = cisalhamento(inputImage, paramCV, paramCH);

endif

if numberOperation == 1 || numberOperation == 2
         figure, imshow(outputImage);
         imwrite(outputImage, 'images_result/image_result.png');
endif

# Lendo Operação
fprintf("Escolha a Operação: \n")
fprintf("1 - Transformação de Intensidade - Correção Gama (Transformação de Potência)\n")
fprintf("2 - Transformação Geométrica - Cisalhamento\n")
numberOperation = input("Digite o Número da Operação: ")

# Lendo Imagem
# nameImage = input("Digite o Nome da Imagem: ")
nameImage = 'images/barbara_gray.bmp'
img = imread(nameImage);

# Chamando Operação
if numberOperation == 1
         paramC = input("Digite o Parâmetro c: ")
         param_gama = input("Digite o Parâmetro gama(γ): ")
         outputImage = corr_gama(img, paramC, param_gama);
         figure, imshow(outputImage);
         imwrite(outputImage, 'image_result.png');


elseif numberOperation == 2
         paramCV = input("Digite o Parâmetro Cisalhamento Vertical (cv): ")
         paramCH = input("Digite o Parâmetro Cisalhamento Horizontal (ch): ")
         outputImage = cisalhamento(img, paramCV, paramCH);
         figure, imshow(outputImage);
         imwrite(outputImage, 'image_result.png');
else
         fprintf("Operação Invaĺida!\n")
        
endif


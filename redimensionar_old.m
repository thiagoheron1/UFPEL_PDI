function arquivo2 = redimensionar_old(arquivo1, tipo, num1, num2)
         # Variáveis de Controle
         axisX = 1;
         axisY = 2;
         INTERPOLACAO_VIZINHO_MAIS_PROXIMO = 1;
         INTERPOLACAO_BILENEAR = 2;
         
         # Show informações
         display("Tipo de Interpolação: "), tipo
         display("Número de Expansões no Eixo X: "), num1
         display("Número de Expansões no Eixo Y: "), num2

         # Tamanho do Arquivo 1
         size_arquivo1 = size(arquivo1);
         display("Tamanho do Eixo X do Arquivo 1: "), size_arquivo1(axisX)
         display("Tamanho do Eixo Y do Arquivo 1: "), size_arquivo1(axisY)

         # Tamanho do Arquivo 2
         arquivo2 = (-1) * ones(int32( num1 * size_arquivo1(axisX)), int32(num2 * size_arquivo1(axisY)));
         size_arquivo2 = size(arquivo2);
         size_arquivo2_axis_x = int32(size_arquivo1(1)*num1);
          size_arquivo2_axis_y = int32(size_arquivo1(2)*num2);
         display("Tamanho do Eixo X do Arquivo 2: "), size_arquivo2(axisX)
         display("Tamanho do Eixo Y do Arquivo 2: "), size_arquivo2(axisY)

         # Executando Interpolações
         if (tipo == INTERPOLACAO_VIZINHO_MAIS_PROXIMO)
                  display("Inicializando Interpolacao por Vizinho Mais Pŕoximo")
                  
                  # Aumentando a Imagem
                  if (num1 >= 1 && num2 >= 1)
                           for x = 1: size_arquivo1(axisX)
                              for y = 1:size_arquivo1(axisY)
                                  for fill_x = x * num1 - num1+1 :  x * num1 
                                      for fill_y = y * num2 - num2+1 :  y * num2 
                                          arquivo2(fill_x, fill_y)  = arquivo1(x, y);
                                      endfor
                                 endfor
                              endfor
                           endfor
                  # Diminuindo/Mantendo a Imagem
                   else
                           for x = 1: size_arquivo2(axisX)
                               for y = 1:size_arquivo2(axisY)
                                        new_x = int32(x/num1);
                                        new_y = int32(y/num2);
                                        arquivo2(x, y) = arquivo1(new_x, new_y);
                                endfor
                            endfor
                    endif  
          elseif  (tipo == INTERPOLACAO_BILENEAR)
                    display("Inicializando Interpolacao Bilinear")
                    
                    # Preenchendo a Matriz
                    for x = 1:size_arquivo2_axis_x
                             for y = 1:size_arquivo2_axis_y
                                      if (mod(x, num1) == 0 && mod(y, num2) == 0)
                                               new_x = int32(x/num1);
                                               new_y = int32(y/num2);
                                               arquivo2(x, y) = arquivo1(new_x, new_y);
                                      endif
                              endfor
                    endfor
          
          else
                     display("Opção Inválida! Você Digitou o Número:  "), tipo
          endif
          
          arquivo2 = uint8(arquivo2);
          return
                  
endfunction
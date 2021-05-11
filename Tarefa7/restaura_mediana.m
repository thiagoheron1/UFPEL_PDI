function figura_out = restaura_mediana(figura_in, N)
  imageInput = imread(figura_in);
  
  limitY = size(imageInput)(1);
  limitX = size(imageInput)(2);
  result = zeros(limitY, limitX);
  temp = 0;
  counter = 1;
  
  for y = 1:limitY
    for x = 1:limitX
      
      if(y<limitY-N && x<limitX-N)
        
        for Y = y:y+N
          for X = x:x+N
            if(Y>=1 && Y<limitY && x>=1 && X<limitX)
              temp(counter) = imageInput(Y, X);
              counter += 1;
            endif
          
          endfor
        endfor
      result(y, x) = median(temp);
      %temp = 0;
      counter = 1;
      endif
    endfor
  endfor
  
  result = uint8(result);
  figure, imshow(result); title("Restaura Mediana");
  imwrite(result, "/output/image_restaura_mediana.png"); 
  "/output/lena_sal_e_pimenta_restaura_mediana.png";
  return;
endfunction
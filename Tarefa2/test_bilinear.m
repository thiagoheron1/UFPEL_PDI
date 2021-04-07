# Mockando Valores
axisY = 1;
axisV = 1;
axisU = 2;
axisX = 2;
resizeX = 1;
resizeY = 2;
fixIndexMatrix = 1;

imageOriginal  = [1:3; 3:5; 6:8];
sizeImageOriginal = size(imageOriginal);
sizeImageOriginalAxisY = sizeImageOriginal(axisY)
sizeImageOriginalAxisX = sizeImageOriginal(axisX)

imageResized = zeros( int32(resizeY * sizeImageOriginalAxisY), int32(resizeX * sizeImageOriginalAxisX));
sizeImageResized = size(imageResized);
sizeImageResizedAxisV = sizeImageResized(axisV)
sizeImageResizedAxisU = sizeImageResized(axisU)

# Criando uma Linha/Coluna a mais
imageOriginalLineColumn = zeros(sizeImageOriginalAxisY+1, sizeImageOriginalAxisX+1);
imageOriginalLineColumn(1:sizeImageOriginalAxisY, 1:sizeImageOriginalAxisX) = imageOriginal(:, :);
imageOriginalLineColumn(sizeImageOriginalAxisY+1, :) = imageOriginalLineColumn(sizeImageOriginalAxisY, :);
imageOriginalLineColumn(:, sizeImageOriginalAxisX+1) = imageOriginalLineColumn(:, sizeImageOriginalAxisX);


for posV = 0:sizeImageResizedAxisV-1
         for posU = 0:sizeImageResizedAxisU-1
                  display("V"), posV+1
                  display("U"), posU+1
                 
                 if (mod(posU, resizeX) > 0)
                          tx = (posU / resizeX ) - floor(posU / resizeX )
                 else
                          tx = 0
                 endif 

                 if (mod(posV, resizeY) > 0)  
                          ty = (posV / resizeY) - floor(posV / resizeY );
                 else
                          ty = 0
                 endif
                 R = floor(posU / resizeX)  + fixIndexMatrix
                 S = ceil(posU / resizeX) + fixIndexMatrix
                 if S == R
                        S = S+1
                 endif
                 UP = floor(posV / resizeY)  + fixIndexMatrix
                 DOWN = UP + 1
                  
                  display("UP LEFT"), imageOriginalLineColumn(UP, R) 
                  display("UP RIGHT"), imageOriginalLineColumn(UP, S) 
                  display("DOWN LEFT"), imageOriginalLineColumn(DOWN, R) 
                  display("DOWN RIGHT"), imageOriginalLineColumn(DOWN, S) 
                  
                 Q1 = double(tx * imageOriginalLineColumn(UP, S)          +   (1-tx) * imageOriginalLineColumn(UP, R))
                 Q2 = double(tx * imageOriginalLineColumn(DOWN, S)    +  (1-tx) * imageOriginalLineColumn(DOWN, R))
                 P = double((1-ty) * Q1 + (ty) * Q2)
                 imageResized(posV+1,  posU+1) = P;
                  display('---------------')
                  
endfor
endfor
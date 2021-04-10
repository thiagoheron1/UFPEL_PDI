#A = [1 1 1; 2 2 2; 3 3 3]

#A(:,:).*5

#A(1).*5

#𝑥 = v + cv * w
#𝑦 = w

inputFilenameImage = 'images/barbara_gray.bmp'
outputFilenameImage = 'barbara_gray.png'

inputImage = imread(inputFilenameImage);
outputImage = cisalhamento(inputImage, 0.2, 0);
figure, imshow(outputImage);

inputImage = imread(inputFilenameImage);
outputImage = cisalhamento(inputImage, 0, 0.25);
figure, imshow(outputImage);


1:10
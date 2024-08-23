img = imread("lena_contraste.bmp");

%definicao dos valores maximos e minimos da imagem em escala de [0,1]
min_value = double(min(img(:)))/255;
max_value = double(max(img(:)))/255;

figure;

subplot(3,3,1);
imshow(img)
title('Imagem Original');
subplot(3,3,3);
imhist(img);
title('Histograma Original');

%aplicando identidade na escala padrão
subplot(3,3,4);
imshow(img)
title('Imagem Original');
new_img = imadjust(img, [min_value, max_value], [0,1]);
subplot(3,3,5);
imshow(new_img)
title('Imagem Transformação Identidade');
subplot(3,3,6);
imhist(new_img);
title('Histograma Transformação Identidade');

%Variando os minimos e maximos na escala [0,0.5]
subplot(3,3,7);
imshow(img)
title('Imagem Original');
new_img = imadjust(img, [min_value, max_value], [0,0.5]);
subplot(3,3,8);
imshow(new_img)
title('Imagem Transformação variando minmax');
subplot(3,3,9);
imhist(new_img);
title('Histograma Transformação variando minmax');

%na variação podemos observar que ao definir escalas diferentes ele tende a escurecer ou ainda clarear as imagens

figure;

%Variando correção gama com [0.5,1,1.5]
subplot(4,3,1);
imshow(img)
title('Imagem Original');
img_normalized = double(img)/255;
new_img = imadjust(img_normalized, [min_value, max_value], [], 0.5);
new_img = uint8(new_img*255);
subplot(4,3,3);
imhist(img)

subplot(4,3,4);
imshow(img)
title('Imagem Original');
subplot(4,3,5);
imshow(new_img)
title('Imagem Transformação correção gama 0.5');
subplot(4,3,6);
imhist(new_img);
title('Histograma Transformação correção gama 0.5');

subplot(4,3,7);
imshow(img)
title('Imagem Original');
new_img = imadjust(img_normalized, [min_value, max_value], [], 1);
new_img = uint8(new_img*255);
subplot(4,3,8);
imshow(new_img)
title('Imagem Transformação correção gama 1');
subplot(4,3,9);
imhist(new_img);
title('Histograma Transformação correção gama 1');

subplot(4,3,10);
imshow(img)
title('Imagem Original');
new_img = imadjust(img_normalized, [min_value, max_value], [], 1.5);
new_img = uint8(new_img*255);
subplot(4,3,11);
imshow(new_img)
title('Imagem Transformação correção gama 1.5');
subplot(4,3,12);
imhist(new_img);
title('Histograma Transformação correção gama 1.5');

%na variacao da gama pode se observar que ao aumentar o gama o histograma é cada vez mais jogado para a esqeurda
%o que provoca o escurecimento da imagem




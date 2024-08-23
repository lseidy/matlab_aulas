img = imread('borboleta.png');

indices_bege = find(img(:,:,1)==255 & img(:,:,2)==246 & img(:,:,3)==227);
#img(indices_bege)=(255-20-147);
indices_laranja = find(img(:,:,1)==246 & img(:,:,2)==127 & img(:,:,3)==0);
%img(indices_laranja) = (34-139-34);

[c,l] = ind2sub(size(img),indices_laranja);
for i = 1:size([c,l],1)
    linha = [c,l](i,1);
    coluna = [c,l](i,2);
    img(linha,coluna) = (34-139-34);
 end

[c,l] = ind2sub(size(img),indices_bege);
for i = 1:size([c,l],1)
    linha = [c,l](i,1);
    coluna = [c,l](i,2);
    img(linha,coluna) = (255-20-147);
 end

figure
imshow(img);

imwrite(img,"borboleta_dif.png");

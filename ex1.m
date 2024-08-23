img = imread('miss_spider.jpg');

figure;
subplot(2,3,1)
imshow(img);

img_ycbcr = rgb2ycbcr(img);
subplot(2,3,2)
imshow(img_ycbcr);

subplot(2,3,4)
Y = img_ycbcr(:,:,1);
imshow(Y);

subplot(2,3,5)
Cb = img_ycbcr(:,:,2);
imshow(Cb);

subplot(2,3,6)
Cr = img_ycbcr(:,:,3);
imshow(Cr);

figure;

subplot(2,2,1)
Y = img_ycbcr(:,:,1);
imshow(Y);
subplot(2,2,2)
hist(Y)

Y_dark = Y*0.8;

subplot(2,2,3)
imshow(Y_dark);
subplot(2,2,4)
hist(Y_dark)

imwrite(Y_dark,'Y_dark.png');

figure;
Cb_red = Cb;
indices = Cb_red(1:2:end);
[c,l] = ind2sub(size(Cb_red), indices);
indices_delete = sub2ind(size(Cb_red),c,l);

Cb_red(indices_delete) = [];
%disp([c,l]);
%Cb_red(1:2:end) = 0;
%Cb_red = reshape(Cb_red,size(Cb) - [0 1]);
%Cb_red = Cb
%Cr_red =

subplot(1,2,1)
imshow(Cb_red);
%subplot(1,2,2)
%imshow(Cb_red);





img = imread("barbara_gray.bmp");
new_img = pratica1("barbara_gray.bmp", 2,3,1);
new_img2 = pratica1("barbara_gray.bmp", 0.8,0.5,2);
new_img = mat2gray(new_img);
new_img2 = mat2gray(new_img2);
figure;
subplot(1,3,1);
imshow(new_img);
subplot(1,3,2);
imshow(new_img2);
subplot(1,3,3);
imshow(img);

print('exemplo', '-dpng');

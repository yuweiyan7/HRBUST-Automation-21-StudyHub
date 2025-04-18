clear, clc, close all,
Image=im2double(imread('girl.bmp'));
noiselsp= imnoise( Image,'salt & pepper',0.01);
noiselg= imnoise( Image,'gaussian');
result1=filter2(fspecial('average',3),noiselsp);
result2=filter2(fspecial('average',5),noiselsp);
result3=filter2(fspecial('average',3),noiselg);
result4=filter2(fspecial('average',5),noiselg); 
figure
subplot(131), imshow(Image),title('原图-鄢梦雨，2112010523');
subplot(132), imshow(noiselsp),title('叠加椒盐噪声');
subplot(133), imshow(noiselg),title('叠加高斯噪声');
figure
subplot(221), imshow(result1),title('3x3均值滤波抑制椒盐噪声');
subplot(222), imshow(result2),title('5x5均值滤波抑制椒盐噪声');
subplot(223),imshow(result3),title('3x3均值滤波抑制高斯噪声');
subplot(224), imshow(result4),title('5x5均值滤波抑制高斯噪声');
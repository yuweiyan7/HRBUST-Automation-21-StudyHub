clear,clc, close all;
Image=im2double(imread('girl.bmp'));
noiselsp= imnoise(Image,'salt & pepper',0.01);
noiselg=imnoise(Image, 'gaussian');
result1=medfilt2(noiselsp);
result2=medfilt2(noiselsp,[5 5]);
result3=medfilt2(noiselg);
result4=medfilt2(noiselg,[5 5]);
subplot(131), imshow( Image),title('原图-鄢梦雨，2112010523');
subplot(132), imshow(noiselsp),title('叠加椒盐噪声');
subplot(133), imshow(noiselg),title('叠加高斯噪声');
figure,
subplot(221), imshow(result1),title('3x3中值滤波抑制椒盐噪声');
subplot(222), imshow(result2),title('5x5中值滤波抑制报盐噪声');
subplot(223),imshow(result3),title('3x3中值滤波抑制高斯噪声');
subplot(224), imshow(result4),title('5x5中值滤波抑制高断噪声');
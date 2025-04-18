clear, clc, close all,
Image1=rgb2gray(imread('cameraman.jpg'));
Hgram=imhist(Image1);
Image2=imread('Couple.bmp');
result1=histeq(Image2);
result2=histeq(Image2,Hgram);
figure,
subplot(221),imshow(Image2),title('原图-2112010906 侯昭阳');
subplot(222),imshow(result1),title('直方图均衡化');
subplot(223),imhist(Image2),title('原图直方图');
subplot(224),imhist(result1),title('均衡化后图像的直方图');
figure,
subplot(231),imshow(Image2),title('原图-2112010906 侯昭阳');
subplot(234),imshow(Image1),title('目标图');
subplot(232),imhist(Image2),title('原图直方图');
subplot(235),imhist(Image1),title('目标直方图');
subplot(236),imhist(result2),title('规定化后图像的直方图');
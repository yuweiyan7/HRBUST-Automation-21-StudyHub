X=imread('cameraman.jpg');
X1=rgb2gray(X);
w=[-2 -4 -4 -4 -2;-4 0 8 0 -4;-4 8 24 8 -4;-4 0 8 0 -4;-2 -4 -4 -4 -2];%LoG算子的掩膜
BW_log=imfilter(X1,w);%使用LoG算子
subplot(121),imshow(X),title('原图');
subplot(122),imshow(BW_log>200),title('log算子');%显示二值图像，像素大于200则为1
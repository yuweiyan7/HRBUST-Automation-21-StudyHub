Image=rgb2gray(imread("block.bmp"));
[h,w,c]=size(Image);
scale=imresize(Image,0.5,"bilinear");
rotate=imrotate(Image,30,"bilinear","crop");
tform=affine2d([1 0 0;0 1 0;20 20 1]);
R=imref2d([h,w],[1 w],[1 h]);
trans=imwarp(Image,tform,"FillValues",0,"OutputView",R);
Originaldft=abs(fftshift(fft2(Image)));
Scaledft=abs(fftshift(fft2(scale)));
Rotatedft=abs(fftshift(fft2(rotate)));
Transdft=abs(fftshift(fft2(trans)));

subplot(221),imshow(Image),title("原图像");
subplot(222),imshow(scale),title("缩小变换图像");
subplot(223),imshow(rotate),title("旋转变换图像");
subplot(224),imshow(trans),title("平移变换");
Image=im2double(imread("frose.jpg"));
gray=rgb2gray(Image);
BW=edge(gray,"roberts");
H1=[1 0;0 -1];      H2=[0 -1;-1 0];
R1=imfilter(Image,H1);
R2=imfilter(Image,H2);
edgeImage=abs(R1)+abs(R2);
sharpImage=Image+edgeImage;

subplot(221),imshow(Image),title("原图像");
subplot(222),imshow(edgeImage),title("Roberts梯度图像");
subplot(223),imshow(BW),title("Roberts边缘检测");
subplot(224),imshow(sharpImage),title("Roberts锐化图像");

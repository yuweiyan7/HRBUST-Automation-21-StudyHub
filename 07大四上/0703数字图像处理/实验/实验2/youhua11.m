clear, clc, close all;
Image=im2double(imread('frose.jpg'));
[ height, width, color]= size(Image);
edgeImage= zeros(height,width, color);
for c=1:color
  for x=1: width-1
    for y=1: height-1
      edgeImage(y,x,c)=abs(Image(y,x+1,c)-Image(y,x,c))+abs(Image(y+1,x,c)-Image(y,x,c));
    end
  end
end
sharpImage=Image+edgeImage;
subplot(131), imshow(Image),title('原图像-2112010906 侯昭阳');
subplot(132), imshow(edgeImage), title('梯度图像');
subplot(133), imshow(sharpImage), title('锐化图像');
imwrite(edgeImage,'li6-17-1.jpg');
imwrite(sharpImage,'li6-17-2.jpg');
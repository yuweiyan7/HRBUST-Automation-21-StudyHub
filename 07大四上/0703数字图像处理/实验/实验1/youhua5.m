clear, clc, close all;
Image=imread('couple.bmp');
[height, width]=size(Image);
a1=80;b1=200;c1=30;d1=220;
a2=30;b2=220;c2=80;d2=200;
Newlmage1=zeros( height, width);
Newlmage2=zeros( height, width);
for gray=0:255
  if gray<a1
    newgray=c1/a1*gray;
  elseif gray<b1
    newgray=(d1-c1)/(b1-a1)*(gray-a1)+c1;
  else
    newgray=(255-d1)/(255-b1)*(gray-b1)+d1;  
  end
  Newlmage1(Image==gray)=newgray/255;
  if gray<a2
      newgray=c2/a2*gray;
  elseif gray<b2
      nemgray=(d2-c2)/(b2-a2)*(gray-a2)+c2;
  else
      newgray=(255-d2)/(255-b2)*(gray-b2)+d2; 
  end
      Newlmage2(Image==gray)=newgray/255;
end
subplot(131), imshow( Image), title('原图-2112010906 侯昭阳');
subplot(132),imshow(Newlmage1),title('分段线性变换1');
subplot(133), imshow(Newlmage2),title('分段线性变换2');
imwrite(Newlmage1,'1i6-3-1.jpg');
imwrite(Newlmage2,'li6-3-2.jpg');
I=imread('frose.jpg');  
a=rgb2gray(I);  
level = graythresh(a);  
b=imbinarize(a,level);  
subplot (131),imshow(I),title("原图像");
subplot (132), imshow (a),title("灰度图像");
subplot (133),imshow(b),title("outs图像");
gray1=imread("Couple.bmp")
alpha1=pi/6; alpha2=pi/4; alpha3=pi/3;
result1=gray1*tan(alpha1);
result2=gray1*tan(alpha2);
result3=gray1*tan(alpha3);

subplot(221),imshow(gray1),title("原图")
subplot(222),imshow(result1),title("灰度范围压缩");
subplot(223),imshow(result2),title("灰度范围不变");
subplot(224),imshow(result3),title("灰度范围拉伸");
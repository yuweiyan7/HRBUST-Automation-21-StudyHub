% 读取两幅图像
image1_add = imread('desert.jpg');
image2_add = imread('car.jpg');

%截断求和
result1_add = imadd(image1_add,image2_add);
%加权求和
alpha = 0.6
result2_add = alpha*image1_add+(1-alpha)*image2_add;
result3_add = imlincomb(1-alpha,image1_add,alpha,image2_add)

subplot(321),imshow(image1_add),title("背景图");
subplot(322),imshow(image2_add),title("目标图");
subplot(323),imshow(result1_add),title("截断求和");
subplot(324),imshow(result2_add),title("加权求和");
subplot(325),imshow(result3_add),title("imlincomb加权求和");
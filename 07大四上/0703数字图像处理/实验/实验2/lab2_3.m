% 读取图像
img = imread('frose.jpg'); 
gray_img = rgb2gray(img); % 将图像转换为灰度图像

% 显示原始图像
figure;
subplot(2, 2, 1);
imshow(img);
title('原始图像');

%% 一阶微分算子（Sobel算子）
% 水平方向的Sobel算子
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
% 垂直方向的Sobel算子
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];

% 应用Sobel算子
edge_x = imfilter(double(gray_img), sobel_x, 'replicate');
edge_y = imfilter(double(gray_img), sobel_y, 'replicate');

% 组合水平和垂直方向的梯度，得到边缘图
edge_img = sqrt(edge_x.^2 + edge_y.^2);

% 显示一阶微分结果
subplot(2, 2, 2);
imshow(uint8(edge_img));
title('一阶微分锐化结果 (Sobel)');

%% 二阶拉普拉斯算子
% 定义拉普拉斯算子
laplacian_filter = [0 -1 0; -1 4 -1; 0 -1 0];

% 应用拉普拉斯算子
laplacian_img = imfilter(double(gray_img), laplacian_filter, 'replicate');

% 图像锐化：将原图像加上拉普拉斯算子结果
sharpened_img = double(gray_img) - laplacian_img;

% 显示二阶拉普拉斯锐化结果
subplot(2, 2, 3);
imshow(uint8(sharpened_img));
title('二阶拉普拉斯锐化结果');

% 显示所有结果的组合图
subplot(2, 2, 4);
imshowpair(uint8(edge_img), uint8(sharpened_img), 'montage');
title('一阶和二阶锐化结果对比');

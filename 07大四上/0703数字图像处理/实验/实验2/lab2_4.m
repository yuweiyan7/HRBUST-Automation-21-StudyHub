% 读取图像
img = imread('frose.jpg'); 
gray_img = rgb2gray(img); % 转换为灰度图像

% 显示原始图像
figure;
subplot(3, 3, 1);
imshow(gray_img);
title('原始图像');

%% 图像平滑处理

% 1. 使用3x3均值滤波器
mean_filter = fspecial('average', [3, 3]);
smoothed_mean = imfilter(gray_img, mean_filter, 'replicate');
subplot(3, 3, 2);
imshow(smoothed_mean);
title('均值平滑 (3x3)');

% 2. 使用3x3高斯滤波器
gaussian_filter = fspecial('gaussian', [3, 3], 0.5);
smoothed_gaussian = imfilter(gray_img, gaussian_filter, 'replicate');
subplot(3, 3, 3);
imshow(smoothed_gaussian);
title('高斯平滑 (3x3, σ=0.5)');

% 3. 使用5x5高斯滤波器（更强的平滑效果）
gaussian_filter_5x5 = fspecial('gaussian', [5, 5], 1);
smoothed_gaussian_5x5 = imfilter(gray_img, gaussian_filter_5x5, 'replicate');
subplot(3, 3, 4);
imshow(smoothed_gaussian_5x5);
title('高斯平滑 (5x5, σ=1)');

%% 图像锐化处理

% 4. 使用Sobel算子进行锐化（边缘检测）
sobel_x = fspecial('sobel'); % 水平方向Sobel算子
sobel_y = sobel_x';          % 垂直方向Sobel算子
edge_x = imfilter(double(gray_img), sobel_x, 'replicate');
edge_y = imfilter(double(gray_img), sobel_y, 'replicate');
edge_sobel = sqrt(edge_x.^2 + edge_y.^2);
subplot(3, 3, 5);
imshow(uint8(edge_sobel));
title('Sobel锐化 (边缘检测)');

% 5. 使用3x3拉普拉斯算子进行锐化
laplacian_filter = [0 -1 0; -1 4 -1; 0 -1 0];
sharpened_laplacian = imfilter(double(gray_img), laplacian_filter, 'replicate');
sharpened_laplacian_img = double(gray_img) - sharpened_laplacian;
subplot(3, 3, 6);
imshow(uint8(sharpened_laplacian_img));
title('拉普拉斯锐化 (3x3)');

% 6. 使用增强型拉普拉斯算子进行更强的锐化
enhanced_laplacian_filter = fspecial('laplacian', 0.2); % 增强型拉普拉斯
sharpened_enhanced_laplacian = imfilter(double(gray_img), enhanced_laplacian_filter, 'replicate');
sharpened_enhanced_img = double(gray_img) - sharpened_enhanced_laplacian;
subplot(3, 3, 7);
imshow(uint8(sharpened_enhanced_img));
title('增强拉普拉斯锐化');

%% 显示结果对比

% 显示原图和所有处理结果的并排对比图
subplot(3, 3, 8);
imshowpair(smoothed_gaussian, uint8(sharpened_laplacian_img), 'montage');
title('平滑 vs 锐化 (高斯 vs 拉普拉斯)');

subplot(3, 3, 9);
imshowpair(smoothed_gaussian_5x5, uint8(sharpened_enhanced_img), 'montage');
title('强平滑 vs 强锐化 (5x5高斯 vs 增强拉普拉斯)');

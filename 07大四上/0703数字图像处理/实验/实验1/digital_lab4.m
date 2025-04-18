% 读取原始图像和目标图像
image = imread("Couple.bmp");
image_gray = im2gray(image);  % 转换为灰度图像
hist = imhist(image_gray);    % 计算原始图像的灰度直方图

target_image = imread("Couple.bmp"); % 读取目标图像，用于直方图规定化
target_gray = im2gray(target_image); % 转换为灰度图像

% ---- 直方图均衡化 ----
% 图像尺寸
[height, width] = size(image_gray);
NewImage = zeros(height, width);  % 初始化均衡化后的图像矩阵
s = zeros(256, 1);                % 累积分布函数 (CDF) 数组

% 计算累积分布函数 (CDF)
s(1) = hist(1);
for i = 2:256
    s(i) = s(i - 1) + hist(i);
end
s = s / (height * width);           % 归一化
s = round(s * 255);                 % 映射到 0-255 灰度级

% 应用均衡化映射到新图像
for i = 1:height
    for j = 1:width
        NewImage(i, j) = s(image_gray(i, j) + 1);
    end
end

NewImage = uint8(NewImage);  % 将结果转换为 uint8 类型

% ---- 直方图规定化 ----
specified_image = imhistmatch(image_gray, target_gray); % 将原图像灰度分布规定化到目标图像

% ---- 显示结果 ----
figure;

% 显示原始图像及其直方图
subplot(3, 2, 1), imshow(image_gray), title("原始图像");
% 显示目标图像及其直方图
subplot(3, 2, 2), imshow(target_gray), title("目标图像");

subplot(3, 2, 3), imshow(NewImage), title("均衡化后的图像");
subplot(3, 2, 4), imshow(specified_image), title("规定化后的图像");

subplot(3, 2, 5), imhist(NewImage), title("均衡化后图像的直方图");
subplot(3, 2, 6), imhist(specified_image), title("规定化后图像的直方图");

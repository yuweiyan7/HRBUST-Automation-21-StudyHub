% 读取灰度图像
image = imread("Couple.bmp");
image_gray = im2gray(image); % 转换为灰度图像

% 转换为双精度类型，便于运算
image_double = im2double(image_gray);

% 设置幂次变换参数
gamma1 = 0.5; % 增强暗部细节
gamma2 = 2.0; % 增强亮部细节

% 应用幂次变换
image_gamma1 = image_double .^ gamma1;
image_gamma2 = image_double .^ gamma2;

% 显示原始图像及处理结果
figure;
subplot(1, 3, 1), imshow(image_gray), title('原始灰度图像');
subplot(1, 3, 2), imshow(image_gamma1), title('幂次变换 - γ = 0.5');
subplot(1, 3, 3), imshow(image_gamma2), title('幂次变换 - γ = 2.0');

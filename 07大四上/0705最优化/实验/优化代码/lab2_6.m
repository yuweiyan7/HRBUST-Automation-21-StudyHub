% 清理环境
clc;
clear;

% 定义符号变量
syms x y;

% 定义收益函数
R = (x - 1) * (70 - 5 * x + 4 * y) + (y - 1.2) * (80 - 7 * y + 6 * x);

% 求偏导数
dR_dx = diff(R, x); % 对 x 求偏导
dR_dy = diff(R, y); % 对 y 求偏导

% 解偏导数为 0 的方程组
[sol_x, sol_y] = solve([dR_dx == 0, dR_dy == 0], [x, y]);

% 将符号解转为数值解
sol_x = double(sol_x);
sol_y = double(sol_y);

% 计算最大收益
max_profit = double(subs(R, {x, y}, {sol_x, sol_y}));

% 显示结果
fprintf('最优解为：\n');
fprintf('本地果汁定价 x = %.2f 元/瓶\n', sol_x);
fprintf('外地果汁定价 y = %.2f 元/瓶\n', sol_y);
fprintf('最大收益为：%.2f 元\n', max_profit);

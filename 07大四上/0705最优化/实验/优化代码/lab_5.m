% 工地位置坐标 (a, b) 和需求量 d
a = [1.25, 8.75, 0.5, 5.75, 3, 7.25];
b = [1.25, 0.75, 4.75,5, 6.5, 7.25];
d = [3, 5, 4, 7, 6, 11];

% 料场位置坐标 (x, y) 和日储量 e
x = [5, 2];
y = [1, 7];
e = [20, 20];

% 定义变量 X (运输量) 的初始值
X0 = zeros(6, 2); % 假设初始运输量为0

% 定义目标函数
objective = @(X) calculateObjective(X, x, y, a, b);

% 定义约束条件
constraints = @(X) deal([], [
    sum(reshape(X, 6, 2), 2) - d';    % 工地需求量约束 (6x1)
    (e' - sum(reshape(X, 6, 2), 1))'  % 料场储量约束 (2x1 转置为列向量)
]);

% 使用 fmincon 求解
options = optimoptions('fmincon', 'Algorithm', 'sqp');
X_optimal = fmincon(objective, X0, [], [], [], [], zeros(6, 2), [], constraints, options);

% 显示最优运输方案
disp('最优运输方案 X:');
disp(reshape(X_optimal, 6, 2));

% 目标函数的定义 - 计算每对料场和工地之间的运输成本
function cost = calculateObjective(X, x, y, a, b)
    X = reshape(X, 6, 2);  % 将 X 重塑为 6x2 矩阵
    cost = 0;
    for i = 1:6
        for j = 1:2
            % 计算从料场 j 到工地 i 的运输成本
            distance = sqrt((x(j) - a(i))^2 + (y(j) - b(i))^2);
            cost = cost + X(i, j) * distance;
        end
    end
end
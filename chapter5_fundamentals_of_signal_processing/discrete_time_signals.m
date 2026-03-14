clear; clc; clf;

N = -3:10;                         % 离散时间索引 n
X = [0 2 3 3 2 3 0 -1 -2 -3 -4 -5 1 2];   % 序列值 x[n]

stem(N, X, 'filled');             % 绘制离散时间序列
hold on;
plot([min(N)-1, max(N)+1], [0, 0], 'r', 'LineWidth', 1);
set(gca, 'box', 'on');
xlabel('序列号 n');
ylabel('序列值 x[n]');
title('离散时间信号');
grid on;

clear; clc; clf;

% 采样定理演示程序
% 对于最高频率为 fmax 的连续时间信号, 若采样频率 fs 满足 fs >= 2*fmax,
% 则采样后的离散序列包含恢复原信号所需的全部信息, 不会发生混叠。
% 其中 2*fmax 称为奈奎斯特采样频率。
% 若 fs < 2*fmax, 则采样点过稀, 不同频率成分会在离散域中重叠,
% 导致采样后的序列错误地表现为另一种低频变化, 这种现象称为混叠。
%
% 本程序使用同一个连续时间正弦信号分别进行两组采样:
% 1) 先展示不满足采样定理的情况, 观察采样过程和混叠后的离散信号;
% 2) 再展示满足采样定理的情况, 观察采样过程和正确的离散信号。

% 原始连续时间信号 x(t) = A*sin(2*pi*f0*t + phi)
A = 1;                    % 信号幅值
f0 = 8;                   % 原始信号频率 8 Hz
phi = pi/6;               % 初相位
T = 1;                    % 观察时长 1 s

% 用高分辨率时间轴近似连续时间信号, 仅用于绘图参考
dt_ref = 0.001;
t_ref = 0:dt_ref:T;
x_ref = A * sin(2*pi*f0*t_ref + phi);

% 不满足采样定理: fs_bad < 2*f0 = 16 Hz, 将产生混叠
fs_bad = 10;
Ts_bad = 1 / fs_bad;
t_bad = 0:Ts_bad:T;
x_bad = A * sin(2*pi*f0*t_bad + phi);

% 满足采样定理: fs_good > 2*f0 = 16 Hz, 可以正确表示原始信号
fs_good = 40;
Ts_good = 1 / fs_good;
t_good = 0:Ts_good:T;
x_good = A * sin(2*pi*f0*t_good + phi);

subplot(5,1,1);
plot(t_ref, x_ref, 'b', 'LineWidth', 1.2);
ylim([-1.2, 1.2]);
grid on;
title('原始连续时间信号 x(t), f0 = 8 Hz');
ylabel('幅值');

subplot(5,1,2);
plot(t_ref, x_ref, 'b', 'LineWidth', 1.0);
hold on;
stem(t_bad, x_bad, 'r', 'filled');
hold off;
ylim([-1.2, 1.2]);
grid on;
title('不满足采样定理的采样过程, fs = 10 Hz < 2f0 = 16 Hz');
ylabel('幅值');

subplot(5,1,3);
stem(t_bad, x_bad, 'r', 'filled');
ylim([-1.2, 1.2]);
grid on;
title('不满足采样定理时的采样后信号, 发生混叠');
ylabel('幅值');

subplot(5,1,4);
plot(t_ref, x_ref, 'b', 'LineWidth', 1.0);
hold on;
stem(t_good, x_good, 'm', 'filled');
hold off;
ylim([-1.2, 1.2]);
grid on;
title('满足采样定理的采样过程, fs = 40 Hz > 2f0 = 16 Hz');
ylabel('幅值');

subplot(5,1,5);
stem(t_good, x_good, 'm', 'filled');
ylim([-1.2, 1.2]);
grid on;
title('满足采样定理时的采样后信号');
xlabel('时间 / s');
ylabel('幅值');

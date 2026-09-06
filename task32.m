% Очистка (но если оставить, удалит старые данные)
% clear; close all; clc;  % можно закомментировать, чтобы не стереть переменные

% Запуск симуляции
out = sim('task3');

% --- Извлечение данных (поля уже есть) ---
tout = out.tout;    % время
u1 = out.u1;        % вход 1
u2 = out.u2;        % вход 2
y1 = out.y1;        % выход 1
y2 = out.y2;        % выход 2

% Если данные в формате структуры, преобразуем в массивы
if isstruct(u1) && isfield(u1, 'signals')
    u1 = u1.signals.values; 
    u1 = squeeze(u1);
end
if isstruct(u2) && isfield(u2, 'signals')
    u2 = u2.signals.values;
    u2 = squeeze(u2);
end
if isstruct(y1) && isfield(y1, 'signals')
    y1 = y1.signals.values;
    y1 = squeeze(y1);
end
if isstruct(y2) && isfield(y2, 'signals')
    y2 = y2.signals.values;
    y2 = squeeze(y2);
end

% --- График входных сигналов ---
figure('Name', 'Input signals', 'Position', [100, 100, 800, 600]);
plot(tout, u1, 'b-', 'LineWidth', 3); hold on;
plot(tout, u2, 'r-', 'LineWidth', 3);
grid on;
xlabel('Время t, с', 'FontSize', 14);
ylabel('Амплитуда', 'FontSize', 14);
title('Входные сигналы многоканальной системы', 'FontSize', 16);
legend('u_1(t) = 1(t)', 'u_2(t) = 2\sin(t)', 'FontSize', 14, 'Location', 'best');
set(gca, 'FontSize', 12);
xlim([0 max(tout)]);
saveas(gcf, 'multichannel_inputs.png', 'png');
disp('График входных сигналов сохранён как multichannel_inputs.png');

% --- График выходных сигналов ---
figure('Name', 'Output signals', 'Position', [100, 100, 800, 600]);
plot(tout, y1, 'b-', 'LineWidth', 3); hold on;
plot(tout, y2, 'r-', 'LineWidth', 3);
grid on;
xlabel('Время t, с', 'FontSize', 14);
ylabel('Амплитуда', 'FontSize', 14);
title('Выходные сигналы многоканальной системы', 'FontSize', 16);
legend('y_1(t)', 'y_2(t)', 'FontSize', 14, 'Location', 'best');
set(gca, 'FontSize', 12);
xlim([0 max(tout)]);
saveas(gcf, 'multichannel_outputs.png', 'png');
disp('График выходных сигналов сохранён как multichannel_outputs.png');

fprintf('Максимальное значение y1: %g\n', max(y1));
fprintf('Максимальное значение y2: %g\n', max(y2));
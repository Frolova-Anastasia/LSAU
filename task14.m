% Скрипт для пункта 1.4
% Предполагается, что после симуляции в workspace уже есть:
% - tout, y_data  (из текущей симуляции с u=1, ненулевыми НУ)
% - tout1, y1     (из пункта 1.2: u=1, нулевые НУ)
% - tout2, y2     (из пункта 1.3: u=0, ненулевые НУ)
out = sim('task11lab1');

% Извлечение данных
tout = out.tout;      % время
y_data = out.y_data;  % выходной сигнал

% Проверка наличия данных из пунктов 1.2 и 1.3
if ~exist('y1', 'var') || ~exist('tout1', 'var')
    error('Данные пункта 1.2 (y1, tout1) не найдены. Сначала выполните симуляцию для пункта 1.2 и сохраните переменные.');
end
if ~exist('y2', 'var') || ~exist('tout2', 'var')
    error('Данные пункта 1.3 (y2, tout2) не найдены. Сначала выполните симуляцию для пункта 1.3 и сохраните переменные.');
end
if ~exist('y_data', 'var') || ~exist('tout', 'var')
    error('Данные текущей симуляции (y_data, tout) не найдены. Запустите симуляцию для пункта 1.4.');
end

% Интерполяция данных к общей сетке tout (из текущей симуляции)
y1_interp = interp1(tout1, y1, tout, 'linear', 'extrap');
y2_interp = interp1(tout2, y2, tout, 'linear', 'extrap');

% Сигнал f(t) = y1(t) + y2(t)
f = y1_interp + y2_interp;

% Построение сравнительного графика
figure;
plot(tout, y_data, 'b-', 'LineWidth', 3); hold on;
plot(tout, f, 'r--', 'LineWidth', 3);
grid on;
xlabel('Время t, с', 'FontSize', 14);
ylabel('Амплитуда', 'FontSize', 14);
title('Сравнение полного отклика и суммы составляющих', 'FontSize', 16);
legend('y(t) (u=1, ненулевые НУ)', 'f(t) = y_1(t) + y_2(t)', ...
       'FontSize', 14, 'Location', 'best');
set(gca, 'FontSize', 12);
xlim([0 max(tout)]);

% Сохранение графика
saveas(gcf, 'superposition_check.png', 'png');
disp('График сохранён как superposition_check.png');

% Проверка максимального расхождения
diff_max = max(abs(y_data - f));
fprintf('Максимальное абсолютное расхождение: %g\n', diff_max);

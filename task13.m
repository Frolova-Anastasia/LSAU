

% Запуск симуляции (модель уже настроена для задания 1.3)
out = sim('task11lab1');

% Извлечение данных
tout = out.tout;      % время
y_data = out.y_data;  % выходной сигнал

% Построение графика свободного движения
figure;
plot(tout, y_data, 'r-', 'LineWidth', 3);
grid on;
xlabel('Время t, с', 'FontSize', 14);
ylabel('Амплитуда', 'FontSize', 14);
title('Свободное движение при u=0 и ненулевых начальных условиях', 'FontSize', 16);
legend('y(t)', 'FontSize', 14, 'Location', 'best');
set(gca, 'FontSize', 12);
xlim([0 max(tout)]);

% Сохранение графика
saveas(gcf, 'free_motion.png', 'png');
disp('График сохранён как free_motion.png');

% Вывод начального и конечного значений для проверки
fprintf('Начальное значение y(0) = %g\n', y_data(1));
fprintf('Конечное значение y(∞) ≈ %g\n', y_data(end));


% Загружаем данные из рабочей области (если они уже есть)
% Если вы только что запустили симуляцию, данные уже есть.

% Запуск симуляции и получение всех сигналов
out = sim('task11lab1');  % имя вашей модели без .slx

% Теперь out содержит все сигналы, которые записаны в блоки To Workspace
% Обратитесь к ним по именам
tout = out.tout;  % это время
u_data = out.u_data;  % если вы так назвали сигнал
y_data = out.y_data;

% --- График 1: Входной сигнал u(t) ---
figure(1);
plot(tout, u_data, 'b-', 'LineWidth', 3);  % синяя жирная линия
grid on;
xlabel('Время t, с', 'FontSize', 14);
ylabel('Амплитуда', 'FontSize', 14);
title('Входной сигнал u(t) = 1(t)', 'FontSize', 16);
legend('u(t)', 'FontSize', 14, 'Location', 'best');
set(gca, 'FontSize', 12);  % размер шрифта на осях
xlim([0 10]);  % ограничение по времени, можно изменить
ylim([-0.1 1.5]);

% Сохраняем в PNG (высокое разрешение)
saveas(gcf, 'input_signal.png', 'png');
% или print -dpng -r300 input_signal.png

% --- График 2: Выходной сигнал y(t) ---
figure(2);
plot(tout, y_data, 'r-', 'LineWidth', 3);  % красная жирная линия
grid on;
xlabel('Время t, с', 'FontSize', 14);
ylabel('Амплитуда', 'FontSize', 14);
title('Выходной сигнал y(t)', 'FontSize', 16);
legend('y(t)', 'FontSize', 14, 'Location', 'best');
set(gca, 'FontSize', 12);
xlim([0 10]);
ylim([0 1.5]);  % подберите под свой график

% Сохраняем
saveas(gcf, 'output_signal.png', 'png');

% --- Если нужен также совмещённый график для сравнения ---
figure(3);
plot(tout, u_data, 'b-', 'LineWidth', 3); hold on;
plot(tout, y_data, 'r-', 'LineWidth', 3);
grid on;
xlabel('Время t, с', 'FontSize', 14);
ylabel('Амплитуда', 'FontSize', 14);
title('Входной и выходной сигналы', 'FontSize', 16);
legend('u(t)', 'y(t)', 'FontSize', 14, 'Location', 'best');
set(gca, 'FontSize', 12);
xlim([0 10]);
ylim([0 1.5]);
saveas(gcf, 'input_output_combined.png', 'png');

disp('Графики сохранены в текущую папку.');
clear all;
close all;
clc;
addpath('../funciones')

% Definimos la respuesta impulsional del canal
n0 = 0;    % Primer retardo (en n=0)
alpha1 = -0.5;  % Coeficiente en n=8820
n1 = 8820;  % Segundo retardo
alpha2 = 0.25;  % Coeficiente en n=17640
n2 = 17640;  % Tercer retardo

% Cargar la señal de audio
[x, fs] = audioread('audio.wav');

% Obtener la salida del sistema con la señal de audio original
% sistema = @(x) x; % Passthrough del sistema, si es necesario ajustar, definirlo correctamente
y_left = sys_canal(x(:, 1)); % Canal izquierdo
y_right = sys_canal(x(:, 2)); % Canal derecho

% Aplicar filtro con 2 ramas de retardo a ambos canales
y_left_2b = filter_2b(y_left);
y_right_2b = filter_2b(y_right);

% Combinar ambos canales filtrados en una señal estéreo
y2_stereo = [y_left_2b, y_right_2b];

% Graficar señal original (Canal Izquierdo)
figure('Position', [100, 100, 1200, 600]);
subplot(2, 1, 1);
timeOriginal = (0:length(x) - 1) / fs;
plot(timeOriginal, x(:, 1), 'b');
title('Señal Original (Canal Izquierdo)', 'FontSize', 12);
xlabel('Tiempo (s)', 'FontSize', 10);
ylabel('Amplitud', 'FontSize', 10);
grid on;

% Graficar señal filtrada con 2 ramas (Canal Derecho)
subplot(2, 1, 2);
timeFiltered2 = (0:length(y2_stereo) - 1) / fs;
plot(timeFiltered2, y2_stereo(:, 1), 'r');
title('Salida filtrada con 2 ramas (Canal Derecho)', 'FontSize', 12);
xlabel('Tiempo (s)', 'FontSize', 10);
ylabel('Amplitud', 'FontSize', 10);
grid on;

sound(y2_stereo, fs);
pause(length(y_left_2b)/fs + 1);

% Aplicar filtro con 3 ramas de retardo a ambos canales
y_left_3b = filter_3b(y_left);
y_right_3b = filter_3b(y_right);

% Combinar ambos canales filtrados en una señal estéreo
y3_stereo = [y_left_3b, y_right_3b];

% Graficar señal original (Canal Izquierdo) nuevamente
figure('Position', [100, 100, 1200, 600]);
subplot(2, 1, 1);
plot(timeOriginal, x(:, 1), 'b');
title('Señal Original (Canal Izquierdo)', 'FontSize', 12);
xlabel('Tiempo (s)', 'FontSize', 10);
ylabel('Amplitud', 'FontSize', 10);
grid on;

% Graficar señal filtrada con 3 ramas (Canal Derecho)
subplot(2, 1, 2);
timeFiltered3 = (0:length(y3_stereo) - 1) / fs;
plot(timeFiltered3, y3_stereo(:, 1), 'r');
title('Salida filtrada con 3 ramas (Canal Derecho)', 'FontSize', 12);
xlabel('Tiempo (s)', 'FontSize', 10);
ylabel('Amplitud', 'FontSize', 10);
grid on;

sound(y3_stereo, fs);



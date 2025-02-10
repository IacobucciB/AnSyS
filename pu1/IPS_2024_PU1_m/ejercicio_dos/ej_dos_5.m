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
y_left = sys_canal(x(:, 1)); % Canal izquierdo
y_right = sys_canal(x(:, 2)); % Canal derecho

% Aplicar filtro con 2 ramas de retardo al canal derecho
y_right_2b = filter_2b(y_right);

% Aplicar filtro con 3 ramas de retardo al canal derecho
y_right_3b = filter_3b(y_right);

% Crear figura única para señales filtradas del canal derecho
figure('Position', [100, 100, 1200, 600]);

% Señal filtrada con 2 ramas (Canal Derecho)
subplot(2, 1, 1);
timeFiltered2 = (0:length(y_right_2b) - 1) / fs;
plot(timeFiltered2, y_right_2b, 'r');
title('Salida filtrada con 2 ramas', 'FontSize', 12);
xlabel('Tiempo (s)', 'FontSize', 10);
ylabel('Amplitud', 'FontSize', 10);
grid on;

% Señal filtrada con 3 ramas (Canal Derecho)
subplot(2, 1, 2);
timeFiltered3 = (0:length(y_right_3b) - 1) / fs;
plot(timeFiltered3, y_right_3b, 'r');
title('Salida filtrada con 3 ramas', 'FontSize', 12);
xlabel('Tiempo (s)', 'FontSize', 10);
ylabel('Amplitud', 'FontSize', 10);
grid on;

sound([y_right_2b, y_right_3b], fs);


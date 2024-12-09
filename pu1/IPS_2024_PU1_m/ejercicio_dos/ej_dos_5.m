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

% Canal con los tres impulsos definidos
hc = [1 zeros(1, n1-1) alpha1 zeros(1, n2-n1-1) alpha2];

% Filtro con 1 rama de retardo (para cancelar el retardo en n=0)
hf_1 = [1 zeros(1, n1-1) -alpha1];

% Filtro con 2 ramas de retardo (para cancelar el retardo en n=0 y n=8820)
hf_2 = [1 zeros(1, n1-1) -alpha1 zeros(1, n2-n1-1) alpha2];

% Filtro con 3 ramas de retardo
hf_3 = [1 zeros(1, n1-1) -alpha1 zeros(1, n2-n1-1) alpha2];

% Convolucion para obtener la respuesta impulsional de la cascada
h_cascada_1 = conv(hc, hf_1); % Canal + filtro de 1 rama
h_cascada_2 = conv(hc, hf_2); % Canal + filtro de 2 ramas
h_cascada_3 = conv(hc, hf_3); % Canal + filtro de 3 ramas


% Cargar la senial de audio
[x, fs] = audioread('audio.wav');

% Filtrar la senial
y_1 = filter(hf_1, 1, x); % Senial filtrada con 1 rama
y_2 = filter(hf_2, 1, x); % Senial filtrada con 2 ramas
y_3 = filter(hf_3, 1, x); % Senial filtrada con 3 ramas

% Comparar con la senial original
figure('Position', [100, 100, 1200, 800]); % Tamaño de la ventana gráfica
t = (0:length(x)-1) / fs; % Vector de tiempo
subplot(4,1,1);
plot(t, x);
title('Senial original', 'FontSize', 10);
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(4,1,2);
plot(t, y_1);
title('Senial filtrada (1 rama)', 'FontSize', 10);
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(4,1,3);
plot(t, y_2);
title('Senial filtrada (2 ramas)', 'FontSize', 10);
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(4,1,4);
plot(t, y_3);
title('Senial filtrada (3 ramas)', 'FontSize', 10);
xlabel('Tiempo (s)');
ylabel('Amplitud');

% Escuchar las seniales
disp('Reproduciendo la senial original...');
sound(x, fs);
pause(length(x)/fs + 1);

disp('Reproduciendo la senial filtrada (1 rama)...');
sound(y_1, fs);
pause(length(y_1)/fs + 1);

disp('Reproduciendo la senial filtrada (2 ramas)...');
sound(y_2, fs);
pause(length(y_2)/fs + 1);

disp('Reproduciendo la senial filtrada (3 ramas)...');
sound(y_3, fs);
pause(length(y_3)/fs + 1);


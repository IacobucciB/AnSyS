clear all;
close all;
clc;
addpath('../funciones')

% Definimos la respuesta impulsional del canal
n0 = 10; % Retardo del canal
alpha1 = 0.5; % Coeficiente del canal
hc = [1 zeros(1, n0-1) alpha1]; % Canal con un retardo de n0

% Filtro con 2 ramas de retardo
hf_2 = [1 zeros(1, n0-1) -alpha1]; % Filtro que cancela el retardo del canal

% Filtro con 3 ramas de retardo (incluye un segundo término corrector)
n1 = 15; % Otro retardo
alpha2 = 0.25; % Coeficiente adicional
hf_3 = [1 zeros(1, n0-1) -alpha1 zeros(1, n1-n0-1) alpha2];

% Filtro con 4 ramas de retardo (incluye un tercer término corrector)
n2 = 20; % Otro retardo
alpha3 = -0.1; % Coeficiente adicional
hf_4 = [1 zeros(1, n0-1) -alpha1 zeros(1, n1-n0-1) alpha2 zeros(1, n2-n1-1) alpha3];

% Convolución para obtener la respuesta impulsional de la cascada
h_cascada_2 = conv(hc, hf_2); % Canal + filtro de 2 ramas
h_cascada_3 = conv(hc, hf_3); % Canal + filtro de 3 ramas
h_cascada_4 = conv(hc, hf_4); % Canal + filtro de 4 ramas

% Graficar las respuestas impulsionales
figure;
subplot(3,1,1);
stem(h_cascada_2);
title('Respuesta impulsional: Canal + Filtro (2 ramas)');
xlabel('n');
ylabel('Amplitud');

subplot(3,1,2);
stem(h_cascada_3);
title('Respuesta impulsional: Canal + Filtro (3 ramas)');
xlabel('n');
ylabel('Amplitud');

subplot(3,1,3);
stem(h_cascada_4);
title('Respuesta impulsional: Canal + Filtro (4 ramas)');
xlabel('n');
ylabel('Amplitud');

% Cargar la señal de audio
[x, fs] = audioread('audio.wav');

% Filtrar la señal
y_2 = filter(hf_2, 1, x); % Señal filtrada con 2 ramas
y_3 = filter(hf_3, 1, x); % Señal filtrada con 3 ramas
y_4 = filter(hf_4, 1, x); % Señal filtrada con 4 ramas

% Comparar con la señal original
figure;
t = (0:length(x)-1) / fs; % Vector de tiempo
subplot(4,1,1);
plot(t, x);
title('Señal original');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(4,1,2);
plot(t, y_2);
title('Señal filtrada (2 ramas)');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(4,1,3);
plot(t, y_3);
title('Señal filtrada (3 ramas)');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(4,1,4);
plot(t, y_4);
title('Señal filtrada (4 ramas)');
xlabel('Tiempo (s)');
ylabel('Amplitud');

% Escuchar las señales
disp('Reproduciendo la señal original...');
sound(x, fs);
pause(length(x)/fs + 1);

disp('Reproduciendo la señal filtrada (2 ramas)...');
sound(y_2, fs);
pause(length(y_2)/fs + 1);

disp('Reproduciendo la señal filtrada (3 ramas)...');
sound(y_3, fs);
pause(length(y_3)/fs + 1);

disp('Reproduciendo la señal filtrada (4 ramas)...');
sound(y_4, fs);
pause(length(y_4)/fs + 1);


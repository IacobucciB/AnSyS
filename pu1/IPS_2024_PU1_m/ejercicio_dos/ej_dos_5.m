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

% Filtro con 2 ramas de retardo (para cancelar el retardo en n=0 y n=8820)
hf_2 = [1 zeros(1, n1-1) -alpha1];

% Filtro con 3 ramas de retardo (para cancelar el retardo en n=0, n=8820 y n=17640)
hf_3 = [1 zeros(1, n1-1) -alpha1 zeros(1, n2-n1-1) alpha2];

% Filtro con 4 ramas de retardo (puede incluir un coeficiente adicional si es necesario)
% Este filtro podría añadir una nueva corrección si fuera necesario, pero no se hace en este caso
hf_4 = [1 zeros(1, n1-1) -alpha1 zeros(1, n2-n1-1) alpha2];

% Convolución para obtener la respuesta impulsional de la cascada
h_cascada_2 = conv(hc, hf_2); % Canal + filtro de 2 ramas
h_cascada_3 = conv(hc, hf_3); % Canal + filtro de 3 ramas
h_cascada_4 = conv(hc, hf_4); % Canal + filtro de 4 ramas (aunque no cambia en este caso)


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


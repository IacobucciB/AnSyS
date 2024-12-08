clear all;
close all;
clc;
addpath('../funciones')

% Cargar el archivo de audio
[x, fs] = audioread('audio.wav');

% Aplicar el sistema a la señal
y = sys_canal(x);

% Escuchar las señales
disp('Reproduciendo la señal de entrada...');
sound(x, fs);
pause(length(x)/fs + 1);

disp('Reproduciendo la señal de salida...');
sound(y, fs);

% Graficar las señales
t = (0:length(x)-1) / fs;
figure;
subplot(2,1,1);
plot(t, x);
title('Señal de entrada');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(2,1,2);
plot(t, y);
title('Señal de salida');
xlabel('Tiempo (s)');
ylabel('Amplitud');


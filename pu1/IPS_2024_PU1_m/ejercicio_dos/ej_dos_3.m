clear all;
close all;
clc;
addpath('../funciones')

% Cargar el archivo de audio
[x, fs] = audioread('audio.wav');

% Aplicar el sistema a la se�al
y = sys_canal(x);

% Escuchar las se�ales
disp('Reproduciendo la se�al de entrada...');
sound(x, fs);
pause(length(x)/fs + 1);

disp('Reproduciendo la se�al de salida...');
sound(y, fs);

% Graficar las se�ales
t = (0:length(x)-1) / fs;
figure;
subplot(2,1,1);
plot(t, x);
title('Se�al de entrada');
xlabel('Tiempo (s)');
ylabel('Amplitud');

subplot(2,1,2);
plot(t, y);
title('Se�al de salida');
xlabel('Tiempo (s)');
ylabel('Amplitud');


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



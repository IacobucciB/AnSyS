clear all;
close all;
clc;
addpath('../funciones');

legajo = 022386;

% Generar senial x[n] con hcanald
[n, x] = hcanald(legajo);

% Generar senial impulsiva delta[n] y respuesta del sistema sys_canal
d_k = delta(n);         % Impulso unitario
h = sys_canal(d_k);     % Respuesta del sistema al impulso

% Grafica de las seniales
figure;

% Subplot 1: Senial original x[n]
subplot(2, 1, 1);
hold on;

% Identificar valores diferentes de cero y valores iguales a cero
valores_diferentes_de_cero_x = x ~= 0;
valores_cero_x = ~valores_diferentes_de_cero_x;

% Graficar la senial original x[n]
stem(n(valores_cero_x), x(valores_cero_x), 'o', 'Color', 'b', 'DisplayName', 'x[n] = 0');
stem(n(valores_diferentes_de_cero_x), x(valores_diferentes_de_cero_x), 'o', 'Color', 'r', 'DisplayName', 'x[n] ? 0');

% Configuracion del grafico
title('Senial original x[n]');
xlabel('n');
ylabel('x[n]');
legend;
hold off;

% Subplot 2: Respuesta del sistema h[n]
subplot(2, 1, 2);
hold on;

% Identificar valores diferentes de cero y valores iguales a cero en h[n]
valores_diferentes_de_cero_h = h ~= 0;
valores_cero_h = ~valores_diferentes_de_cero_h;

% Graficar la senial de respuesta h[n]
stem(n(valores_cero_h), h(valores_cero_h), 'o', 'Color', 'b', 'DisplayName', 'h[n] = 0');
stem(n(valores_diferentes_de_cero_h), h(valores_diferentes_de_cero_h), 'o', 'Color', 'r', 'DisplayName', 'h[n] ? 0');

% Configuracion del grafico
title('Respuesta del sistema h[n]');
xlabel('n');
ylabel('h[n]');
legend;
hold off;

% Mostrar valores distintos de cero en consola
disp('Valores distintos de cero en la senial original x[n]:');
indices_diferentes_de_cero_x = n(valores_diferentes_de_cero_x);
valores_diferentes_de_cero_x = x(valores_diferentes_de_cero_x);

for i = 1:length(indices_diferentes_de_cero_x)
    fprintf('n = %d, x[n] = %.2f\n', indices_diferentes_de_cero_x(i), valores_diferentes_de_cero_x(i));
end

disp('Valores distintos de cero en la respuesta del sistema h[n]:');
indices_diferentes_de_cero_h = n(valores_diferentes_de_cero_h);
valores_diferentes_de_cero_h = h(valores_diferentes_de_cero_h);

for i = 1:length(indices_diferentes_de_cero_h)
    fprintf('n = %d, h[n] = %.2f\n', indices_diferentes_de_cero_h(i), valores_diferentes_de_cero_h(i));
end


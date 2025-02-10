% Define el rango de n
n = 0:53000;

% Delta de Dirac (delta(n) = 1 cuando n = 0, y 0 en cualquier otro lugar)
x = (n == 0);

% Aplicación de los sistemas
% sys_canal, filter_2b y filtro_3b deben estar definidos previamente
y = sys_canal(x);      % Salida del sistema canal
y2b = filter_2b(y);    % Salida del filtro 2b
y3b = filter_3b(y);    % Salida del filtro 3b

% Filtrar muestras distintas de cero
n_y2b = n(y2b ~= 0);
y2b_interesante = y2b(y2b ~= 0);

n_y3b = n(y3b ~= 0);
y3b_interesante = y3b(y3b ~= 0);

% Graficar las respuestas impulsionales de y2b e y3b
figure;
subplot(2, 1, 1);
stem(n_y2b, y2b_interesante, 'LineWidth', 1.5, 'Marker', 'o');
title('Respuesta impulsional del filtro con 2 ramas (valores distintos de cero)');
xlabel('n');
ylabel('Amplitud');
grid on;

subplot(2, 1, 2);
stem(n_y3b, y3b_interesante, 'LineWidth', 1.5, 'Marker', 'o');
title('Respuesta impulsional del filtro con 3 ramas (valores distintos de cero)');
xlabel('n');
ylabel('Amplitud');
grid on;

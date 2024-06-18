% defincion de la senal VID
% x[n] = 1 si -1 <= n <= 4; 0 cc

% tp1-ej3
n = -2:8;
x_n = zeros(size(n));
signal = (n >= 0 & n <= 4);
x_n(signal) = 1;

% graficamos
figure;
stem(n, x_n);
xlabel('n');
ylabel('x[n]');
title('tp1-ej3 : x[n]');
grid on;
set(gca, 'FontSize', 18);

% tp1-ej3a
n = -2:8;
x_n = zeros(size(n));
signal = (n >= 0 & n <= 4);
x_n(signal) = 1;
n = n + 1;

% graficamos
figure;
stem(n, x_n);
xlabel('n');
ylabel('x[n]');
title('tp1-ej3a : x[n-1]');
grid on;
set(gca, 'FontSize', 18);

% tp1-ej3b
n = -2:8;
x_n = zeros(size(n));
signal = (n >= 0 & n <= 4);
x_n(signal) = 1;
m = 2*n

% graficamos
figure;
stem(m, x_n);
xlabel('n');
ylabel('x[n]');
title('tp1-ej3b : x[2n]');
grid on;
set(gca, 'FontSize', 18);

% tp1-ej3c
n = -2:8;
x_n = zeros(size(n));
signal = (n >= 0 & n <= 4);
x_n(signal) = 1;
m = n.^2

% graficamos
figure;
stem(m, x_n);
xlabel('n');
ylabel('x[n]');
title('tp1-ej3c : x[n^2]');
grid on;
set(gca, 'FontSize', 18);

% tp1-ej3d
n = -2:8;
x_n = zeros(size(n));
signal = (n >= 0 & n <= 4);
x_n(signal) = 1;
m = -n - 3;

% graficamos
figure;
stem(m, x_n);
xlabel('n');
ylabel('x[n]');
title('tp1-ej3d : x[-n-3]');
grid on;
set(gca, 'FontSize', 18);

% tp1-ej3e
n = -2:8;
x_n = zeros(size(n));
signal = (n >= 0 & n <= 4);
x_n(signal) = 1;

% Impar{x[n]}
x_odd = (x_n - fliplr(x_n)) / 2;

% graficamos
figure;
stem(n, x_odd);
xlabel('n');
ylabel('Impar\{x[n]\}');
title('tp1-ej3e : Impar\{x[n]\}');
grid on;
set(gca, 'FontSize', 18);

% tp1-ej3f
n = -2:8;
x_n = zeros(size(n));
signal = (n >= 0 & n <= 4);
x_n(signal) = 1;

% Par{x[n]}
x_even = (x_n + fliplr(x_n)) / 2;

% graficamos
figure;
stem(n, x_even);
xlabel('n');
ylabel('Par\{x[n]\}');
title('tp1-ej3e : Par\{x[n]\}');
grid on;
set(gca, 'FontSize', 18);

% combinados
% tp1-ej3e
n = -2:8;
x_n = zeros(size(n));
signal = (n >= 0 & n <= 4);
x_n(signal) = 1;

% Impar{x[n]}
x_odd = (x_n - fliplr(x_n)) / 2;

% Par{x[n]}
x_even = (x_n + fliplr(x_n)) / 2;

% en la misma figura
figure;
hold on;

stem(n, x_odd);
xlabel('n');
ylabel('Impar\{x[n]\}');

stem(n, x_even);
ylabel('Par\{x[n]\}');

grid on;
set(gca, 'FontSize', 18);

hold off;

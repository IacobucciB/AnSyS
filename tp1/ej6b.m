n = -1:7;
x_n = [0, 1, 1, 1, 1, 1, 0, 0, 0];

figure;
stem(n, x_n);
xlabel('n');
ylabel('x[n]');
title('Manejo de Senales VID : x[n]');
grid on;

xa = n + 1;
figure; 
stem(xa, x_n);
xlabel('n');
ylabel('x[n-1]');
title('Ejercicio 3 a) : x[n-1]');
grid on;
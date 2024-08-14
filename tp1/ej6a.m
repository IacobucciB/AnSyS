t = [-2:.001:8];

function h = tri1(t)
    % TRI1 senal del ejercicio 2 de la Practica 1
    h = (t+1).*(t >= -1 & t < 1) + (-t+3).*(t >= 1 & t < 3);
end

h = tri1(2*t-3);
plot(t,h)
grid on
title "TP1 - Ej6a"
xlabel "n"
ylabel "t[n]"
set(gca, 'FontSize', 18);

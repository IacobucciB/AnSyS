function plotCompleto(lim_ejes, eje_x, eje_y, titulo, tam_letra, col, grosor, t, x)
    % crear y maximizar la figura
    figure('units', 'normalized', 'outerposition', [0 0 1 1]);
    % graficar -> color, marcador y grosor
    plot(t, x, col, 'Linewidth', grosor);
    % limite de los ejes
    axis(lim_ejes);
    % grilla
    grid on;
    % tamaño de la letra para la leyenda y los ejes
    set(gca, 'FontSize', tam_letra);
    % nombre del eje_x
    xlabel(eje_x);
    % nombre del eje_y
    ylabel(eje_y);
    % titulo para el grafico
    title(titulo);
end
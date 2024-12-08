% Sistema Ejercicio Dos
function output = sys_canal(input)
    % Constantes para los retardos
    delay1 = 8820; % Retardo A
    delay2 = 17640; % Retardo B

    % Coeficientes de las respuestas al impulso h[A] y h[B]
    coeffA = -0.5; % h[A]
    coeffB = 0.25; % h[B]

    % Inicializamos la salida con ceros del mismo tamaño que la entrada
    output = zeros(size(input));

    % Calculamos la longitud de la señal de entrada
    inputLength = length(input);

    % Caso 1: No se aplica retardo (indices desde 1 hasta delay1)
    % La salida es igual a la entrada.
    output(1:delay1) = input(1:delay1);

    % Caso 2: Solo aplica el primer retardo (indices desde delay1+1 hasta delay2)
    % La salida es la entrada en esta región mas el efecto del retardo A.
    for i = delay1+1:delay2
        output(i) = input(i) + coeffA * input(i - delay1);
    endfor

    % Caso 3: Aplica el retardo A y el retardo B (indices desde delay2+1 en adelante)
    % La salida es la entrada en esta región más los efectos de ambos retardos.
    for i = delay2+1:inputLength
        output(i) = input(i) + coeffA * input(i - delay1) + coeffB * input(i - delay2);
    endfor
endfunction

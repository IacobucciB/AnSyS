% Respuesta en Frecuencia Sistema Dos
function ret = frf_sys_2(n)
  ret = 0.5 .* (1 - exp(-1i * 2 * pi * n));
endfunction

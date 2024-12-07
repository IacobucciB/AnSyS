% Respuesta en Frecuencia Sistema Cuatro
function ret = frf_sys_4(n)
  ret = (1 - exp(-1i * 2 * pi * n)) ./ (4 + 2 .* exp(-1i * 2 * n));
endfunction

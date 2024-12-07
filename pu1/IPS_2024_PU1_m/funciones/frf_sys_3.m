% Respuesta en Frecuencia Sistema Tres
function ret = frf_sys_3(n)
  ret = (1 + exp(-1i * 2 * pi * n)) ./ (4 - 2 .* exp(-1i * 2 * pi * n));
endfunction

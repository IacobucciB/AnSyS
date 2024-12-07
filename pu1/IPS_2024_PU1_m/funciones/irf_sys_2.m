% Respuesta Impulsional Sistema Dos
function ret = irf_sys_2(n)
  ret = 0.5 * (delta(n) - delta(n - 1));
endfunction

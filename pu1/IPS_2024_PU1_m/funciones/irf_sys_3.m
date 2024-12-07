% Respuesta Impulsional Sistema Tres
function ret = irf_sys_3(n)
  ret = 2.^(-n - 2) .* u_step(n) + 2.^(-n -1) .* u_step(n - 1);
endfunction

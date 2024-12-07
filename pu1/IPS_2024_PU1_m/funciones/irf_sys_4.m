% Respuesta Impulsional Sistema Cuatro
function ret = irf_sys_4(n)
  ret = (-0.5).^(n) .* (0.25 * u_step(n) + 0.5 * u_step(n - 1));
endfunction

% Sistema Unofunction y = sys_1(x)  y(1) = 0.5 * x(1);  for n = 2:length(x)    y(n) = 0.5 * x(n) + 0.5 * x(n-1);
  endfor
endfunction
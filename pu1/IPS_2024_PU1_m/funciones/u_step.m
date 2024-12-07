% Funcion Escalon Unitario
function ret = u_step(n)
    ret = zeros(size(n));
    ret(n >= 0) = 1;
end

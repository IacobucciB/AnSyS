% TFTDfunction TFTD_S = TFTD_senial(x, n, s)    TFTD_S = zeros(size(s));    for k = 1:length(s)        TFTD_S(k) = sum(x .* exp(-1i * 2 * pi * s(k) * n));    endend
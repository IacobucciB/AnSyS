function output = filter_3b(input)
    delay = 8820;     % Main delay value
    coeff = -0.5;     % Filter coefficient
    output = zeros(size(input));

    for idx = 1:length(input)
        output(idx) = input(idx);
        if idx >= delay + 1
            output(idx) = output(idx) - coeff * input(idx - delay);
        end
        if idx >= 3 * delay + 1
            output(idx) = output(idx) + coeff^3 * input(idx - 3 * delay);
        end
        if idx >= 4 * delay + 1
            output(idx) = output(idx) - coeff^4 * input(idx - 4 * delay);
        end
    end
end

function output = filter_2b(input)
    delay = 8820;     % Primary delay samples
    factor = -0.5;    % Coefficient
    output = zeros(size(input));

    for idx = 1:length(input)
        output(idx) = input(idx);
        if idx >= delay + 1
            output(idx) = output(idx) - factor * input(idx - delay);
        end
        if idx >= 3 * delay + 1
            output(idx) = output(idx) + factor^3 * input(idx - 3 * delay);
        end
    end
end

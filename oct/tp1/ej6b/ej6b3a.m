n = -1:7
x_n = zeros(size(n))
signal = (n >= 0 & n <= 4)
x_n(signal) = 1
stem(n,x_n)

grid on
hold on
set(gca, 'FontSize', 18);

n = -1:7
x_n = zeros(size(m))
signal = (n-1 >= 0 & n-1 <= 4)
x_n(signal) = 1
stem(n,x_n)



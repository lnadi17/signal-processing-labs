function y = lab1_h1(x, N)
    y = zeros(1, N);
    y(1) = x(1);
    for n = 2:N
        y(n) = x(n) - x(n - 1);
    end
end
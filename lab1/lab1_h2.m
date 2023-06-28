function y = lab1_h2(x, N)
    y = zeros(1, N);
    y(1) = x(1);
    for n = 2:N
        y(n) = y(n - 1) + x(n);
    end
end
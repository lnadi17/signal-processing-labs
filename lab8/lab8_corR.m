function out = corR(X, Y, m)
    N = length(X);

    if m >= 0
        up = N - m - 1;
        s = 0;
        for n = 0:up
            s = s + X(n + 1) * Y(n + m + 1);
        end
        out = 1./(N - m)*s;
    end

    if m < 0
        up = N - 1;
        s = 0;
        for n = abs(m):up
            s = s + X(n + 1) * Y(n + m + 1);
        end
        out = 1./(N - abs(m))*s;
    end
end

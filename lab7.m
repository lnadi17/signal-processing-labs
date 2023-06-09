function signalebi(N)
    randoms = randn(1, N);
    figure;
    plot(randoms);

    function display_values(x)
        miu = mean(x);
        sigma = var(x);
        disp(miu);
        disp(sigma);
    end

    display_values(randoms);
    y = randoms * 3 + 3;
    display_values(y);
    
    t = -1:0.001:2;
    function F = empcdf(X, t)
        F = zeros(length(t));
        for i = 1:length(t)
            F(i) = sum(X < t(i));
        end
        F = F / length(X);
    end
    F1 = empcdf(randn(1, 20), t);
    F2 = empcdf(randn(1, 200), t);
    figure;
    plot(t, F1);
    figure;
    plot(t, F2);
    
    x1 = -log(1-rand(1, 20))./3;
    x2 = -log(1-rand(1, 200))./3;
    F1 = empcdf(x1, t);
    F2 = empcdf(x2, t);
    figure;
    plot(t, F1);
    figure;
    plot(t, F2);
    hold on;
    plot(t, (1-exp(-3.*t)).*heaviside(t));
    hold off;
end

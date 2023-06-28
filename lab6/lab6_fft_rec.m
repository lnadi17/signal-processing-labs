function X = lab6_fft_rec(x)
    N = length(x);

    % Base case
    if N == 2
        X(1) = x(1) + x(2);
        X(2) = x(1) - x(2);
        return;
    end

    x1 = x(1:2:N-1); % Even
    x2 = x(2:2:N); % Odd
    X1 = lab6_fft_rec(x1);
    X2 = lab6_fft_rec(x2);
    X = zeros(1, N);
    for k = 0:N/2-1
        Wnk = exp(-1j*2*pi*k/N);
        X(k+1) = X1(k+1) + Wnk * X2(k+1);
        X(k+1+N/2) = X1(k+1) - Wnk * X2(k+1);
    end
end
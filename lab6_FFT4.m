function X = lab6_FFT4(x)
    x1 = x(1:2:3); % Even
    x2 = x(2:2:4); % Odd
    X1 = lab6_FFT2(x1);
    X2 = lab6_FFT2(x2);
    X = zeros(1, 4);
    for k = 0:1
        Wnk = exp(-1j*2*pi*k/4);
        X(k+1) = X1(k+1) + Wnk * X2(k+1);
        X(k+1+2) = X1(k+1) - Wnk * X2(k+1);
    end
end
function X = lab6_FFT8(x)
    x1 = x(1:2:7); % even
    x2 = x(2:2:8); % odd
    X1 = lab6_FFT4(x1);
    X2 = lab6_FFT4(x2);
    X = zeros(1, 8);
    for k = 0:3
        Wnk = exp(-1j*2*pi*k/8);
        X(k+1) = X1(k+1) + Wnk * X2(k+1);
        X(k+1+4) = X1(k+1) - Wnk * X2(k+1);
    end
end
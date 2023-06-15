function [X, w] = lab6_DFTsamples(x)
    N = length(x);
    k = 0:N-1;
    w = 2*pi*k/N;
    w(w >= pi) = w(w >= pi) - 2*pi;
    w = fftshift(w);
    X = lab5_DFTsum(x);
    X = fftshift(X);
end
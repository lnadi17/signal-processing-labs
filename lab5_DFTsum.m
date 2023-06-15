function X = lab5_DFTsum(x)
    N = length(x);
    X = zeros(1, N);
    n = 0:N-1;
    for k=0:N-1
        X(k+1) = sum(x.*exp(-1j*2*pi/N*k.*n));
    end
end
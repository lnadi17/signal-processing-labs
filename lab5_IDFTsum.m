function x = lab5_IDFTsum(X)
    N = length(X);
    x = zeros(1, N);
    k = 0:N-1;
    for n=0:N-1
        x(n+1) = 1/N*sum(X.*exp(1j*2*pi/N.*k*n));
    end
end
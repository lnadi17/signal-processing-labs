function A = lab5_DFTmatrix(N)
    A = zeros(N, N);
    for k = 1:N
        for n = 1:N
            A(k, n) = exp(-1j*2*pi*(k-1)*(n-1)/N);
        end
    end
end
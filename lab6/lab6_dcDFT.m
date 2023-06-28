function X = lab6_dcDFT(x)
    N = length(x);
    g = x(1:2:N-1);
    h = x(2:2:N);
    G = lab5_DFTsum(g);
    H = lab5_DFTsum(h);
    X = zeros(1, N);
    for k = 0:N/2-1
        Wnk = exp(-1j*2*pi*k/N);
        X(k+1) = G(k+1) + Wnk .* H(k+1);
        X(k+1 + N/2) = G(k+1) - Wnk .* H(k+1);
    end
end
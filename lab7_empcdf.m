function F = lab7_empcdf(X, t)
    F = zeros(length(t));
    for i = 1:length(t)
        F(i) = sum(X < t(i));
    end
    F = F / length(X);
end
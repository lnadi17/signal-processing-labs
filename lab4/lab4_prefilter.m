function h = lab4_prefilter(w, alpha)
    z = exp(-1j*w);
    h = (alpha(1) + alpha(2) * z + alpha(3) * z .^ 2) ...
        ./ (1 + alpha(4) * z + alpha(5) * z .^ 2);
end
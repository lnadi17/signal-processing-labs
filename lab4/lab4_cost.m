function cost = lab4_cost(alpha)
    w = -pi:0.01:pi;
    Hid = abs(w) <= pi/2;
    Ha = lab4_prefilter(w, alpha);
    cost = sum((abs(Hid) - abs(Ha)) .^ 2);
end

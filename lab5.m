x = -20:20;
L = 11;
w = abs(x - (L-1)/2) <= (L-1)/2;
figure
stem(x, w);
title('Input Signal');

%%

% Hand-calculated DTFT (Example 4.14)
x = -pi:0.01:pi;
X = exp(-1j*x*(L-1)./2).*sin(x*L./2)./sin(x./2);
figure
hold on
plot(x, abs(X));

% Computer-calculated DTFT
stem(linspace(-pi, pi, 128), fftshift(abs(fft(w, 128))));
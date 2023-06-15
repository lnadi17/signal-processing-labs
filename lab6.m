x = hamming(20)';
X = lab5_DFTsum(x);
figure
stem(0:19, abs(X));

%%

[X, w] = lab6_DFTsamples(x);
figure
stem(w, abs(X));
xlim([-pi pi]);

%%

n = 0:49;
x = sin(0.1*pi*n);

[X, w] = lab6_DFTsamples(x);

figure
subplot(2, 1, 1);
plot(w, abs(X));

% Observe the effect of zero-padding
subplot(2, 1, 2);
x = [x zeros(1, 150)];
[X, w] = lab6_DFTsamples(x);
plot(w, abs(X));

%%


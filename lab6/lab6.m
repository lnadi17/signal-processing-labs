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

N = 10;
n = 0:N-1;
x1 = n == 0;
x2 = ones(1, N);
x3 = exp(1j*2*pi*n/10);
x4 = cos(2*pi*n/10);

figure
subplot(2, 2, 1);
stem(n, abs(lab6_dcDFT(x1)));
xlim([0 9]);
subplot(2, 2, 2);
stem(n, abs(lab6_dcDFT(x2)));
xlim([0 9]);
subplot(2, 2, 3);
stem(n, abs(lab6_dcDFT(x3)));
xlim([0 9]);
subplot(2, 2, 4);
stem(n, abs(lab6_dcDFT(x4)));
xlim([0 9]);

%%

N = 16;
n = 0:N-1;
x1 = n == 0;
x2 = ones(1, N);
x3 = exp(1j*2*pi*n/10);
x4 = cos(2*pi*n/10);

figure
subplot(2, 2, 1);
stem(n, abs(lab6_fft_rec(x1)));
subplot(2, 2, 2);
stem(n, abs(lab6_fft_rec(x2)));
subplot(2, 2, 3);
stem(n, abs(lab6_fft_rec(x3)));
subplot(2, 2, 4);
stem(n, abs(lab6_fft_rec(x4)));
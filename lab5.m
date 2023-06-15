x = -20:20;
L = 11;
w = abs(x - (L-1)/2) <= (L-1)/2;
figure
stem(x, w);
title('Input Signal');

%%

% Hand-calculated DTFT (Example 4.14 from book 3)
x = -pi:0.01:pi;
X = exp(-1j*x*(L-1)./2).*sin(x*L./2)./sin(x./2);
figure
hold on
plot(x, abs(X));

% Computer-calculated DTFT
stem(linspace(-pi, pi, 128), fftshift(abs(fft(w, 128))));

%%

W = X; w = x;
figure
subplot(2, 1, 1);
plot(w, abs(W));
subplot(2, 1, 2);
plot(w, angle(W));

%%

% Plot given cosine function for one period
N = 8;
n = 0:N-1;
t = 0:0.01:N-1;
x = cos(pi/4*n);

figure
hold on
stem(n, x);
% Plot the two frequencies that we found in the next section
plot(t, cos(2*pi/N*1*t));
plot(t, cos(2*pi/N*7*t));

%%

% Calculate DTFT of the whole signal and plot it for one period
C = zeros(1, N);
for k=0:N-1
    C(k+1) = 1/N*sum(x.*exp(-1j*2*pi/N*k.*n));
end

% This gives 2*pi/N and 2*pi*7/N frequencies
figure
stem(0:N-1, abs(C)); 

%%

% Take DTFT of the windowed function
N = 20;
n = 0:N-1;
x = cos(pi/4*n);
figure
subplot(2, 1, 1);
stem(n, x);
subplot(2, 1, 2);
[X, w] = DTFT(x, 512);
plot(w, abs(X));

%%

wnd = 0.54-0.46*cos(2*pi*n/(N-1));
x = x.*wnd;
figure
subplot(2, 1, 1);
stem(n, x);
subplot(2, 1, 2);
[X, w] = DTFT(x, 512);
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
stem(n, abs(lab5_DFTsum(x1)));
xlim([0 9]); ylim([0 1]);
subplot(2, 2, 2);
stem(n, abs(lab5_DFTsum(x2)));
xlim([0 9]); ylim([0 1]);
subplot(2, 2, 3);
stem(n, abs(lab5_DFTsum(x3)));
xlim([0 9]); ylim([0 1]);
subplot(2, 2, 4);
stem(n, abs(lab5_DFTsum(x4)));
xlim([0 9]); ylim([0 1]);

%%

% Take IDFT of DFTs and confirm that they are equal to the original signals
figure
subplot(2, 2, 1);
stem(n, real(lab5_IDFTsum(lab5_DFTsum(x1))));
xlim([0 9]);
subplot(2, 2, 2);
stem(n, real(lab5_IDFTsum(lab5_DFTsum(x2))));
xlim([0 9]);
subplot(2, 2, 3);
hold on
stem(n, real(lab5_IDFTsum(lab5_DFTsum(x3))));
stem(n, imag(lab5_IDFTsum(lab5_DFTsum(x3))));
legend('Real', 'Imag');
xlim([0 9]);
subplot(2, 2, 4);
stem(n, real(lab5_IDFTsum(lab5_DFTsum(x4))));
xlim([0 9]);

%%



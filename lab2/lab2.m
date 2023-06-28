w = -pi:0.01:pi;
a1 = pi/6; a2 = pi/3; a3 = pi/2;
H1 = 1 - 2*exp(-1j*w)*cos(a1) + exp(-2j*w);
H2 = 1 - 2*exp(-1j*w)*cos(a2) + exp(-2j*w);
H3 = 1 - 2*exp(-1j*w)*cos(a3) + exp(-2j*w);

figure
subplot(3, 1, 1);
plot(w, abs(H1));
xlim([-pi pi])
title('H1');

subplot(3, 1, 2);
plot(w, abs(H2));
xlim([-pi pi])
title('H2');

subplot(3, 1, 3);
plot(w, abs(H3));
xlim([-pi pi])
title('H3');

%%

[x, Fs] = audioread('gala_sin.wav');
x = x(:, 1);
sound(x, Fs);

%%

figure
t = 0:1/Fs:200/Fs;
hold on
plot(t, x(1:201)); %  lambda = 0.0022 -> f = 440 Hz
plot(t, 0.6*sin(440*2*pi*t));
legend('Audio', 'Approximation');

%%

[X, w] = DTFT(x, 0);
figure
plot(w, abs(X));

%%

[X_max, l_max] = max(abs(X));
disp(abs(w(l_max))/pi/2*Fs)

%%

y = filter([1 -2*cos(2*pi*440/Fs) 1], [1 0 0], x);

[Y, w] = DTFT(y, 0);
figure
plot(w, abs(Y));
sound(y);

%%

fvtool(tf2sos([1 -2*cos(2*pi*440/Fs) 1], [1 0 0]));

%%

r1 = 0.99; r2 = 0.9; r3 = 0.7;
w = -pi:0.01:pi;
H = @(r) (1 - r) ./ (1 - 2*r*cos(pi/3)*exp(-1j*w) + r^2 * exp(-2j*w));

figure
subplot(3, 1, 1);
plot(w, abs(H(r1)));
title('r = 0.99');

subplot(3, 1, 2);
plot(w, abs(H(r2)));
title('r = 0.9');

subplot(3, 1, 3);
plot(w, abs(H(r3)));
title('r = 0.7');

%%

load('pcm.mat');
x = pcm; Fs = 8000;
sound(x, Fs);

%%

[X, w] = DTFT(x(100:200), 1024);
plot(w, abs(X));

%%

theta = 2*pi*3146/Fs;
r = 0.995;
[X, w] = DTFT(x, 0);
H = (1 - r) ./ (1 - 2*r*cos(theta)*exp(-1j*w) + r^2 * exp(-2j*w));
Y = X .* H;
plot(w, abs(Y));
xlim([theta-0.02 theta+0.02])

%%

% Had to multiply by 20 hear the sound clearly
x = 20*real(ifft(Y)); 
sound(x, Fs);

%%

load('nspeech.mat')
x = nspeech2; Fs = 8000;
sound(x, Fs);

%%

M1 = 7; M2 = 21; M3 = 101;
N = @(m) 2*m + 1;
N1 = N(M1); N2 = N(M2); N3 = N(M3);
n1 = 0:N1-1; n2 = 0:N2-1; n3 = 0:N3-1;

h1 = 2/pi*sinc(2/pi*(n1 - (N1-1)/2));
h2 = 2/pi*sinc(2/pi*(n2 - (N2-1)/2));
h3 = 2/pi*sinc(2/pi*(n3 - (N3-1)/2));

figure
hold on
plot(abs(DTFT(h1, 1024)));
plot(abs(DTFT(h2, 1024)));
plot(abs(DTFT(h3, 1024)));
xlim([0 1024]);

%%

y1 = conv(h1, x);
y2 = conv(h2, x);
y3 = conv(h3, x);

%%

sound(10*y1, Fs);

%%

sound(10*y2, Fs);

%%

sound(10*y3, Fs);

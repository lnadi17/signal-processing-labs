figure
hold on

n = 0:0.1:10;
y = sin(pi*n);
stem(n, y);

n = 0:0.01:10;
y = sin(pi*n);
plot(n, y);
title('sin(\pin), step size = 0.1'); xlabel('n'); ylabel('sin(pi n)');

%%

figure
subplot(2, 1, 1);
t = -10*pi:0.01:10*pi;
f = sin(pi*t)./(pi*t);
plot(t, f); xlim([-10*pi 10*pi]);

t = -2:0.01:2;
y = abs(t) <= 0.5;
subplot(2, 1, 2);
plot(t, y);

%%

figure
n = -10:50;
u = n >= 0;
a1 = -3; a2 = -1; a3 = 1; a4 = 3;
f1 = a1 * (u - (n >= 5));
f2 = a2 * (u - (n >= 5));
f3 = a3 * (u - (n >= 5));
f4 = a4 * (u - (n >= 5));

g1 = a1 * u .* cos(pi/4*n);
g2 = a2 * u .* cos(pi/4*n);
g3 = a3 * u .* cos(pi/4*n);
g4 = a4 * u .* cos(pi/4*n);

subplot(4, 2, 1);
stem(f1);
title('f1');
subplot(4, 2, 2);
stem(f2);
title('f2');
subplot(4, 2, 3);
stem(f3);
title('f3');
subplot(4, 2, 4);
stem(f4);
title('f4');

subplot(4, 2, 5);
stem(g1);
title('g1');
subplot(4, 2, 6);
stem(g2);
title('g2');
subplot(4, 2, 7);
stem(g3);
title('g3');
subplot(4, 2, 8);
stem(g4);
title('g4');

%%

T1 = 0.1; T2 = 0.001;
x = @(t) sin(pi*t);
t1 = -pi:T1:pi;
t2 = -pi:T2:pi;

diff1 = zeros(1, length(t1));
for i = 2:length(t1)
    diff1(i) = (x(t1(i)) - x(t1(i - 1)))/T1;
end

diff2 = zeros(1, length(t2));
for i = 2:length(t2)
    diff2(i) = (x(t2(i)) - x(t2(i - 1)))/T2;
end

figure
hold on
stem(t1, diff1);
plot(t2, diff2);
title('diff(sin(\pit))')

%%

x1 = [1 zeros(1, 19)];
x2 = x1;
h1 = lab1_h1(x1, 20);
h2 = lab1_h2(x2, 20);
h12 = lab1_h1(h2, 20);
h21 = lab1_h2(h1, 20);
h1p2 = h1 + h2;

figure
hold on
subplot(5, 1, 1);
stem(h1);
title('H1');
subplot(5, 1, 2);
stem(h2);
title('H2');
subplot(5, 1, 3);
stem(h12);
title('H12');
subplot(5, 1, 4);
stem(h21);
title('H21');
subplot(5, 1, 5);
stem(h1p2);
title('H1 + H2');

%%

[x_audio, Fs] = audioread('Look_around_mono.wav');
sound(x_audio, Fs);

%%

x1 = x_audio';
y1 = lab1_h1(x1, length(x1));
sound(y1, Fs);

%%
x2 = x1;
y2 = lab1_h2(x2, length(x2));
sound(y2, Fs);

%%

w = 0:0.01:pi;
H1 = 1 - exp(-1j*w);
H2 = 1 ./ H1;

figure
subplot(2, 2, 1);
plot(w, abs(H1));
xlim([0 pi])
title('H1')

subplot(2, 2, 2);
plot(w, abs(H2));
xlim([0 pi])
title('H2')

subplot(2, 2, 3);
hold on
pspectrum(y1);
pspectrum(x1);
legend('Filtered', 'Original')
title('Y1')

subplot(2, 2, 4);
hold on
pspectrum(y2);
pspectrum(x1);
legend('Filtered', 'Original')
title('Y2')


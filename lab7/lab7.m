%%
N = 1000;
randoms = randn(1, N);
figure;
plot(randoms);
lab7_miuvar(randoms);

%%

y = randoms * 3 + 3;
lab7_miuvar(y);

t = -1:0.001:2;

F1 = lab7_empcdf(randn(1, 20), t);
F2 = lab7_empcdf(randn(1, 200), t);
figure;
plot(t, F1);
figure;
plot(t, F2);

%%

x1 = -log(1-rand(1, 20))./3;
x2 = -log(1-rand(1, 200))./3;
F1 = lab7_empcdf(x1, t);
F2 = lab7_empcdf(x2, t);
figure;
plot(t, F1);
figure;
plot(t, F2);
hold on;
plot(t, (1-exp(-3.*t)).*heaviside(t));
hold off

%%

t = 0:0.01:1;
cdf = t.^3;
pdf = 3*t.^2;

figure
subplot(3, 1, 1)
plot(t, cdf);
title('CDF')

subplot(3, 1, 2)
plot(t, pdf);
title('PDF')

L = 20; x0 = 0; xl = 1;
delta = (xl - x0)/L;
F = @(x) x.^3;
f = zeros(1, L);

x = x0:delta:xl;
for i = 2:L+1
    f(i) = F(x(i)) - F(x(i - 1));
end

subplot(3, 1, 3)
hold on
stem(f)

U = rand(1, 1000);
X = U.^(1/3);
H = hist(X, x);

stem(H/1000);
xlim([0, L + 1])
ylim([0, 0.2])
legend('Theory', 'Approximation')
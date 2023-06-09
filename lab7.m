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

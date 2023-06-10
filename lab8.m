x = randn(1, 1000);
y = randn(1, 1000);

z1 = y;
z2 = (x + y)/2;
z3 = (4*x + y)/5;
z4 = (99*x + y)/100;

figure
subplot(2, 2, 1);
plot(x, z1, 'x');

subplot(2, 2, 2);
plot(x, z2, 'x');

subplot(2, 2, 3);
plot(x, z3, 'x');

subplot(2, 2, 4);
plot(x, z4, 'x');

roxz1 = corr(x', z1');
roxz2 = corr(x', z2');
roxz3 = corr(x', z3');
roxz4 = corr(x', z4');

%%

a = [1 0 0];
b = [1 -1 1];
f = filter(b, a, x);

figure
subplot(2, 2, 1);
plot(f, circshift(f, [0, -1]), 'x');

subplot(2, 2, 2);
plot(f, circshift(f, [0, -2]), 'x');

subplot(2, 2, 3);
plot(f, circshift(f, [0, -3]), 'x');

subplot(2, 2, 4);
plot(f, circshift(f, [0, -4]), 'x');

%%

N = length(f);
ryy = zeros(1, 41);
for m = -20:1:20
    up = N - abs(m) - 1;
    s = 0;
    for n = 1:(up + 1)
        s = s + f(n)*f(n + abs(m));
    end
    ryy(m + 21) = 1./(N-abs(m))*s;
end
figure
stem(ryy);

%%

load('radar.mat');

Xn = randn(1, 1000);
Zn = randn(1, 1000);
Yn = Xn + Zn;

cors = zeros(1, 21);
for m = -10:1:10
    cors(m + 11) = lab8_corR(Xn, Yn, m);
end

figure
stem(cors);
%%

N = 21;
N_DTFT = 1024;
n = 0:1:(N-1);
n_dtft = 0:1:(N_DTFT-1);

% Hanning
sq = ones(1, N);
han = 0.5 - 0.5*cos(2*pi*n/(N-1));
ham = 0.54 - 0.46*cos(2*pi*n/(N-1));
black = 0.42 - 0.5*cos(2*pi*n/(N-1)) + 0.08*cos(4*pi*n/(N-1));

sq_dtft = DTFT(sq, N_DTFT);
han_dtft = DTFT(han, N_DTFT);
ham_dtft = DTFT(ham, N_DTFT);
black_dtft = DTFT(black, N_DTFT);

figure('Name', 'Window Functions');
subplot(2,2,1)
plot(n,sq)
title('Subplot 1: Square')

subplot(2,2,2)
plot(n,han)
title('Subplot 2: Hanning')

subplot(2,2,3)
plot(n,ham)
title('Subplot 3: Hamming')

subplot(2,2,4)
plot(n,black)
title('Subplot 4: Blackman')

%%

figure('Name', 'Window Function DTFTs');
subplot(2,2,1)
plot(n_dtft, abs(sq_dtft))
title('Subplot 1: Square')

subplot(2,2,2)
plot(n_dtft, abs(han_dtft))
title('Subplot 2: Hanning')

subplot(2,2,3)
plot(n_dtft, abs(ham_dtft))
title('Subplot 3: Hamming')

subplot(2,2,4)
plot(n_dtft, abs(black_dtft))
title('Subplot 4: Blackman')

%%

figure('Name', 'Window Function DTFTs (dB)');
subplot(2,2,1)
plot(n_dtft, db(abs(sq_dtft)))
title('Subplot 1: Square')

subplot(2,2,2)
plot(n_dtft, db(abs(han_dtft)))
title('Subplot 2: Hanning')

subplot(2,2,3)
plot(n_dtft, db(abs(ham_dtft)))
title('Subplot 3: Hamming')

subplot(2,2,4)
plot(n_dtft, db(abs(black_dtft)))
title('Subplot 4: Blackman')

%%

wc = 0.6*pi;
h_rect = wc/pi*sinc(wc/pi*(n-(N-1)/2));
h = h_rect.*ham;

figure('Name', 'Custom Hamming Filter');
subplot(2,1,1)
stem(n, h)
title('Subplot 1: Impulse Respone')

subplot(2,1,2)
plot(n_dtft, db(abs(DTFT(h, N_DTFT))))
xlim([0 1000])
title('Subplot 2: Impulse Response DTFT (dB)')

%%

figure('Name', 'Kaiser Functions for different Betas');
subplot(3,3,1)
plot(n, kaiser(N, 0))
title('Beta = 0')

subplot(3,3,2)
plot(n, kaiser(N, 1))
title('Beta = 1')

subplot(3,3,3)
plot(n, kaiser(N, 5))
title('Beta = 5')

subplot(3,3,4)
plot(n_dtft, abs(DTFT(kaiser(N, 0), N_DTFT)))
title('DTFT Beta = 0')

subplot(3,3,5)
plot(n_dtft, abs(DTFT(kaiser(N, 1), N_DTFT)))
title('DTFT Beta = 1')

subplot(3,3,6)
plot(n_dtft, abs(DTFT(kaiser(N, 5), N_DTFT)))
title('DTFT Beta = 5')

%%

% Load nspeech and listen to it
load('nspeech.mat')
sound(nspeech2, 8000);

%% 

% Create Custom Kaiser Filter
wp = 1.8;
wc = 2.0;
ws = 2.2;
dp = 0.05;
ds = 0.005;
d = min(dp, ds);
A = -db(d);
kaiser_N = ceil(1 + (A-8)/(2.285*(ws-wp)));
kaiser_beta = 0.5842*(A-21)^(0.4)+0.07886*(A-21);

figure('Name', 'Custom Kaiser Function');
kaiser_n = 0:1:(kaiser_N-1);
h_rect = wc/pi*sinc(wc/pi*(kaiser_n-(kaiser_N-1)/2));
kaiser_h = h_rect .* kaiser(kaiser_N, kaiser_beta)';
x = linspace(-pi, pi, N_DTFT);
plot(x, abs(DTFT(kaiser_h, N_DTFT)));

%%

% Filter nspeech2 with custom Kaiser filter
y = filter(kaiser_h, 1, nspeech2);
sound(y, 8000);

%%

% Filter nspeech2 with Custom Parks-McClellan filter
f = [1.8 2.2];
m = [1 0];
ripple = [0.05 0.005];
[no, fo, mo, w] = firpmord(f, m, ripple, 2*pi);
b = firpm(no, fo, mo, w);
y2 = filter(b, 1, nspeech2);
sound(y2, 8000);
r = roots([1 -1 1]);
disp(r);
% Use these roots in pezdemo

%%

r = roots([1 1 1 1 1 1]);
disp(r);
% Use these roots in pezdemo

%%

r = roots([1 0 0 0 0 0 -1]);
disp(r);
% Use these roots in pezdemo

%%

r = roots([1 0 -1]);
p = roots([1 0.8 0.64]);
disp(r);
disp(p);
% Use r as poles and p as poles in pezdemo

%%

r = roots([64 80 100]);
p = roots([1 0.8 0.64]);
disp(r);
disp(p);
% Use r as poles and p as poles in pezdemo

%%

% Calculate notch filter poles and zeros for theta = pi/4 and r = 0.95
r = roots(poly([exp(1j*pi/4) exp(-1j*pi/4)]));
p = roots(poly([0.95*exp(1j*pi/4) 0.95*exp(-1j*pi/4)]));
disp(r);
disp(p);
% Now use these roots and poles in pezdemo

%%

% Find h using filter
b = poly([exp(1j*pi/4) exp(-1j*pi/4)]);
a = poly([0.95*exp(1j*pi/4) 0.95*exp(-1j*pi/4)]);
h = filter(b, a, [0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
stem(h);

%%

[x, Fs] = audioread('gala_sin.wav');
x = x(:, 1);
sound(x, Fs);

%%

b = poly([exp(1j*2*pi*440/Fs) exp(-1j*2*pi*440/Fs)]);
a = poly([0.95*exp(1j*2*pi*440/Fs) 0.95*exp(-1j*2*pi*440/Fs)]);
y = filter(b, a, x);
sound(y, Fs);

%%

fvtool(tf2sos(b, a));

%%

% Start creating musical note detector
[x, Fs] = audioread('Note08.wav');
sound(x, Fs);
pspectrum(x, Fs);

%%

% NOTE: This detection method works for some notes but it isn't perfect
[note, freq] = lab3_noteDetect(x, Fs);
disp(note);
disp(freq);

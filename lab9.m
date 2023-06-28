w = imread('cameraman.tif');

figure
imshow(w);
impixelinfo

%%

c = imread('moon.tif');
cd = double(c);
imshow(c)
figure
imshow(cd);

%%

imshow(cd/255);

%%

imshow(cd/1023);

%%

imshow(cd/127);

%%

c = imread('tire.tif');
figure
subplot(2, 2, 1);
imshow(c);
subplot(2, 2, 2);
imshow(imresize(c, 1/2));
subplot(2, 2, 3);
imshow(imresize(c, 1/8));
subplot(2, 2, 4);
imshow(imresize(c, 1/32));

%%

b = imread('rice.png');
b1 = imadd(b, 128);
b2 = imsubtract(b, 128);
figure
subplot(3, 1, 1);
imshow(b);
subplot(3, 1, 2);
imshow(b1);
subplot(3, 1, 3);
imshow(b2);

%%

B = imread('rice.png');
xc = imcomplement(b);
imshow(xc);

%%

c = imread('pout.tif');
figure
imshow(c);
figure

%%

ch = histeq(c);
figure
imshow(ch);
figure
imhist(ch);

%%

r = imread('rice.png');
figure
imshow(r);
figure
imshow(r > 120);

%%

c = imread('cameraman.tif');
f1 = fspecial('average');
cf1 = filter2(f1, c);
figure
imshow(c);
figure
imshow(cf1/255);

%%

f1 = fspecial('average', 16);
cf1 = filter2(f1, c);
figure
imshow(cf1/255);

%%

h = [1 -2 1; -2 4 -2; 1 -2 1];
f = imfilter(c, h);
figure
imshow(f);

%%

g1 = fspecial('gaussian', [5, 5]);
g2 = fspecial('gaussian', [5, 5], 2);
g3 = fspecial('gaussian', [11, 11], 2);
g4 = fspecial('gaussian', [11, 11], 5);
figure
imshow(filter2(g1, c)/256);
figure
imshow(filter2(g2, c)/256);
figure
imshow(filter2(g3, c)/256);
figure
imshow(filter2(g4, c)/256);

%%

c = imread('rice.png');
h = [-1 0 1; -2 0 2; -1 0 1];
imshow(filter2(h, c)/256);

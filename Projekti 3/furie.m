pkg load statistics
pkg load image

img = imread('lena.tif');
img = im2double(img);

##shtojme zhurmen ne imazh
noisyimg = img + zhurma('rayleigh', 1, 1, size(img,1), size(img,2), 1, 0, 0.1);

## kthehet imazhi nga domeni hapsinore ne ate te frekuences
F = fft2(noisyimg);

## krijohet nje rrjet koordinatash per frekuenca
[X,Y] = meshgrid(1:size(noisyimg,2),1:size(noisyimg,1));

##behet llogaritja e frekuencave hapsinore
S = 25*cos((pi*X)/4+(pi*Y)/3) + 10*sin((pi*X)/2+(pi*Y)/9);
##Behet nderrimi i vendeve te frekuencave me ane te funksionit fftshift.
S_shifted = fftshift(S);

##shumezojme transformimin e Furie me frekuencat e gjetura me lart
Multiplication = F .* S_shifted;

## bejme transformimin invers Furie te imazhit
inv = ifft2(Multiplication);
subplot(1,2,1), imshow(img), title('Imazhi origjinal');
subplot(1,2,2), imshow(inv, []), title('Imazhi i krijuar');


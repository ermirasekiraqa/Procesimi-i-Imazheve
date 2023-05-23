function H = filteri(M, N, u0, v0, d0, n)
  ## Creating the grid for frequencies
  [U, V] = meshgrid(1:N, 1:M);

  ## Calculating distances from the center for each frequency
  D1 = sqrt((U - (M/2+u0)).^2 + (V - (N/2+v0)).^2);
  D2 = sqrt((U - (M/2-u0)).^2 + (V - (N/2-v0)).^2);

  ## Filter function
  H = 1 ./ (1 + (d0 ./ (D1 .* D2)).^n);
end

img = imread('C:\Users\Pulse Electronics\OneDrive\Desktop\Detyra3\lena.tif');
img = im2double(img);

## Fourier transform
F = fftshift(fft2(img));

## Define parameters
u0 = 50;
v0 = 70;
d0 = 20;
n = 3;

## Apply the custom filter
H = filteri(size(img,1), size(img,2), u0, v0, d0, n);

## Apply the filter in the frequency domain
G = F .* H;

## Inverse Fourier transform
g = real(ifft2(ifftshift(G)));

## Display the original image and the filtered image side by side
subplot(1, 2, 1), imshow(img), title('Imazhi origjinal');
subplot(1, 2, 2), imshow(g), title('Imazhi i filtruar');

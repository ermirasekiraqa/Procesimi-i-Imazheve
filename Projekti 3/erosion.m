## Marrim foton origjinale
original_img = imread('original_image.png');

## kthejme foton nga formati RGB ne grayscale
 original_img = rgb2gray(original_img);
pkg load image

## Kthejme foton ne formatin binar
original_img = im2bw(original_img, 0.5);

## elementi strukturor ne formen katrore me 26 pixel ne te dy anet
se = strel('square',26);

## perdorim erosionin me elementin e krijuar me lart
output_img = imerode(original_img, se);

## shfaqim imazhet
subplot(1,2,1), imshow(I), title('Imazhi origjinal');
subplot(1,2,2), imshow(output_img), title('Imazhi i krijuar');



function ArithmeticOperations (input1, input2)
  img1 = rgb2gray(input1);
  img2 = rgb2gray(input2);

  img1 = im2double(img1);
  img2 = im2double(img2);

  choice = input('1: Add 2: Subtract 3: Multiply 4: Divide Enter your choice: ');

  switch choice
    case 1
      img = img1 + img2;
      subplot(1, 3, 1), imshow(img1), title('Image 1');
      subplot(1, 3, 2), imshow(img2), title('Image 2');
      subplot(1, 3, 3), imshow(img), title('Image after addition');
    case 2
      img = img1 - img2;
      subplot(1, 3, 1), imshow(img1), title('Image 1');
      subplot(1, 3, 2), imshow(img2), title('Image 2');
      subplot(1, 3, 3), imshow(img), title('Image after subtraction');
    case 3
      img = img1 .* img2;
      subplot(1, 3, 1), imshow(img1), title('Image 1');
      subplot(1, 3, 2), imshow(img2), title('Image 2');
      subplot(1, 3, 3), imshow(img), title('Image after multiplication');
    case 4
      img = img1 ./ img2;
      subplot(1, 3, 1), imshow(img1), title('Image 1');
      subplot(1, 3, 2), imshow(img2), title('Image 2');
      subplot(1, 3, 3), imshow(img), title('Image after division');
    otherwise
      error('Wrong choice');
  endswitch
endfunction

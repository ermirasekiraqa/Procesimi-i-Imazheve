function retval = F2 (I, p, N)
  ## Kontrollo nese N eshte numer cift apo numer negativ
  if(rem(N, 2) == 0 || N < 0)
    error('Nuk lejohet vlera e dhene per N!');
  endif

  ## Krijo matricen I2 identike me matricen I
  I2 = I(1:rows(I), 1:columns(I));

  ## Qendra e pare e filterit
  x = N/2 + 0.5;
  ## Kufiri per qendren e fundit te filterit
  y = N/2 - 0.5;

  for i = x:(rows(I) - y)
    for j = x:(columns(I) - y)
      ## Krijo matricen A me qender (i, j)
      A = I((i - y):(i + y), (j - y):(j + y));

      ## Kthe matricen A ne varg
      A = A'(:);

      ## Cakto kufirin e siperm te shumes
      limit = N * N - p;

      ## Mbledh termat e vargut A nga p deri ne limit
      sumA = sum(A(p:limit));

      ## Llogarit vleren f2
      f2 = sumA / (N * N - 2 * p);

      ## Rrumbullako vleren f2 dhe vendose ne poziten (i, j) ne matricen I2
      I2(i, j) = round(f2);
    endfor
  endfor
  ## Funksioni F2 kthen si vlere matricen I2
  retval = I2;
endfunction

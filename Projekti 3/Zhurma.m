function [zhurma] = Zhurma(shperndarja, x, y, z, k, s, a, b)
  ## Kontrollojme nese vlera e s eshte e ndryshme nga 1, 2 apo 3
  if (s < 1 || s > 3)
    error('Vlera e s duhet te jete 1, 2 apo 3!');
  endif

  ## Vlerat e paracaktuara te parametrave a dhe b
  if nargin < 8
      a = 0;
      b = 0;
  end

  m = z - x + 1;
  n = k - y + 1;

  ## Krijimi i matrices se zhurmes
  zhurma = zeros(m, n, s);

  ## Gjenerimi i shurmes duke u bazuar ne tipin e shperndarjes
  switch lower(shperndarja)
      case 'rayleigh'
          for i = 1:s
              zhurma(:,:,i) = a + b * random('Rayleigh', 1, [m, n]);
          end

      case 'exponential'
          for i = 1:s
              zhurma(:,:,i) = a + b * random('Exponential', 1, [m, n]);
          end

      case 'lognormal'
          for i = 1:s
              zhurma(:,:,i) = a + b * random('Lognormal', 0, 1, [m, n]);
          end

      case 'salt&pepper'
          for i = 1:s
              zhurma(:,:,i) = a + b * imnoise(zeros(m, n), 'salt & pepper');
          end

      case 'erlang'
          for i = 1:s
              zhurma(:,:,i) = a + b * gamrnd(2, 1, [z - x + 1, k - y + 1]);
          end

      otherwise
          error('Shperndarja eshte e gabuar');
  end

end

function retval = tridiagonal(p,q,m)
  if (m<3 || numel(p) != (m-1) || numel(q) != (m-1))
    display("No se reunen las condiciones\n");
  else
    A = zeros(m,m);

    for i = 1:(m)
      for j=1:(m)
        if (i == j)
          if i == 1
            A(i,j) = 2*q(1);
            A(i,j+1) = q(1);
          elseif i == m
            A(m,m) = 2*p(m-1);
            A(m,m-1) = p(m-1);
          else
            A(i,j) = 2*(p(i-1)+q(i));
            A(i,j+1) = q(i);
            A(i,j-1) = p(i-1); 
          endif
        endif
      endfor
    endfor
    retval = A;
    return;
  endif  
endfunction

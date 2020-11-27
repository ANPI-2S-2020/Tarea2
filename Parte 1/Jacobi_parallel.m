## @deftypefn {} {@var{retval} =} Jacobi_p (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alex <Alex@DESKTOP-2E344PQ>
## Created: 2020-11-26

function retval = Jacobi_parallel(A, b,x, m,i)
  sum=0;
  for j=1:m
    if(j!=i)
      sum=sum+A(i,j)*x(j);
    endif
  endfor
  retval=(1/A(i,i))*(b(i)-sum);
endfunction
clc;clear;

%Definiendo los valores iniciales del metodo de Jacobi
m = 242;
xk = xk1 = zeros(m,1);
b = ones(m,1);
tol = 10^-5;
error = tol + 1;
n = 1;
p=q=[1:0.1:25];

%Calculando la Matriz Tridiagonal A
A = tridiagonal(p,q,m);

while (error > tol && n < 1000)
  for i = 1:m
    sum = 0;
    term = 1/A(i,i);
    bi = b(i);
    for j = 1:m
      if i != j
        sum = sum + A(i,j)*xk(j);
      endif
    endfor
    xk1(i) = term*(bi-sum);
  endfor
  error = norm(A*xk-b);
  xk= xk1;
  n=n+1;
  endwhile
 
xk

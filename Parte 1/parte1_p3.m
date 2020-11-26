pkg load parallel;
clc;clear;
%Definiendo los valores inciales
m=242;
xk=zeros(m,1);
b=ones(m,1);
tol=10e-5;
error=tol+1;
k=0;
p=q=[1:0.1:25];

%Calculando la matriz tridiagonal A

A=tridiagonal(p,q,m);

while(error>tol)&& (k<1000)
  fun_handler=@(i) Jacobi_parallel(A,b,xk, m,i); %Definiendo un handle de la funcion Jacobi_parallel (Parametrizandola)
  xk=pararrayfun(nproc,fun_handler,1:m).'; %Paralelizando el proceso en terminos del elemento xi de la iteracion k+1.
  k=k+1;
  error=norm(A*xk-b);
endwhile
k

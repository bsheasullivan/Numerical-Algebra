function [diaga, diagInv, UDiag, RDiag, Lower, Upper, A] = datagen(n)
diaga = sparse(1:n, 1:n, 3*ones(1,n),n,n);%D
diagInv = sparse(1:n, 1:n, (1/3)*ones(1,n),n,n);%invD
UDiag = sparse(1:n-1,2:n, -1*ones(1,n-1),n,n);
RDiag = sparse(n:-1:(n/2)+2,1:(n/2)-1, .5*ones(1,(n/2)-1), n, n);
Lower = RDiag+UDiag';
Upper = RDiag'+UDiag;
A = diaga+Lower+Upper;
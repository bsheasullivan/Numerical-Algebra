%Gauss seidel
function [x] = gaussseidel(n)
tic;
[diaga, diagInv, UDiag, RDiag, Lower, Upper, A] = datagen(n);
b= Db(n);
x0 = zeros(n,1);
x = zeros(n,1);
k =1;
maxIter = 1000;
TOL = 10^(-5);
[column, row, a] = find(A);
while k<maxIter
    j=1;
    for i = 1:n
        sum1 = 0;
        sum2 = 0;
        while row(j) ==i
            if row(j) <column(j)
                sum1 = sum1+A(i,column(j))*x(i);
            elseif row(j) ~=column(j)
                sum2 = sum2 + A(i,column(j))*x0(i);
            end
            if j~= 4*n-4
                j = j+1;
            else
                break;
            end
        end
        x(i) = (1/3)*(-sum1-sum2+b(i));
    end
    ploty(k) = norm(x-x0);
    if norm(x-x0)<TOL
        break;
    end
    x0=x;
    k=k+1;
end
display(n)
display(k)
toc
for i = 1:k
    gy(i) = ploty(i);
end
% plotx = linspace(0,k,k);
% plot(plotx,gy)
% hold on
% plot(plotx, plotx*0+10^(-5),'k')

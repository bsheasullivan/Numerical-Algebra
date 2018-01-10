function x = aitkenSOR(n)
tic;
w = 1.1
[diaga, diagInv, UDiag, RDiag, Lower, Upper, A] = datagen(n);
b= Db(n);
x0 = zeros(n,1);
TOL = 10^(-5);
maxIter = 1000;
k = 1;
x = zeros(n,1);
x2 = zeros(n,1);
x3 = zeros(n,1);
[column, row, a] = find(A);
ploty = zeros(n,1);
while k<maxIter
    m=0;
    while m<5
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
            x(i) = (1-w)*x0(i)+(w/3)*(-sum1-sum2+b(i));
        end
        ploty(k) = norm(x-x0); 
        x3 = x2;
        x2 = x0;
        x0 = x;
        k=k+1;
        m=m+1;
    end
    if (x0-2*x2+x3) ~=0
        x0 = (x3-((x2-x3).*(x2-x3))./(x0-2*x2+x3));
    end
    if norm(x-x0)<TOL
        break;
    end
   x0=x;
   k=k+1;
end
display(n)
display(k)
toc
for i = 1:k-1
    gy(i) = ploty(i);
end
plotx = linspace(0,k,k-1);
plot(plotx,gy)
hold on
plot(plotx, plotx*0+10^(-5),'k')
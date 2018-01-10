%jacobi aitken
function [x] = aitkenjacobi(n);
tic;
[diaga, diagInv, UDiag, RDiag, Lower, Upper, A] = datagen(n);
x0 = zeros(n,1);
b = Db(n);
maxIter = 1000;
TOL = 10^(-5);
x3 = zeros(n,1);
x2 = zeros(n,1);
k = 1;
T = diagInv*(Lower+Upper);
c = diagInv*b;
ploty = zeros(1,50);%store plotting data
while k < maxIter
    m=0;
    while m<5
        x = T*(-x0)+c;
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
    x0 = x;
    k = k+1;
end
display(n)
display(k)
toc
for i = 1:k
    gy(i) = ploty(i);
end
% plotx = linspace(0,k,k);
% plot(plotx, gy)
% hold on
% plot(plotx, plotx*0+10^(-5),'k')

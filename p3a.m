function matp3a=  p3a(n) %matrix
matp3a = zeros(n);%initialize
for i = 1:n
    matp3a(i,i) = 3; %diagonals
end
for i = 1:n
    if i~= n/2 || i ~= 1+n/2 
      matp3a(i,n-i+1) = 0.5; %opposite diags
    end
end
for i = 2:n
    matp3a(i,i-1)= -1;%super diags
    matp3a(i-1,i)= -1;%sub diags
end
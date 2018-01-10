function vectp3a = p3vect(n)%vector b
vectp3a(1) = 2.5; %sets endpoints to 2.5
vectp3a(n) = 2.5;
for i = 2:((n-4)/2)+1
   vectp3a(i) = 1.5; %sets middle values, 
end
vectp3a(2+(n-4)/2) = 1; %other middles
vectp3a(3+(n-4)/2) = 1;
for i = 4+(n-4)/2:n-1
    vectp3a(i) = 1.5; %last middles. 
end
vectp3a = vectp3a'; %makes it vertical
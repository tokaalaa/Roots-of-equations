function [max] = pivoting(A,j,n)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
   max = j;
   for i = j+1 : n
       if (A(i,j) > A(max,j))
           max = i;
       end
   end
end


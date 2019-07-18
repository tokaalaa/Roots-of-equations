function [flag] = checkInconsistent(A,b)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    aug = A;
    aug(:,size(A,1)+1) = b;
    if rank(A)==rank(aug)
        flag =false;
    else
        flag = true;
    end
end 


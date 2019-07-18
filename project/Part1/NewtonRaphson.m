function [r,A,divergence] = NewtonRaphson(equation,x,precision,max_iter)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
derivative = diff(equation);
A = zeros();
r = x;
for iter = 1 : max_iter
    xold = x;
    f = double(subs(equation,x));
    fd = double(subs(derivative,x));
    if (fd == 0)
        divergence = 'Undefined ! division by zero ..';
        return;
    end
    x = xold - f/fd;
    error = abs(x-xold);
    A(iter,1)=iter;
    A(iter,2)=xold;
    A(iter,3)=f;
    A(iter,4)=fd;
    A(iter,5)=x;
    A(iter,6)=error;
    if (error < precision)
        break;
    end
end
r=x;
if abs(xold-r) > precision
    divergence = 'Root diverged';
else
    divergence = 'Root converged';
end
o = transpose(A);
fileID = fopen('Output.txt','w');
fprintf(fileID,'Iteration    xold         f(x)        diff(x)         xnew               eps\r\n');
fprintf(fileID,'%d            %f     %f    %f       %f         %f\r\n',o);
fprintf(fileID,'\r\n\r\nroot = %f',r);
fclose(fileID);
end


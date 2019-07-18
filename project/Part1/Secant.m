function [xr,A,divergence] = Secant(equation,x0,x1,precision,max_iter)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
A = zeros();
xr = x0;
for iter = 1 : max_iter
    fx0 = double(subs(equation,x0));
    fx1 = double(subs(equation,x1));
    if (fx0-fx1)==0
        divergence = 'Divisio by zero !';
        return;
    end
    x2 = x1 - (fx1*(x0-x1))/(fx0 - fx1);
    error = abs(x2-x1);
    A(iter,1)=iter;
    A(iter,2)=x0;
    A(iter,3)=x1;
    A(iter,4)=fx0;
    A(iter,5)=fx1;
    A(iter,6)=x2;
    A(iter,7)=error;
    if (error < precision)
        break;
    end
    x0 = x1;
    x1 = x2;
end
xr = x2;
if abs(x2-x1) > precision
    divergence = 'Root diverged';
else
    divergence = 'Root converged';
end
o = transpose(A);
fileID = fopen('Output.txt','w');
fprintf(fileID,'Iteration    x0           x1          f(x0)          f(x1)           x2          eps\r\n');
fprintf(fileID,'%d            %f     %f    %f       %f       %f    %f\r\n',o);
fprintf(fileID,'\r\n\r\nroot = %f',xr);
fclose(fileID);
end


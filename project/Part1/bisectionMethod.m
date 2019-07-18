function [xrnew,A, numofitr, good] = bisectionMethod(equ,xl,xu,eps, maxiter)
numofitr = ceil(log(xl-xu)-log(eps)/log(2));
i = 0;
Accuracy =0;
xrold = 0;
A = zeros();
good = 'valid bounds';
xrnew = 0;
if subs(equ,xu)*subs(equ,xl) > 0
    % no brackting
    A(i+1,1) = 0;
    A(i+1,2) = 0;
    A(i+1,3) = 0;
    A(i+1,4) = 0;
    A(i+1,5) = 0;
    A(i+1,6) = 0;
    good = 'invalid bounds';
    return
end
syms x;
% disp('   itration      Xl        Xu        Xr      f(xr)    Accuracy');
while i < maxiter
    xrnew = (xu+xl)/2;
    fxrnew = subs(equ,xrnew);
    if i ~= 0
        Accuracy = abs(xrnew-xrold);
    end
 %   disp([i,xl,xu,xrnew,fxrnew,Accuracy]);
    A(i+1,1) = i+1;
    A(i+1,2) = xl;
    A(i+1,3) = xu;
    A(i+1,4) = xrnew;
    A(i+1,5) = fxrnew;
    A(i+1,6) = Accuracy;
    xrold = xrnew;
    if ((Accuracy < eps && Accuracy > 0)|| i == maxiter)
        break;
    end
    if fxrnew*subs(equ,xl) > 0
        xl = xrnew;
    elseif fxrnew*subs(equ,xl) < 0
        xu = xrnew;
    else 
        break
    end
    i = i+1;
end
o = transpose(A);
fileID = fopen('Output.txt','w');
fprintf(fileID,'Iteration    xl         xu        xr         f(xr)              eps\r\n');
fprintf(fileID,'%.0f            %f     %f    %f       %f         %f\r\n',o);
fprintf(fileID,'\r\n\r\nroot = %f',xrnew);
fclose(fileID);
end
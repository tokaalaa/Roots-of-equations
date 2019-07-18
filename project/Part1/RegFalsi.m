function [xrnew,A,good] = RegFalsi(equ,xl,xu,eps,maxIter)
i = 0;Accuracy =0;xrold = 0;
A = zeros();
xrnew = 0;
syms x;
good = 'valid bounds';
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
while i < maxIter
 %   disp (xu + ' ' + xl)
    fxu = double(subs(equ,xu));
    fxl = double(subs(equ,xl));
    if (abs(fxl - fxu) < eps)
        break;
    else
    xrnew = (xl*fxu-xu*fxl)/(fxu-fxl);
    end
    fxrnew = subs(equ,xrnew);
    if i ~= 0
        Accuracy = abs(xrnew-xrold);
    end
    A(i+1,1) = i+1;
    A(i+1,2) = xl;
    A(i+1,3) = xu;
    A(i+1,4) = xrnew;
    A(i+1,5) = fxrnew;
    A(i+1,6) = Accuracy;
    xrold = xrnew;
    if (Accuracy < eps && Accuracy > 0)||(maxIter == i)
        break
    end
    if fxrnew*fxl > 0
        xl = xrnew;
    elseif fxrnew*fxl < 0
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
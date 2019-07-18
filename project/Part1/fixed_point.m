function [xr, A, type, iter, gdash] = fixed_point(equ,x0,eps,max_itr)
disp([equ x0 eps max_itr])
    xr = x0;
    A = zeros();
    xr_old = xr;
    syms x;
    g = equ +x;
    difg = diff(g);
    gdash = double(subs(difg,x0));
    if (abs(subs(difg,x0)) <= 1)
        if (subs(difg,x0) > 0)
            type = 'converge, monotonic';
        else
            type = 'converge, oscillate';
        end
    else 
        if (subs(difg,x0) > 0)
            type = 'diverge, monotonic';
        else
            type = 'diverge, oscillate';
        end
    end
    disp (type)
    iter = 0;
    while (1)
        A(iter+1,1) = iter+1;
        A(iter+1,2) = xr;
        xr = double(subs(g,xr_old));
        if isinf(xr)
            break;
        end
        if ( xr ~= 0)
            es = (abs(( xr - xr_old)/ xr) *100);
        A(iter+1,3) = es;
        end
        iter = iter + 1;
        if (es < eps || iter > max_itr)
            break;
        end
        xr_old = xr;
    end
   o = transpose(A);
fileID = fopen('Output.txt','w');
fprintf(fileID,'Iteration    x                eps\r\n');
fprintf(fileID,'%d            %f         %f\r\n',o);
fprintf(fileID,'\r\n\r\nroot = %f',xr);
fclose(fileID);
end
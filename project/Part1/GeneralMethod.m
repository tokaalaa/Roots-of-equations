function [root] = GeneralMethod(equation,eps,max_iterations)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes 
try coeff = sym2poly(equation);
    if coeff(size(coeff,2)) == 0
        root = 0;
        return;
    else
        guess = nthroot(abs(coeff(size(coeff,2))),(size(coeff,2)-1));
        [xi, Arrays, E, R,divergence] = BirgeVieta(equation,guess,eps,max_iterations);
       
        if strcmp(divergence,'Root converged') 
            root = xi;
            return;
        end
        [xi, Arrays, E, R,divergence] = BirgeVieta(equation,(guess*-1),eps,max_iterations);
        if strcmp(divergence,'Root converged')
            root = xi;
            return;
        end
        f1 = double(subs(equation,guess));
        f2 = double(subs(equation,0));
        f3 = double(subs(equation,(guess*-1)));
        if f1*f2 < 0
            root = bisectionMethod(equation,0,guess,eps,max_iterations);
            return
        elseif f2*f3 < 0
            root = bisectionMethod(equation,(guess*-1),0,eps,max_iterations);
            return;
        end
    end
    [xr,A,divergence] = Secant(equation,0,guess,eps,max_iterations);
    root = xr;
catch
    guess = randi([-20,20]);
    syms x;
    g = equation + x;
    derivative = diff(g);
    if abs(double(subs(derivative,guess))) <= 1
            [xr, A, type, iter, gdash] = fixed_point(equation,guess,eps,max_iterations);
            root=xr;
            return;
    end
    for i = 0:2
        tempGuess = guess+4;
        if abs(double(subs(derivative,tempGuess))) <= 1
            [xr, A, type, iter, gdash] = fixed_point(equation,tempGuess,eps,mx_iterations);
            root=xr;
            return;
        end
    end
    for i = 0:2
        tempGuess = guess-4;
        if abs(double(subs(derivative,tempGuess))) <= 1
            [xr, A, type, iter, gdash] = fixed_point(equation,tempGuess,eps,max_iterations);
            root=xr;
            return;
        end
    end
    guess = randi([-20,20]);
    left = guess;
    right = guess;
    delta = 1;
    f1 = double(subs(equation,guess));
    f2 = f1;
    f3 = f1;
    i = 0
    while f2*f1 >= 0 && f3*f1 >= 0
        left = left - delta;
        right = right + delta;
        f2 = double(subs(equation,left));
        f3 = double(subs(equation,right));
        i=i+1
        if i > 100
            break;
        end
    end
    if f2*f1 < 0
        [xrnew,A,good] = RegFalsi(equation,left,guess,eps,max_iterations);
        root = xrnew;
        return;
    elseif f3*f1 < 0
        [xrnew,A,good] = RegFalsi(equation,left,right,eps,max_iterations);
        root = xrnew;
        return;
    end
    [xr,A,divergence] = Secant(equation,left,guess,eps,max_iterations);
    root = xr;
end
end

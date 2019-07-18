function [equ,x,A,name,numofitr,type,E, R,gdash,time] = readEquation(fileName)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fileID = fopen(fileName,'r');
line = fgetl(fileID);
x=0;
numofitr = 0;
type = 0;
E = 0;
R = 0;
A = 0;
gdash = 0;
time = 0;
sym x;
eq = strcat('@(x)',line);
equ = expstring(eq);
equation=str2func(equ);
syms x;
y= equation(x);
name = fgetl(fileID);
interval = fgetl(fileID);
l=sscanf(interval, '%f %f');
disp(l(1));
bound = fgetl(fileID);
fclose(fileID);
bound = str2num(bound);
if (bound==floor(bound))
    eps=0.00001;
    max_iter = bound;
else
    eps=bound;
    max_iter = 50;
end
if strcmp(name,'bisection')
    tic;
    [x,A, numofitr,type]=bisectionMethod(equation, l(1),l(2),eps,max_iter);
    toc;
    time = toc;
    name = 'bisection';
elseif strcmp(name,'False-position')
    tic;
    [x,A,type]=RegFalsi(equation, l(1),l(2),eps,max_iter);
    toc;
    time = toc;
    name = 'falsePosition';
elseif strcmp(name,'Fixed point')
    tic;
    [x, A, type, numofitr, gdash]=fixed_point(y,l(1),eps,max_iter);
    toc;
    time = toc;
    name = 'fixedPoint';
elseif strcmp(name,'Newton-Raphson')
    [x,A,type]=NewtonRaphson(y,l(1),eps,max_iter);
    name = 'newtonRaphson';
elseif strcmp(name,'Secant')
    tic;
    [x,A,type]=Secant(equation, l(1),l(2),eps,max_iter);
    toc;
    time = toc;
    name = 'secant';
elseif strcmp(name,'Bierge-Vieta')
    tic;
    [x, A, E, R,type]=BirgeVieta(y,l(1),eps,max_iter);
    toc;
    time = toc;
    name = 'biergeVieta';
end
end

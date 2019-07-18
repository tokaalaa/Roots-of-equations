function [ flag ] = check( fileName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fileID = fopen(fileName,'r');
num = fgetl(fileID);
n = str2num(num);
sym('x',[1 n]);
if n > 0
    line = fgetl(fileID);
    eqn = evalin(symengine,line);
    equations = eqn;
end
for i = 2:n
    line = fgetl(fileID);
    eqn = evalin(symengine,line);
    equations = [equations,eqn];
end
fclose(fileID);
sym('x',[1 n]);
var = sym('x',[1,n]);
[A,B] = equationsToMatrix(equations, var);
[flag] = checkInconsistent(A,B);
end


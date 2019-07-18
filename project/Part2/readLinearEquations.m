function [X,StepsA,StepsB,StepsLU,B,D,name,n] = readLinearEquations(fileName)
%UNTITLED2 Summary of this function goes here
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
    equations=[equations,eqn];
end
name = fgetl(fileID);
if strcmp(name, 'Gaussian-Seidel') || strcmp(name, 'All')
    initials = fgetl(fileID);
    newstr = strsplit(initials,' ');
    z = zeros();
    for i = 1 : length(newstr)
        z(i) = str2double(newstr(i));
    end   
    fclose(fileID);
    [X,StepsA,StepsB,StepsLU,B,D] = SolveLinearEquations(n,equations,name,50,0.00001,z);
else
    fclose(fileID);
    [X,StepsA,StepsB,StepsLU,B,D] = SolveLinearEquations(n,equations,name,10,0.0001,[1 0 1]);
end
end
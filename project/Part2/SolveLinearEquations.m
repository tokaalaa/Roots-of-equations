function [X,StepsA,StepsB,StepsLU,B,D] = SolveLinearEquations(n,equations,name, maxIterations, epsilon, initial)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
sym('x',[1 n]);
var = sym('x',[1,n]);
[A,B] = equationsToMatrix(equations, var);
if strcmp(name, 'Gaussian-elimination')
    [X,StepsA,StepsB,StepsLU,B,D] = GaussElimination(n,vpa(A),vpa(B));
elseif strcmp(name, 'LU decomposition')
    [X,StepsA,StepsB,StepsLU,B,D] = LUDecomposition(n,vpa(A),vpa(B));
elseif strcmp(name, 'Gaussian-Jordan')
    [timeElapsed,system_matrix,steps,lastMatrix,solution] = gauss_jordan(vpa(A),vpa(B), n);
    X = timeElapsed;
    StepsA = system_matrix;
    StepsB = steps;
    StepsLU = lastMatrix;
    B = solution;
    D = system_matrix;
elseif strcmp(name,'Gauss-Seidel')
    tic;
    [numOfIterations , final , errorArray , answers] = GaussSeidel2(n, vpa(A), vpa(B), initial , maxIterations , epsilon);
    toc;
    B = toc;
    X = numOfIterations;
    StepsA = final;
    StepsB = errorArray;
    StepsLU = answers;
    D = answers;
elseif strcmp(name,'All')
    tic;
    [X1,StepsA1,StepsB1,StepsLU1,B1,D1] = GaussElimination(n,vpa(A),vpa(B));
    toc;
    elapsedtime1 = toc;
    tic;
    [X2,StepsA2,StepsB2,StepsLU2,B2,D2] = LUDecomposition(n,vpa(A),vpa(B));
    toc;
    elapsedtime2 = toc;
    [timeElapsed,system_matrix,steps,lastMatrix,solution] = gauss_jordan(vpa(A),vpa(B), n);
    elapsedtime3 = timeElapsed;
    tic;
    [numOfIterations , final , errorArray , answers] = GaussSeidel2(n, vpa(A), vpa(B), initial , maxIterations , epsilon);
    toc;
    elapsedtime4 = toc;
    StepsA(:,:,1) = X1(:,:);
    StepsA(:,:,2) = X2(:,:);
    StepsA(:,:,3) = solution(:,:);
    StepsA(:,:,4) = answers(:,:);
    StepsB(:,:,1) = elapsedtime1;
    StepsB(:,:,2) = elapsedtime2;
    StepsB(:,:,3) = elapsedtime3;
    StepsB(:,:,4) = elapsedtime4;
    X = X2;
    StepsLU = X1;
    B = X1;
    D = X2;
end
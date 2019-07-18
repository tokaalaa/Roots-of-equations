function [xi, Arrays, E, R,divergence] = BirgeVieta(equ,x0,eps,max_iterations)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Arrays = zeros();
disp(equ);
xiold = x0;
R = zeros();
E = zeros();
R (1,1) = x0;
E (1,1) = 0;
syms x;
coeff = sym2poly(equ);
[temp, order] = size(coeff);
j = 1;
i = 1;
k = 0;
%xinew = xi+1;
fileID = fopen('Output.txt','w');
A = zeros();
        A(1,1) = order -1;
        A(1,2) = coeff(j);
        A(1,3) = coeff(j);
        A(1,4) = coeff(j);
        j = j + 1;
         while j <= order
            A(k+2,1) = order - j ;
            A(k+2,2) = coeff(j);
            A(k+2,3) = A(k+2,2)+ xiold * A(k+1,3);
            if j ~= order
            A(k+2,4) = A(k+2,3)+ xiold * A(k+1,4);
            else 
                A(k+2,4) = 0;
            end
            k= k+1;
            j = j + 1;
         end 
          % save array a
         Arrays(:,:,1) = A;
         xi = xiold - (A(order,3)/A(order-1,4));  
         err = xi - xiold;
         R (2,1) = xi;
         E (2,1) = err;
         xiold = xi;
         o = transpose(A);
          fprintf(fileID,'Iteration 1:\r\n\r\nxi       ai               bi              ci\r\n');
          fprintf(fileID,'%.0f        %f         %f        %f\r\n',o);
         fprintf(fileID,'\r\n\r\nx = %f\r\n\r\n\r\n',xi);
    while (abs(A(order,3)) > eps && i <= max_iterations)
        j = 1;
        A = zeros();
        A(1,1) = order - 1;
        A(1,2) = coeff(j);
        A(1,3) = coeff(j);
        A(1,4) = coeff(j);
        i = i +1;
        j = j + 1;
        k = 0;
        while j <= order  
            A(k+2,1) = order - j;
            A(k+2,2) = coeff(j);
            A(k+2,3) = A(k+2,2)+ xiold * A(k+1,3);
            if j ~= order
            A(k+2,4) = A(k+2,3)+ xiold * A(k+1,4);
            else 
                A(k+2,4) = 0;
            end
            k= k+1;
            j = j + 1;
        end 
        % save array a
        Arrays(:,:, i) = A;
        xi = xiold - (A(order,3)/A(order-1,4));
        err = xi - xiold;
         R (i+1,1) = xi;
         E (i+1,1) = err;
         xiold = xi;
         o = transpose(A);
          fprintf(fileID,'Iteration %d:\r\n\r\nxi       ai               bi              ci\r\n',i);
          fprintf(fileID,'%.0f        %f         %f        %f\r\n',o);
         fprintf(fileID,'\r\n\r\nx = %f\r\n\r\n\r\n',xi);
    end
    fclose(fileID);
if abs(xiold-xi) > eps
    divergence = 'Root diverged';
else
    divergence = 'Root converged';
end
end


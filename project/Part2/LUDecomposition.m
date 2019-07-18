function [X,StepsA,StepsB,StepsLU,B,D] = LUDecomposition(n,A,b)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
if (checkInconsistent(A,b))
    print('Inconsistant system .. no solution');
else
   fileID = fopen('Output.txt','w');
   LU = A;
   counter= 1;
   StepsA(:,:,counter) = A;
   StepsB(:,:,counter) = b;
   StepsLU(:,:,counter) = LU;
   counter = counter+1;
   for k = 1: n-1
      pivot = pivoting(A,k,n);
      if (pivot ~= k)
          temp = A(k,:);
          A(k,:) = A(pivot,:);
          A(pivot,:) = temp;
          temp = LU(k,:);
          LU(k,:) = LU(pivot,:);
          LU(pivot,:) = temp;
          temp = b(pivot);
          b(pivot) = b(k);
          b(k) = temp;
      end
      StepsA(:,:,counter) = A;
      for i = k + 1: n
          m = LU(i,k)/LU(k,k);
          LU(i,k) = m;
          for j = k + 1: n
              LU(i,j) = LU(i,j) - m * LU(k,j);    
          end   
      end
      StepsLU(:,:,counter) = LU;
      counter = counter+1;
   end
   fprintf(fileID,'A=LU\r\nA=\r\n');
   for i = 1:n
       fprintf(fileID,'%f    ',A(i,:));
       fprintf(fileID,'\r\n');
   end
   fprintf(fileID,'\r\nL=\r\n');
   for i = 1:n
       for j = 1:i-1
           fprintf(fileID,'%f    ',A(i,j));
       end
       fprintf(fileID,'%f    ',1);
       for j = i+1:n
           fprintf(fileID,'%f    ',0);
       end
       fprintf(fileID,'\r\n');
   end
   fprintf(fileID,'\r\nU=\r\n');
   for i = 1:n
       for j = 1:i-1
           fprintf(fileID,'%f    ',0);
       end
       for j = i:n
           fprintf(fileID,'%f    ',A(i,j));
       end
       fprintf(fileID,'\r\n');
   end
   D = zeros();
   D(1) = b(1);
   B = b;
   for i = 2:n
       sum = 0;
       for j = 1:i-1
           sum = sum + D(j)*LU(i,j);
       end
       D(i) = b(i) - sum;
   end
   fprintf(fileID,'\r\nb=\r\n');
   for i = 1:n
       fprintf(fileID,'%f    ',b(i));
       fprintf(fileID,'\r\n');
   end
   fprintf(fileID,'\r\nLd=b\r\nd=\r\n');
   for i = 1:n
       fprintf(fileID,'%f    ',D(i));
       fprintf(fileID,'\r\n');
   end
   X = zeros();
   X(n)=D(n)/A(n,n);
   for i = n:-1:1
       sum = 0;
       for j = i+1:n
           sum = sum + LU(i,j)*X(j);
       end 
       X(i) = (D(i) - sum)/LU(i,i);
   end
   fprintf(fileID,'\r\nUx=d\r\nx=\r\n');
   for i = 1:n
       fprintf(fileID,'%f    ',X(i));
       fprintf(fileID,'\r\n');
   end
end
end


function [X,StepsA,StepsB,StepsLU,B,D] = GaussElimination(n,A,b)

if (checkInconsistent(A,b))
    print('Inconsistant system .. no solution');
else    
    fileID = fopen('Output.txt','w');
    counter= 1;
    StepsLU(:,:,counter) = A;
    B = b;
    D = b;
   StepsA(:,:,counter) = A;
   StepsB(:,:,counter) = b;
   counter = counter+1;
   for k = 1: n-1
      fprintf(fileID,'Step %.0f:\r\n',k);
      pivot = pivoting(A,k,n);
      if (pivot ~= k)
          temp = A(k,:);
          A(k,:) = A(pivot,:);
          A(pivot,:) = temp;
          temp = b(pivot);
          b(pivot) = b(k);
          b(k) = temp;
          StepsA(:,:,counter) = A;
          StepsB(:,:,counter) = b;
          counter = counter+1;
          fprintf(fileID,'Pivoting:\r\nA=\r\n');
          for i = 1:n
             fprintf(fileID,'%f    ',A(i,:));
             fprintf(fileID,'\r\n');
          end
          fprintf(fileID,'\r\n\r\n');
          fprintf(fileID,'B=\r\n');
          for i = 1:n
             fprintf(fileID,'%f    ',b(i));
             fprintf(fileID,'\r\n');
          end
          fprintf(fileID,'\r\n\r\n');
      end
      for i = k + 1: n
          m = A(i,k)/A(k,k);
          A(i,k) = 0;
          for j = k + 1: n
              A(i,j) = A(i,j) - m * A(k,j);    
          end
          b(i) = b(i) - m * b(k);     
      end
      StepsA(:,:,counter) = A;
      StepsB(:,:,counter) = b;
      counter = counter+1;
      fprintf(fileID,'Elimination:\r\nA=\r\n');
          for i = 1:n
             fprintf(fileID,'%f    ',A(i,:));
             fprintf(fileID,'\r\n');
          end
          fprintf(fileID,'\r\n\r\n');
          fprintf(fileID,'B=\r\n');
          for i = 1:n
             fprintf(fileID,'%f    ',b(i));
             fprintf(fileID,'\r\n');
          end
          fprintf(fileID,'\r\n\r\n');
   end
   X(n) = b(n)/A(n,n);
   for i = n:-1:1
       sum = 0;
       for j = i+1:n
           sum = sum + A(i,j)*X(j);
       end
       X(i) = (b(i) - sum)/A(i,i);
   end
   fprintf(fileID,'Solution:\r\nX=\r\n');
          for i = 1:n
             fprintf(fileID,'%f    ',X(i));
             fprintf(fileID,'\r\n');
          end
end
fclose(fileID);
end

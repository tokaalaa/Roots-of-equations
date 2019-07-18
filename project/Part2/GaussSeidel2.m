function [numOfIterations , final , errorArray , answers] = GaussSeidel2(numberOfFunctions ,coeff_matrix,constants_matrix, initialGuess , maxIterations , epsilon)
syms a b c d e f g h i j k l m n o p k r s t u v w x y z x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 y0 y1 y2 y3 y4 y5 y6 y7 y8 y9;
tic
answers = double.empty;
previous = double.empty;
for i = 1: numberOfFunctions
    answers = [answers;initialGuess(i)];
end
iteration = 1;
error = 100;
errorArray = double.empty;
final = double.empty;
while  iteration <= maxIterations & error > epsilon
    for i = 1 : length(answers)
        j = 1;
        previous(i) = answers(i);
        answers(i) = constants_matrix(i);
        for k = 1 : length(answers) - 1
             if j == i
                 j = j + 1;
             end
             answers(i) = answers(i) - coeff_matrix(i,j)*answers(j);
             j = j + 1;
        end
        answers(i) = answers(i) / coeff_matrix(i,i);
        error = abs(((answers(i) - previous(i)) / answers(i)) * 100);
        errorArray(i , iteration) = error;
        final(i,iteration) = answers(i);
    end
    iteration = iteration + 1;
end 
numOfIterations = iteration - 1;
time=toc;

fileID = fopen('C:\Users\lenovo\git\numerical-assignment\Part2\Output.txt','w');
fprintf(fileID,'Number of Iterations :   %d\r\n',numOfIterations);
fprintf(fileID,'\r\n');
fprintf(fileID,'Answer of each Iteration : \r\n');
fprintf(fileID,'   X1         X2         X3\r\n');
fprintf(fileID,'   %.4f       %.4f       %.4f  \r\n',final);
fprintf(fileID,'\r\n');
fprintf(fileID,'Error of each Iteration : \r\n');
fprintf(fileID,'   ErrX1      ErrX2      ErrX3\r\n');
fprintf(fileID,'   %.4f       %.4f       %.4f  \r\n',errorArray);
fprintf(fileID,'\r\n');
fprintf(fileID,'Final Answers : \r\n');
fprintf(fileID,'    X1          X2          X3\r\n');
fprintf(fileID,'   %.4f        %.4f         %.4f  \r\n',answers);
fprintf(fileID,'\r\n');
fprintf(fileID,'Time : \r\n');
fprintf(fileID,'   %f   \r\n',time);
disp(time);
fclose(fileID);
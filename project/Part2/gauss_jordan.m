function [timeElapsed,system_matrix,steps,lastMatrix,solution] = gauss_jordan(coeff_matrix, constants_matrix, num_of_unknowns)
    tic
    
    %create_system_matrix 
    for index=1:size(constants_matrix)
        coeff_matrix(index, length(constants_matrix)+1)=constants_matrix(index);
    end
    system_matrix=coeff_matrix;
    result=system_matrix;
    
    
    %forward_elimination
    steps(:,:,1) = result;
    for pivot_index=1:num_of_unknowns
        %normalize
        pivot=result(pivot_index, pivot_index);
        for col=1:num_of_unknowns+1
            result(pivot_index, col)=result(pivot_index, col)/pivot;
                   
        end
          steps(:,:,pivot_index) = result;
        %apply elimination
        for row=1:num_of_unknowns
            if row==pivot_index
                continue;
            end
            row_pivot=result(row,pivot_index);
            for col=pivot_index:num_of_unknowns+1
               result(row,col)=result(row,col)-row_pivot*result(pivot_index,col); 
            end
        end
    end
    lastMatrix=result;
    
    
    %back_substitution
    solution=[0,0];
    for i=1:num_of_unknowns
        solution(i)=lastMatrix(i, num_of_unknowns+1);
    end
    
    timeElapsed = toc;

    
fileID = fopen('C:\Users\lenovo\git\numerical-assignment\Part2\Output.txt','w');
fprintf(fileID,'System Matrix : \r\n');
Tsystem_matrix=transpose(system_matrix);
fprintf(fileID,'   %.4f       %.4f       %.4f       %.4f   \r\n',Tsystem_matrix);
fprintf(fileID,'\r\n');
fprintf(fileID,'Step 1 : \r\n');
Tsteps(:,:,1)=transpose(steps(:,:,1));
fprintf(fileID,'   %.4f       %.4f       %.4f       %.4f   \r\n',Tsteps(:,:,1));
fprintf(fileID,'\r\n');
fprintf(fileID,'Step 2 : \r\n');
Tsteps(:,:,2)=transpose(steps(:,:,2));
fprintf(fileID,'   %.4f       %.4f       %.4f       %.4f   \r\n',Tsteps(:,:,2));
fprintf(fileID,'\r\n');
fprintf(fileID,'Step 3 : \r\n');
Tsteps(:,:,3)=transpose(steps(:,:,3));
fprintf(fileID,'   %.4f       %.4f       %.4f       %.4f   \r\n',Tsteps(:,:,3));
fprintf(fileID,'\r\n');
fprintf(fileID,'Step 4 : \r\n');
TlastMatrix=transpose(lastMatrix);
fprintf(fileID,'   %.4f       %.4f       %.4f       %.4f   \r\n',TlastMatrix);
fprintf(fileID,'\r\n');
fprintf(fileID,'Solution : \r\n');
fprintf(fileID,'   %.4f       %.4f       %.4f     \r\n',solution);
fprintf(fileID,'\r\n');
fprintf(fileID,'Time : \r\n');
fprintf(fileID,'   %.4f   \r\n',timeElapsed);
fclose(fileID);
end

function [equation] = expstring(equation)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
equation = strrep(equation,'e^','exp(');
indices = strfind(equation, 'exp(');
i =1;
while i <= size(indices)
   current = indices(i);
 %  disp(equation)
   current = current + 4;
   no = 0;
   while (1)
  %     disp (strlength(equation))
       if current >= length(equation)
   %        equation = equation +')';
           equation = insertAfter(equation, current, ')');
       %    disp(equation)
           break
       end
       if equation(current) == '('
           no = no +1;
           disp(equation)
       end
       if equation(current) == '+' || equation(current) == '-'
           if no == 0
             equation = insertAfter(equation, current-1, ')');
             break;
           end
       end
 %      disp(equation) 
       if equation(current) == ')'
           if (no == 0 )
              
              equation = insertAfter(equation, current, ')');
             break; 
           end
           no = no - 1;
       end
       current = current +1;
   end
   indices = strfind(equation, 'exp(');
    i = i+1;
end
%disp(equation)
%outputArg1 = inputArg1;
%outputArg2 = inputArg2;
end

function NewCharArray = insertAfter( CharArray, Position, WhatToInsert)
  NewCharArray = char( strcat( cellstr(CharArray(:,1:Position)), cellstr(WhatToInsert), cellstr(CharArray(:, Position+1:end)) ) );
end
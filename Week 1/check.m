% CHECK  Check two variables to see if they are the same
%   CHECK(title, var1, var2)
%     display the title and "OK" if the variables are equal or
%     "FAIL" if they are not equal

function check(title, var1, var2)
    fprintf(title + ": ") 
    if var1 == var2
        disp("OK")
    else
        disp("FAIL")
    end
end

% tells the user which ion exchange method to use to separate the two inputted amino acid sequences 

function [statement] = ion_exchanger(AA1_charge, AA2_charge, AA1, AA2)

% assigning exchange method and eluted amino acids to different conditions of amino acid sequence charge combinations
    if ((AA1_charge > 0 && AA2_charge >0) || (AA1_charge < 0 && AA2_charge < 0) || (AA1_charge == AA2_charge))    
        statement = strcat(AA1, " and ", AA2, " cannot be separated by either a cation or anion exchanger.");
        return
    elseif AA1_charge == 0 
        AA_elute1 = AA1;
        AA_stay = AA2;
        AA_stay_color = [0.6, 0.6, 1.0];
        x = ".";
        if AA2_charge > 0 
            method = "cation";
        else
            method = "anion";
        end
    elseif AA2_charge == 0
        AA_elute1 = AA2;
        AA_stay = AA1;
        AA_stay_color = [1.0, 1.0, 0.4];
        x = ".";
        if AA1_charge > 0 
            method = "cation";
        else
            method = "anion";
        end
    else 
        method = "anion or cation";
        if AA1_charge < 0 && AA2_charge > 0
            AA_elute1 = AA1;
            x = strcat(" in a cation exchanger. ", AA2, " will elute first in an anion exchanger.");
        elseif AA1_charge > 0 && AA2_charge < 0 
            AA_elute1 = AA2;
            x = strcat(" in a cation exchanger. ", AA1, " will elute first in an anion exchanger.");
        end
    end
    
    % takes the variables assigned in the if/else statement above and concatenates them into a statement about the optimal exchange method  
    statement = strcat("You can separate ", AA1, " and ", AA2, " using a(n) ", method, " exchanger. ")
    statement = statement + newline + strcat(AA_elute1, " will elute first", x);
    
end 

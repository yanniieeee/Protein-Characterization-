function [statement] = ion_exchange(AA1_charge, AA2_charge, AA1, AA2)
    if ((AA1_charge > 0 && AA2_charge >0) || (AA1_charge < 0 && AA2_charge < 0) || (AA1_charge == AA2_charge))    
        statement = strcat(AA1, " and ", AA2, " cannot be separated by either a cation or anion exchanger.");
        return
    elseif AA1_charge == 0 
        AA_elute1 = AA1;
        x = ".";
        if AA2_charge > 0 
            method = "cation";
        else
            method = "anion";
        end
    elseif AA2_charge == 0
        AA_elute1 = AA2;
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
    statement = strcat("You can separate ", AA1, " and ", AA2, " using a(n) ", method, " exchanger. ",...
                AA_elute1, " will elute first", x);
end 
function [statement ] = ion_exchanger(AA1_charge, AA2_charge, AA1, AA2)
    if ((AA1_charge > 0 && AA2_charge >0) || (AA1_charge < 0 && AA2_charge < 0) || (AA1_charge == AA2_charge))    
        print(strcat(AA1, " and ", AA2, " cannot be separated by the ion exchanger"));
    elseif AA1_charge == 0 
        if AA2_charge > 0 
            statement = strcat("You can separate ", AA1, " and ", AA2, " using a cation exchanger. ", AA1, " will elute first." ); 
            method = "cation";
        else
            statement = strcat("You can separate ", AA1, " and ", AA2, " using a anion exchanger. ",...
                AA1, " will elute first." );
            method = "anion";
        end
    elseif AA2_charge == 0
        if AA1_charge > 0 
            statement = strcat("You can separate ", AA1, " and ", AA2, " using a cation exchanger. ",...
                AA2, " will elute first." );
            method = "cation";
        else
            statement = strcat("You can separate ", AA1, " and ", AA2, " using a anion exchanger. ",...
                AA2, " will elute first." );
            method = "anion";
        end
    else 
        if AA1_charge < 0 && AA2_charge > 0
            statement = strcat("You can separate ", AA1, " and ", AA2, " using a cation or anion exchanger. ",...
                AA1, " will elute first in a cation exchanger. ", AA2, ...
                " will elute first in an anion exchanger.");
            method = "anion and cation";
        elseif AA1_charge > 0 && AA2_charge < 0 
           statement = strcat("You can separate ", AA1, " and ", AA2, " using a cation or anion exchanger. ",...
                AA2, " will elute first in a cation exchanger. ", AA1, ...
                " will elute first in an anion exchanger.");
        end
    end
    
end 
function [AA1_info, AA2_info] = protein_char(pH, AA1, AA2)
    AA1_charge = charge_calc(pH,AA1);
    if AA1_charge > 0
        AA1_charge = strcat("+", string(AA1_charge), ". ");
    else
        AA1_charge = strcat(string(AA1_charge), ". ");
    end 
    
    AA2_charge = charge_calc(pH,AA2);
    if AA2_charge > 0
        AA2_charge = strcat("+", string(AA2_charge),". ");
    else
        AA2_charge = strcat(string(AA2_charge), ". ");
    end 
    AA1_pI = pI_calc(AA1);
    AA2_pI = pI_calc(AA2);
    
    if AA1_pI > 7
        elec_end1 = "anode.";
    else
        elec_end1 = "cathode.";
    end
    
    if AA2_pI > 7
        elec_end2 = "anode.";
    else
        elec_end2 = "cathode.";
    end
    
    
    AA1_info = strcat("The overall charge of amino acid ", AA1, " at pH ", string(pH),...
    " is ", AA1_charge); 
    AA1_info = AA1_info + newline + strcat("The pI of amino acid ", AA1, " is ",  string(AA1_pI), ". ");
    AA1_info = AA1_info + newline + strcat("Amino acid ", AA1, " will move toward the ", elec_end1);

    AA2_info = strcat("The overall charge of amino acid ", AA2, " at pH ", string(pH), ...
    " is ", AA2_charge);
    AA2_info = AA2_info + newline + strcat("The pI of amino acid ", AA2, " is ",  string(AA2_pI), ". ");
    AA2_info = AA2_info + newline + strcat("Amino acid ", AA2, " will move toward the ", elec_end2);

    cathode_anode_gen(AA1_pI,AA2_pI);
    
end 
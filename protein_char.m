%Main function of our project: takes in a pH and 2 amino acid sequences and generates an animation of how the 
%amino acids would separate on a cathode anode electrophoresis gel and text that describes the isoelectric points,
%charge in the given pH, and how the proteins can be separated using an ion exchanger. 

function [AA1_info, AA2_info, statement] = protein_char(pH, AA1, AA2)

%Defining the pKas and charges of the amino acid sequences in dictionary format
pKRs = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [10.54, 12.48,6.04,3.90,4.07,10.46,8.37]);
pKRs_charge_below = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [1,1,1,0,0,0,0]);
pKRs_charge_equal = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [-1/2,-1/2,1/2,-1/2,-1/2,-1.5,-1/2]);
pKRs_charge_above = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [0,0,0,-1,-1,-1,-1]);
pK1s_carbonyl = containers.Map(["G","A","V","L","I","M","P","F","W","K","R","H","S","T","N","Q","Y","C","D","E"],[2.35,2.35,2.29,2.33,2.32,2.13,1.95,2.20,2.46,2.16,1.82,1.80,2.19,2.09,2.14,2.17,2.20,1.92,1.99,2.10]);
pK2s_amino_group = containers.Map(["G","A","V","L","I","M","P","F","W","K","R","H","S","T","N","Q","Y","C","D","E"], [9.78,9.87,9.74,9.74,9.76,9.28,10.54,9.31,9.41,9.06,8.99,9.33,9.21,9.10,8.72,9.13,9.21,10.70,9.90,9.47]);    

%Checking to see if pH is in valid range and if inputted amino acids are valid sequences 
new_AA1 = char(AA1);
if not(pH>=0 && pH <=14)
    AA1_info = "Your pH is in the invalid range";
    return;
end
    
for i = 1:length(new_AA1)
    doesExist = isKey(pK1s_carbonyl,new_AA1(i));
    if not(doesExist)
        AA1_info = "One or more of your amino acid sequences contains at least one invalid amino acid";
        AA2_info = "";
        statement = "";
        return;
    end
end
new_AA2 = char(AA2);
for i = 1:length(new_AA2)
    doesExist = isKey(pK1s_carbonyl,new_AA2(i));
    if not(doesExist)
        AA2_info = "One or more of your amino acid sequences contains at least one invalid amino acid";
        AA1_info = "";
        statement = "";
        return;
    end
end

%Finding the charge and isoelectric points of both amino acids 
AA1_charge = charge_calc(pH,AA1);
AA1_charge_number = AA1_charge; 
    if AA1_charge > 0
        AA1_charge = strcat("+", string(AA1_charge), ". ");
    else
        AA1_charge = strcat(string(AA1_charge), ". ");
    end 
    
    AA2_charge = charge_calc(pH,AA2);
    AA2_charge_number = charge_calc(pH, AA2);
    if AA2_charge > 0
        AA2_charge = strcat("+", string(AA2_charge),". ");
    else
        AA2_charge = strcat(string(AA2_charge), ". ");
    end 
    AA1_pI = pI_calc(AA1);
    AA2_pI = pI_calc(AA2);
    
% Finding if the inputted amino acids move towards the cathode or anode     
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
    
% Putting all the information about each amino acid's isoelectric point, charge, and preference for cathode or anode into 
% text statements. 
    AA1_info = "AA1 info:";
    AA1_info = AA1_info +newline + strcat("The overall charge of amino acid ", AA1, " at pH ", string(pH),...
    " is ", AA1_charge); 
    AA1_info = AA1_info + newline + strcat("The pI of amino acid ", AA1, " is ",  string(AA1_pI), ". ");
    AA1_info = AA1_info + newline + strcat("Amino acid ", AA1, " will move toward the ", elec_end1);
    
    AA2_info = "AA2 info:";
    AA2_info = AA2_info + newline + strcat("The overall charge of amino acid ", AA2, " at pH ", string(pH), ...
    " is ", AA2_charge);
    AA2_info = AA2_info + newline + strcat("The pI of amino acid ", AA2, " is ",  string(AA2_pI), ". ");
    AA2_info = AA2_info + newline + strcat("Amino acid ", AA2, " will move toward the ", elec_end2);
  
 %Defining how the two amino acids would move if an ion exchanger was used to separate the amino acids
    statement = ion_exchanger(AA1_charge_number, AA2_charge_number, AA1, AA2);
   
% Generating an image that shows the separation of the amino acids on the cathode and anode 
% and text that describes the isoelectric point, charge, and how to separate the amino acids with 
% an ion exchanger. 
    cathode_anode_gen(AA1, AA2, AA1_pI,AA2_pI, AA1_info, AA2_info, statement);
    
end 

% Function calculates the total charge of an amino acid under a certain environmental pH
function total_charge = charge_calc(pH, AA)
%Defining the different charge properties of each amino acid and their pKas in a dictionary format 
pKRs = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [10.54, 12.48,6.04,3.90,4.07,10.46,8.37]);
pKRs_charge_below = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [1,1,1,0,0,0,0]);
pKRs_charge_equal = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [-1/2,-1/2,1/2,-1/2,-1/2,-1.5,-1/2]);
pKRs_charge_above = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [0,0,0,-1,-1,-1,-1]);
pK1s_carbonyl = containers.Map(["G","A","V","L","I","M","P","F","W","K","R","H","S","T","N","Q","Y","C","D","E"],[2.35,2.35,2.29,2.33,2.32,2.13,1.95,2.20,2.46,2.16,1.82,1.80,2.19,2.09,2.14,2.17,2.20,1.92,1.99,2.10]);
pK2s_amino_group = containers.Map(["G","A","V","L","I","M","P","F","W","K","R","H","S","T","N","Q","Y","C","D","E"], [9.78,9.87,9.74,9.74,9.76,9.28,10.54,9.31,9.41,9.06,8.99,9.33,9.21,9.10,8.72,9.13,9.21,10.70,9.90,9.47]);
% Summing the charge of amino acids that have charged R groups since uncharged amino acids do not have R groups that contribute towards overall charge
total_charge = 0; 
new_AA = char(AA);
for i = 1:length(new_AA)
	single_AA = new_AA(i);
    doesExist = isKey(pKRs,single_AA);
    if doesExist
        if pKRs(single_AA) < pH
            total_charge = total_charge + pKRs_charge_above(single_AA);
        elseif pKRs(single_AA) > pH
            total_charge = total_charge + pKRs_charge_below(single_AA);
        else 
            total_charge = total_charge + pKRs_charge_equal(single_AA);
        end
    else   
    end
end
% Adding the charge of the carbonyl group and the amino group based on pKas 
if pH > pK1s_carbonyl(new_AA(1))
	total_charge = total_charge - 1; 
elseif pH < pK1s_carbonyl(new_AA(1))
    total_charge = total_charge;
	
else 
	total_charge = total_charge - .5;
end
if pH < pK2s_amino_group(new_AA(end))
	total_charge = total_charge + 1;
elseif pH > pK2s_amino_group(new_AA(end))
	total_charge = total_charge;
else 
	total_charge = total_charge + .5;
end
end

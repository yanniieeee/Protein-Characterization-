function pI = pI_calc(AA)
pKRs = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [10.54, 12.48,6.04,3.90,4.07,10.46,8.37]);
pKRs_charge_below = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [1,1,1,0,0,0,0]);
pKRs_charge_equal = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [-1/2,-1/2,1/2,-1/2,-1/2,-1.5,-1/2]);
pKRs_charge_above = containers.Map(["K", "R", "H", "D", "E", "Y", "C"], [0,0,0,-1,-1,-1,-1]);
pK1s_carbonyl = containers.Map(["G","A","V","L","I","M","P","F","W","K","R","H","S","T","N","Q","Y","C","D","E"],[2.35,2.35,2.29,2.33,2.32,2.13,1.95,2.20,2.46,2.16,1.82,1.80,2.19,2.09,2.14,2.17,2.20,1.92,1.99,2.10]);
pK2s_amino_group = containers.Map(["G","A","V","L","I","M","P","F","W","K","R","H","S","T","N","Q","Y","C","D","E"], [9.78,9.87,9.74,9.74,9.76,9.28,10.54,9.31,9.41,9.06,8.99,9.33,9.21,9.10,8.72,9.13,9.21,10.70,9.90,9.47]);
all_pkas = [];
new_AA = char(AA);
for i = 1:length(new_AA)
	single_AA = new_AA(i);
    doesExist = isKey(pK1s_carbonyl,single_AA);
    if doesExist
        if new_AA(i) == "K"|| new_AA(i) == "R" || new_AA(i) == "H" || new_AA(i) == "D" || new_AA(i) == "E" || new_AA(i) == "Y" || new_AA(i) == "C"
            all_pkas = [all_pkas pKRs(single_AA)];
        else	
            all_pkas = all_pkas;
        end
    end 
end  

all_pkas = [0, all_pkas, pK1s_carbonyl(single_AA(1)), pK2s_amino_group(single_AA(end))];
	
sorted_pkas = sort(all_pkas);

for i = 1:(length(sorted_pkas) - 1)
	test_pH = (sorted_pkas(i) + sorted_pkas(i+1))/2;
	if charge_calc(test_pH, AA) == 0
		pI = (sorted_pkas(i) +sorted_pkas(i+1))/2;
        break
    end
end
end 

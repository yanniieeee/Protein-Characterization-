
https://user-images.githubusercontent.com/79676714/110406009-5e15ac00-8036-11eb-98b7-99481fad032e.mov

# Determining Protein Separation Method and Isoelectric Points

Our project plans to make protein characterization easier when given a pH and 2 amino acid sequences. The program tells the user how to separate the proteins 
and its charge properties using two methods, either under the given pH or at neutral (i.e. physiological) pH. Our main function, protein_char, takes in 3 inputs: pH (in range of 0-14) and 2 amino acid sequences in the one lettered abbreviation form as strings (i.e. "AAA", "AUGYKW") of any length. 

In order to filter out invalid inputs, our function is able to recognize if the pH is in between 0-14 inclusively and whether or not the amino acid sequences contain invalid amino acid abbreviations. If an invalid pH is inputted, our function will return “Your pH is in the invalid range”. If an amino acid sequence contains an invalid amino acid abbreviation, our function will return: “One or more of your amino acid sequences contains at least one invalid amino acid”.

The output of protein_char generates information about 2 ways to separate amino acids: an ion exchanger, and a cathode-anode electrophoresis gel.   

# For the ion exchanger:

Amino acid sequences have different charges at different pHs, depending on if their carboxyl groups, amino groups, and side chain (R) groups are protonated or deprotonated. So based on the user-inputted pH, the two amino acids may have different charge signs, allowing for easy separation through a cation exchanger (in which the positively-charged amino acid is expected to stay in the cation column while the other non-positively charged amino acid is expected to elute out) or anion exchanger (same thing as cation exchanger, except negatively-charged amino acids stay in the column). This program will tell you which ion exchanger to use, and which amino acid sequence will elute first; this information is seen as text at the bottom of the pop-up image. However, the user may notice that this separation method is flawed: what happens when both amino acids have the same sign charge (i.e. +1 and +2, -1 and -1, 0 and 0, etc.)?

# This is where the cathode-anode electrophoresis gel comes in: 

Amino acid sequences can be separated on a cathode and anode based on their respective pIs, or isoelectric points. In neutral (physiological) pH, amino acid sequences with pIs < 7 will be negatively charged, and will thus move towards the cathode (positive end). Meanwhile, amino acid sequences with pI > 7 will be positively charged at neutral (physiological pH), and will this move towards the anode (negative end). The distance that the amino acid travels is also directly proportional to its pI; the greater the |amino acid pI - 7| is, the farther towards its respective end of the electrophoresis graph. Our function provides an animated visual of this separation. Using gel eletrophoresis allows us to separate proteins that may have the same overall charge at the user-input pH and cannot be separated by an ion exchanger. As you long as you know what the two pIs of the two amino acids are, you can compare the distance they've traveled to see which pI corresponds to which amino acid sample placed in the eletrophoresis gel. And since pIs are unique to each amino acid sequence, as soon as you've assigned which pI to amino acid 1 or amino acid 2, you can identify the actual amino acid sequence of each sample, effectively separating and identifying your two inputted amino acid sequences. 

The output of protein_char also provides information about each amino acid sequence's isoelectric point, and the charge of the 2 amino acid sequences at the given pH, seen as text placed at the top of the pop-up image. 

We created several functions that would calculate the individual data that is outputted by protein_char. The function pI_calc takes in an amino acid sequence
in the one-letter abbreviation form and calculates the isoelectric point, which is the pH at which an amino acid has a net charge of 0. The function 
charge_calc takes in a pH and an amino acid sequence and outputs the charge of the amino acid at that pH. The cathode_anode_gen function is in charge of 
generating the animation of protein separation on the cathode and anode and also places descriptive text about each of the proteins on the image. The 
cathode_anode_gen function takes in 2 amino acids, 2 amino acid pIs, text describing the pI and charge of 2 amino acids, and a statement about how the 
two amino acids would filter out on an ion exchanger. The function ion_exchanger is in charge of generating the statement about how the two amino acids 
would filter out on an ion exchanger and takes in 2 amino acid charges and their sequences. 

# EXAMPLE:

input: 
[AA1_info, AA2_info, statement] = protein_char(2, "KRGAVEYCP", "KRHHSTIMP")

output:

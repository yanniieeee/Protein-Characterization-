# Protein-Characterization- 

Our project plans to make protein characterization easier when given a pH and 2 amino acid sequences. The program tells the user how to separate the proteins 
and its charge properties under a given pH. Our main function, protein_char, takes in 3 inputs: pH and 2 amino acid sequences in the one lettered abbreviation form (i.e. AAA, AUGYKW) of any length. 
The output of protein_char generates an image of the 2 Amino acid sequences being separated on a cathode and anode based on their respective charges 
at the inputted pH and also shows text that describes the isoelectric point, charge of the 2 amino acid sequences at the given pH, and which compound will
elute first on an ion exchanger. 

We created several functions that would calculate the individual data that is outputted by protein_char. The function pI_calc takes in an amino acid sequence
in the one-letter abbreviation form and calculates the isoelectric point, which is the pH at which an amino acid has a net charge of 0. The function 
charge_calc takes in a pH and an amino acid sequence and outputs the charge of the amino acid at that pH. The cathode_anode_gen function is in charge of 
generating the animation of protein separation on the cathode and anode and also places descriptive text about each of the proteins on the image. The 
cathode_anode_gen function takes in 2 amino acids, 2 amino acid pIs, text describing the pI and charge of 2 amino acids, and a statement about how the 
two amino acids would filter out on an ion exchanger. The function ion_exchanger is in charge of generating the statement about how the two amino acids 
would filter out on an ion exchanger and takes in 2 amino acid charges and their sequences. 

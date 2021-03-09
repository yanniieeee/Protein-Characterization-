% The function generates an image of 2 proteins separating on a cathode anode electrophoresis gel and text describing 
% the pI and charges of the 2 proteins as well as how the 2 proteins would separate on an ion exchanger.
function [] = cathode_anode_gen(AA1, AA2, AA1_pI, AA2_pI, AA1_info, AA2_info, statement)
%Plotting the rectangle of the entire electrophoresis gel 
gel = rectangle('Position',[1 1 14 4],'EdgeColor', 'k','FaceColor', [0.9, 0.9, 0.9]);
%Plotting the rectangle that represents the cathode and the cathode label
cathode = rectangle('Position',[0 1 1 4],'EdgeColor', 'k','FaceColor', [0.9, 0, 0.4]);
cathode_text = text(0+1/2,1+4/2,'Cathode','Rotation', 90, 'HorizontalAlignment','center');

%Plotting the rectangle that represents the anode and the anode label 
anode = rectangle('Position',[15 1 1 4],'EdgeColor', 'k','FaceColor', [0, 0.8, 1.0]);
anode_text = text(15+1/2,1+4/2,'Anode','Rotation', 270, 'HorizontalAlignment','center');

%Plotting the two wells that represent where the amino acids are initially placed  
AA2_well = rectangle('Position',[8 1.75 0.5 0.75], 'EdgeColor', 'k');
AA1_well = rectangle('Position',[8 3.5 0.5 0.75], 'EdgeColor', 'k');

%Initializing the rectangle that represents the first inputted amino acid 
AA1 = rectangle('Position',[8 3.5 0.5 0.75], 'EdgeColor', 'k', 'FaceColor', [1.0, 1.0, 0.4]);
AA1_text = text(8+0.5/2,3.5+0.75/2, 'AA1','Rotation', 90, 'HorizontalAlignment','center');

%Initializing the rectangle that represents the second inputted amino acid 
AA2 = rectangle('Position',[8 1.75 0.5 0.75], 'EdgeColor', 'k', 'FaceColor', [0.6, 0.6, 1.0]);
AA2_text = text(8+0.5/2,1.75+0.75/2,'AA2','Rotation', 90, 'HorizontalAlignment','center');
axis([-4 20 -4 10]);
axis equal
axis off

%Drawing a positive charge on top of the cathode rectangle 
positive_charge = viscircles([0.5 5.5], .35, 'Color', 'k');
positive_charge_text = text(.5, 5.55,'+', 'HorizontalAlignment','center');

%Drawing a negative charge on top of the anode rectangle  
negative_charge = viscircles([15.5 5.5], .35, 'Color', 'k');
negative_charge_text = text(15.5, 5.55,'-', 'HorizontalAlignment','center');

% Generating text that describes each of the properties of the two amino acids and how they would separate on an ion exchanger 
AA1_info_text = text(16, 8, AA1_info, 'HorizontalAlignment','center');
AA2_info_text = text(0, 8, AA2_info, 'HorizontalAlignment','center');
statement_text = text(8, 0, statement, 'HorizontalAlignment', 'center');


pause(0.3)
%Animating the movement of the amino acids on the gel electrophoresis 
for i = 0:20 
        delete(AA1);
        delete(AA1_text);
        delete(AA2);
        delete(AA2_text);
        AA1 = rectangle('Position',[8+i*(AA1_pI-7)/20 3.5 0.5 0.75], 'EdgeColor', 'k', 'FaceColor', [1.0, 1.0, 0.4]);
        AA1_text = text(8+0.5/2+i*(AA1_pI-7)/20 ,3.5+0.75/2,'AA1','Rotation', 90, 'HorizontalAlignment','center');
        AA2 = rectangle('Position',[8+i*(AA2_pI-7)/20 1.75 0.5 0.75], 'EdgeColor', 'k', 'FaceColor', [0.6, 0.6, 1.0]);
        AA2_text = text(8+0.5/2+i*(AA2_pI-7)/20,1.75+0.75/2,'AA2','Rotation', 90, 'HorizontalAlignment','center');
        pause(0.3);
end
end


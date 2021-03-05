function [] = cathode_anode_gen(AA1_pI, AA2_pI)
%to plot rectangle
gel = rectangle('Position',[1 1 14 4],'EdgeColor', 'k','FaceColor', [0.9, 0.9, 0.9]);
%anode
cathode = rectangle('Position',[0 1 1 4],'EdgeColor', 'k','FaceColor', [0.9, 0, 0.4]);
cathode_text = text(0+1/2,1+4/2,'Cathode','Rotation', 90, 'HorizontalAlignment','center');

%cathode
anode = rectangle('Position',[15 1 1 4],'EdgeColor', 'k','FaceColor', [0, 0.8, 1.0]);
anode_text = text(15+1/2,1+4/2,'Anode','Rotation', 270, 'HorizontalAlignment','center');

AA1 = rectangle('Position',[8 3.5 0.5 0.75], 'EdgeColor', 'k', 'FaceColor', [1.0, 1.0, 0.4]);
AA1_text = text(8+0.5/2,3.5+0.75/2,'AA1','Rotation', 90, 'HorizontalAlignment','center');

%AA2
AA2 = rectangle('Position',[8 1.75 0.5 0.75], 'EdgeColor', 'k', 'FaceColor', [0.6, 0.6, 1.0]);
AA2_text = text(8+0.5/2,1.75+0.75/2,'AA2','Rotation', 90, 'HorizontalAlignment','center');
axis([0 16 -1 6]);
axis off

pause(0.3)

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
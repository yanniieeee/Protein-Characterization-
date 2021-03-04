%to plot rectangle
rectangle('Position',[1 1 14 4],'EdgeColor', 'k','FaceColor', [0.9, 0.9, 0.9]);
%anode
rectangle('Position',[0 1 1 4],'EdgeColor', 'k','FaceColor', [0, 0.8, 1.0]);
text(0+1/2,1+4/2,'Anode','Rotation', 90, 'HorizontalAlignment','center')

%cathode
rectangle('Position',[15 1 1 4],'EdgeColor', 'k','FaceColor', [0.9, 0, 0.4]);
text(15+1/2,1+4/2,'Cathode','Rotation', 270, 'HorizontalAlignment','center')

%AA1
rectangle('Position',[8 3.5 0.5 0.75], 'EdgeColor', 'k', 'FaceColor', [1.0, 1.0, 0.4]);
text(8+0.5/2,3.5+0.75/2,'AA1','Rotation', 90, 'HorizontalAlignment','center')

%AA2
rectangle('Position',[8 1.75 0.5 0.75], 'EdgeColor', 'k', 'FaceColor', [0.6, 0.6, 1.0]);
text(8+0.5/2,1.75+0.75/2,'AA2','Rotation', 90, 'HorizontalAlignment','center')

axis([0 16 -1 6]);
axis off

blocks = load(' points.mat');
blocks = blocks.arr;
size = length (blocks)
close all

hold on
for i = 1 : size
 plots = blocks{i}
%  plots = plots'
 x = plots(:,1);
 y = plots(:,2);
 ind = length(x)-1;
 tx = x(ind);
 ty = y(ind);


 plot(x,y)
  drawnow;
 pause(1);
 x1 = [x(1) tx];
 y1 = [y(1) ty];
      drawnow;


end
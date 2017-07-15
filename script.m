%% load data into matlab
clear all
load('cellarray_ways.mat', 'cellarray_ways');
blocks = load(' blocks.mat')
blocks= blocks.arr
num_of_blocks=size(blocks)
hold on
for iii=1:num_of_blocks(2)
%Ways = zeros(length(cellarray_ways),length(cellarray_ways{cell_num}),2);
%% find block
for cell_num = 1:length(cellarray_ways)
    for point_num = 1:length(cellarray_ways{cell_num})
        Ways(cell_num,point_num,1) = cellarray_ways{cell_num}{point_num}(1);
        Ways(cell_num,point_num,2) = cellarray_ways{cell_num}{point_num}(2);
    end
end


%% load data into matlab

load('cellarray_ways.mat', 'cellarray_ways');

%Ways = zeros(length(cellarray_ways),length(cellarray_ways{cell_num}),2);
%% find block
for cell_num = 1:length(cellarray_ways)
    for point_num = 1:length(cellarray_ways{cell_num})
        Ways(cell_num,point_num,1) = cellarray_ways{cell_num}{point_num}(1);
        Ways(cell_num,point_num,2) = cellarray_ways{cell_num}{point_num}(2);
    end
end



X={};
Y={};



    
for cell_num = 1:length(cellarray_ways)
    %plot(Ways(cell_num,:,1) , Ways(cell_num,:,2));
  
     manual_ways_toshow=blocks{iii};
    
%% manual_ways_toshow=[63,80,74,97];
    if (sum(cell_num==manual_ways_toshow)==1)
        
        disp([num2str(cell_num) ,'_']);
        %following code is used to detect if the path(set of points) is a
        %relatively straight line
        [p,struct] = polyfit( Ways(cell_num,1:length(cellarray_ways{cell_num}),1) , Ways(cell_num,1:length(cellarray_ways{cell_num}),2) ,1)
        if(struct.df<90000000000000000 )% .df is a measure of straightness (dont know/need the exact details)
            
            plot( Ways(cell_num,1:length(cellarray_ways{cell_num}),1) , Ways(cell_num,1:length(cellarray_ways{cell_num}),2) );
            X{end+1}= Ways(cell_num,1:length(cellarray_ways{cell_num}),1);
            Y{end+1}= Ways(cell_num,1:length(cellarray_ways{cell_num}),2);
        else
            %dont plot lines that arent straight
            disp('is not a st line')
        end
        % number the lines for easy marking of paths
        text(max(Ways(cell_num,1:length(cellarray_ways{cell_num}),1)),max(Ways(cell_num,1:length(cellarray_ways{cell_num}),2)),num2str(cell_num))
        disp('^');
    
    end
drawnow;


end




%% pick a way and get its neighbouring ways


end
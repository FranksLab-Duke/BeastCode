function [ ] = subplotpos( spwidth, spheight, spgridx, spgridy, totalmargin )
%What does it do? It definitely updates the position and size of subplots, but I'm not sure if it's 1 or many. 
%                 See *** inputs for more. 

%SUBPLOTpos Summary of this function goes here (Thanks Kevin, also, I'm not too sure what these code lines mean)
%   sppos = subplotpos( spwidth, spheight, spgridx, spgridy ) --> An old version of the function?
% also makes subplots 20% bigger --> I'm not convinced this is always true

%INPUTS
%   spwidth: the wdidth of the current subplot
%   spheight: the height of the current subplot
%   ****spgridx: not sure if this is a vector or not, but possibly the x dimension of the grid spot within which the subplot 
%                will exist (think a plot within a box). I'd expect there's more than one grid spot though, but they're probably
%                all the same size? I'm not sure if this program works for 1 subplot at a time or many and if it's many, how the
%                position updates to put the new plots in subsequent grid spots 
%   ****spgridy: same idea as above but the y version
%   totalmargin: (I think) the current margin about the subplot in the figure window. Is the same value all around (x and y).
%                 Must be a value [0,1] for it to make sense and work with the code below.
%OUTPUTS
%   []: an empty array. Must be like this to get out the new axes array which sets the new plot dimensions and location (??)
%       >>Not sure why the output array needs to be empty, why axes isn't set to a variable which is what's returned, and why
%       a variable needs to be returned at all (the code line within this function should be able to update the current 
%       figure without needing to be pulled out, I think

% margin = 0.05; --> I don't think this is a real comment. The margins won't always be .05 unless totalmargin and subplot (sp) 
% dimentions are already related (I don't think they are since sps are usually rectangles, but here the initial margin is the 
% same all around the figure window, not different for the x and  y margins, like it's becoming in the below code.) 

%Set new margin values for x and y
marginx=totalmargin/(spwidth+1); %makes the current (x) margin smaller by a factor or the subplot width +1
marginy=totalmargin/(spheight+1); %makes the current (y) margin smaller by a factor or the subplot height +1

%Resize the plot size dimentions
%Note: totalmargin must be < 1 here so psx/y isn't negative 
plotsizex = (1-totalmargin)/spwidth; %makes the subplot width bigger when spw<1-tm and smaller when spw>1-tm.
                                     %subplot width must also be [0,1] for the plot size to have a chance at increasing
plotsizey = (1-totalmargin)/spheight; %same idea as above 
%Notice that the new margins above were set off the original sp size, not these new ones

%Set x and x subplot positions, spacing away from the edge of the figure
%window by marginx and marginy (leaving a margin around the subplot)
plotposx = marginx + (spgridx-1)*(plotsizex+marginx); %Gets a margin within the whole figure AND within its plot (plotsizex)
plotposy = marginy + (spheight-spgridy)*(plotsizey+marginy); %Gets a margin within the whole figure AND within its plot (plotsizey)

axes('position', [plotposx, plotposy, plotsizex, plotsizey]) %creats axes graphics object for current figure
                                                             %sets position and size of current subplot

end


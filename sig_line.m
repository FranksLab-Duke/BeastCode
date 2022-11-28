function sig_line(xs, ys, pv)
%INPUTS
%   xs: The x vales of 2 comparison points (a 1x2 array)
%   ys: The x vales of 2 comparison points (a 1x2 array)
%   pv: p value of their difference

%FUNCTION: Add a * and p value to an existing plot between 2 significantly different data points

yr = range(get(gca,'YLim')); %get the range of the ylim (ymin and max) from the current window. Is a single value

if pv<.05 %Only does something if pv is < .05 (significant)
    plot(xs,.05*yr+[max(ys), max(ys)],'k') %plot black dots slightly above each comparison point
    text(mean(xs),.07*yr+max(ys),'*','HorizontalAlignment','Center','BackGroundColor','none') %Add a black * at (mean(xs),slightly above max(ys))
    text(mean(xs),max(ys)-.07*yr,num2str(pv,'%0.3f'),'HorizontalAlignment','Center','BackGroundColor','none','fontsize',6) %Add the p value slightly below the *
end
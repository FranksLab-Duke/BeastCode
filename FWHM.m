function [dur] = FWHM(PSTHt,fx,wlevel)
%FWHM = full width at half maximum: 
%       usually to find the x-axis distance between the 2 points that are half the magnitude of the max along a curve
%       here, it seems to be the distance between 2 points that are some fraction of the max value, as set by the user 

%INPUTS
%   PSTHt: Peristimulus Time Histogram (time) --> probably the time vector (like actual time values recorded at)
%   fx: frequency --> probably the timeseries data in the psth (like the spikes/s values at each time point)
%   wlevel: probably a scalar [0,1] 

%OUTPUTS
%   dur: the (thresholded) duration of the spike 

[pk,lc] = max(fx); %pk = max value, lc = location on array (just 1 value)

%xr and xl give you the bound of values about pk that are above a certain threshold (as set by wlevel)
xr = find(fx(lc:end)<pk*wlevel,1); %Find the first indice of fx that is < pk*wlevel (a threshold amount (ex .95 of the peak)
                                   %following the indice of the peak. 
xl = lc-find(fx(1:lc)<pk*wlevel,1,'last'); %find the last indice where "" PRECEDING the peak

stepsize = mean(diff(PSTHt)); %a double, average step length between time points within PSTHt
if isempty(xr)
    xr = length(fx(lc:end)); %If the above code never found a value below the threshold, just set it to the final value in the set
end
if isempty(xl) %If the above code couldn't find a lower bound, set it to the indice of the peak (pk) value
    xl = lc;
end
    
dur = (xr+xl)*stepsize; %the duration of the (spike?). Is the time within the bounds*the avg time stepsize (scales the value up or down to match real time)
                        %Need to add them because xl=lc-find(..) and the xr is distance from lc, not 0
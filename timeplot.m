function timeplot(timedata, multiplier)
%Plots a time plot. There will be point at each timepoint a spike occured (all points will
%have the same y value == multiplier)

%INPUTS
%   timedata: x-axis data, time series
%   multiplier: multiplier for y axis inputs

plot(timedata,multiplier*ones(1,length(timedata)),'r.') %plots vs time data
%timedata = x values
%y values: a vector the length of timedata whose values==multiplier  
%Mark each point with red dots
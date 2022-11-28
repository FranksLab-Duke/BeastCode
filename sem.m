function [se] = sem(x)
%Returns the standard error caluclated from the standard error of the mean function for sample x. 
se = std(x)/sqrt(size(x,1));
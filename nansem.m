function [nse] = nansem(x)
%Standard error of means ignoring NANs
%INPUTS
%   x: a data set
%OUTPUTS
%   nse: the SEM of x ignoring NANs

%nanstd(): stddev of x ignorning NANs
%sum(~isnan(x)) sums every value in x that isn't NAN (sums every real value)
nse = nanstd(x)./sqrt(sum(~isnan(x)));
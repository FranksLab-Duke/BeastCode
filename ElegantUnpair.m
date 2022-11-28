function [X,Y] = ElegantUnpair(Z)
%INPUTS
%An array Z

%OUTPUTS
%2 arrays of the same length of z, x and y.

sqrtz = floor(Z.^.5); %raise each val of z to the .5 and floor each result (-6.7 becomes -7, 6.7 becomes 6)
sqz = sqrtz.^2;       %square the result (I guess this was to ensure we're working with whole numbers)
if (Z-sqz) >= sqrtz %This is only true if every value of the prior is >= than the following
    X = sqrtz;
    Y = Z - sqz - sqrtz;
else
    X = Z - sqz;
    Y = sqrtz;
end
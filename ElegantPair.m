function [Z] = ElegantPair(X,Y)
%INPUTS
%x and y must be arrays of the same length, or 1 must be a scalar
%Based on the way the code is written, it seems both x and y are arrays.

%OUTPUTS
%z: and array of the same length of x and y

if X >= Y %This will only run if every value of x is >= Y
    Z = X.^2 + X + Y; %z= (every element of x)^2+original x values+yo
else
    Z = Y.^2 + X;     %z= (every element of y)^2+original x
end
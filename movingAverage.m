% does moving average on signal x, window size is w
function y = movingAverage(x, w)
   k = ones(1, w) / w; %A 1-by-w matrix of 1/w
   y = conv(x, k, 'same'); %returns a central part of the convolution of x and k that is the same size as x (the signal)
end

%In math, convolution is a mathmatical operation on 2 functions that
%producesa  third function that expresses how the shape of 1 is modified by
%the other. 

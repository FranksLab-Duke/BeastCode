function [w] = gaussianwin(M,sigma)
% http://www.dsprelated.com/freebooks/sasp/Gaussian_Window_Transform.html
% This is actually the website you want, second example: https://www.dsprelated.com/freebooks/sasp/Matlab_Gaussian_Window.html
% 
%INPUTS:
%   M: window length
%   sigme: unnormalized standard deviation (generally M/8, says the website)
%OUTPUTS
%   w: a length M (or M-point) gaussian window who's points have std dev sigma
%THOUGHTS: I think this just makes a toy gaussian plot (like it generates
%          a curve that fits the window and signma parameters you give it) that you
%          can use to compare your actual data to. 
n= -(M-1)/2 : (M-1)/2;
w = exp(-n .* n ./ (2 * sigma .* sigma))';


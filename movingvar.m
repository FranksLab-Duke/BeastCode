function y=movingvar(X,N)
% y=movingvar(X,N)
% Calculates N-point moving variance of Vector
% Highly recommend that N be odd (no error checking)
% Note: first and last N/2 points will be unreliable.
% Output will be a column vector.
% Authors: Scott Seidman (scott.seidman@rochester.edu) 1/23/99

X=X(:); %Sticks each column one after the other into a big single column
XSQR=X.*X; %This is the same as squaring each value in the vector
convsig=ones(1,N); %A row vector of ones length N (the width of the window you want over your data for the variance calculation)

%Note: XSQR and X are the same size. Colvolving each of them with convsig results in matrices of the same size.
%       y is also the same size as these resultant matrices, but it's values contain the moving average over X.
%       Due to the context and how conv(a,b) is calculated, all of these resultant matrices are column vectors w/ 
%       length = max([length(convsig)+length(XSQR)-1,length(convsig),length(B)])
y=(conv(convsig,XSQR)-(conv(convsig,X).^2)/N)/(N-1);

y=y(ceil(N/2):length(X)+floor(N/2)); %Cuts the first and last N/2 points
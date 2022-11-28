function printpos(positions)
%Takes input: positions, no return value
%Updates values associated with current figure. 

%set(): sets object properties --> set(handle to be operated on, 'property name', property value)
%       H=gcf means get handle to current figure. 
set(gcf,'Position',positions) %sets positions of current figure handle to positions (input value)
set(gcf,'PaperUnits','points','PaperPosition',[0 0 positions(3:4)],'PaperSize',[positions(3:4)]); %sets all of these values,
%       but I think Blonding created them, I can't find them on the MathWorks help center
set(gcf,'DefaultAxesFontSize',10) %set default font size on current handle to 10

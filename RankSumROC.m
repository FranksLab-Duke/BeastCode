function [ auROC, p ] = RankSumROC( Control, Stimulus )
% Use matlab's ranksum function to get to an auROC for comparing PSTHs
%INPUTS
%   control: your control data
%   stimulus: test data
%OUTPUTS
%   auROC: area under the ROC curve
%   p: probability of seeing this result given the 2 distibutions have equal distributions and equal medians (null of rank sum
%      Don't forget, want a small p value to claim their different distributions/dif medians 

%Visit: https://glassboxmedicine.com/2019/02/23/measuring-performance-auc-auroc/ for informaiton on auROCs (really good website!)
%auROC is the area under an ROC curve

%Ranksum: https://data.library.virginia.edu/the-wilcoxon-rank-sum-test/#:~:text=Since%20the%20Wilcoxon%20Rank%20Sum,usually%20taken%20as%20equal%20medians.
[p,~,stats] = ranksum(Stimulus,Control); %returns p value of ranksum for stim and control samples,
                                         %and stats, contians field 'ranksum': rank sum statistic for Stimulus
auROC = (stats.ranksum - length(Stimulus)*(length(Stimulus)+1)/2)/(length(Stimulus)*length(Control)); %calculate auROC
if isnan(p)
    p = 1; %essentially meaning the observed rank sum statistic is 100% likely (came from same distributions)given the 2 samples
end
end


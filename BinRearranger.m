function [trainlabel,traindata,n_bins] = BinRearranger(Raster,PST,BinSize,Trials)
%INPUTS
%    Raster: 3d cell array containing 1d cell arrays. Contains raster plot info
%    PST: contains the start an end time points of interest
%    BinSize: how big you want each bin in the histogram to be
%    Trials: number of trials, should be an array (not scalar   
%Outputs from PSTHmaker_Beast, used below
%    PSTHtrials: organized the same way as Raster, but each element in the trial vector is now a count of the number of times a value fell in each bin
%    PSTHt: the iterative times in the PSTH, excluding t=0
%OUTPUTS
%   trainlabel: a column vector containing multiple repetitions of thecarray containing 1:the number of rows in the PSTHtrials
%               matrix
%   traindata: double reshaped version of the matrix version of PSTHtrials
%   n_bins: always going to be the length of PSTHt, I assume this will be used in whatever function using this one as the 
%           number of bins a future histogram should have


%Uses inputs with a different function to get back PSTHtrials and PSTHt
[~, PSTHtrials, PSTHt] = PSTHmaker_Beast(Raster, PST, BinSize, Trials); %skip the first output (which is PSTH), and only save the second 2 as PSTHtrials and PSTHt
            %get the time and trial hit information from the would be PSTH
%
% for V = 1:size(PSTHtrials,1)
%     for U = 1:size(PSTHtrials,2)
%         for T = 1:size(PSTHtrials,3)
%             PSTHtrials{V,U,T} = shake(PSTHtrials{V,U,T});
%         end
%     end
% end


%% for "temporal" code.  normalizing away all spike count changes.
% a = cellfun(@sum,PSTHtrials);
% aa = mat2cell(a,ones(size(a,1),1),ones(size(a,2),1),ones(size(a,3),1));
% b = cellfun(@rdivide,PSTHtrials,aa,'uni',0);
% pt = b;
% pt(a==0) = {ones(size(b{1,1,1}))/sum(ones(size(b{1,1,1})))};
% PSTHtrials = pt;

%%
    A = cell2mat(PSTHtrials); %turn the cell array PSTHtrials into a matrix


%create trainlabel, traindata, and n_bins based on how many dimensions A has    
if ndims(A) == 3 %If the matrix of PSTHtrials has 3 dimentions (rectangular prism)
    B = permute(A,[3,1,2]); %take the values in A and switch them so that the depth values are now the row values, rows are columns, and columns are depth
            %takes your values and rearranges them into a newly shaped matrix
            %https://www.mathworks.com/help/matlab/ref/permute.html
    traindata = reshape(B,size(B,1)*size(B,2),[]); %take elements columnwise from B and reshape so it has Brows*Bcols rows and as many columns as it needs
    trainlabel = repmat(1:size(A,1),size(PSTHtrials,3),1); %create a matrix containing copies of the array 1:size(A,1) so that it repeats the depth of PSTHtrials times in the row dim (that many "rows") and 1 time in the column dim 
    trainlabel = trainlabel(:); %make 1 big long column vector of the elements in trainlabel (repeat each column after the last)
    
    n_bins = length(PSTHt);
else
    B = permute(A,[4,1,2,3]); %same idea as above, but it makes a 4D matrix here instead of a 3D one. 
    
    traindata = reshape(B,size(B,1)*size(B,2),[]);%same as above
    trainlabel = repmat(1:size(A,1),size(PSTHtrials,4),1); %uses the 4th dim of PSTHtrials instead of the 3rd
    trainlabel = trainlabel(:);
    
    n_bins = length(PSTHt);
end
end


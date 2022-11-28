function [b] =  cellcat3d(a)
%Takes a cell array (matrix probs), concatenates, and reshapes it (returns)

% input: cell array
% returns b, a reshaped array

%returns an N-D array with the same elements as input [1], but reshaped to have size [2,3,4]
%in this case, the elements of input [1] are all the cells of 'a' concatenated along the first dimension (successive cells become successive rows (dim1))
%The x,y,z dimensions are (num rows in a, num columns in a, an empty vector (resizable) in the z plane)
%Note, the dimentions come from the original input cell array, not the concatenated version used in the reshape line
%       But: the output values (elements) came from the concatenated array.
b = reshape(cat(1,a{:}),size(a,1),size(a,2),[]);
end
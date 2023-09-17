%%%%%%%%%%%%%  Function apply_maxpool %%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PURPOSE: Reduce the spatial size of the array by producing and output
%          having only half the number of cols and rows. Maxpool will
%          operates on each channel separately.
% INPUT:
%       An array of size 2N x 2M x D
% 
% OUTPUT:
%       An Array of size N x D x D 
% 
% NOTES:
%      In must be defined as above  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [outarray] = apply_maxpool(inarray)
% assign size variables
[row, col, channel] = size(inarray); 

% split inarray into blocks/cells of 2x2 and put them in a cell array
ca = mat2cell(inarray, 2*ones(1, row/2), 2*ones(1, col/2), channel); 
% reshape (resize) the cell array to 1x(N*M)cell array
ca_new = reshape(ca,1,[]);
% create an empty cell array to store the max values
c = {};

% the for loop goes through every 2x2 cells in ca_new and find the maximum
% value of each cell, then add that value to the cell array c.
for i = 1:size(ca_new,2)
    x = ca_new(i);
    c{end+1} = max(cell2mat(x),[],[1 2]);
end

% reshape cell array c into N*M cell array
C = reshape(c,row/2,[]);

% return outarray by converting the cell array C back to array of size NxMxD
outarray = cell2mat(C);
end

    
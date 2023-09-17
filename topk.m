%%%%%%%%%%%%%  Function topk %%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PURPOSE: Calculate the accuracy in terms of the top-k classes
% INPUT:
%       k, an integer
%       monolith, the tabulated output of the CNN
%       trueclass, the groundtruth for the CNN
%
% OUTPUT:
%       accuracy, a double representing the percentage of time
%       the correct class was in the top-k predictions
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function accuracy = topk(k, monolith, trueclass)
correct_pred = 0;
for i = 1:length(trueclass)
    [~, indices] = maxk(monolith(1, 1, :, i), k);
    if ( ismember(double(trueclass(i)), indices))
        correct_pred = correct_pred + 1;
    end
end
accuracy = correct_pred / length(trueclass);
end
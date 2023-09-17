%%%%%%%%%%%%%  Function apply_fullconnect %%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Apply a filter bank of D_2 linear filters and D_2 scalar bias
%       values to compute output values. Each filter is applied in a
%       way that computes a sing,e scalar valued output. Then the 
%       output will be a 1 x 1 x D_2 array
%
% Input Variables:
%      In: an array of size N x M x D_1
%      F: a filterbank of size N x M x D_1 x D_2
%      B: bias value vector of size D_2
%      
% Returned Results:
%      Out: an array of size 1 x 1 x D_2
%
% 
%  Restrictions/Notes:
%      In must be defined as above  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Out = apply_fullconnect(In, F, B)

% Extract size values
f_bank_size = size(F);
N = f_bank_size(1);
M = f_bank_size(2);
D1 = f_bank_size(3);
D2 = f_bank_size(4);

Out = zeros(1,1,D2);

% For each filter in the filter bank (L used instead of l as 
% l (the letter after j)is indistinguishable from 1 (the integer after 0))
for L = 1 : D2
    % Multiply each coordinate in filter by same coordinate in In
    % and add the filter's corresponding scalar bias value B(L)
    for i = 1 : N
        for j = 1 : M
            for k = 1 : D1
                Out(1, 1, L) = Out(1, 1, L) + F(i, j, k, L) * In(i, j, k);
            end
        end
    end
    Out(1, 1, L) = Out(1, 1, L) + B(L);
end

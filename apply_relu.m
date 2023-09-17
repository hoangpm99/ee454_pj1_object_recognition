%%%%%%%%%%%%%  Function apply_fullconnect %%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      make any negative numbers in the input become 0
% Input Variables:
%      f: a MxNx3 RGB image array
%      
% Returned Results:
%      Out: an array of same size
%
% 
%  Restrictions/Notes:
%        
%    Ruike Tang 09/13/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Out = apply_relu(f)
[M,N,C] = size(f);
for c = 1:C
    for x = 1:M
        for y = 1:N
            Out(x,y,c) = max(f(x,y,c),0);
        end
    end
end
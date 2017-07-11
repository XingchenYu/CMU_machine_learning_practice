% The NB_Classify function takes a matrix of MAP estimates for theta_yw,
% the prior probability for class 0, and uses these estimates to classify
% a test set.
function [yHat] = NB_Classify(D, p, XTest)
    %% Inputs %% 
    % D - (2 by V) matrix
    % p - scalar
    % XTest - (m by V) matrix
    
    %% Outputs %%
    % yHat - 1D vector of length m
%     s_zero = zeros(size(XTest,1),1);
%     s_one = zeros(size(XTest,1),1);
    yHat = ones(size(XTest,1),1);
    for i = 1:size(XTest,1)
        s_zero = zeros(size(XTest,2),1);
        s_one = zeros(size(XTest,2),1);
        for j = 1:size(XTest,2)
            if (XTest(i,j) == 0)
               s_zero(j,1) = log(1 - D(1,j));
               s_one(j,1) = log(1 - D(2,j));
            else
               s_zero(j,1) = log(D(1,j));
               s_one(j,1) = log(D(2,j));
            end
        end
        p0 = logProd(s_zero) + log(p);
        p1 = logProd(s_one) + log(1 - p);
        if p0 >= p1
            yHat(i, 1) = 0;
        else 
            yHat(i, 1) = 1;
        end
    end
 
end

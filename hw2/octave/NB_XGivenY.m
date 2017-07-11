% The NB_XGivenY function takes a training set XTrain and yTrain and
% Beta parameters alpha and beta, then returns a matrix containing
% MAP estimates of theta_yw for all words w and class labels y
function [D] = NB_XGivenY(XTrain, yTrain, alpha, beta)
    %% Inputs %% 
    % XTrain - (n by V) matrix
    % yTrain - 1D vector of length n
    % alpha - scalar
    % beta - scalar

    %% Outputs %%
    % D - (2 by V) matrix
    numy_zero = sum(yTrain == 0) + alpha + beta - 2;
    numy_one = sum(yTrain == 1) + alpha + beta - 2;
    
    D = zeros(2, size(XTrain,2));
%     for i = 1:size(XTrain,2)
%         for j = 1:size(yTrain)
%             if (yTrain(j) == 0 && XTrain(j,i) == 1)
%                 D(1,i) = D(1,i) + 1;
%             end
%             if (yTrain(j) == 1 && XTrain(j,i) == 1)
%                 D(2,i) = D(2,i) + 1;
%             end
%         end
%     end
    y0 = double(yTrain == 0);
    y1 = double(yTrain == 1);
    x1 = double(XTrain == 1);
    D(1,:) = y0' * x1;
    D(2,:) = y1' * x1;
    D = D + alpha - 1;
    D(1,:) = D(1,:) / numy_zero;
    D(2,:) = D(2,:) / numy_one;
end
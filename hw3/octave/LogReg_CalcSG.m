%Function that calculates and returns the stochastic gradient value using a
%particular data point (x, y).

%Input
%x : 1xK+1 dimesnional feature point
%y : Actual output for the input x
%w : weight vector 

%Output
%sg : stochastic gradient of the weight vector

function [retval] = LogReg_CalcSG (x, y, w)
    phi = 1 ./ (1 + exp(-x * w));
    retval = (y - phi) * x;
end

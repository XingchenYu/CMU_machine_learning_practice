%function that reads all four of the Linear Regression csv files and outputs
%them as such

%Input
%filepath : The path where all the four csv files are stored.

%output 
%XTrain : NxK+1 matrix containing N number of K+1 dimensional training features
%yTrain : Nx1 vector containing the actual output for the training features
%XTest  : nxK+1 matrix containing n number of K+1 dimensional testing features
%yTest  : nx1 vector containing the actual output for the testing features

function [XTrain,yTrain,XTest,yTest] = LinReg_ReadInputs (filepath)
    XTrain = csvread([filepath, filesep(), 'LinReg_XTrain.csv']);
    yTrain = csvread([filepath, filesep(), 'LinReg_yTrain.csv']);

    XTest = csvread([filepath, filesep(), 'LinReg_XTest.csv']);
    yTest = csvread([filepath, filesep(), 'LinReg_yTest.csv']);
    
    max_train = max(XTrain);
    min_train = min(XTrain);
    for i = 1:size(XTrain,1)
        XTrain(i,:) = (XTrain(i,:) - min_train) ./ (max_train - min_train);
    end
    for i = 1:size(XTest,1)
        XTest(i,:) = (XTest(i,:) - min_train) ./ (max_train - min_train);
    end
    col_train = ones(size(XTrain,1),1);
    col_test = ones(size(XTest,1),1);
    XTrain = [col_train, XTrain];
    XTest = [col_test, XTest];
end

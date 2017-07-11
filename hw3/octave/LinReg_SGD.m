%Stochastic Gradient Descent Algorithm function

%Input
%XTrain : NxK+1 matrix containing N number of K+1 dimensional training features
%yTrain : Nx1 vector containing the actual output for the training features

%Output
%w    : Updated Weight vector after completing the stochastic gradient descent
%trainLoss : vector of training loss values at each epoch
%testLoss : vector of test loss values at each epoch

function [w, trainLoss, testLoss] = LinReg_SGD (XTrain, yTrain, XTest, yTest)
    w = ones(size(XTrain,2),1);
    w = w - 0.5;
    trainLoss = zeros(100,1);
    testLoss = zeros(100,1);
    for t = 1 : 100
        for i = 1 : size(XTrain,1)
            eta = (t - 1) * size(XTrain,1) + i;
            sg = LinReg_CalcSG (XTrain(i, :), yTrain(i), w);
            w = LinReg_UpdateParams (w, sg, 0.5 / sqrt(eta));
        end
        trainLoss(t) = LinReg_CalcObj (XTrain, yTrain, w);
        testLoss(t) = LinReg_CalcObj (XTest, yTest, w);
    end
    
%     plot(1:100,trainLoss,'r','lineWidth',2);
%     hold on
%     plot(1:100,testLoss,'b','lineWidth',2);
%     hold off
%     xlabel('100 epochs');
%     ylabel('Loss value');
%     legend('trainLoss','testLoss');
%     title('trainLoss and testLoss curve');
end




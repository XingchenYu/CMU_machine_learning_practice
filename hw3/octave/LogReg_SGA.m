%Stochastic Gradient Ascent Algorithm function

%Input
%XTrain : NxK+1 matrix containing N number of K+1 dimensional training features
%yTrain : Nx1 vector containing the actual output for the training features
%XTest  : nxK+1 matrix containing n number of K+1 dimensional testing features
%yTest  : nx1 vector containing the actual output for the testing features


%Output
%w             : final weight vector
%trainPerMiscl : a vector of percentages of misclassifications on your training data at every 200 gradient descent iterations
%testPerMiscl  : a vector of percentages of misclassifications on your testing data at every 200 gradient descent iterations
%yPred         : a vector of your predictions for yTest using your final w
   
function [w, trainPerMiscl, testPerMiscl, yPred] = LogReg_SGA (XTrain, yTrain, XTest, yTest)
    w = ones(size(XTrain,2),1);
    w = w - 0.5;
%     trainPerMiscl = zeros(5,1);
%     testPerMiscl = zeros(5,1);
%     for t = 1 : 5
%         for i = 1 : size(XTrain,1)
%             eta = (t - 1) * size(XTrain,1) + i;
%             sg = LogReg_CalcSG (XTrain(i, :), yTrain(i), w);
%             w = LogReg_UpdateParams (w, sg', 0.5 / sqrt(eta));
%         end
%         [yPred, trainPerMiscl(t)] = LogReg_PredictLabels (XTrain, yTrain, w);
%         [yPred, testPerMiscl(t)] = LogReg_PredictLabels (XTest, yTest, w);
%     end
    trainPerMiscl = zeros(floor(5 * size(XTrain,1) / 200),1);
    testPerMiscl = zeros(floor(5 * size(XTrain,1) / 200),1);
    for t = 1 : 5
        for i = 1 : size(XTrain,1)
            eta = (t - 1) * size(XTrain,1) + i;
            sg = LogReg_CalcSG (XTrain(i, :), yTrain(i), w);
            w = LogReg_UpdateParams (w, sg', 0.5 / sqrt(eta));
            if (mod(eta, 200) == 0)
                [yPred, trainPerMiscl(floor(eta / 200))] = LogReg_PredictLabels (XTrain, yTrain, w);
                [yPred, testPerMiscl(floor(eta / 200))] = LogReg_PredictLabels (XTest, yTest, w);
            end
        end
        
    end
    
%     plot(1:size(trainPerMiscl,1),trainPerMiscl,'r','lineWidth',2);
%     hold on;
%     plot(1:size(testPerMiscl,1),testPerMiscl,'b','lineWidth',2);
%     hold off;
%     xlabel('epochs')
%     ylabel('Error value')
%     legend('trainPerMiscl','testPerMiscl')
%     title('Training and test percentages of misclassified points')
end

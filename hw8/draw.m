a = [33.3,91.875,94.275,95.5,96.35,97.14,97.375,97.68,98.14,98.45,98.59,98.66,98.96,98.8,99.21,99.42,99.44,99.4];
b = [1.099,0.319,0.189,0.261,0.1898,0.1581,0.2165,0.1541,0.1474,0.1173,0.0703,0.1037,0.0957,0.1313,0.0545,0.0723,0.0687,0.0989];
plot(0:10000:170000,a)
xlabel('Numbers of iterations'),ylabel('Test accuracy');  
title('Test accuracy trending ');  
hold on;
plot(1:10000,list2,'r');
legend('Brute force sampling','Gibbs sampling');
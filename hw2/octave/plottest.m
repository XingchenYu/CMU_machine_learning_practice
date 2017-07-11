X = 0.1 : 0.01 : 0.3;
y1 = betapdf(X, 2, 5);
y2 = betapdf(X, 5 ,2);

figure
plot(X,y1,'r');

hold on
plot(X,y2,'b');
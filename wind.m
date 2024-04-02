M = csvread("T1.csv");

x = normalize(M(2:433,2),"range");
x2 = normalize(M(2:433,4), "range");

y = linspace(0,72,432);

figure(1)
plot(y,x,'bo'); hold on
plot(y,x2,'ro'); hold off

figure(2)
a = normalize(M(2:4321,2), "range");
b = M(2:4321,3);
z = max(M(:,2))

plot(b,a,'o');

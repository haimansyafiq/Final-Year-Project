M = csvread("T1.csv");
size(M,1)
[Mnorm, c, s] = normalize(M(2:end), "range");

z1 = normalize(M(2:433,4), "center", c, "scale", s);
x1 = normalize(M(2:433,2), "center", c, "scale", s);
length(z1)
length(x1)

z2 = normalize(M(434:865,4), "center", c, "scale", s);
x2 = normalize(M(434:865,2), "center", c, "scale", s);

x3 = normalize(M(866:1297,2),"center", c, "scale", s);
z3 = normalize(M(866:1297,4),"center", c, "scale", s);

y = linspace(0,72,432);



figure(1)
plot(y,x1,'b'); hold on
plot(y,z1,'r'); hold off

figure(2)
plot(y,x2,'b'); hold on
plot(y,z2,'r'); hold off

figure(3)
plot(y,x3,'b'); hold on
plot(y,z3,'r'); hold off

%Parameters

N = 10^4;
thetaR = 0.5;
sigmaR = 0.2;

rhoX = 0.3087;
thetaX = 0.2317;
mewX = 0.712;
sigmaX = 0.0884;

xa = 0; xb = 2;
parvec = [xa,xb,rhoX, thetaX, mewX, sigmaX, thetaR, sigmaR];

%Generate N-col vector of values

a = 0.05; rc = 0.5;
R0 = rc + a.*randn(N,1);

b = 0.05; xc = 0.5;
X0 = xc + b.*randn(N,1);

%Integration scheme
tend = 48;
t0 = 1;
dt = 0.001;

tsteps = (tend-t0)/dt;

%[Rtend, Rmat] = R_RK2(R0,t0,tsteps,dt,parvecR);
[Xtf , Xmat] = X_EM(X0, R0, t0, tsteps, dt, parvec);

%Plot
figure(1)
[f0,xx] = hist(X0,50);
p0 = exp(-(xx-0.5).^2/(2*a^2))./sqrt(2*pi*a^2);
dxx = diff(xx(1:2));
bar(xx,f0/sum(f0*dxx)); hold on
plot(xx,p0,'r'); hold off
axis([0 6 0 9]);


figure(2)
[f,xx] = hist(Xtf,50);
dxx = diff(xx(1:2));
bar(xx,f/sum(f*dxx));
axis([0 6 0 9]);

figure(3)
t = linspace(t0,tend,100);
plot(t,Xmat(10,:),'b',t,Xmat(20,:),'k');
xlabel('t'); ylabel('X_t');

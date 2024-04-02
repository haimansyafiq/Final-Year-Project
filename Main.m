dataSet = csvread("T1.csv");

%Numerical Parameters

N = 10^4; % No. of particles

% dXt Parameter estimates
theta = 0.2;
alpha = 0.2;

xa = 0; xb = 1;
parvec = [xa,xb, theta, alpha];

% Generate N-col vector of values from normal dist.

X0 = dataSet(2,4);

%Integration scheme
tend = 1;
t0 = 0;
dt = 0.01;

tsteps = (tend-t0)/dt;

%[Rtend, Rmat] = R_RK2(R0,t0,tsteps,dt,parvecR);
Xtf = MOne(X0, t0, tsteps, dt, parvec);

%Plot
%figure(1)
%[f0,xx] = hist(X0,50);
%p0 = exp(-(xx-0.5).^2/(2*a^2))./sqrt(2*pi*a^2);
%dxx = diff(xx(1:2));
%bar(xx,f0/sum(f0*dxx)); hold on
%plot(xx,p0,'r'); hold off
%axis([0 6 0 9]);


%figure(2)
[f,xx] = hist(Xtf,50);
dxx = diff(xx(1:2));
bar(xx,f/sum(f*dxx));
%axis([0 6 0 9]);

%figure(3)
%t = linspace(t0,tend,100);
%plot(t,Xmat(10,:),'b',t,Xmat(20,:),'k');
%xlabel('t'); ylabel('X_t');

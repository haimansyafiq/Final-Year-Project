function [Xend,Xmat] = X_EM(xstart, rstart, t0, tsteps, dt, parvec)

  N = size(rstart, 1); %no. of particles
  xnow = xstart;
  rnow = rstart;

  xa = parvec(1);
  xb = parvec(2);

  rhoX = parvec(3);
  thetaX = parvec(4);
  mewX = parvec(5);
  sigmaX = parvec(6);

  thetaR = parvec(7);
  sigmaR = parvec(8);

  %Initialize soln arrays
  Xend = zeros(size(xstart));
  Xmat = zeros(N, 100);

  %Rend = zeros(size(rstart));
  %Rmat = zeros(N, 100);

  %Go through steps
  tnow = t0;
  for j = 1:tsteps
    dW = sqrt(dt).*randn(N,1);
    Pt = (sin(tnow/6)).^2;
    dPt = (cos(tnow/6).*sin(tnow/6))./3;

    xnew = xnow + ((1-exp(-xnow)).*(rhoX.*dPt + rnow) + thetaX.*(Pt.*mewX - xnow)) + sigmaX.*dW;
    rnew = rnow - thetaR.*rnow.*dt + sigmaR.*dW;

    %domain boundaries
    %xnew(xnew<xa) = -xnew(xnew<xa);
    %xnew(xnew>xb) = 2*xb - xnew(xnew>xb);

    if mod(j,tsteps/100) == 0
      trow = j/(tsteps/100);
      Xmat(:,trow) = xnew;
    endif

    tnow = t0 + j*dt;
    xnow = xnew;
    rnow = rnew;

  endfor

  Xend = xnew;


function [Xend, Xmat] = MOne(xstart, t0, tsteps, dt, parvec)

  N = size(xstart, 1); %no. of particles
  xnow = xstart;

  theta = parvec(3);
  alpha = parvec(4);

  %Initialize soln arrays
  Xend = zeros(size(xstart));
  Xmat = zeros(N, 100);

  %Go through steps
  tnow = t0;
  for j = 1:tsteps
    dW = sqrt(dt).*randn(N,1);
    Pt = (sin(tnow/6)).^2;

    bX = -theta.*(xnow-Pt);
    cX = sqrt(2.*theta.*alpha.*xnow.*(1-xnow));

    if tnow == 0 || tnow == 1
      cX = 0;
    endif

    xnew = xnow + bX.*dt + cX.*dW;

    if mod(j,tsteps/100) == 0
      trow = j/(tsteps/100);
      Xmat(:,trow) = xnew;
    endif

    tnow = t0 + j*dt;
    xnow = xnew;

  endfor

  Xend = xnew;


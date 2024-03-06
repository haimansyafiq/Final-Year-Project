function [rend,rmat] = R_RK2(rstart, t0, tsteps, dt, parvec)

%============ Currently not called in main =======%

  N = size(rstart, 1); %no. of particles
  rnow = rstart;

  ra = parvec(1);
  rb = parvec(2);

  alpha = parvec(3);
  sigma = parvec(4);


  %Initialize soln arrays
  rend = zeros(size(rstart));
  rmat = zeros(N, 100);

  %Go through steps
  tnow = t0;
  for j = 1:tsteps
    dW = sqrt(dt).*randn(N,1);
    rmew = rnow - alpha.*rnow.*dt + sigma.*dW;
    rnew = rnow + 0.5.*(-alpha.*rnow - alpha.*rmew).*dt + 0.5.*sigma.*dW;
    %rnew = rnow - alpha.*rnow.*dt + sigma.*dW;

    %domain boundaries
    rnew(rnew<ra) = -rnew(rnew<ra);
    rnew(rnew>rb) = 2*rb - rnew(rnew>rb);

    if mod(j,tsteps/100) == 0
      trow = j/(tsteps/100);
      rmat(:,trow) = rnew;
    endif

    tnow = t0 + j*dt;
    rnow = rnew;

  endfor

  rend = rnew;


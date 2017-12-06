function y = fq1(t,u)
%y=du/dt
  global C;
  global R;
  global V;
  R0 = R(1+0.1((V-u/C)/R))
%  y = (V-u/C)/R

function y = fq1(t,u)
%y=du/dt
  global C;
  global R;
  global V;
  y = (V-u/C)/R

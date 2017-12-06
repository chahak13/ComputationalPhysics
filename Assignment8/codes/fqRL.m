function y = fqRL(t,u)
%y=du/dt
  global L;
  global R;
  global V;
  y = (V-u*R)/L;

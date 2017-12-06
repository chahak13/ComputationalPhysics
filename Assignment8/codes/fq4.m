function y = fq4(t,u)
%y=du/dt
  global L;
  global C;
  global R;
  global Amp;
  global freq;

  V = Amp*sin(2*pi*freq*t);

  y=zeros(2,1);
  y(1) = u(2);
  y(2) = V/L - u(2)*R/L - u(1)/(L*C);

function y = fq1(t,u)
%y=du/dt
  global L;
  global C;
  y=zeros(2,1);
  y(1)=u(2);
  y(2)=-1*u(1)/(L*C);

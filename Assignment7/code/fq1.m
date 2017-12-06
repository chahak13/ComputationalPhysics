function y = fq1(t,u)

global G;
global Msun;
global Mearth;
r= u(1)^2 + u(2)^2;
r= sqrt(r);
F = -1*G*Mearth*Msun/r^2;
theta = atan2(u(2),u(1));
aX = F*cos(theta)/Mearth;
aY = F*sin(theta)/Mearth;
y=zeros(4,1);
y(1)=u(3);
y(2)=u(4);
y(3)=aX;
y(4)=aY;





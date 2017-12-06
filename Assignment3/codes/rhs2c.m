function y = rhs2c(t,u);

global cnst;
global alpha;
R=6400000;
Bm = 4e-5;
y0 = 1000;
g = cnst;
v=sqrt(u(1)^2 + u(2)^2);

y = zeros(length(u),1);

y(1) = -g*sin(alpha) - Bm*exp(-1*u(4)/y0)*v*u(1);
y(3) = u(1);
y(2) = -g*cos(alpha) - Bm*exp(-1*u(4)/y0)*v*u(2);
y(4) = u(2);
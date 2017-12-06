function y = rhs(t,u);

global cnst;
global m;
w = 10;
c = 1;
y = zeros(length(u),1);

y(1) = u(2);

y(2) = (-1*cnst).*u(1)-c/(2*m).*u(2)-cos(w*t)/m;
function y = rhs(t,u);

global cnst;
y = zeros(length(u),1);

y(1) = u(2);

y(2) = (-1*cnst).*u(1);
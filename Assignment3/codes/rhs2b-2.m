function y = rhs2b(t,u);

global cnst;
R=6400000;

g = cnst/(1+u(4)/R).^2;

y = zeros(length(u),1);
y(1) = 0;
y(3) = u(1);
y(2) = -g;
y(4) = u(2);
function y = rhs2(t,u);

global cnst;
y = zeros(length(u),1);
y(1) = 0;
y(2) = -1*cnst;
y(3) = u(1);
y(4) = u(2);

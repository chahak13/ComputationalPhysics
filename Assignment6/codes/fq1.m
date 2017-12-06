function [y_0] = fq1(t,y)
y_0 = zeros(4,1);
global m1;
global l1;
global m2;
global l2;
global g;

a = (m1+m2)*l1;
b = m2*l2*cos(y(1)-y(3));
c = m2*l1*cos(y(1)-y(3));
d = m2*l2;
e = -m2*l2*y(4)*y(4)*sin(y(1)-y(3)) - g*(m1+m2)*sin(y(1));
f = m2*l1*y(2)*y(2)*sin(y(1)-y(3)) - m2*g*sin(y(3));

y_0(1) = y(2);
y_0(3) = y(4);
y_0(2) = (d*e - b*f)/(a*d - b*c);
y_0(4) = (a*f - c*e)/(a*d - c*b);
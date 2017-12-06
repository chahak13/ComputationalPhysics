clear all;
close all;
clc;

t_start = 0;
t_end = 100;
dt = 0.01;
t_span = [t_start:dt:t_end];

global m1;
global m2;
global l1;
global l2;
global g;
m1 = 2; % mass of sphere 1
m2 = 1; % mass of sphere 2
l1 = 1; % length of string 1
l2 = 2; % length of string 2
g = 32;

initial = zeros(4,1);
initial(1) = 2*pi/5;
initial(2) = 0.0;
initial(3) = pi/2;
initial(4) = 0.0;
options = odeset('RelTol',1.0e-6);
[t,y] = ode45('fq1',t_span,initial,options);

% y(1) = theta1
% y(2) = d(theta1)/dt
% y(3) = theta2
% y(4) = d(theta2)/dt

% Potential Energy
V = -1*(m1+m2)*g*l1*cos(y(:,1)) - m2*g*l2*cos(y(:,3));

% Kinetic energy
K = 0.5*(m1+m2)*y(:,2).^2*l1.^2 + 0.5*m2*(l2.^2*y(:,4).^2 + 2*l1*l2*y(:,2).*y(:,4).*cos(y(:,1)-y(:,3)));

% Total energy
T = K + V;

% End point of pendulum one
x1 = l1*sin(y(:,1));
y1 = l1*cos(y(:,1));
vx1 = l1*cos(y(:,1)).*y(:,2);
vy1 = -1*l1*sin(y(:,1)).*y(:,2);


% End point of double pendulum 
x2 = l1*sin(y(:,1)) + l2*sin(y(:,3));
y2 = -l1*cos(y(:,1))-l2*cos(y(:,3));
vx2 = l1*cos(y(:,1)).*y(:,2) + l2*cos(y(:,3)).*y(:,4);
vy2 = -l1*sin(y(:,1)).*y(:,2) - l2*sin(y(:,3)).*y(:,4);

plot(x2,y2),title('Position of second pendulum'),xlabel('x(m)'),ylabel('y(m)');
figure();
plot(t,y(:,1)),title('Angular displacement of pendulum 1'),xlabel('t(s)'),ylabel('Theta(rad)');
figure();
plot(t,y(:,3)),title('Angular displacement of pendulum 2'),xlabel('t(s)'),ylabel('Theta(rad)');
figure();
plot(t,T),title('Total energy of the system'),xlabel('t(s)'),ylabel('Joules'),ylim([-50 0]);
figure();
plot(t,K),title('Kinetic energy of the system'),xlabel('t(s)'),ylabel('Joules');
figure();
plot(t,V),title('Potential energy of the system'),xlabel('t(s)'),ylabel('Joules');

% h = plot(NaN,NaN);
% x = t_span;
% y = y1;
% for k = 1:length(x)
%     pause(0.001);
%     set(h,'XData',x(1:k),'YData',y(1:k));
%     drawnow
% end
% Mass spring system

clc;
clear all;
close all;
 
k=1;                                      % value of spring constant (N/m)
m=1;                                         % mass of object (kg)
global cnst;
cnst = k/m;
w0 = sqrt(k/m);
time_period = 2*pi*sqrt(m/k);
dt = time_period/1000;
t_start = 0;
t_end = 4*time_period;
t_span = t_start:dt:t_end;
num_points = t_end/dt;

 
u0 = zeros(2,1);
T = zeros(length(u0),1);
u0(1) = 1; % x
u0(2) = 0; % v
 
[t,u] = ode45(@rhs,[t_start:dt:t_end],u0);

kinetic_energy = 0.5*m*u(:,2).*u(:,2);
potential_energy = 0.5*k*u(:,1).*u(:,1);
total_energy = kinetic_energy + potential_energy;
energy_error = (total_energy - total_energy(1,1))/total_energy(1,1);

plot(t,u(:,1),'b',t,u(:,2),'r'),xlabel('(m-blue), (m/s-red)'),ylabel('Time(s)'),title('Plot of position and velocity of the mass with time(k=1,m=1)');
figure();
plot(u(:,1),u(:,2)),xlabel('Position(m)'),ylabel('Velocity(m/s)'),title('Phase space diagram of the mass(k=1,m=1)');

figure();
subplot(2,1,1);
analytic_x = cos(w0*t);
plot(t_span,analytic_x,t,u(:,1),'r');
subplot(2,1,2);
analytic_v = -w0*sin(w0*t);
plot(t_span,analytic_v,t,u(:,2),'r');

figure();
plot(t,energy_error),ylabel('Joules(J)'),xlabel('Time(s)'),title('Error in energy');
figure();
plot(t,total_energy),ylabel('Joules(J)'),xlabel('Time(s)'),title('Total energy');
figure();
plot(t,kinetic_energy),ylabel('Joules(J)'),xlabel('Time(s)'),title('Kinetic energy');
figure();
plot(t,potential_energy),ylabel('Joules(J)'),xlabel('Time(s)'),title('Potential energy');

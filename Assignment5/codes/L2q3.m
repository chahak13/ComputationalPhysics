% Mass spring system

clc;
clear all;
close all;
 
global k;                                      % value of spring constant (N/m)
global m;                                         % mass of object (kg)
global cnst;
k=10;
m=1;
cnst = k/m;
w0 = sqrt(k/m)
time_period = 2*pi*sqrt(m/k);
dt = time_period/1000;
t_start = 0;
t_end = 100;
t_span = t_start:dt:t_end;
num_points = t_end/dt;

 
u0 = zeros(2,1);
T = zeros(length(u0),1);
u0(1) = 1; % x
u0(2) = 1; % v
 
[t,u] = ode45(@fq3,[t_start:dt:t_end],u0);

kinetic_energy = 0.5*m*u(:,2).*u(:,2);
potential_energy = 0.5*k*u(:,1).*u(:,1);
total_energy = kinetic_energy + potential_energy;

plot(t,u(:,1),'b',t,u(:,2),'r'),xlabel('(m-blue), (m/s-red)'),ylabel('Time(s)'),title('Plot of position and velocity of the mass with time');
figure();
plot(u(:,1),u(:,2)),xlabel('Position(m)'),ylabel('Velocity(m/s)'),title('Phase space diagram of the mass');
figure();
plot(t,kinetic_energy,'b'),xlabel('Time(s)'),ylabel('Kinetic Energy(J)'),title('Kinetic Energy of the mass');
figure();
plot(t,potential_energy,'b'),xlabel('Time(s)'),ylabel('Potential Energy(J)'),title('Potential Energy of the mass');
figure();
plot(t,total_energy,'b'),xlabel('Time(s)'),ylabel('Total Energy(J)'),title('Total Energy of the mass');

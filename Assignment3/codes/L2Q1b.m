% Mass spring system

clc;
clear all;
close all;
 
k=4900;                                      % value of spring constant (N/m)
m=100;                                         % mass of object (kg)
global cnst;
cnst = k/m;
time_period = 2*pi*sqrt(m/k);
dt = time_period/1000;
t_start = 0;
t_end = 4*time_period;
num_points = t_end/dt;

 
u0 = zeros(2,1);
T = zeros(length(u0),1);
u0(1) = 0.7;
u0(2) = 0;
 
[t,u] = ode45(@rhs,[t_start:dt:t_end],u0);

plot(t,u);
figure();
plot(u(:,1),u(:,2));
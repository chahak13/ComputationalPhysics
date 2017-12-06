%Pendulum 

clc;
 clear all;
 close all;
 
 l=1;                                           % Length of the string (m)
 g=9.8;                                         % Gravitational acceleration (m/s2)
 global cnst;
 cnst = g/l;
 time_period = 2*pi*sqrt(l/g);
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
 
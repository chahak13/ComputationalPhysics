% Projectile motion using ode with variable g

clc;
clear all;
close all;

t_start = 0;
t_end = 150;
dt = 0.1;
num_points = t_end/dt;
global cnst;
cnst = 9.8;
theta = pi/6;
ini_velocity = 750;
u0 = zeros(4,1);
u0(1) = ini_velocity*cos(theta);                % Vx
u0(2) = ini_velocity*sin(theta);                % Vy
u0(3) = 0;                                      % X0
u0(4) = 0;                                      % Y0

%u0(5)= 9.8;                                     % g0
%X = zeros(num_points,1);
%Y = zeros(num_points,1);
%T = zeros(num_points,1);

[t,u] = ode45(@rhs2b,[t_start:dt:t_end],u0);
[t2,u2] = ode45(@rhs2,[t_start:dt:t_end],u0);



for step=1:num_points
    if(u(step,4)>=0)
      continue;
    else
        break;
    end
end

plot(t,u(:,3));
grid on;
figure();   

hold on;

% Analytic solution

g = 9.8;
%X = zeros(num_points,1);
%Y = zeros(num_points,1);
T = zeros(num_points,1);

for step2 = 1:num_points-1
    T(step2+1) = T(step2) + dt;
end

X = ini_velocity*cos(theta)*T;
Y = ini_velocity*sin(theta)*T - 0.5*g*(T.^2);

plot(t(1:step),u(1:step,4),t2(1:step),u2(1:step,4),'r.',T(1:step),Y(1:step),'g');      % blue - variable g; red - constant g; green = analytical

grid on;

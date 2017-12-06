% Projectile motion using ode with drag

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


[t,u] = ode45(@rhs2bb,[t_start:dt:t_end],u0);

for step=1:num_points
    if(u(step,4)>=0)
      continue;
    else
        break;
    end
end

plot(t(1:step),u(1:step,3));
title('Position in x direction');
grid on;
figure();   
plot(t(1:step),u(1:step,4));
title('Position in y direction');
grid on;
figure();
plot(t(1:step),u(1:step,1));
title('velocity in x direction');
grid on;
figure();
plot(t(1:step),u(1:step,2));
title('velocity in y direction');
grid on;


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
ini_velocity = 750;
u0 = zeros(4,1);

u0(3) = 0;                                      % X0
u0(4) = 0;                                      % Y0
theta = (15*pi)/180:pi/180:(60*pi)/180;
max_range = zeros(length(theta),1);
max_theta = 0;

for i=1:length(theta)
    
    u0(1) = ini_velocity*cos(theta(i));                % Vx
    u0(2) = ini_velocity*sin(theta(i));                % Vy
    [t,u] = ode45(@rhs2bb,[t_start:dt:t_end],u0);
    
    for step=1:num_points
        if(u(step,4)>=0)
          continue;
        else
          break;
        end
    end
    
    max_range(i) = u(step,3); 
    
end
max_range_final = max(max_range)

for i=1:length(theta)
    if(max_range(i) == max_range_final)
        break;
    end
end

max_theta = theta(i)
subplot(2,2,1)
plot(t(1:step),u(1:step,3));
title('Position in x direction');
grid on;
subplot(2,2,2);   
plot(t(1:step),u(1:step,4));
title('Position in y direction');
grid on;
subplot(2,2,3);
plot(t(1:step),u(1:step,1));
title('velocity in x direction');
grid on;
subplot(2,2,4);
plot(t(1:step),u(1:step,2));
title('velocity in y direction');
grid on;
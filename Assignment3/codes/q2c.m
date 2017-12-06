% Projectile motion of a missile assuming the target to be 5000m away and
% at a height of 5000m

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
global alpha;
alpha = pi/4;
target_distance = 5000*sqrt(2);
max_theta = 0;

u0 = zeros(4,1);
u0(3) = 0;                                      % X0
u0(4) = 0;                                      % Y0
theta = 1:pi/180:(20*pi)/180;
velocity = 500:800;
max_range = zeros(length(theta),1);

for i=1:length(theta)
    
    u0(1) = ini_velocity*cos(theta(i)+pi/4);                % Vx
    u0(2) = ini_velocity*sin(theta(i)+pi/4);                % Vy
    [t,u] = ode45(@rhs2bb,[t_start:dt:t_end],u0);
    
    for step=1:num_points
        if(u(step,4)<=0)
          continue;
        else
          break;
        end
    end
    
    max_range(i) = u(step,3); 
    
end
max_range_final = max(max_range);
for i=1:length(theta)
    if(max_range(i) == max_range_final)
        max_theta = theta(i)
        break;
    end
end

for i=1:length(velocity)
    u0(1) = velocity(i)*cos(max_theta);                % Vx
    u0(2) = velocity(i)*sin(max_theta);                % Vy
    [t,u] = ode45(@rhs2c,[t_start:dt:t_end],u0);
    
    for step=1:num_points
        if(u(step,4)<=0)
          continue;
        else
          break;
        end
    end
    
    max_range(i) = u(step,3);
end

for i=1:length(velocity)
    if(max_range(i)<=5000)
        continue;
    else
        break
    end;
end

subplot(2,1,1)
plot(t,u(:,3));
title('Position in x direction');
grid on;
subplot(2,1,2);   
plot(t,u(:,4));
title('Position in y direction');
grid on;

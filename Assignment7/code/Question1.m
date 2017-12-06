close all;
clear all;
clc;

simulation_time = 1;
step_size = 0.001;


initial = [0 1 2*pi 0];
[t, solved] = ode45(@rhs1, 0:step_size:simulation_time, initial);
if max(solved(:,1))>max(solved(:,2))
    a = max(solved(:,1));
    b = max(solved(:,2));
else
    a = max(solved(:,2));
    b = max(solved(:,1));
end
max(solved(:,1))
max(solved(:,2))
eccentricity = sqrt(1-(b*b)/(a*a))
plot(solved(:, 1), solved(:, 2)),title('Orbit of the Earth'),xlabel('x(AU)'),ylabel('y(AU)');
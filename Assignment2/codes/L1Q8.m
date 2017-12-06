% Parachute falling

clc;
clear;
clear all;
close all;

% Necessary variables

t_start = 0;                        % Starting time of the simulation
t_end = 10;                         % End time of the simulation
dt = 0.01;                          % Step size for the simulation

num_points = (t_end - t_start)/dt;  % Total number of points for the simulation
T = zeros(num_points,1);            % Time array
H = zeros(num_points,1);            % Position of the ball
V = zeros(num_points,1);            % Velocity of the ball
H(1)=100;                           % Initial height of 100m

% Simulation loop

for step=1:num_points-1
        H(step+1) = H(step) - V(step)*dt;
        V(step+1) = V(step) + (10-V(step))*dt;
        T(step+1) = T(step) + dt;
        if(H(step+1) < 0)
            break;
       end
end

plot(T,H);
figure();
plot(T,V);
ylabel('velocity(m/s2)');
xlabel('time(s)');
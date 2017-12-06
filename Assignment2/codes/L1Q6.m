% Freefall motion of a ball under gravity (no drag/buoyant force)

clc;
clear;
clear all;
close all;

% Necessary variables

t_start = 0;                        % Starting time of the simulation
t_end = 15;                         % End time of the simulation
dt = 0.01;                          % Step size for the simulation
g = 9.8;                            % Value of gravitational acceleration 'g' (assumed constant)
num_points = (t_end - t_start)/dt;  % Total number of points for the simulation
T = zeros(num_points,1);            % Time array
H = zeros(num_points,1);            % Position of the ball
V = zeros(num_points,1);            % Velocity of the ball
V(1)=-50;                           % Initial height of 100m

% Simulation loop

for step=1:num_points-1
        H(step+1) = H(step) - V(step)*dt;
        V(step+1) = V(step) + g*dt;
        T(step+1) = T(step) + dt;
        if(H(step+1) < 0)
            break;
        end
end

H(step+1) = 2*H(step) - H(step-1);
V(step+1) = 2*V(step) - V(step-1);
H(step+2:num_points) = 0;
V(step+2:num_points) = 0;
% Analytical solution for the problem

analytic_height=-1*(V(1)*T+0.5*g*T.^2);
analytic_velocity = V(1)+g*T;

% Graph plotting

plot(T(1:step+1),H(1:step+1),'g.',T,analytic_height);
ylim([0 130]);
xlim([0 12]);
title("Graph of position vs time (green) and analytical height vs time (blue)");
xlabel("time(s)");
ylabel("height from the ground(m)");
figure();
plot(T(1:step+1),V(1:step+1),'r+',T,analytic_velocity,'g');
ylim([-55 55]);
xlim([0 12]);
title("Graph of velocity vs time (red) and analytical hvelocity vs time (green)");
xlabel("time(s)");
ylabel("velocity(m/s)");
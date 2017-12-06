% Freefall without neglecting the effect of buoyancy

clc;
clear;
clear all;
close all;

% Necessary variables

t_start = 0;                                          % Start time of the simulation (s)
t_end = 145;                                           % End time of the simulation (s)   
dt = 0.01;                                            % Step size for the simulation (s)
g0 = 9.8;                                              % Gravitational acceleration (m/s2)
radius_of_sphere = 1;																	% Radius of the sphere (m)
density_of_air = 1.225;																% Density of the air (assumed constant) (kg/m3)
num_points = (t_end-t_start)/dt;											% Total number of points simulated

R = 6371*10.^3;
volume_of_sphere = 4*pi*(radius_of_sphere^3)/3;				% Volume of the sphere (m3)
force_buoyant = density_of_air*volume_of_sphere*g0;		% Buoyant force (N)
mass_of_sphere = 100;																		% Mass of the sphere (kg)
T = zeros(num_points,1);															% Time array
position_varying_g = zeros(num_points,1);								% Array for position of sphere in the presence of buoyant force
velocity_varying_g = zeros(num_points,1);				% Array for velocity of sphere in the presence of buoyant force
position_constant_g = zeros(num_points,1);												% Array for position of sphere in the absence of buoyant force
velocity_constant_g = zeros(num_points,1);								% Array for velocity of sphere in the absence of buoyant force		
position_varying_g(1) = 100000;
position_constant_g(1) = 100000;
% Simulation loop

for step=1:num_points-1
        
				h=position_varying_g(step);
				g=g0/(1+(h/R))^2;
				position_varying_g(step+1) =position_varying_g(step) - velocity_varying_g(step)*dt;
        velocity_varying_g(step+1) = velocity_varying_g(step) + (g-force_buoyant/mass_of_sphere)*dt;
        position_constant_g(step+1) = position_constant_g(step) - velocity_constant_g(step)*dt;
        velocity_constant_g(step+1) = velocity_constant_g(step) + (g0-force_buoyant/mass_of_sphere)*dt;
        T(step+1)=T(step) + dt;
				if(position_varying_g(step+1) <0)
					break;
				end
end

% Analytical solution

analytic_height=position_varying_g-0.5*g*T.^2;

% Graph plotting
plot(T(1:step+1),position_constant_g(1:step+1),'r',T(1:step+1),position_varying_g(1:step+1),'g');
title("Graph of position(constant g) vs time (red) and position(varying g) vs time (green)");
xlabel("time(s)");
ylabel("displacement(m)");
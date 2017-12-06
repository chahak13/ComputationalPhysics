close all;
clear all;
clc;

global E mass_earth initial_tangential_velocity;
global radius_around_sun l mass_sun;
E = -2.624e33;
mass_earth = 5.972e24;
G = 6.67e-11;
radius_around_sun = 1.49e9;
mass_sun = 1.989e30;
initial_tangential_velocity = sqrt((G * mass_sun) / (radius_around_sun));
l = mass_earth * (radius_around_sun ^ 2) * initial_tangential_velocity;


initial_radius = radius_around_sun;
initial_angle = 0;

[t, solved] = ode45(@rhs2, 0:0.00001:1, [initial_radius initial_angle]); 
x = solved(:, 1) .* cos(solved(:, 2));
y = solved(:, 1) .* sin(solved(:, 2));
plot(x, y);
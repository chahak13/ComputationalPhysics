%Freefall in outer air and water
clear all;
close all;
clear;

g=9.8;
timeStart=0;
timeEnd=100;
dt=0.01;
numberOfPoints=(timeEnd- timeStart)/dt;


densityWater=1000;
densityGlass=8000;


radius=3.7*(10^-3)/2;

%let us consider a glass ball
densityObject=densityGlass;

Time = zeros(numberOfPoints,1);

Position= zeros(numberOfPoints,1);
Velocity= zeros(numberOfPoints,1);
volume=(4*pi*(radius^3))/3;
mass=volume*densityObject;
bouyantForce=volume*densityWater*g;
eta=10
stokesCoeff=6*pi*eta*radius;
mass
stokesCoeff
bouyantForce

for step=1:numberOfPoints-1
  netAcceleration=g - (bouyantForce/mass) - ((stokesCoeff/mass)*Velocity(step));
  Position(step+1)=Position(step)+Velocity(step)*dt;
  Velocity(step+1)=Velocity(step)+netAcceleration*dt;
  Time(step+1)=Time(step)+dt;
end
plot(Time,Velocity),xlabel('time(s)'),ylabel('velocity(m/s)'),title('Terminl velocity of a Steel BB in Water');

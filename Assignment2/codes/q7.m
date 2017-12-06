%balloon problem
clear all;
close all;
clc;

timeStart=0;
timeEnd=10;
dt=0.1;
numberOfPoints=(timeEnd- timeStart)/dt;

densityAir=1.205;
g=9.8
radius = [1; 0.1; 0.01];
volume= 1.33*pi*(radius.^3);
bouyantForce=volume*densityAir*g;
densityGases = [0.1664; 0.0899; 1.250; 1.429; 1.977 ]
%                He      H        N      O2     CO2

%We will first plot for Helium with different Radii
mass=volume.*densityGases(1);
bouyantAcceeleration= bouyantForce./mass
netAcceleration=bouyantAcceeleration.-g;

Time=zeros(numberOfPoints,1);
Position=zeros(numberOfPoints,3);
Velocity=zeros(numberOfPoints,3);

for step=1:numberOfPoints-1
  Position(step+1,1)=Position(step,1)+Velocity(step,1)*dt;
  Velocity(step+1,1)=Velocity(step,1)+netAcceleration(1,1)*dt;
  Position(step+1,2)=Position(step,2)+Velocity(step,2)*dt;
  Velocity(step+1,2)=Velocity(step,2)+netAcceleration(2,1)*dt;
  Position(step+1,3)=Position(step,3)+Velocity(step,3)*dt;
  Velocity(step+1,3)=Velocity(step,3)+netAcceleration(3,1)*dt;
  Time(step+1)=Time(step)+dt;
end;

plot(Time,Position(:,1),'r+',Time,Position(:,2),'b.',Time,Position(:,3),'g'),xlabel('time(s)'),ylabel('height(m)'),title('Height attained by a He balloon in atmosphere'),legend('r=1m','r=0.1m',r='0.01m');
figure();

%Now we plot for different balloons
massGases= volume(1).*densityGases;
bouyantAccelerationGases=bouyantForce(1)./massGases;
netAccelerationGases=bouyantAccelerationGases.-massGases;
PositionGases=zeros(numberOfPoints,5);
VelocityGases=zeros(numberOfPoints,5);
netAccelerationGases(5,1)
for step=1:numberOfPoints-1
  PositionGases(step+1,1)=PositionGases(step,1)+VelocityGases(step,1)*dt;
  VelocityGases(step+1,1)=VelocityGases(step,1)+netAccelerationGases(1,1)*dt;

  PositionGases(step+1,2)=PositionGases(step,2)+VelocityGases(step,2)*dt;
  VelocityGases(step+1,2)=VelocityGases(step,2)+netAccelerationGases(2,1)*dt;

  PositionGases(step+1,3)=PositionGases(step,3)+VelocityGases(step,3)*dt;
  VelocityGases(step+1,3)=VelocityGases(step,3)+netAccelerationGases(3,1)*dt;

  PositionGases(step+1,4)=PositionGases(step,4)+VelocityGases(step,4)*dt;
  VelocityGases(step+1,4)=VelocityGases(step,4)+netAccelerationGases(4,1)*dt;

  PositionGases(step+1,5)=PositionGases(step,5)+VelocityGases(step,5)*dt;
  VelocityGases(step+1,5)=VelocityGases(step,5)+netAccelerationGases(5,1)*dt;
end;

plot(Time,PositionGases(:,1),'r',Time,PositionGases(:,2),'b',Time,PositionGases(:,3),'g',Time,PositionGases(:,4),'y',Time,PositionGases(:,5),'k'),xlabel('time(s)'),ylabel('height(m)'),title('Height of balloons filled with different gases'),legend('He','H','N2','O2','CO2');

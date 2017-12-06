%Freefall in outer air
clear all;
close all;
clear;

g=9.8;
timeStart=0;
timeEnd=10;
dt=0.1;
numberOfPoints=(timeEnd- timeStart)/dt;

densityAir=1.225;
densitIron=7874;
densityGlass=2000;
densityTwice=2*densityAir;

radius=[1;0.1;0.01];

%let us consider a glass ball
densityObject=densityGlass;

Time = zeros(numberOfPoints,1);
Position = zeros(numberOfPoints,3);
Velocity = zeros(numberOfPoints,3);

volume=(4*pi*(radius.^3))/3;
bouyantForce=volume.*densityAir;
mass=volume.*densityObject;
bouyantAcceleration=bouyantForce./mass;
netAcceleration=(bouyantAcceleration.-g)*-1;
netAcceleration
for step=1:numberOfPoints-1
  Position(step+1,1)=Position(step,1)+Velocity(step,1)*dt;
  Velocity(step+1,1)=Velocity(step,1)+netAcceleration(1,1)*dt;
  Position(step+1,2)=Position(step,2)+Velocity(step,2)*dt;
  Velocity(step+1,2)=Velocity(step,2)+netAcceleration(2,1)*dt;
  Position(step+1,3)=Position(step,3)+Velocity(step,3)*dt;
  Velocity(step+1,3)=Velocity(step,3)+netAcceleration(3,1)*dt;
  Time(step+1)=Time(step)+dt;
end;
Analytical = 0.5*(g)*(Time.^2);
plot(Time,Position(:,1),'r.',Time,Position(:,2),'b+',Time,Position(:,3),'g'),xlabel('time(s)'),ylabel('position(m)'),title('Position time graph of a glass ball falling in air'),legend('r=1','r=0.1','r=0.01');
figure();
plot(Time,Position(:,1),'r',Time,Analytical,'b'),xlabel('time(s)'),ylabel('position(m)'),title('Position time graph of a glass ball falling in air'),legend('Computational','Analytical');

%Freefall in outer space
clear all;
close all;
clear;

g=9.8/6;
timeStart=0;
timeEnd=20;
dt=0.1;
numberOfPoints=(timeEnd- timeStart)/dt;

Time = zeros(numberOfPoints,1);
Position = zeros(numberOfPoints,1);
Velocity = zeros(numberOfPoints,1);
Position(1) = 100;
for step=1:numberOfPoints-1
  Position(step+1)=Position(step)-Velocity(step)*dt;
  Velocity(step+1)=Velocity(step)+g*dt;
  Time(step+1)=Time(step)+dt;
	if(Position(step+1)<0)
		break;
	end
end;

AnalyticalPosition=Position(1)-0.5*g*(Time.^2);
AnalyticalVelocity=Time.*g;
plot(Time(1:step+1),Position(1:step+1),'r.',Time(1:step+1),AnalyticalPosition(1:step+1)),xlabel('time(s)'),ylabel('position(m)'),title('Position time graph of a body in freefall'),legend('Computational','Analytical');
figure
plot(Time(1:step+1),Velocity(1:step+1),'r.',Time(1:step+1),AnalyticalVelocity(1:step+1)),xlabel('time(s)'),ylabel('position(m)'),title('Velocity time graph of a body in freefall'),legend('Computational','Analytical');

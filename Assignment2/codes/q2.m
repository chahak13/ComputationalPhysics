%Uniform motion
clear all;
close all;
clear;

v=50;
timeStart=0;
timeEnd=10;
dt=2;
numberOfPoints=(timeEnd- timeStart)/dt;

Time = zeros(numberOfPoints,1);
Position = zeros(numberOfPoints,1);

for step=1:numberOfPoints-1
  Position(step+1)=Position(step)+v*dt;
  Time(step+1)=Time(step)+dt;
end;
Analytical=Time.*v;
plot(Time,Position,'r+',Time,Analytical),xlabel('time(s)'),ylabel('position(m)'),title(strcat(strcat('Position time plot (dt=',num2str(dt)),')'));

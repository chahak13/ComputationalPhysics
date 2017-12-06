clc;
clear all;
close all;

%Initial Conditions
u = zeros(2,1);
u(1)=0;%x
u(2)=10;%vx

%Experiment Parameters
global omega;
global beta;
global m;
m=1;
k=1;
c=0.5;

omega=sqrt(k/m);
beta=c/(2*m);
timePeriod=2*pi/omega

%Time
tStart=0;
tEnd=10*timePeriod;
dt=timePeriod/100;
tSpan=[tStart:dt:tEnd];

[Time,Y]=ode15s('fq2',tSpan,u);
%figure();
plot(Time,Y(:,1)),xlabel('time(s)'),ylabel('position(m)'),title(['Damped oscillator k=',num2str(k),' m=',num2str(m),' and friction coeff 0.1']);
%figure();
%plot(cycle,Amplitude);
grid;

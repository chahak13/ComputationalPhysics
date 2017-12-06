clear all;
close all;
clc;

tStart = 0;
tEnd = 70;
dt = 0.01;
tSpan = [tStart:dt:tEnd];

global R;
global L;
global C;
global Amp;
global freq;

R=0.2;
L=0.1;
C=0.1;
Amp=1;
freq=1/(2*pi*sqrt(L*C));

initialCondition = zeros(2,1);
initialCondition(1) = 2;
[Time,X] = ode45('fq4',tSpan,initialCondition);

plot(Time,X(:,2),'b'),xlabel('time(s)'),ylabel('charge(C)'),title('Current in an RLC Circuit');

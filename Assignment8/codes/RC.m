clear all;
close all;
clc;

tStart=0;
tEnd=5;
dt=0.05;
tSpan = [tStart:dt:tEnd];

global R;
global C;
global V;
R = 5;
C = 0.1;
V = 2;

initialCharge= 0;

[Time,computationalChargeR1] = ode45('fq1',tSpan,initialCharge);

plot(Time,computationalChargeR1,'r'),title('Charge in a capacitor in a charging RC Circuit'),xlabel('time(s)'),ylabel('charge(C)');

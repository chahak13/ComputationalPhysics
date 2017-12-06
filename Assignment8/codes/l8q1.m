clear all;
close all;
clc;

global C;
global R;
global V;

C = 0.2;
R = 1;
V = 0;

dt = 0.05;
tStart = 0;
tEnd = 2;

tSpan = [tStart:dt:tEnd];
initialCharge = 1 ;
[t,charge] = ode45('fq1',tSpan,initialCharge);
current = V/R - charge(:,1)./(R*C);
plot(t,current(:,1)),title('Current in an RC Circuit'),xlabel('time(s)'),ylabel('charge(C)');
figure();
plot(t,charge(:,1)),title('Charge on a capacitor in an RC Circuit'),xlabel('time(s)'),ylabel('charge(C)');
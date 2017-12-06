clear all;
close all;
clc;

global C;
global L;
global V;

C = 0.2;
L = 1;

dt = 0.1;
tStart = 0;
tEnd = 20;

tSpan = [tStart:dt:tEnd];
u = zeros(2,1);
u(1)=1;
[t,charge1] = ode45('fq2',tSpan,u);
w = 1/sqrt(L*C);
analytical = cos(tSpan.*w);
plot(t,charge1(:,1),'r+',t,analytical,'b'),title('Charge on a capacitor in an LC Circuit'),xlabel('time(s)'),ylabel('charge(C)'),ylim([-1.5,1.5]),legend('Computational','Analytical');

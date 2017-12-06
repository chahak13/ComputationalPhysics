clear;
clear all;
%close all;
clc;
tStart=0;
tEnd=100000;
dt=100;
g0=9.8;
numPoints=(tEnd-tStart)/dt;
T=zeros(numPoints,1);
X=zeros(numPoints,1);
V=zeros(numPoints,1);
R=6371*10^3;

%simulation loop

for step=1:numPoints-1
    d = X(step);	
    g=g0*(1-d/R);
    V(step+1) = V(step) + g*dt;
    X(step+1) = X(step) + V(step+1)*dt;
    T(step+1) = T(step) + dt;
end

plot(T,X,'r');
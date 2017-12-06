clear all;
close all;
clc;

tStart = 0;
dt = 3600;
tEnd =2*31536000;
tSpan = [tStart:dt:tEnd];

global G;
global Msun;
global Mearth;

Msun = 1.989e30;
Mearth = 0.642e24;
G = 6.674e-11;
R = 2.279e11;
V2 = sqrt(G*Msun/R);

u = zeros(4,1);
u(1) = R;%x
u(2) = 0;%y
u(3) = 0;%vx
u(4) = V2;%vy
[Time,Xellipse] = ode45('fq1',tSpan,u);

u(4) = V2;
[Time,Xcircle] = ode45('fq1',tSpan,u);

Vellipse = sqrt(Xellipse(:,3).^2+Xellipse(:,4).^2);
Vcircle = sqrt(Xcircle(:,3).^2+Xcircle(:,4).^2);

Kellipse = 0.5 * Vellipse.^2 * Mearth;
Kcircle = 0.5 * Vcircle.^2 * Mearth;

Rellipse = sqrt(Xellipse(:,1).^2+Xellipse(:,2).^2);
Rcircle = sqrt(Xcircle(:,1).^2+Xcircle(:,2).^2);

Pellipse =-1* G*Mearth*Msun./Rellipse;
Pcircle = -1* G*Mearth*Msun./Rcircle;


if max(Xellipse(:,1))>max(Xellipse(:,2))
    a = max(Xellipse(:,1));
    b = max(Xellipse(:,2));
else
    a = max(Xellipse(:,2));
    b = max(Xellipse(:,1));
end
max(Xellipse(:,1))
max(Xellipse(:,2))
eccentricity_of_ellipticalOrbit = sqrt(1-(b*b)/(a*a))

if max(Xcircle(:,1))>max(Xcircle(:,2))
    a = max(Xcircle(:,1));
    b = max(Xcircle(:,2));
else
    a = max(Xcircle(:,2));
    b = max(Xcircle(:,1));
end
max(Xcircle(:,1))
max(Xcircle(:,2))
eccentricity_of_circularOrbit = sqrt(1-(b*b)/(a*a))


plot(Xellipse(:,1),Xellipse(:,2),'b'),pbaspect([1 1 1]),title('Planetary Orbit'),xlabel('X(m)'),ylabel('Y(m)'),legend('Ellipse','Circle');
figure();
subplot(3,1,1);
plot(Time,Vellipse,Time,Vcircle,'r'),title('Speed of a planet in an orbit'),xlabel('time(s)'),ylabel('speed(m/s)'),legend('Ellipse','Circle');
subplot(3,1,2);
plot(Time,Kellipse,Time,Kcircle,'r'),title('Kinetic Energy of a planet in an orbit'),xlabel('time(s)'),ylabel('Kinetic Energy(J)'),legend('Ellipse','Circle');
subplot(3,1,3)
plot(Time,Pellipse,Time,Pcircle,'r'),title('Potential Energy of a planet in an orbit'),xlabel('time(s)'),ylabel('Potential Energy(J)'),legend('Ellipse','Circle');
figure();
plot(Time,Kellipse+Pellipse,'r',Time,Kcircle+Pcircle,'b'),title('Total Energy of a planet in an orbit'),ylim([-8e33 0]),xlabel('time(s)'),ylabel('Total Energy(J)'),legend('Ellipse','Circle');
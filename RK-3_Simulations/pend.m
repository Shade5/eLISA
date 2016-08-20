clear all
clc
close all

timerange=0:0.1:500;
initial=[pi/3 0];

[t,y]=ode113(@f,timerange,initial);
%plot(t,y(:,1));

KE= 0.5*(y(:,2).^2);
PE= 9.8*(1-cos(y(:,1)));
E=KE+PE;

plot(t,E);


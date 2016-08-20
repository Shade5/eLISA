clear all
clc
close all
hold on

timerange=0:60*24*6:60*24*60*366;

initial=[152.10*10^(9),0,1000,0,29.29*1000,0,0,0,0,0,0,0];

M=1.98855*10^30;
m=5.97219*10^24;
G=6.67408*10^(-11);

[t,y]=ode45(@g,timerange,initial);

KE= 0.5*m*(y(:,4).^2+y(:,5).^2) + 0.5*M*(y(:,10).^2+y(:,11).^2);
PE = -G*M*m./(sqrt( (y(:,1)-y(:,7)).^2+(y(:,2)-y(:,8)).^2));

E= KE+PE;

%{
for i=1:size(y,1)
    figure(1);
    plot(y(i,1),y(i,2),'ro');
    plot(y(i,5),y(i,6),'bo');
    figure(2)
    hold on
    plot(i,KE(i),'go');
    
    pause(0.1);
end
%}

plot3(y(:,1),y(:,2),y(:,3));

max(E)-min(E)


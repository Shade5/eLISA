clear all
close all
clc

hold on;

xe=[152.10*10^(9),0,1000];
ve=[0,29.29*1000,0];
xs=[0,0,0];
vs=[0,0,0];

[E1,Ev1,S,Sv]= earsun(xe,ve,xs,vs);



plot3(E1(:,1),E1(:,2),E1(:,3),'r');
plot3(S(:,1),S(:,2),S(:,3),'y');

pha=10;

xe=[E1(pha,1)*cos(2*pi/3)-E1(pha,2)*sin(2*pi/3),E1(pha,2)*cos(2*pi/3)+E1(pha,1)*sin(2*pi/3),E1(pha,3)];
ve=[Ev1(pha,1)*cos(2*pi/3)-Ev1(pha,2)*sin(2*pi/3),Ev1(pha,2)*cos(2*pi/3)+Ev1(pha,1)*sin(2*pi/3),Ev1(pha,3)];
xs=[0,0,0];
vs=[0,0,0];

[E2,Ev2,S,Sv]= earsun(xe,ve,xs,vs);



plot3(E2(:,1),E2(:,2),E2(:,3),'g');
plot3(S(:,1),S(:,2),S(:,3),'y');



pha=2*pha;

xe=[E1(pha,1)*cos(4*pi/3)-E1(pha,2)*sin(4*pi/3),E1(pha,2)*cos(4*pi/3)+E1(pha,1)*sin(4*pi/3),E1(pha,3)];
ve=[Ev1(pha,1)*cos(4*pi/3)-Ev1(pha,2)*sin(4*pi/3),Ev1(pha,2)*cos(4*pi/3)+Ev1(pha,1)*sin(4*pi/3),Ev1(pha,3)];
xs=[0,0,0];
vs=[0,0,0];

[E3,Ev3,S,Sv]= earsun(xe,ve,xs,vs);



plot3(E3(:,1),E3(:,2),E3(:,3),'b');
plot3(S(:,1),S(:,2),S(:,3),'y');


for i=1:1:size(E1,1)
    
            plot3([E1(i,1) E2(i,1)],[E1(i,2) E2(i,2)],[E1(i,3) E2(i,3)]);
            plot3([E2(i,1) E3(i,1)],[E2(i,2) E3(i,2)],[E2(i,3) E3(i,3)]);
            plot3([E1(i,1) E3(i,1)],[E1(i,2) E3(i,2)],[E1(i,3) E3(i,3)]);
            pause(0.1);
    
end
    
    
    
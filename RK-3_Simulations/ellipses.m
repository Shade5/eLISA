clear all
close all
clc

O=10^23;

hold on;

axis([-2*10^11 2*10^11 -2*10^11 2*10^11 -2*10^9 2*10^9])
L=10^9;



xe=[152.10*10^(9),0,L/2];
ve=[0,29.29*1000,0];
xs=[0,0,0];
vs=[0,0,0];

[E1,Ev1,S,Sv]= earsun(xe,ve,xs,vs);

pha=100;


xe=[E1(pha,1),E1(pha,2),0];
ve=[Ev1(pha,1),Ev1(pha,2),Ev1(pha,3)];
xs=[0,0,0];
vs=[0,0,0];

[Ea,Eva,S,Sv]= earsun(xe,ve,xs,vs);



pha=2441
 

xe=[E1(pha,1)*cos(2*pi/3)-E1(pha,2)*sin(2*pi/3),E1(pha,2)*cos(2*pi/3)+E1(pha,1)*sin(2*pi/3),E1(pha,3)];
ve=[Ev1(pha,1)*cos(2*pi/3)-Ev1(pha,2)*sin(2*pi/3),Ev1(pha,2)*cos(2*pi/3)+Ev1(pha,1)*sin(2*pi/3),Ev1(pha,3)];
xs=[0,0,0];
vs=[0,0,0];

[E2,Ev2,S,Sv]= earsun(xe,ve,xs,vs);




pha=1217;

xe=[E1(pha,1)*cos(4*pi/3)-E1(pha,2)*sin(4*pi/3),E1(pha,2)*cos(4*pi/3)+E1(pha,1)*sin(4*pi/3),E1(pha,3)];
ve=[Ev1(pha,1)*cos(4*pi/3)-Ev1(pha,2)*sin(4*pi/3),Ev1(pha,2)*cos(4*pi/3)+Ev1(pha,1)*sin(4*pi/3),Ev1(pha,3)];
xs=[0,0,0];
vs=[0,0,0];

[E3,Ev3,S,Sv]= earsun(xe,ve,xs,vs);




plot3(E1(:,1),E1(:,2),E1(:,3),'r');
plot3(S(:,1),S(:,2),S(:,3),'y');
plot3(E2(:,1),E2(:,2),E2(:,3),'g');
plot3(S(:,1),S(:,2),S(:,3),'y');
plot3(E3(:,1),E3(:,2),E3(:,3),'b');
plot3(S(:,1),S(:,2),S(:,3),'y');
plot3(0,0,0,'yo');
for i=1:10:size(E1,1)
    
       e =     plot3(Ea(i,1),Ea(i,2),Ea(i,3),'bo');
       h1=     plot3([E1(i,1) E2(i,1)],[E1(i,2) E2(i,2)],[E1(i,3) E2(i,3)],'r');
       h2=     plot3([E2(i,1) E3(i,1)],[E2(i,2) E3(i,2)],[E2(i,3) E3(i,3)],'b');
       h3=     plot3([E1(i,1) E3(i,1)],[E1(i,2) E3(i,2)],[E1(i,3) E3(i,3)],'g');
            pause(0.0000001);
            
            delete(h1);
            delete(h2);
            delete(h3);
            delete(e);
           
            
    
end
  


E=ditances(E1,E2,E3);

E(1)

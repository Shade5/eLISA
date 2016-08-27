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


pha=500;

xe=[E1(pha,1)*cos(pi/2)-E1(pha,2)*sin(pi/2),E1(pha,2)*cos(pi/2)+E1(pha,1)*sin(pi/2),E1(pha,3)];
ve=[Ev1(pha,1)*cos(pi/2)-Ev1(pha,2)*sin(pi/2),Ev1(pha,2)*cos(pi/2)+Ev1(pha,1)*sin(pi/2),Ev1(pha,3)];
xs=[0,0,0];
vs=[0,0,0];

[E2,Ev2,S,Sv]= earsun(xe,ve,xs,vs);



plot3(E2(:,1),E2(:,2),E2(:,3),'g');
plot3(S(:,1),S(:,2),S(:,3),'y');



pha=2*pha;

xe=[E1(pha,1)*cos(2*pi/2)-E1(pha,2)*sin(2*pi/2),E1(pha,2)*cos(2*pi/2)+E1(pha,1)*sin(2*pi/2),E1(pha,3)];
ve=[Ev1(pha,1)*cos(2*pi/2)-Ev1(pha,2)*sin(2*pi/2),Ev1(pha,2)*cos(2*pi/2)+Ev1(pha,1)*sin(2*pi/2),Ev1(pha,3)];
xs=[0,0,0];
vs=[0,0,0];

[E3,Ev3,S,Sv]= earsun(xe,ve,xs,vs);

plot3(E3(:,1),E3(:,2),E3(:,3),'b');

pha=2*pha;

xe=[E1(pha,1)*cos(3*pi/2)-E1(pha,2)*sin(3*pi/2),E1(pha,2)*cos(3*pi/2)+E1(pha,1)*sin(3*pi/2),E1(pha,3)];
ve=[Ev1(pha,1)*cos(3*pi/2)-Ev1(pha,2)*sin(3*pi/2),Ev1(pha,2)*cos(3*pi/2)+Ev1(pha,1)*sin(3*pi/2),Ev1(pha,3)];
xs=[0,0,0];
vs=[0,0,0];

[E4,Ev4,S,Sv]= earsun(xe,ve,xs,vs);

plot3(E4(:,1),E4(:,2),E4(:,3),'y');
plot3(S(:,1),S(:,2),S(:,3),'y');

plot3(0,0,0,'yo');

for i=1:10:size(E1,1)
        
       h1=     plot3([E1(i,1) E2(i,1)],[E1(i,2) E2(i,2)],[E1(i,3) E2(i,3)],'r');
       h2=     plot3([E2(i,1) E3(i,1)],[E2(i,2) E3(i,2)],[E2(i,3) E3(i,3)],'b');
       h3=     plot3([E4(i,1) E3(i,1)],[E4(i,2) E3(i,2)],[E4(i,3) E3(i,3)],'g');
       h4=     plot3([E1(i,1) E4(i,1)],[E1(i,2) E4(i,2)],[E1(i,3) E4(i,3)],'y');
            pause(0.1);
            
            delete(h1);
            delete(h2);
            delete(h3);
            delete(h4);
            
    
end
  




%{
l1=sqrt((E1(:,1)-E2(:,1)).^2+(E1(:,2)-E2(:,2)).^2+(E1(:,3)-E2(:,3)).^2);
l2=sqrt((E1(:,1)-E3(:,1)).^2+(E1(:,2)-E3(:,2)).^2+(E1(:,3)-E3(:,3)).^2);
l3=sqrt((E3(:,1)-E2(:,1)).^2+(E3(:,2)-E2(:,2)).^2+(E3(:,3)-E2(:,3)).^2);


figure()
plot(l1,'r');
plot(l2,'b');
plot(l3,'g');

%}


 
    
    
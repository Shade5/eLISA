clear all
close all
clc

hold on

L=10^9;
Ome=2*pi;

h=1/3660;


xe=[152.10*10^(9),0,L/2];
ve=[0,29.29*1000,0];



t=0:h*2*pi:2;

E1(:,1)=ve(1)*sin(Ome*t)/Ome -(3*xe(1) + 2*ve(2)/Ome)*cos(Ome*t)+2*(2*xe(1)+ve(2)/Ome);
E1(:,2)=(6*xe(1)+4*ve(2)/Ome)*sin(Ome*t) +2*ve(1)*cos(Ome*t)/Ome -3*t*(2*Ome*xe(1)+ve(2))+(xe(2)-2*ve(1)/Ome);
E1(:,3)=xe(3)*cos(Ome*t)+ve(3)*sin(Ome*t)/Ome;

Ev1(:,1)=findvel(E1(:,1),ve(1),60*6*24);
Ev1(:,2)=findvel(E1(:,2),ve(2),60*6*24);    
Ev1(:,3)=findvel(E1(:,3),ve(3),60*6*24);

xlabel('x');
ylabel('y');
for i=1:size(E1,1)

plot3(E1(i,1),E1(i,2),E1(i,3),'ro');

pause(0.0001)

end




%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pha=2441
 

xe=[E1(pha,1)*cos(2*pi/3)-E1(pha,2)*sin(2*pi/3),E1(pha,2)*cos(2*pi/3)+E1(pha,1)*sin(2*pi/3),E1(pha,3)];
ve=[Ev1(pha,1)*cos(2*pi/3)-Ev1(pha,2)*sin(2*pi/3),Ev1(pha,2)*cos(2*pi/3)+Ev1(pha,1)*sin(2*pi/3),Ev1(pha,3)];



E2(:,1)=xe(1)*sin(Ome*t)/Ome -(3*ve(1) + 2*xe(2)/Ome)*cos(Ome*t)+2*(2*ve(1)+xe(2)/Ome);
E2(:,2)=(6*ve(1)+4*xe(2)/Ome)*sin(Ome*t)/Ome -xe(1)*cos(Ome*t)/Ome -2*t*(2*Ome*ve(1)+xe(2))+(ve(2)-2*xe(1)/Ome);
E2(:,3)=ve(3)*cos(Ome*t)+xe(3)*sin(Ome*t)/Ome;

Ev2(:,1)=findvel(E2(:,1),ve(1),60*6*24);
Ev2(:,2)=findvel(E2(:,2),ve(2),60*6*24);
Ev2(:,3)=findvel(E2(:,3),ve(3),60*6*24);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pha=1217;

xe=[E1(pha,1)*cos(4*pi/3)-E1(pha,2)*sin(4*pi/3),E1(pha,2)*cos(4*pi/3)+E1(pha,1)*sin(4*pi/3),E1(pha,3)];
ve=[Ev1(pha,1)*cos(4*pi/3)-Ev1(pha,2)*sin(4*pi/3),Ev1(pha,2)*cos(4*pi/3)+Ev1(pha,1)*sin(4*pi/3),Ev1(pha,3)];


E3(:,1)=xe(1)*sin(Ome*t)/Ome -(3*ve(1) + 2*xe(2)/Ome)*cos(Ome*t)+2*(2*ve(1)+xe(2)/Ome);
E3(:,2)=(6*ve(1)+4*xe(2)/Ome)*sin(Ome*t)/Ome -xe(1)*cos(Ome*t)/Ome -2*t*(2*Ome*ve(1)+xe(2))+(ve(2)-2*xe(1)/Ome);
E3(:,3)=ve(3)*cos(Ome*t)+xe(3)*sin(Ome*t)/Ome;

Ev3(:,1)=findvel(E3(:,1),ve(1),60*6*24);
Ev3(:,2)=findvel(E3(:,2),ve(2),60*6*24);
Ev3(:,3)=findvel(E3(:,3),ve(3),60*6*24);



plot3(E1(:,1),E1(:,2),E1(:,3),'r');
pause(2);

plot3(E2(:,1),E2(:,2),E2(:,3),'g');

plot3(E3(:,1),E3(:,2),E3(:,3),'b');

plot3(0,0,0,'yo');

%}

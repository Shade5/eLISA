clear all
close all
clc



hold on;

axis([-1.3369 1.3369 -1.3369 1.3369 -0.0134 0.0134])
L=0.0067;



xe=[1.0167,0,0];
ve=[0,6.1745,0];
xs=[0,0,0];
vs=[0,0,0];
xa=[0.9611,-0.3295,L/2];
va=[2.0364,5.8381,0];

[E1,Ev1,S,Sv,A1,Av1]= earsunsat(xe,ve,xs,vs,xa,va);




pha=2441;
 

xa=[A1(pha,1)*cos(2*pi/3)-A1(pha,2)*sin(2*pi/3),A1(pha,2)*cos(2*pi/3)+A1(pha,1)*sin(2*pi/3),A1(pha,3)];
va=[Av1(pha,1)*cos(2*pi/3)-Av1(pha,2)*sin(2*pi/3),Av1(pha,2)*cos(2*pi/3)+Av1(pha,1)*sin(2*pi/3),Av1(pha,3)];


[E2,Ev2,S,Sv,A2,Av2]= earsunsat(xe,ve,xs,vs,xa,va);




pha=1217;

xa=[A1(pha,1)*cos(4*pi/3)-A1(pha,2)*sin(4*pi/3),A1(pha,2)*cos(4*pi/3)+A1(pha,1)*sin(4*pi/3),A1(pha,3)];
va=[Av1(pha,1)*cos(4*pi/3)-Av1(pha,2)*sin(4*pi/3),Av1(pha,2)*cos(4*pi/3)+Av1(pha,1)*sin(4*pi/3),Av1(pha,3)];


[E3,Ev3,S,Sv,A3,Av3]= earsunsat(xe,ve,xs,vs,xa,va);


%{

plot3(A1(:,1),A1(:,2),A1(:,3),'r');
plot3(A2(:,1),A2(:,2),A2(:,3),'g');
plot3(A3(:,1),A3(:,2),A3(:,3),'b');
plot3(0,0,0,'y*');

for i=1:10:size(E1,1)
    
       e1 =     plot3(E1(i,1),E1(i,2),E1(i,3),'bo');
	   e2 =     plot3(E2(i,1),E2(i,2),E2(i,3),'bo');
	   e3 =     plot3(E3(i,1),E3(i,2),E3(i,3),'bo');
	   
       h1=     plot3([A1(i,1) A2(i,1)],[A1(i,2) A2(i,2)],[A1(i,3) A2(i,3)],'r');
       h2=     plot3([A2(i,1) A3(i,1)],[A2(i,2) A3(i,2)],[A2(i,3) A3(i,3)],'b');
       h3=     plot3([A1(i,1) A3(i,1)],[A1(i,2) A3(i,2)],[A1(i,3) A3(i,3)],'g');
            pause(0.0000001);
            
            delete(h1);
            delete(h2);
            delete(h3);
            delete(e1);
			delete(e2);
			delete(e3);

end
%}

encheck3bd(E1,Ev1,S,Sv,A1,Av1)

ditances(A1,A2,A3)

  
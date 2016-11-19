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





plot3(E1(:,1),E1(:,2),E1(:,3),'b');

min=10

for i=0:10000000000000
    a= sqrt((E1(1,1)-E1(end-i,1)).^2+(E1(1,2)-E1(end-i,2)).^2+(E1(1,3)-E1(end-i,3)).^2);
    if(min>a)
        min=a;
    else
        break;
    end
end
i
a


  
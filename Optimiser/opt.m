function lam= opt(pha)

L=0.0067;

pha=round(pha);

xe=[1.0167,0,0];
ve=[0,6.1745,0];
xs=[0,0,0];
vs=[0,0,0];
xa=[0.9611,-0.3295,L/2];
va=[2.0364,5.8381,0];

[E1,Ev1,S,Sv,A1,Av1]= earsunsat(xe,ve,xs,vs,xa,va);

	xa=[A1(pha(1),1)*cos(2*pi/3)-A1(pha(1),2)*sin(2*pi/3),A1(pha(1),2)*cos(2*pi/3)+A1(pha(1),1)*sin(2*pi/3),A1(pha(1),3)];
	va=[Av1(pha(1),1)*cos(2*pi/3)-Av1(pha(1),2)*sin(2*pi/3),Av1(pha(1),2)*cos(2*pi/3)+Av1(pha(1),1)*sin(2*pi/3),Av1(pha(1),3)];

[E2,Ev2,S,Sv,A2,Av2]= earsunsat(xe,ve,xs,vs,xa,va);

	xa=[A1(pha(2),1)*cos(4*pi/3)-A1(pha(2),2)*sin(4*pi/3),A1(pha(2),2)*cos(4*pi/3)+A1(pha(2),1)*sin(4*pi/3),A1(pha(2),3)];
	va=[Av1(pha(2),1)*cos(4*pi/3)-Av1(pha(2),2)*sin(4*pi/3),Av1(pha(2),2)*cos(4*pi/3)+Av1(pha(2),1)*sin(4*pi/3),Av1(pha(2),3)];

[E3,Ev3,S,Sv,A3,Av3]= earsunsat(xe,ve,xs,vs,xa,va);

lam=miniz(A1,A2,A3);
 
end


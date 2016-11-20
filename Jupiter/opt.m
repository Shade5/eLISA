function lam= opt(pha)

pha=round(pha);

xe=[1.0167,0,0];
ve=[0,6.1745,0];
xs=[0,0,0];
vs=[0,0,0];
xj=[5.4587,0,0];
vj=[0,2.6224,0];



load sat1

	xa=[A1(pha(1),1)*cos(2*pi/3)-A1(pha(1),2)*sin(2*pi/3),A1(pha(1),2)*cos(2*pi/3)+A1(pha(1),1)*sin(2*pi/3),A1(pha(1),3)];
	va=[Av1(pha(1),1)*cos(2*pi/3)-Av1(pha(1),2)*sin(2*pi/3),Av1(pha(1),2)*cos(2*pi/3)+Av1(pha(1),1)*sin(2*pi/3),Av1(pha(1),3)];

[~,~,~,~,A2,~,~,~]= earsunsatjup(xe,ve,xs,vs,xa,va,xj,vj);

	xa=[A1(pha(2),1)*cos(4*pi/3)-A1(pha(2),2)*sin(4*pi/3),A1(pha(2),2)*cos(4*pi/3)+A1(pha(2),1)*sin(4*pi/3),A1(pha(2),3)];
	va=[Av1(pha(2),1)*cos(4*pi/3)-Av1(pha(2),2)*sin(4*pi/3),Av1(pha(2),2)*cos(4*pi/3)+Av1(pha(2),1)*sin(4*pi/3),Av1(pha(2),3)];

[~,~,~,~,A3,~,~,~]= earsunsatjup(xe,ve,xs,vs,xa,va,xj,vj);

lam=miniz(A1,A2,A3);
 
end


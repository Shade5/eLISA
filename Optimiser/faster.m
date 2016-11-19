

function lam= faster(pha)

L=0.0067;

pha=round(pha);

xe=[1.0167,0,0];
ve=[0,6.1745,0];
xs=[0,0,0];
vs=[0,0,0];


load sat1;
    xa=zeros(2,3);
    va=zeros(2,3);
	xa(1,:)=[A1(pha(1),1)*cos(2*pi/3)-A1(pha(1),2)*sin(2*pi/3),A1(pha(1),2)*cos(2*pi/3)+A1(pha(1),1)*sin(2*pi/3),A1(pha(1),3)];
	va(1,:)=[Av1(pha(1),1)*cos(2*pi/3)-Av1(pha(1),2)*sin(2*pi/3),Av1(pha(1),2)*cos(2*pi/3)+Av1(pha(1),1)*sin(2*pi/3),Av1(pha(1),3)];
    size(xa)
    xa(2,:)=[A1(pha(2),1)*cos(4*pi/3)-A1(pha(2),2)*sin(4*pi/3),A1(pha(2),2)*cos(4*pi/3)+A1(pha(2),1)*sin(4*pi/3),A1(pha(2),3)];
	va(2,:)=[Av1(pha(2),1)*cos(4*pi/3)-Av1(pha(2),2)*sin(4*pi/3),Av1(pha(2),2)*cos(4*pi/3)+Av1(pha(2),1)*sin(4*pi/3),Av1(pha(2),3)];

parfor i = 1:2
    [~,~,~,~,A2(i),~]= earsunsat(xe,ve,xs,vs,xa(i),va(i));
end


lam=miniz(A1,A2(1),A3(2));
 
end





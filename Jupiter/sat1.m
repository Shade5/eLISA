L=0.0067;

xe=[1.0167,0,0];
ve=[0,6.1745,0];
xs=[0,0,0];
vs=[0,0,0];
xa=[0.9600,-0.3295,L/2];
va=[2.0363,5.8903,0];
xj=[5.4587,0,0];
vj=[0,2.6224,0];

[E1,Ev1,S,Sv,A1,Av1,J,Jv]= earsunsatjup(xe,ve,xs,vs,xa,va,xj,vj);

save sat1 E1 Ev1 S Sv A1 Av1 J Jv;


  
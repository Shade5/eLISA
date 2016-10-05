clear all
close all
clc
L=10^9;
Ome=2*pi;


xe=[152.10*10^(9),0,L/2];
ve=[0,29.29*1000,0];



t=0:0.001:2*pi;

x=xe(1)*sin(Ome*t)/Ome -(3*ve(1) + 2*xe(2)/Ome)*cos(Ome*t)+2*(2*ve(1)+xe(2)/Ome);
y=(6*ve(1)+4*xe(2)/Ome)*sin(Ome*t)/Ome -xe(1)*cos(Ome*t)/Ome -2*t*(2*Ome*ve(1)+xe(2))+(ve(2)-2*xe(1)/Ome);
z=ve(3)*cos(Ome*t)+xe(3)*sin(Ome*t)/Ome;

plot3(x,y,z)
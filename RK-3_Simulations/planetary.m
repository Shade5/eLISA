clear all
close all
clc


h=60*24*60;

A=zeros(366*60*24,3);



G=6.67408*10^(-11);

GM=G*1.98855*10^30 ;
Gm=G*5.97219*10^24;



figure(1);
%axis([-2*10^11 2*10^11 -2*10^11 2*10^11])

xlabel({'X'})
ylabel({'Y'})
hold on
figure(2);
xlabel({'Time'})
ylabel({'Energy'})
%axis([0 500 -3*10^33 -2*10^33])

hold on

figure(3);
xlabel({'Time'})
ylabel({'Angular momemtum'})
%axis([0 500 -3*10^40 -2*10^40])

hold on




x0=152.10*10^(9);
vx0=0;
y0=0;
vy0=29.29*1000;
z0=0;
vz0=0;
%vy0=sqrt(GM/x0);

xs0=0;
vxs0=0;
ys0=0;
vys0=0;
zs0=0;
vzs0=0;
sr=6960000000;



    


for t=1:366*24*60
    t
    
    
    
    xm = x0 + h*vx0/2;
    ym = y0 + h*vy0/2;
    zm = z0 + h*vz0/2;
    
    xsm = xs0 + h*vxs0/2;
    ysm = ys0 + h*vys0/2;
    zsm = zs0 + h*vzs0/2;
    
    r = sqrt( (xsm-xm)^2+(ysm-ym)^2 + (zsm-zm)^2);
    
    if r < sr
        
       fprintf('Apocaplyse');
       return;
    end
    
    
    %earth
    vx1 = vx0 - h*(GM*(xm-xsm)/(r)^(3));
    vy1 = vy0 - h*(GM*(ym-ysm)/(r)^(3));
    vz1 = vz0 - h*(GM*(zm-zsm)/(r)^(3));
    
    vxm = vx0 - h*(GM*(x0-xs0)/(r)^(3))/2;
    vym = vy0 - h*(GM*(y0-ys0)/(r)^(3))/2;
    vzm = vz0 - h*(GM*(z0-zs0)/(r)^(3))/2;
    
    x1 = x0 + h*vxm;
    y1 = y0 + h*vym;
    z1 = z0 + h*vzm;
    
    %sun
    
    vxs1 = vxs0 - h*(Gm*(xsm-xm)/(r)^(3));
    vys1 = vys0 - h*(Gm*(ysm-ym)/(r)^(3));
    vzs1 = vzs0 - h*(Gm*(zsm-zm)/(r)^(3));
    
    vxsm = vxs0 - h*(Gm*(xs0-x0)/(r)^(3))/2;
    vysm = vys0 - h*(Gm*(ys0-y0)/(r)^(3))/2;
    vzsm = vzs0 - h*(Gm*(zs0-z0)/(r)^(3))/2;
    
    xs1 = xs0 + h*vxsm;
    ys1 = ys0 + h*vysm;
    zs1 = zs0 + h*vzsm;
    
    E1= Gm*0.5*(vx1*vx1 + vy1*vy1 + vz1*vz1)/G+GM*0.5*(vxs1*vxs1 + vys1*vys1 + vzs1*vzs1)/G; 
    E2= GM*(-Gm/r)/G; 
    
    L = Gm*(y1*vx1-x1*vy1)/G + Gm*(ys1*vxs1-xs1*vys1)/G;
    
    x0=x1;
    y0=y1;
    z0=z1;
    vx0=vx1;
    vy0=vy1;
    vz0=vz1;
    
    xs0=xs1;
    ys0=ys1;
    zs0=zs1;
    vxs0=vxs1;
    vys0=vys1;
    vzs0=vzs1;
    
    A(t,1)=x1;
    A(t,2)=y1;
    A(t,3)=z1;
    
    
    %{
    figure(1);
    plot3(x1,y1,z1,'ro');
    plot3(xs1,ys1,zs1,'bx');
    pause(.001);
    %}
    
    figure(2)
    pause(.0001);
    plot(t,(E1+E2),'bo');
    
    %figure(3)
    %pause(.0001);
    %plot(t,L,'ro');
    
    
    
    
end




[r,ti1] = min(A(:,1));  
2*(ti1)/(24*60)

   
    
    
    
    
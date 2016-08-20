function [E,Ev,B,Bv] = earsun(xe,ve,xs,vs)

    h=60*24*60;
    
    E=zeros(366*60*24,3);
    B=zeros(366*60*24,3);
    
    Ev=zeros(366*60*24,3);
    Bv=zeros(366*60*24,3);
    
    G=6.67408*10^(-11);
    GM=G*1.98855*10^30;
    Gm=G*5.97219*10^24;


    x0=xe(1)
    vx0=ve(1);
    y0=xe(2);
    vy0=ve(2);
    z0=xe(3);
    vz0=ve(3);


    xs0=xs(1);
    vxs0=vs(1);
    ys0=xs(2);
    vys0=vs(1);
    zs0=xs(3);
    vzs0=vs(1);
    sr=6960000000;


    for t=1:366

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
        
%         hold on
%             figure(1);
%             plot3(x1,y1,z1,'ro');
%             plot3(xs1,ys1,zs1,'bx');
%             pause(.001);

        E(t,1)=x1;
        E(t,2)=y1;
        E(t,3)=z1;
        
        Ev(t,1)=vx1;
        Ev(t,2)=vy1;
        Ev(t,3)=vz1;
        
        B(t,1)=xs1;
        B(t,2)=ys1;
        B(t,3)=zs1;
        
        Bv(t,1)=vxs1;
        Bv(t,2)=vys1;
        Bv(t,3)=vzs1;

        

    end



end


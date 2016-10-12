function rk = gr(t,y)

    % AU=1.496*10^11;
    % M0=1.989*10^30;
    % year=365*24*60*60;

    G=39.4316;
    
    GM=G;
    Ge=G*3.0025*10^(-06);
    
    r=sqrt((y(1)-y(5))^2+(y(2)-y(6))^2);
    
    %rk=[ex;ey;evx;evy;sx;sy;svx;svy]
    rk=[y(3);
        y(4);
        -GM*(y(1)-y(5))/r^3;
        -GM*(y(2)-y(6))/r^3;
        y(7);
        y(8);
        Ge*(y(1)-y(5))/r^3;
        Ge*(y(2)-y(6))/r^3]
    %rk=[ex;ey;ez;evx;evy;evz;sx;sy;sz;svx;svy;svz;ax;ay;az;avx;avy;avz]
    

end


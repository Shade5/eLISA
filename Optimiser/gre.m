function rk = gre(t,y)

    % AU=1.496*10^11;
    % M0=1.989*10^30;
    % year=365*24*60*60;

    G=39.4316;
    
    GM=G;
    Ge=G*3.0025*10^(-06);
    Ga=G*3.6953*10^(-08);
    
    rse=sqrt((y(1)-y(5))^2+(y(2)-y(6))^2);
    rsa=sqrt((y(9)-y(5))^2+(y(10)-y(6))^2);
    rae=sqrt((y(1)-y(9))^2+(y(2)-y(10))^2);
    
    %rk=[ex;ey;evx;evy;sx;sy;svx;svy;ax;ay;avx;avy]
    rk=[y(3);
        y(4);
        GM*(y(5)-y(1))/rse^3 + Ga*(y( 9)-y(1))/rae^3;
        GM*(y(6)-y(2))/rse^3 + Ga*(y(10)-y(2))/rae^3;
        y(7);
        y(8);
        Ge*(y(1)-y(5))/rse^3 + Ga*(y( 9)-y(5))/rsa^3;
        Ge*(y(2)-y(6))/rse^3 + Ga*(y(10)-y(6))/rsa^3;
        y(11);
        y(12);
        Ge*(y(1)-y( 9))/rae^3 + GM*(y(5)-y( 9))/rsa^3;
        Ge*(y(2)-y(10))/rae^3 + GM*(y(6)-y(10))/rsa^3];
    %rk=[ex;ey;ez;evx;evy;evz;sx;sy;sz;svx;svy;svz;ax;ay;az;avx;avy;avz]
    

end


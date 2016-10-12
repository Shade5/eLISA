function rk = gre3d(t,y)

    % AU=1.496*10^11;
    % M0=1.989*10^30;
    % year=365*24*60*60;

    G=39.4316;
    
    GM=G;
    Ge=G*3.0025*10^(-06);
    Ga=G*3.6953*10^(-08);
    
    rse=sqrt((y( 1)-y(7))^2+(y( 2)-y(8))^2+(y( 3)-y( 9))^2);
    rsa=sqrt((y(13)-y(7))^2+(y(14)-y(8))^2+(y(15)-y( 9))^2);
    rae=sqrt((y(1)-y(13))^2+(y(2)-y(14))^2+(y( 3)-y(15))^2);
    
    %rk=[ex;ey;ez;evx;evy;evz;sx;sy;sz;svx;svy;svz;ax;ay;az;avx;avy;avz]
    rk=[y(4);
        y(5);
        y(6);
        GM*(y(7)-y(1))/rse^3 + Ga*(y(13)-y(1))/rae^3;
        GM*(y(8)-y(2))/rse^3 + Ga*(y(14)-y(2))/rae^3;
        GM*(y(9)-y(3))/rse^3 + Ga*(y(15)-y(3))/rae^3;
        y(10);
        y(11);
        y(12);
        Ge*(y(1)-y(7))/rse^3 + Ga*(y(13)-y(7))/rsa^3;
        Ge*(y(2)-y(8))/rse^3 + Ga*(y(14)-y(8))/rsa^3;
        Ge*(y(3)-y(9))/rse^3 + Ga*(y(15)-y(9))/rsa^3;
        y(16);
        y(17);
        y(18);
        Ge*(y(1)-y(13))/rae^3 + GM*(y(7)-y(13))/rsa^3;
        Ge*(y(2)-y(14))/rae^3 + GM*(y(8)-y(14))/rsa^3;
        Ge*(y(3)-y(15))/rae^3 + GM*(y(9)-y(15))/rsa^3];
    %rk=[ex;ey;ez;evx;evy;evz;sx;sy;sz;svx;svy;svz;ax;ay;az;avx;avy;avz]
    

end


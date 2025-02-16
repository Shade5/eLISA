function rk = g(t,y)
    G=6.67408*10^(-11);
    
    GM=G*1.98855*10^30;
    Gm=G*1000;

    r=sqrt( (y(1)-y(7))^2+(y(2)-y(8))^2+(y(3)-y(9))^2);
    %rk=[ex;ey;ez;evx;evy;evz;sx;sy;sz;svx;svy;svz]
    rk=[y(4);y(5);y(6);
        -GM*(y(1)-y(7))/(r)^(3);-GM*(y(2)-y(8))/(r)^(3);-GM*(y(3)-y(9))/(r)^(3);
        y(10);y(11);y(12);
        -Gm*(y(7)-y(1))/(r)^(3);-Gm*(y(8)-y(2))/(r)^(3);-Gm*(y(9)-y(3))/(r)^(3)];
end


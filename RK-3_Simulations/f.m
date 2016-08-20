function rk = f(t,y)
g=9.8;
L=1;
rk=[y(2);-g*sin(y(1))/L];
end


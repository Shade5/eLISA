function [E,Ev,S,Sv,A,Av,J,Jv] = earsunsatjup(xe,ve,xs,vs,xa,va,xj,vj)

    timerange=0:1/(365*24*60):1.1;     %timerange=0:1/3651:6;
    
    initial=[xe(1),xe(2),xe(3),...
             ve(1),ve(2),ve(3),...
             xs(1),xs(2),xs(3),...
             vs(1),vs(2),vs(3),...
             xa(1),xa(2),xa(3),...
             va(1),va(2),va(3),...
             xj(1),xj(2),xj(3),...
             vj(1),vj(2),vj(3)];
    

        [~,y]=ode23(@gsaej3d,timerange,initial);

        E=y(:,1:3);
        Ev=y(:,4:6);
        S=y(:,7:9);
        Sv=y(:,10:12);
        A=y(:,13:15);
        Av=y(:,16:18);
        J=y(:,19:21);
        Jv=y(:,22:24);
       
end


function [E,Ev,B,Bv] = earsun(xe,ve,xs,vs)


   
    E=zeros(3661,3);
    B=zeros(3661,3);
    
    Ev=zeros(3661,3);
    Bv=zeros(3661,3);
    
    timerange=0:6*24*60:60*24*60*366*3;
    
    initial=[xe(1),xe(2),xe(3),ve(1),ve(2),ve(3),xs(1),xs(2),xs(3),vs(1),vs(2),vs(3)];
    

        [t,y]=ode23(@g,timerange,initial);

        E=y(:,1:3);
        Ev=y(:,4:6);
        B=y(:,7:9);
        Bv=y(:,10:12);
       


end


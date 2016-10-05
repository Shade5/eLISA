clear all
clc
close all

hold on;
   

    
    timerange=0:0.1:10000;
    
    initial=[3,0];
    

        [t,y]=ode45(@g,timerange,initial);

        E=y(:,1);
        Ev=y(:,2);
        
        KE=0.5*Ev.^2;
        PE=0.5*E.^2;
        
        plot(KE+PE);

    


        [t,y]=ode23(@g,timerange,initial);

        E=y(:,1);
        Ev=y(:,2);
        
        KE=0.5*Ev.^2;
        PE=0.5*E.^2;
        
        plot(KE+PE,'r');
        
        
        [t,y]=ode113(@g,timerange,initial);

        E=y(:,1);
        Ev=y(:,2);
        
        KE=0.5*Ev.^2;
        PE=0.5*E.^2;
        
        plot(KE+PE,'g');



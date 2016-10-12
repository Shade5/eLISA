clear all
clc
close all

hold on;

timerange=0:0.001:5
    
    initial=[1.01671,0,0,6.1765,0,0,0,0];
    

        [t,y]=ode23(@gr,timerange,initial);
        E=y(:,1:2);
        Ev=y(:,3:4);
        S=y(:,5:6);
        Sv=y(:,7:8);
        
        
         plot(E(:,1),E(:,2),'r');
         plot(S(:,1),S(:,2),'b');
       
        
        encheck(E,Ev,S,Sv)
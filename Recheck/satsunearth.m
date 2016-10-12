clear all
clc
close all

hold on;

timerange=0:0.001:1/12;
    
    initial=[1.01671,0,0,6.1765,...
             0,0,0,0,...
            1.01671+0.0027,0,0,6.1765+0.2154];
    

        [t,y]=ode23(@gre,timerange,initial);
        E=y(:,1:2);
        Ev=y(:,3:4);
        S=y(:,5:6);
        Sv=y(:,7:8);
        A=y(:,9:10);
        Av=y(:,11:12);
        
        
        %plot(E(:,1),E(:,2),'r');
       % plot(A(:,1),A(:,2),'g');
        
        for i=1:size(E,1)
       %  plot(S(i,1),S(i,2),'bo');
         a=plot(A(i,1)-E(i,1),A(i,2)-E(i,2),'go');
         pause(0.1)
         
        end
       
        
        encheck3bd(E,Ev,S,Sv,A,Av)
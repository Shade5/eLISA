clear all
clc
close all

hold on;

timerange=0:0.001:1;
    
    initial=[0,0,1.01671,0,6.1765,0,...
             0,0,0,0,0,0, ...
             0,0,1.01671+0.0027,0,6.1765+0.21540,0];
    

        [t,y]=ode23(@gre3d,timerange,initial);
        E=y(:,1:3);
        Ev=y(:,4:6);
        S=y(:,7:9);
        Sv=y(:,10:12);
        A=y(:,13:15);
        Av=y(:,16:18);
        
        
        plot3(E(:,1),E(:,2),E(:,3),'r');
        plot3(A(:,1),A(:,2),A(:,3),'g');
        
%         for i=1:size(E,1)
%             plot(S(i,1),S(i,2),'bo');
%             a=plot(A(i,1)-E(i,1),A(i,2)-E(i,2),'go');
%             pause(0.1)
%         end
       
        
        encheck3bd(E,Ev,S,Sv,A,Av)
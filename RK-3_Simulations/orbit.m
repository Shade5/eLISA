clear all
clc
close all
hold on

for epsilon =0.1:0.1:1;
    for e=0.1:0.1:1;
        phi=0:0.01:2*pi;
        R=1;
        
        X=R*(cos(phi)+e)*cos(epsilon);
        Y=R*sin(phi)*sqrt(1-e*e);
        Z=R*(cos(phi)+e)*sin(epsilon);
        
        plot3(X,Y,Z);
        pause(0.1);
    end
    
end

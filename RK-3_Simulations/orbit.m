clear all
clc
close all

axis tight

hold on

%{
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
%}


epsilon =0.01;
e=.5;
        phi=0:0.1:4*pi;
        R=1;
        
        L=2*R*(1+e)*sin(epsilon);
        
        X1=R*(cos(phi)+e)*cos(epsilon);
        Y1=R*sin(phi)*sqrt(1-e*e);
        Z1=R*(cos(phi)+e)*sin(epsilon);
        
        pha=0.03;
        X12=R*(cos(phi+pha)+e)*cos(epsilon);
        Y12=R*sin(phi+pha)*sqrt(1-e*e);
        Z12=R*(cos(phi+pha)+e)*sin(epsilon);
        

        X13=R*(cos(phi+2*pha)+e)*cos(epsilon);
        Y13=R*sin(phi+2*pha)*sqrt(1-e*e);
        Z13=R*(cos(phi+2*pha)+e)*sin(epsilon);
        


       % plot3(X1,Y1,Z1);
        
        X2=X12*cos(2*pi/3)-Y12*sin(2*pi/3);
        X3=X13*cos(4*pi/3)-Y13*sin(4*pi/3);
        
        Y2=X12*sin(2*pi/3)+Y12*cos(2*pi/3);
        Y3=X13*sin(4*pi/3)+Y13*cos(4*pi/3);
        
        R1=sqrt((X1-X2).^2+(Y1-Y2).^2+(Z1-Z12).^2);
        R2=sqrt((X3-X2).^2+(Y3-Y2).^2+(Z13-Z12).^2);
        R3=sqrt((X1-X3).^2+(Y1-Y3).^2+(Z1-Z13).^2);
        
        L
        R1(1)
        R2(1)
        R3(1)
       
       
       
        
        for i=1:size(phi,2)
            i
            plot3(X1(i),Y1(i),Z1(i),'ro');
            plot3(X2(i),Y2(i),Z12(i),'go');
            plot3(X3(i),Y3(i),Z13(i),'bo');
            pause(0.0001);
        end
       
        
        for i=1:size(phi,2)
            
            
            plot3([X1(i) X2(i)],[Y1(i) Y2(i)],[Z1(i) Z12(i)]);
            plot3([X2(i) X3(i)],[Y2(i) Y3(i)],[Z12(i) Z13(i)]);
            plot3([X1(i) X3(i)],[Y1(i) Y3(i)],[Z1(i) Z13(i)]);
            pause(0.0001);
            
        end
        
        plot3(0,0,0,'yx');
    %{    

        plot(R1,'g');
        pause(1);
        plot(R2,'r');
        plot(R3,'b');
        
        
       % plot3(X2,Y2,Z1);
       % plot3(X3,Y3,Z1);
        pause(0.1);
        
        %}


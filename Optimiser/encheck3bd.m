function encheck3bd(E,Ev,S,Sv,A,Av)
%ENCHECK Summary of this function goes here
%   Detailed explanation goes here
    figure();
    hold on
    G=39.4316;
    
    M=1;
    m=3.0025*10^(-06);
    a=3.6953*10^(-08);
    
    KE = 0.5*(m*(Ev(:,1).^2+Ev(:,2).^2+Ev(:,3).^2)...
             +M*(Sv(:,1).^2+Sv(:,2).^2+Sv(:,3).^2)...
             +a*(Av(:,1).^2+Av(:,2).^2+Av(:,3).^2));
         
    rse=sqrt((E(:,1)-S(:,1)).^2+(E(:,2)-S(:,2)).^2+(E(:,3)-S(:,3)).^2);
    rae=sqrt((E(:,1)-A(:,1)).^2+(E(:,2)-A(:,2)).^2+(E(:,3)-A(:,3)).^2);
    ras=sqrt((S(:,1)-A(:,1)).^2+(S(:,2)-A(:,2)).^2+(S(:,3)-A(:,3)).^2);
    
    PE = -G*M*m*rse.^(-1) -G*M*a*ras.^(-1) -G*a*m*rae.^(-1);
    
   % plot(KE,'r');
   % plot(PE,'g');
   save KE2e KE
   save PE2e PE
    plot(KE+PE,'b');


end


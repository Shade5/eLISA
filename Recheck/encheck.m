function encheck(E,Ev,S,Sv)
%ENCHECK Summary of this function goes here
%   Detailed explanation goes here
    figure();
    hold on
    G=39.4316;
    
    M=1;
    m=3.0025*10^(-06);
    
    KE = 0.5*(m*(Ev(:,1).^2+Ev(:,2).^2)+M*(Sv(:,1).^2+Sv(:,2).^2));
    r=sqrt((E(:,1)-S(:,1)).^2+(E(:,2)-S(:,2)).^2)
    PE = -G*M*m*r.^(-1);
    plot(KE+PE,'b');


end


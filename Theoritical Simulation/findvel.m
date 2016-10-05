function V = findvel(E,v0,h)
%FINDVEL Summary of this function goes here
%   Detailed explanation goes here
    V(1)=v0;

    for i=2:size(E)-1
        
        V(i)=(E(i+1)-E(i-1))/(2*h);
    end

end


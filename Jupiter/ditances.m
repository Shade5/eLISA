function E12=ditances(E1,E2,E3)

    figure();
    hold on;
    L=0.0067;
    E12=sqrt((E1(1:1000:end,1)-E2(1:1000:end,1)).^2+(E1(1:1000:end,2)-E2(1:1000:end,2)).^2+(E1(1:1000:end,3)-E2(1:1000:end,3)).^2);
    E13=sqrt((E1(1:1000:end,1)-E3(1:1000:end,1)).^2+(E1(1:1000:end,2)-E3(1:1000:end,2)).^2+(E1(1:1000:end,3)-E3(1:1000:end,3)).^2);
    E32=sqrt((E3(1:1000:end,1)-E2(1:1000:end,1)).^2+(E3(1:1000:end,2)-E2(1:1000:end,2)).^2+(E3(1:1000:end,3)-E2(1:1000:end,3)).^2);
    plot(L*ones(size(E12,1)));

    plot(E12,'r');

    plot(E13,'b');

    plot(E32,'g');
            
    
end


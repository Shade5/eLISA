function E12=ditances(E1,E2,E3)

            figure();
            hold on;
            L=0.0067;
            E12=sqrt((E1(:,1)-E2(:,1)).^2+(E1(:,2)-E2(:,2)).^2+(E1(:,3)-E2(:,3)).^2);
            E13=sqrt((E1(:,1)-E3(:,1)).^2+(E1(:,2)-E3(:,2)).^2+(E1(:,3)-E3(:,3)).^2);
            E32=sqrt((E3(:,1)-E2(:,1)).^2+(E3(:,2)-E2(:,2)).^2+(E3(:,3)-E2(:,3)).^2);
            plot(L*ones(size(E1,1)))
           plot(E12,'r');
           pause(2);
           plot(E13,'b');
           pause(2);
           plot(E32,'g');
            
    
end

